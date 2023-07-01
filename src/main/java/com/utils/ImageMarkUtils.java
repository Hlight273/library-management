package com.utils;


import com.dto.ImageInfoDTO;
import com.utils.FontUtil;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

import static com.dto.ImageInfoDTO.createImageDTO;

public class ImageMarkUtils {
    /**
     * 编辑图片,往指定位置添加文字
     *
     * @param srcImgPath    :源图片路径
     * @param targetImgPath :保存图片路径
     * @param list          :文字集合
     */
    public static Boolean writeImage(String srcImgPath, String targetImgPath, List<ImageInfoDTO> list) {
        FileOutputStream outImgStream = null;
        String fileExt = srcImgPath.substring(srcImgPath.lastIndexOf(".") + 1);
        try {
            //读取原图片信息
            //得到文件
            File srcImgFile = new File(srcImgPath);
            //文件转化为图片
            Image srcImg = ImageIO.read(srcImgFile);
            //获取图片的宽
            int srcImgWidth = srcImg.getWidth(null);
            //获取图片的高
            int srcImgHeight = srcImg.getHeight(null);

            //添加文字:
            BufferedImage bufImg = new BufferedImage(srcImgWidth, srcImgHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = bufImg.createGraphics();
            g.drawImage(srcImg, 0, 0, srcImgWidth, srcImgHeight, null);
            for (ImageInfoDTO imgDTO : list) {
                //根据图片的背景设置水印颜色
                g.setColor(imgDTO.getColor());
                g.setFont(imgDTO.getFont());
                //防锯齿
                g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                        RenderingHints.VALUE_ANTIALIAS_ON);
                //设置字体
                int x = imgDTO.getX();
                //判断是否居中
                if (imgDTO.getIsCenter()) {
                    FontMetrics fm = g.getFontMetrics(imgDTO.getFont());
                    x = (srcImgWidth - fm.stringWidth(imgDTO.getText())) / 2;
                }
                //画出水印
                g.drawString(imgDTO.getText(), x, imgDTO.getY());
            }
            g.dispose();
            // 输出图片
            outImgStream = new FileOutputStream(targetImgPath);
            return ImageIO.write(bufImg, fileExt, outImgStream);
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (null != outImgStream) {
                    outImgStream.flush();
                    outImgStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static String crete(String path,String webPath, String date ,String name, String matchName, String teamName, String lv) {
        String[] num = {"一", "二", "三"};
        //模板文件地址
        String srcImgPath = path+"award_template.png";
        //证书生成地址
        String tarImgPath = path+"award.png";
        //创建图片文字数据集合；
        List<ImageInfoDTO> list = new ArrayList<>();
        //list.add(createImageDTO("SOIDMN9929399", Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 24), 250, 1290, false));
        list.add(createImageDTO(name+" 同学:", Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 30), 304-80, 318, false));
        list.add(createImageDTO("在"+matchName+"中，你所属的"+teamName+"荣获", Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 24), 572-80, 374, true));
        list.add(createImageDTO(lv, new Color(200,0,0), FontUtil.loadFontResource(Font.BOLD, 60), 593-80, 477, true));
        list.add(createImageDTO("特颁此证，以资鼓励", Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 24), 316-80, 621, false));
        list.add(createImageDTO("绍兴文理学院", Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 24), 902-80, 621, false));
        list.add(createImageDTO(date, Color.BLACK, FontUtil.loadFontResource(Font.PLAIN, 18), 900-70, 662, false));
        //操作图片:
        ImageMarkUtils.writeImage(srcImgPath, tarImgPath, list);
        return webPath+"/img/award.png";
        //TODO 上传文件
    }

}
