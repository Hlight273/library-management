package com.servlet;

import com.dao.UserDao;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditPwdServlet", value = "/EditPwdServlet")
public class EditPwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        String pwd = request.getParameter("oldpwd");
        String newpwd = request.getParameter("newpwd");
        UserDao userDao = new UserDao();
        userDao.setPwd(user.getId(),pwd,newpwd);
        //更新用户信息
        user = userDao.getByEmailAndPwd(user.getEmail(),pwd);
        request.getSession().setAttribute("user",user);
        response.sendRedirect(request.getContextPath() + "/user.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
