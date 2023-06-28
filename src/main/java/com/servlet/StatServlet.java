package com.servlet;

import com.dao.StatDao;
import com.domain.Stat;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StatServlet", value = "/StatServlet")
public class StatServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if(user==null || !user.isAdmin()){
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        StatDao statDao = new StatDao();
        List<Stat> countStat = statDao.getCountStat();
        List<Stat> awardStat = statDao.getAwardStat();
        request.setAttribute("countStat",countStat);
        request.setAttribute("awardStat",awardStat);
        request.getRequestDispatcher("/admin/stat.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
