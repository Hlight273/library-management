package com.servlet;

import com.dao.CategoryDao;
import com.domain.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchServlet", value = "/MatchServlet")
public class MatchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //要发布比赛要进这个页面，传一个分类列表到管理员编辑发布页
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categoryList = categoryDao.getList();
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/matchcreate.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
