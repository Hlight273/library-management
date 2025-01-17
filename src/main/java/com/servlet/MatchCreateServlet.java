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
        //接受表单信息，新建一个比赛
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        String applicationend = request.getParameter("applicationend");
        String description = request.getParameter("description");
        String theme = request.getParameter("theme");
        int categoryid = Integer.parseInt(request.getParameter("categoryid"));
        String url = request.getParameter("url");
        MatchDao matchDao = new MatchDao();
        boolean success = matchDao.add(name,start,end,description,theme,categoryid,url,applicationend);
        //返回信息，成功回主页，失败显示
        if(success) {
            response.sendRedirect(request.getContextPath() + "/IndexServlet");
        }else {
            request.setAttribute("msg","创建失败");
            request.getRequestDispatcher("/MatchServlet").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
