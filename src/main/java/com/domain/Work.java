package com.domain;

public class Work {
    private int id;
    private String url;
    private int matchId;
    private int teamId;

    public Work() {
    }

    public Work(int id, String url, int matchId, int teamId) {
        this.id = id;
        this.url = url;
        this.matchId = matchId;
        this.teamId = teamId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getMatchId() {
        return matchId;
    }

    public void setMatchId(int matchId) {
        this.matchId = matchId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }
}
