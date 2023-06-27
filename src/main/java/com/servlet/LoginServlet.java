package com.servlet;

import com.dao.UserDao;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取请求参数 email、pwd
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        //2.使用模型（M）中的对象执行业务方法
        UserDao userDao = new UserDao();
        User user = userDao.getByEmailAndPwd(email,pwd);
        if (user != null){
            //3.1登录成功 user对象写入Session 重定向
            request.getSession().setAttribute("user",user);
            response.sendRedirect(request.getContextPath() + "/IndexServlet");
        }
        else{
            //3.2登录失败 重定向 登录页面
            request.setAttribute("msg","电话或密码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
