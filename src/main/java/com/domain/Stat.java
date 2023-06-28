package com.domain;

public class Stat {
    private int userId;
    private String userName;
    private int awardCount;
    private int applyCount;
    private int lv;
    private int like;

    public Stat() {
    }

    public Stat(int userId, String userName, int awardCount, int applyCount, int lv, int like) {
        this.userId = userId;
        this.userName = userName;
        this.awardCount = awardCount;
        this.applyCount = applyCount;
        this.lv = lv;
        this.like = like;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getAwardCount() {
        return awardCount;
    }

    public void setAwardCount(int awardCount) {
        this.awardCount = awardCount;
    }

    public int getApplyCount() {
        return applyCount;
    }

    public void setApplyCount(int applyCount) {
        this.applyCount = applyCount;
    }

    public int getLv() {
        return lv;
    }

    public void setLv(int lv) {
        this.lv = lv;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    @Override
    public String toString() {
        return "Stat{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", awardCount=" + awardCount +
                ", applyCount=" + applyCount +
                ", lv=" + lv +
                ", like=" + like +
                '}';
    }
}
