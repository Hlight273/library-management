package com.dao;

import com.domain.Match;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MatchDao {

    //主页默认显示的竞赛数量
    private static final int LIMIT = 6;
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public boolean add(String name, String start, String end, String description, String theme, int categoryid, String url, String applicationend){
        int affectRows = 0;
        try {
            String sql = "insert into `match`(name, start, end, description, theme, categoryid, url, applicationend) values(?,?,?,?,?,?,?,?)";
            affectRows = template.update(sql,name, start, end, description, theme, categoryid, url, applicationend);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    public boolean edit(int id,String name, String start, String end, String description, String theme, int categoryid, String url, String applicationend){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update `match` set name=?, start=?, end=?, description=?, theme=?, categoryid=?, url=?, applicationEnd=? where id=?";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql, name, start, end, description, theme, categoryid, url, applicationend, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //通过Id获取竞赛
    public Match getMatchById(int matchId){
        Match match=new Match();
        try {
            String sql = "select * from `match` where Id= ?  ";
            match = template.queryForObject(sql, new BeanPropertyRowMapper<>(Match.class), matchId);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return match;
        }
    }

    //获取全部
    public List<Match> getAll(){
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` order by Start";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //用于主页：获取最近的LIMIT个竞赛列表，日期倒序
    public List<Match> getNewList(){
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` order by End desc limit ? ";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),LIMIT);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //进行中的
    public List<Match> getCurrentList(){
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` where NOW() BETWEEN Start AND End order by End desc";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //分类筛选 (若分类id为0则表示全部)
    public List<Match> getNewListByCategoryId(int category_id){
        List<Match> matchList = null;
        String sql = "";
        try {
            if (category_id == 0){
                sql = "select * from `match` order by Start";
                matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class));
            }else{
                sql = "select * from `match` where CategoryId = ? order by Start";
                matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),category_id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //关键词筛选
    public List<Match> getNewListByKey(String keyword) {
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` where Name like concat('%',?,'%') order by End desc";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),keyword);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

}
