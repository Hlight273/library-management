package com.domain;

import com.dao.UserDao;

public class Member {
    private int id;
    private int userId;
    private int TeamId;

    public Member() {
    }

    public Member(int id, int userId, int teamId) {
        this.id = id;
        this.userId = userId;
        TeamId = teamId;
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
        return TeamId;
    }

    public void setTeamId(int teamId) {
        TeamId = teamId;
    }

    public String getMemberRealname(){
        UserDao userDao = new UserDao();
        return userDao.getNameById(this.userId);
    }
}
