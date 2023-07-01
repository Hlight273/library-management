package com.dto;


import java.awt.*;


public class ImageInfoDTO {

    /**
     * 文字内容
     */
    private String text;
    /**
     * 字体颜色和透明度
     */
    private Color color;
    /**
     * 字体
     */
    private Font font;
    /**
     * 所在图片的x坐标
     */
    private Integer x;
    /**
     * 所在图片的y坐标
     */
    private Integer y;

    /**
     * 是居中
     */
    private Boolean isCenter;


    /**
     * 创建ImageInfoDTO, 每一个对象,代表在该图片中要插入的一段文字内容:
     *
     * @param text     : 文本内容;
     * @param color    : 字体颜色(前三位)和透明度(第4位,值越小,越透明);
     * @param font     : 字体的样式和字体大小;
     * @param x        : 当前字体在该图片位置的横坐标;
     * @param y        : 当前字体在该图片位置的纵坐标;
     * @param y        : 当前字体在该图片位置的纵坐标;
     * @param isCenter : 当前字体在该图片位置是否居中;
     * @return 图片信息对象
     */
    public static ImageInfoDTO createImageDTO(String text, Color color, Font font, int x, int y, boolean isCenter) {
        ImageInfoDTO imageInfoDTO = new ImageInfoDTO();
        imageInfoDTO.setText(text);
        imageInfoDTO.setColor(color);
        imageInfoDTO.setFont(font);
        imageInfoDTO.setX(x);
        imageInfoDTO.setY(y);
        imageInfoDTO.setIsCenter(isCenter);
        return imageInfoDTO;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Font getFont() {
        return font;
    }

    public void setFont(Font font) {
        this.font = font;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Boolean getIsCenter() {
        return isCenter;
    }

    public void setIsCenter(Boolean center) {
        isCenter = center;
    }

}
