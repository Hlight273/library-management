package com.utils;

import org.springframework.core.io.ClassPathResource;

import java.awt.*;
import java.io.InputStream;

/**
 * @author mac
 */
public class FontUtil {


    /**
     * 导入本地字体 防止linux下汉字乱码
     *
     * @param style 字体类型
     * @param size  字体大小
     * @return 字体
     */
    public static Font loadFontResource(int style, int size) {
        InputStream resourceAsStream = null;
        try {
            ClassPathResource classPathResource = new ClassPathResource("font/GB2312.ttf");
            resourceAsStream = classPathResource.getInputStream();
            Font font = Font.createFont(Font.TRUETYPE_FONT, resourceAsStream);
            return font.deriveFont(style, size);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

