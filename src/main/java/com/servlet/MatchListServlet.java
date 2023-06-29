package com.servlet;

import com.dao.CategoryDao;
import com.dao.MatchDao;
import com.domain.Category;
import com.domain.Match;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchListServlet", value = "/MatchListServlet")
public class MatchListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //进入该servlet时，若无参数则补该参数为0，0代表搜索全部
        String category_id = request.getParameter("category_id");
        if (category_id == null) category_id = "0";
        MatchDao matchDao = new MatchDao();
        CategoryDao categoryDao = new CategoryDao();
        List<Match> matchList = matchDao.getNewListByCategoryId(Integer.parseInt(category_id));
        List<Category> categoryList = categoryDao.getList();
        //竞赛列表页 需要三个request域参数：matchList, categoryList, current_category_id(当前分类)
        request.setAttribute("matchList",matchList);
        request.setAttribute("categoryList",categoryList);
        request.setAttribute("current_category_id",category_id);
        request.getRequestDispatcher("/match.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
