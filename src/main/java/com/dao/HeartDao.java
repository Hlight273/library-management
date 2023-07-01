package com.dao;

import com.domain.Category;
import com.domain.Heart;
import com.domain.Team;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class HeartDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    //点赞
    public boolean add(int userId, int teamId){
        int affectRows = 0;
        try {
            String sql = "insert into `heart`(UserId, teamId) values(?,?)";
            affectRows = template.update(sql, userId, teamId);
            if(affectRows > 0){
                String sql1 = "update `team` set `Like` = `Like`+1 where Id = ?";
                affectRows = template.update(sql1, teamId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //取消点赞
    public boolean cancel(int userId,int teamId){
        int affectRows = 0;
        try {
            String sql = "delete from `heart` where UserId = ? and TeamId = ?";
            affectRows = template.update(sql, userId, teamId);
            if(affectRows > 0){
                String sql1 = "update `team` set `Like` = `Like`-1 where Id = ?";
                affectRows = template.update(sql1, teamId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //检验重复点赞
    public boolean isRepeat(int userId, int teamId){
        List<Heart> heartList = null;
        try {
            String sql = "select * From `heart` where UserId = ? and teamId = ?";
            heartList = template.query(sql, new BeanPropertyRowMapper<>(Heart.class), userId, teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return heartList.size()>0;
        }
    }
}
