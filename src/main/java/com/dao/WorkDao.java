package com.dao;

import com.domain.Team;
import com.domain.Work;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class WorkDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
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
