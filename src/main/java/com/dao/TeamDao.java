package com.dao;

import com.domain.Match;
import com.domain.Team;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class TeamDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //寻找某人所属团队
    public  Team  getTeamById(int teamId){
        Team team =new Team();
        try {
            String sql = "select * from team where Id = ?";
            team = template.queryForObject(sql, new BeanPropertyRowMapper<>(Team.class),teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return team;
        }
    }
}
