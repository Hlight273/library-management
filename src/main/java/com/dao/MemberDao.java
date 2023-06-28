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
}
