package com.servlet;

import com.dao.CategoryDao;
import com.dao.MatchDao;
import com.domain.Category;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.Match;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchSearchServlet", value = "/MatchSearchServlet")
public class MatchSearchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //传入key关键词，返回matchList和categoryList，返回到主页
        request.setCharacterEncoding("utf-8");
        String keyword = request.getParameter("keyword");
        MatchDao bookDao = new MatchDao();
        List<Match> matchList = bookDao.getNewListByKey(keyword);
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categoryList = categoryDao.getList();
        request.setAttribute("matchList",matchList);
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
