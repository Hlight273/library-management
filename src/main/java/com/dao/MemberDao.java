package com.dao;

import com.domain.Member;
import com.domain.Team;
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

    public  List<Member>  getMemberByteamId(int teamId){
        List<Member> memberList = null;
        try {
            String sql = "select * from Member where teamId = ?";
            memberList = template.query(sql, new BeanPropertyRowMapper<>(Member.class),teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return memberList;
        }
    }

    //创建团队同时添加队员
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
}
