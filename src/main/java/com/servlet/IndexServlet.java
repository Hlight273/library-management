package com.servlet;

import com.dao.CategoryDao;
import com.dao.MatchDao;
import com.domain.Category;
import com.domain.Match;


import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/IndexServlet")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MatchDao matchDao = new MatchDao();
        CategoryDao categoryDao = new CategoryDao();
        List<Match> matchList = matchDao.getNewList();
        List<Category> categoryList = categoryDao.getList();
        //主页显示12个最近的竞赛
        request.setAttribute("matchList",matchList);
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
