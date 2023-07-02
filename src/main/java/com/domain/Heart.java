package com.domain;

public class Heart {
    private int id;
    private int userId;
    private int teamId;

    public Heart() {
    }

    public Heart(int id, int userId, int teamId) {
        this.id = id;
        this.userId = userId;
        this.teamId = teamId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }
}
