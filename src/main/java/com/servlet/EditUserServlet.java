package com.servlet;

import com.dao.UserDao;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditUserServlet", value = "/EditUserServlet")
public class EditUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if(user==null){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        UserDao userDao = new UserDao();
        userDao.edit(user.getId(),name,email);
        //更新用户信息
        user = userDao.getByEmailAndPwd(email,user.getPwd());
        request.getSession().setAttribute("user",user);
        response.sendRedirect(request.getContextPath() + "/user.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
