package com.domain;

public class Team {
    private int id;
    private String name;
    private int isDelete;
    private String workName;
    private int like;
    private int lv;
    private String description;
    private int matchId;
    private int userId;

    public Team() {
    }

    public Team(int id, String name, int isDelete, String workName, int like, int lv, String description, int matchId, int userId) {
        this.id = id;
        this.name = name;
        this.isDelete = isDelete;
        this.workName = workName;
        this.like = like;
        this.lv = lv;
        this.description = description;
        this.matchId = matchId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(int isDelete) {
        this.isDelete = isDelete;
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getLv() {
        return lv;
    }

    public void setLv(int lv) {
        this.lv = lv;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
