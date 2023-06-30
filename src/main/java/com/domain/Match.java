package com.domain;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Match {
    private int Id;
    private String Name;
    private Date Start;
    private Date End;
    private String Description;
    private String Theme;
    private int CategoryId;
    private String Url;
    private Date ApplicationEnd;

    public Match() {
    }

    public Match(int id, String name, Date start, Date end, String description, String theme, int categoryId, String url, Date applicationEnd) {
        Id = id;
        Name = name;
        Start = start;
        End = end;
        Description = description;
        Theme = theme;
        CategoryId = categoryId;
        Url = url;
        ApplicationEnd = applicationEnd;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Date getStart() {
        return Start;
    }

    public void setStart(Date start) {
        Start = start;
    }

    public Date getEnd() {
        return End;
    }

    public void setEnd(Date end) {
        End = end;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getTheme() {
        return Theme;
    }

    public void setTheme(String theme) {
        Theme = theme;
    }

    public int getCategoryId() {
        return CategoryId;
    }

    public void setCategoryId(int categoryId) {
        CategoryId = categoryId;
    }

    public String getUrl() {
        return Url;
    }

    public void setUrl(String url) {
        Url = url;
    }

    public Date getApplicationEnd() {
        return ApplicationEnd;
    }

    public void setApplicationEnd(Date applicationEnd) {
        ApplicationEnd = applicationEnd;
    }

    @Override
    public String toString() {
        return "Match{" +
                "Id=" + Id +
                ", Name='" + Name + '\'' +
                ", Start=" + Start +
                ", End=" + End +
                ", Description='" + Description + '\'' +
                ", Theme='" + Theme + '\'' +
                ", CategoryId=" + CategoryId +
                ", Url='" + Url + '\'' +
                ", ApplicationEnd=" + ApplicationEnd +
                '}';
    }

    /**
     *
     * @return 返回今天是否处于竞赛期间
     */
    public boolean isNow(){
        Date now = new Date();
        return  this.getEnd().after(now);
    }

    /**
     *
     * @param date date类型的日期
     * @return 返回日期的字符串形式，适配input:date的value
     */
    public String getDateString(Date date){
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }
}
