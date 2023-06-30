package com.dao;

import com.domain.Team;
import com.domain.Work;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class WorkDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    //add新作品，返回主键id，失败为-1
    public int add(String url, int matchId, int teamId){
        int affectRows, id = -1;
        try {
            String sql = "insert into work(Url,MatchId,TeamId) values(?,?,?)";
            affectRows = template.update(sql, url, matchId, teamId);
            if(affectRows > 0) {
                String sql1 = "select * from work where MatchId=? and TeamId=? order by id desc limit 1";
                Work work = template.queryForObject(sql1, new BeanPropertyRowMapper<>(Work.class),matchId,teamId);
                if (work != null) id = work.getId();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return id;
        }
    }

    //删除指定workid的作品
    public boolean delete(int workid){
        int affectRows = 0;
        try {
            String sql = "delete from work where Id=?";
            affectRows = template.update(sql, workid);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //通过teamId
    public List<Work> getWorkListByteamId(int teamId){
        List<Work> workList= null;
        try {
            String sql = "select * from work where TeamId = ?";
            workList = template.query(sql, new BeanPropertyRowMapper<>(Work.class),teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return workList;
        }
    }
}
