package com.domain;

import java.util.Date;

public class match {
    private int Id;
    private String Name;
    private Date Start;
    private Date End;
    private String Description;
    private String Theme;
    private int CategoryId;

    public match() {
    }

    public match(int id, String name, Date start, Date end, String description, String theme, int categoryId) {
        Id = id;
        Name = name;
        Start = start;
        End = end;
        Description = description;
        Theme = theme;
        CategoryId = categoryId;
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
}
