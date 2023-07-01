package com.domain;

public class Heart {
    private int id;
    private int userId;
    private int matchId;

    public Heart() {
    }

    public Heart(int id, int userId, int matchId) {
        this.id = id;
        this.userId = userId;
        this.matchId = matchId;
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

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }
}
