package com.dao;

import com.domain.Member;
import com.domain.Team;
import com.domain.Work;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MemberDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //寻找某人
    public  List<Member>  getMemberByUserId(int userId){
        List<Member> memberList = null;
        try {
            String sql = "select * from Member where UserId = ?";
            memberList = template.query(sql, new BeanPropertyRowMapper<>(Member.class),userId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return memberList;
        }
    }

    //添加队员
    public boolean add(int userId, int teamId ){
        int affectRows = 0;
        try {
            String sql = "insert into member (UserId, TeamId) values(?,?)";
            affectRows = template.update(sql, userId, teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //获得团队成员列表
    public List<Member> getMemberListByteamId(int teamId){
        List<Member> memberList= null;
        try {
            String sql = "select * from member where TeamId = ?";
            memberList = template.query(sql, new BeanPropertyRowMapper<>(Member.class),teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return memberList;
        }
    }

    //修改团队成员
    public boolean edit(int memberId,int userId){
        int affectRows = 0;
        try {
            String sql1 = "update  member set userId = ? ,where Id = ?";
            affectRows = template.update(sql1, userId, memberId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

}
