package com.xsupport.util;

import com.baidu.aip.ocr.AipOcr;
import io.swagger.annotations.ApiModelProperty;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.*;

public class Util {

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
    public static Map<String, String> recover(Map<String, Object> map) {
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
     * 获取对象所有属性和值
     *
     * @param obj
     * @return
     */
    public static Map<String, Object> getFiledAndProperty(Object obj) {
        Map<String, Object> map = new LinkedHashMap<>();
        Class userCla = obj.getClass();
        Field[] fs = userCla.getDeclaredFields();
        for (int i = 0; i < fs.length; i++) {
            Field f = fs[i];
            f.setAccessible(true);
            Object val;
            try {
                val = f.get(obj);
                map.put(f.getName(), val);
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    /**
     * 获取属性和 @ApiModelProperty(value="") 注解
     *
     * @param classZ
     * @return
     */
    public static Map<String, Object> getColumnValue(Class classZ) {
        Field[] fields = classZ.getDeclaredFields();
        Field field;
        Object val;
        Map<String, Object> map = new LinkedHashMap<>();
        for (int i = 0; i < fields.length; i++) {
            fields[i].setAccessible(true);
        }
        for (int i = 1; i < fields.length; i++) {
            try {
                System.out.println(fields[i].getName());
                field = classZ.getDeclaredField(fields[i].getName());
                ApiModelProperty apiModelProperty = field.getAnnotation(ApiModelProperty.class);
                if (apiModelProperty == null) {
                    continue;
                }
                val = apiModelProperty.value();

                map.put(field.getName(), val);
            } catch (NoSuchFieldException e) {
                e.printStackTrace();
            }
        }
        return map;
    }

    /**
     * 按比例对图片进行缩放.
     *
     * @param _width
     * @param _height
     * @param bufferedImage
     * @throws IOException
     */
    public static ByteArrayOutputStream zoomByScale(int _width, int _height, BufferedImage bufferedImage) throws IOException {
        //获取缩放后的Image对象
        Image _img = bufferedImage.getScaledInstance(_width, _height, Image.SCALE_DEFAULT);
        //新建一个和Image对象相同大小的画布
        BufferedImage image = new BufferedImage(_width, _height, BufferedImage.TYPE_INT_RGB);
        //获取画笔
        Graphics2D graphics = image.createGraphics();

        //将Image对象画在画布上,最后一个参数,ImageObserver:接收有关 Image 信息通知的异步更新接口,没用到直接传空
        graphics.drawImage(_img, 0, 0, image.getGraphics().getColor(), null);
        //释放资源
        graphics.dispose();
        //使用ImageIO的方法进行输出

        ByteArrayOutputStream byteArrayOut = new ByteArrayOutputStream();
        ImageIO.write(image, "JPEG", byteArrayOut);

        byteArrayOut.close();
        return byteArrayOut;
    }

    /**
     * 生成UUID
     * @return
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}