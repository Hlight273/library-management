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

    //获取竞赛列表，日期倒序
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
