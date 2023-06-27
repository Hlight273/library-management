package com.dao;

import com.domain.Category;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CategoryDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    public List<Category> getList() {
        List<Category> categoryList = null;
        try {
            String sql = "select * from category order by Id";
            categoryList = template.query(sql, new BeanPropertyRowMapper<>(Category.class));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return categoryList;
        }
    }

}
