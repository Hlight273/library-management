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
        String category_id = request.getParameter("category_id");
        if (category_id == null){
            category_id = "0";
        }
        MatchDao matchDao = new MatchDao();
        List<Match> matchList=new ArrayList<>();
        if(category_id.equals("0") ){
            matchList = matchDao.getAll();
        }
        else {
            matchList = matchDao.getNewListByCategoryId(Integer.parseInt(category_id));
        }
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categoryList = categoryDao.getList();
        //主页默认获取的三个request域参数：matchList, categoryList, current_category_id(当前分类)
        request.setAttribute("matchList",matchList);
        request.setAttribute("categoryList",categoryList);
        request.setAttribute("current_category_id",category_id);
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
