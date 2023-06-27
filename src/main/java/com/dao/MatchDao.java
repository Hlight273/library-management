package com.dao;

import com.domain.Match;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class MatchDao {

    //主页默认显示的竞赛数量
    private static final int LIMIT = 12;
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public boolean add(String name, String start, String end, String description, String theme, int categoryid, String url){
        int affectRows = 0;
        try {
            String sql = "insert into `match`(name, start, end, description, theme, categoryid, url) values(?,?,?,?,?,?,?)";
            affectRows = template.update(sql,name, start, end, description, theme, categoryid, url);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }

    //获取最近的竞赛列表，日期倒序
    public List<Match> getNewList(){
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` order by Start limit ?";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),LIMIT);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //获取进行中的竞赛列表
    public List<Match> getCurrentList(){
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` where NOW() BETWEEN Start AND  End order by Start";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),LIMIT);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //获取竞赛列表，分类筛选 (若分类id为0则不筛选)
    public List<Match> getNewListByCategoryId(int category_id){
        List<Match> matchList = null;
        String sql = "";
        try {
            if (category_id == 0){
                sql = "select * from `match` order by Start limit ?";
                matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),LIMIT);
            }else{
                sql = "select * from `match` where CategoryId = ? order by Start limit ?";
                matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),category_id,LIMIT);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

    //获取竞赛列表，根据关键词筛选
    public List<Match> getNewListByKey(String keyword) {
        List<Match> matchList = null;
        try {
            String sql = "select * from `match` where Name like concat('%',?,'%') order by Start limit ?";
            matchList = template.query(sql, new BeanPropertyRowMapper<>(Match.class),keyword,LIMIT);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return matchList;
        }
    }

}
