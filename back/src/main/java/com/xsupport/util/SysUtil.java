package com.xsupport.util;

import java.util.UUID;

public class SysUtil {
    public static String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-","");
    }

    public static void main(String[] args) {
        String s = int.class.getCanonicalName();
        System.out.println(s);
    }
}
