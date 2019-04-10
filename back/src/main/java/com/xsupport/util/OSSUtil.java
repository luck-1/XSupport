package com.xsupport.util;

import com.alibaba.fastjson.JSON;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.*;
import lombok.Data;
import java.io.*;
import java.util.List;
import java.util.Map;

@Data
public class OSSUtil {

    private static String endpoint;

    private static String accessKeyId;

    private static String accessKeySecret;

    private static String bucketName;

    private static OSSClient ossClient;


    /**
     * OSS客户端
     * @return
     */
    public static OSSClient getOssClient() {
        endpoint = "https://oss-cn-beijing.aliyuncs.com";
        accessKeyId = "LTAI8A4BIWZOWIqv";
        accessKeySecret = "adKFZKEOG1ZKrKVcqd6EV3hnS3he1J";
        return new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }

    /**
     * OSS文件夹名
     * @return
     */
    public static String getBucketName() {
        return "ikingrun";
    }

    /**
     * input流 转 byte[]
     * @param is
     * @return
     */
    public static byte[] inputStreamToByte(InputStream is) {
        byte[] buffer = new byte[1024 * 5];
        int len;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            while ((len = is.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }
            baos.flush();
            buffer = baos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                is.close();
                baos.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return buffer;
    }

    /**
     * 得到OSS文件的byte[]
     * @param ossClient
     * @param objectName
     * @return
     */
    public static byte[] getObjectForByte(OSSClient ossClient, String objectName) {
        //OSS对象存储下载文件
        String bucketName = getBucketName();
        if (!ossClient.doesObjectExist(bucketName, objectName)) {
            return null;
        }
        //得到目标文件
        OSSObject ossObject = ossClient.getObject(bucketName, objectName);
        //得到输入流
        InputStream inputStream = ossObject.getObjectContent();
        //输入流转字节数组
        byte[] bytes = inputStreamToByte(inputStream);
        return bytes;
    }

    /**
     * 解析OSS图片对象得到文件名
     * @param source
     * @return
     */
    public static java.util.List<String> getFileName(String source) {
        Map<String, List<String>> map = JSON.parseObject(source, Map.class);
        List<String> list = map.get("imgs");
        return list;
    }
}