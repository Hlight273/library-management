package com.dao;

import com.domain.Stat;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class StatDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /*
    竞赛数量
    SELECT UserId,`user`.`Name` as UserName,Count(member.UserId) as ApplyCount from member LEFT JOIN user ON `user`.Id=member.UserId LEFT JOIN team ON team.Id=member.TeamId GROUP BY member.UserId ORDER BY Count(member.UserId) DESC

    获奖数量
    SELECT UserId,`user`.`Name` as UserName,Count(Lv) as RewardCount,Lv,`Like` from member LEFT JOIN user ON `user`.Id=member.UserId LEFT JOIN team ON team.Id=member.TeamId WHERE Lv!=0 GROUP BY member.UserId ORDER BY Lv DESC
    */

    //竞赛数量的统计数据
    public List<Stat> getCountStat(){
        List<Stat> statList = null;
        try {
            String sql = "SELECT UserId,`user`.`Name` as UserName,Count(member.UserId) as ApplyCount from member LEFT JOIN user ON `user`.Id=member.UserId LEFT JOIN team ON team.Id=member.TeamId GROUP BY member.UserId ORDER BY Count(member.UserId) DESC";
            statList = template.query(sql, new BeanPropertyRowMapper<>(Stat.class));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return statList;
        }
    }

    //竞赛数量的获奖数据，仅包含一二三等奖
    public List<Stat> getAwardStat(){
        List<Stat> statList = null;
        try {
            String sql = "SELECT UserId,`user`.`Name` as UserName,Count(Lv) as AwardCount,Lv,`Like` from member LEFT JOIN user ON `user`.Id=member.UserId LEFT JOIN team ON team.Id=member.TeamId WHERE Lv!=0 GROUP BY member.UserId ORDER BY Count(Lv) DESC";
            statList = template.query(sql, new BeanPropertyRowMapper<>(Stat.class));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return statList;
        }
    }
}
