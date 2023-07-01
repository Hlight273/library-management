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
    public boolean add(int userId, int matchId ,int teamId){
        int affectRows = 0;
        try {
            String sql = "insert into `heart`(UserId, MatchId) values(?,?)";
            affectRows = template.update(sql, userId, matchId);
            if(affectRows > 0){
                String sql1 = "update `team`set 'Like' = 'Like'+1 where teamId = ?";
                affectRows = template.update(sql1, teamId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //取消点赞
    public boolean cancel(int userId, int matchId ,int teamId){
        int affectRows = 0;
        try {
            String sql = "delete from work where UserId = ? and MatchId = ?";
            affectRows = template.update(sql, userId, matchId);
            if(affectRows > 0){
                String sql1 = "update `team`set 'Like' = 'Like'-1 where teamId = ?";
                affectRows = template.update(sql1, teamId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //检验重复点赞
    public boolean isRepeat(int userId, int matchId){
        Heart heart = null;
        try {
            String sql = "select * From `heart` where UserId = ?, MatchId = ?";
            heart = template.queryForObject(sql, new BeanPropertyRowMapper<>(Heart.class), userId, matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(heart!=null){
                return false;
            }
            else {
                return true;
            }
        }
    }
}
