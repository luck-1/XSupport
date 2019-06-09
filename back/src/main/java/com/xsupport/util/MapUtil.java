package com.xsupport.util;

import com.baidu.aip.ocr.AipOcr;
import com.xsupport.model.measure.Temperature;
import io.swagger.annotations.ApiModelProperty;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

public class MapUtil {

    /**
     * 百度ocr识别图片文字客户端
     * 后调用 String str = client.basicGeneral(bytes,new HashMap<>()).toString();
     *
     * @return
     */
    public static AipOcr getAipOcr() {
        String APP_ID = "15194026";
        String API_KEY = "cPrIGjfOxiErrXNBZpjh92f1";
        String SECRET_KEY = "kmtzs1oGwVD7rC90qPPYyxXSpc3rB7Kd";
        AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);
        //可选参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);
        return client;
    }

    /**
     * map -> k,v反转
     *
     * @param map
     * @return
     */
    public static Map<String, String> recoverKeyAndValue(Map<String, Object> map) {
        Iterator iterator = map.keySet().iterator();
        Map<String, String> map1 = new LinkedHashMap<>();
        while (iterator.hasNext()) {
            String k = (String) iterator.next();
            String v = (String) map.get(k);
            map1.put(v, k);
        }
        return map1;
    }

    /**
     * 获取属性和 @ApiModelProperty(value="") 注解
     *
     * @param object
     * @return
     */
    public static Map<String, Object> getApiKeyAndValue(Object object) {
        Map<String, Object> map = new HashMap<>();
        Class objectClass = object.getClass();
        Field[] fields = objectClass.getDeclaredFields();
        for (Field field : fields) {
            field.setAccessible(true);
            try {
                ApiModelProperty apiModelProperty = field.getAnnotation(ApiModelProperty.class);
                if (apiModelProperty == null) {
                    continue;
                }
                Object o = field.get(object);
                map.put(apiModelProperty.value(), o);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    public static Map<String, String> getApiStringKeyAndValue(Object object) {
        Map<String, Object> map = getApiKeyAndValue(object);
        Map<String, String> stringValueMap = new HashMap<>();
        map.forEach((key, value) -> stringValueMap.put(key, value == null ? null : value.toString()));
        return stringValueMap;
    }


    public static void main(String[] args) {
        getApiKeyAndValue(new Temperature(12f, 16f));
    }
}