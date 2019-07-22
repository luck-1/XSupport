package com.xsupport.system.token;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import java.util.Date;

/**
 * @author lxc
 * @date 2019/4/12
 * @description token生成和解析
 */
@Slf4j
@Data
public class JwtUtil {

    /**
     * 签名
     */
    private static final String SALT = "JOKER";

    /**
     * token过期时间
     */
    private static final int EXPIRES_TIME = 7 * 24 * 60 * 60 * 1000;

    /**
     * 存储token的key值
     */
    private static final String KEY = "user";

    public static String createJwt(String id){
        // 生成签名密钥
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(SALT);
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, SignatureAlgorithm.HS256.getJcaName());

        JwtBuilder builder = Jwts.builder()
                .setHeaderParam("typ", "JWT")
                .claim(KEY, id)
                .signWith(SignatureAlgorithm.HS256, signingKey);

        //过期时间
        if(EXPIRES_TIME > 0){
            long nowMillis = System.currentTimeMillis();
            builder.setExpiration(new Date(nowMillis + EXPIRES_TIME)).setNotBefore(new Date(nowMillis));
        }

        return builder.compact();
    }

    /**
     * 解析token
     * @param token 要解析的token值
     * @return 解析结果
     */
    public static Claims parseWebToken(String token) {

        return Jwts.parser()
                .setSigningKey(DatatypeConverter.parseBase64Binary(SALT))
                .parseClaimsJws(token)
                .getBody();
    }


    /**
     * 从token得到生成token的用户ID
     * @param request http请求
     * @return 用户ID
     */
    public static String getUserIdByToken(HttpServletRequest request) {
        return parseWebToken(request.getHeader("x-access-token")).get(KEY).toString();
    }


    public static void main(String[] args) {
        String token = createJwt("123456");
        System.out.println(token);
        Claims claims = parseWebToken(token);
        System.out.println();
    }

}
