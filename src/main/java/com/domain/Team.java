package com.domain;

import com.dao.HeartDao;
import com.dao.MemberDao;
import com.dao.WorkDao;

import java.util.List;

public class Team {
    private int id;
    private String name;
    private int isDelete;
    private String workName;
    private int like;
    private int lv;
    private String description;
    private int matchId;
    private int captainId;

    public Team() {
    }

    public Team(int id, String name, int isDelete, String workName, int like, int lv, String description, int matchId, int captainId) {
        this.id = id;
        this.name = name;
        this.isDelete = isDelete;
        this.workName = workName;
        this.like = like;
        this.lv = lv;
        this.description = description;
        this.matchId = matchId;
        this.captainId = captainId;
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

    public int getCaptainId() {
        return captainId;
    }

    public void setCaptainId(int captainId) {
        this.captainId = captainId;
    }

    public List<Work> getWorkList(){
        WorkDao workDao = new WorkDao();
        return workDao.getWorkListByteamId(this.id);
    }

    public List<Member> getMemberList(){
        MemberDao memberDao = new MemberDao();
        return memberDao.getMemberByteamId(this.id);
    }

    /**
     *
     * @return 根据lv返回几等奖的字符串，0返回空
     */
    public String getLvString(){
        String[] num = {"一", "二", "三"};
        if(this.lv != 0) return num[this.lv-1]+"等奖";
        return "未获奖";
    }

    /**
     *
     * @param myUserId 待查询用户的id
     * @return 返回该id的用户是否给这个team点赞过
     */
    public boolean ifMeLikedTeam(int myUserId){
        HeartDao heartDao = new HeartDao();
        return heartDao.isRepeat(myUserId, this.id);
    }
}
