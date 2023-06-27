package com.dao;

import com.domain.User;
import com.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    //用户注册
    public boolean add(String name, String pwd, String phone){
        int affectRows = 0;
        try {
            //1.编写sql, deposit默认为0
            String sql = "insert into reader(Name, Pwd, Phone, Status, Balance,IsAdmin) values(?,?,?,0,0,0)";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,name, pwd, phone);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    //用户登录
    public User getByEmailAndPwd(String email, String pwd){
        User user = null;
        try {
            //1.编写sql
            String sql = "select * from reader where Email = ? and Pwd = ?";
            //2.调用query方法
            user = template.queryForObject(sql, new BeanPropertyRowMapper<User>
                    (User.class), email,pwd);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return user;
        }
    }
    //用户修改
    public boolean edit(int id,String name, String phone,String status){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update reader set Name=?, Phone=?, Status=? where Id=?";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql, name, phone, status, id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
    //密码修改
    public boolean setPwd(int id,String oldPwd,String newPwd){
        int affectRows = 0;
        try {
            //1.编写sql
            String sql = "update reader set Pwd=? where Id=? and Pwd=?";
            //2.调用update方法，写入数据库
            affectRows = template.update(sql,newPwd,id,oldPwd);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return affectRows > 0;
        }
    }
}
