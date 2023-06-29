package com.servlet;

import com.dao.CategoryDao;
import com.dao.MatchDao;
import com.domain.Category;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchCreateServlet", value = "/MatchCreateServlet")
public class MatchCreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //先判断是不是管理员，如果不是t到登录页
        User user = (User) request.getSession().getAttribute("user");
        if(user==null || !user.isAdmin()){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        //接受表单信息，新建一个比赛
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String description = request.getParameter("description");
        String theme = request.getParameter("theme");
        int categoryid = Integer.parseInt(request.getParameter("categoryid"));
        String url = request.getParameter("url");
        MatchDao matchDao = new MatchDao();
        boolean success = matchDao.add(name,start,end,description,theme,categoryid,url);
        //返回信息，成功回主页，失败显示
        if(success) {
            response.sendRedirect(request.getContextPath() + "/IndexServlet");
        }else {
            request.setAttribute("msg","创建失败");
            request.getRequestDispatcher("/ManageServlet").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
