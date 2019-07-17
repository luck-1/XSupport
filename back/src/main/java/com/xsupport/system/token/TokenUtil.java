package com.xsupport.system.token;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.Key;
import java.util.Date;
import java.util.Properties;

/**
 * @author lxc
 * @date 2019/4/12
 * @description
 */
@Slf4j
public class TokenUtil {
//    private static Logger log = LoggerFactory.getLogger(TokenUtil.class);

    private static final String KEY = "xsupport";

    private static Token webToken = new Token();

    static {
        try {
            Resource resource = new ClassPathResource("/webtoken.properties");
            Properties Props = PropertiesLoaderUtils.loadProperties(resource);
            webToken.setExpiresSecond(Props.getProperty("expiresSecond") == null ? 6379
                    : Integer.parseInt(Props.getProperty("expiresSecond")));
            webToken.setName(Props.getProperty("name"));
            webToken.setSalt(Props.getProperty("salt"));
        } catch (IOException e) {
            log.error("获取 WebTokenProps : " + e.getMessage(), e);
        }
    }

    public static String createToken(Object obj) {
        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);
        // 生成签名密钥
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(webToken.getSalt());
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, SignatureAlgorithm.HS256.getJcaName());
        // 添加构成JWT的参数

        JwtBuilder builder = Jwts.builder().setHeaderParam("typ", "JWT").claim(KEY, obj).setIssuer(webToken.getName())
                .signWith(SignatureAlgorithm.HS256, signingKey);
        // 添加Token过期时间
        long TTLMillis = (long)webToken.getExpiresSecond() * 24 * 60 * 60 * 1000;
        if (TTLMillis >= 0) {
            long expMillis = nowMillis + TTLMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp).setNotBefore(now);
        }
        // 生成JWT
        return builder.compact();
    }


    public static String getUserByWebToken(HttpServletRequest request) {
        try {
            String jsonWebToken = request.getHeader("x-access-token");

            Object object = parseWebToken(jsonWebToken, "user");
            if (object == null) {
                return null;
            }
            String s = object.toString();
            return s;
        } catch (Exception e) {
        }
        return null;
    }

    /**
     * @param jsonWebToken
     * @param key
     * @return
     * @desc 解析token值
     */
    public static Object parseWebToken(String jsonWebToken, String key) {
        try {
            Claims claims = Jwts.parser().setSigningKey(DatatypeConverter.parseBase64Binary(webToken.getSalt()))
                    .parseClaimsJws(jsonWebToken).getBody();
            return claims.get(key);
        } catch (Exception ex) {
            log.error("解析token值：" + ex.getMessage());
            return null;
        }
    }

}
