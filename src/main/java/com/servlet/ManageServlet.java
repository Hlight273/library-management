package com.servlet;

import com.dao.MatchDao;
import com.domain.Match;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManageServlet", value = "/ManageServlet")
public class ManageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //先判断是不是管理员，如果不是t到登录页
        User user = (User) request.getSession().getAttribute("user");
        if(user==null || !user.isAdmin()){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
//        //管理奖项页面，先加载当前进行中的竞赛list
//        MatchDao matchDao = new MatchDao();
//        List<Match> matchList = matchDao.getCurrentList();
//        request.setAttribute("matchList",matchList);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}