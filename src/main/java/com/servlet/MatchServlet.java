package com.servlet;

import com.dao.CategoryDao;
import com.dao.MatchDao;
import com.domain.Category;
import com.domain.Match;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchServlet", value = "/MatchServlet")
public class MatchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        MatchDao matchDao = new MatchDao();
        Match match;
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categoryList = categoryDao.getList();
        request.setAttribute("categoryList",categoryList);
        //如果url中有match的id，说明是编辑竞赛
        if (id!=null){
            match = matchDao.getMatchById(Integer.parseInt(id));
            request.setAttribute("match",match);
            request.getRequestDispatcher("/admin/matchedit.jsp").forward(request,response);
        }
        //如果url中没match_id，说明是创建竞赛
        else{
            request.getRequestDispatcher("/admin/matchcreate.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
