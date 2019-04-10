package com.xsupport.util;

import java.util.UUID;

public class SysUtil {
    public static String getUuid(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    public static void main(String[] args) {
        System.out.println(getUuid());
    }
}
