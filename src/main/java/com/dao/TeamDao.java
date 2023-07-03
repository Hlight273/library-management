package com.dao;

import com.domain.Award;
import com.domain.Match;
import com.domain.Member;
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

    //通过userId和matchId
    public  List<Team>  getTeamByUserIdAdnMatchId(int userId, int matchId){
        List<Team> teamList =null;
        try {
            String sql = "select * from team where Id = ? and MatchId = ?";
            teamList = template.query(sql, new BeanPropertyRowMapper<>(Team.class),userId,matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return teamList;
        }
    }

    //创建团队成功时返回TeamId
    public int add(String teamName, String description, int matchId, int userId){
        int affectRows = 0;
        Team team = null;
        try {
            String sql = "insert into team (Name, isDelete, WorkName,  `Like`, LV, Description, MatchId, CaptainId) values(?,0,'暂无',0,0,?,?,?)";
            affectRows = template.update(sql,teamName, description, matchId, userId);
            if(affectRows > 0){
                String sql1 = "select * from team where Name = ? and MatchId = ?";
                team =  template.queryForObject(sql1, new BeanPropertyRowMapper<>(Team.class),teamName, matchId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return team.getId();
        }
    }

    //验证是否重名
    public List<Team> verifyName(String teamName, int matchId){
        List<Team> teamList = null;
        try {
            String sql = "select * from team where Name = ? and MatchId = ?;";
            teamList = template.query(sql, new BeanPropertyRowMapper<>(Team.class),teamName, matchId);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return teamList;
        }
    }

    //根据matchId寻找团队
    public List<Team> getTeamByMatchId(int matchId){
        List<Team> teamList =null;
        try {
            String sql = "select * from team where MatchId = ?";
            teamList = template.query(sql, new BeanPropertyRowMapper<>(Team.class),matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return teamList;
        }
    }

    //根据matchId寻找团队
    public List<Team> getTeamListLvOrder(int matchId){
        List<Team> teamList =null;
        try {
            String sql = "select * from team where MatchId = ? ORDER BY Lv desc";
            teamList = template.query(sql, new BeanPropertyRowMapper<>(Team.class),matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return teamList;
        }
    }

    //设置奖项
    public boolean setAward(int teamId, int lv ){
        int affectRows = 0;
        try {
            String sql = "update  team set Lv = ?, IsDelete = ? where Id = ?";
            affectRows = template.update(sql, lv, 1, teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //修改团队信息
    public boolean edit(int teamId, String teamName,String workName, String description){
        int affectRows = 0;
        try {
            String sql = "update  team set Name = ?, Description = ? ,WorkName = ? where Id = ?";
            affectRows = template.update(sql, teamName, description, workName, teamId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //剩余奖项
    public Award getAward(int matchId){
        Award awd = new Award();
        try {
            String sql = "SELECT count(Lv=1 or null) as Lv1  , count(Lv=2 or null) as Lv2 ,count(Lv=3 or null) as Lv3 FROM `team` WHERE MatchId = ?";
            awd =  template.queryForObject(sql, new BeanPropertyRowMapper<>(Award.class),matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return awd;
        }
    }
}
