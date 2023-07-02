package com.servlet;

import com.dao.MatchDao;
import com.dao.WorkDao;
import com.domain.Match;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "WorkCreateServlet", value = "/WorkCreateServlet")
public class WorkCreateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("url");
        int matchid = Integer.parseInt(request.getParameter("matchid"));
        int teamid = Integer.parseInt(request.getParameter("teamid"));
        WorkDao workDao = new WorkDao();
        MatchDao matchDao = new MatchDao();

        response.setCharacterEncoding("utf-8");

        //不在活动日期返回600，数据库报错返回601，其他情况返回作品id
        if(!matchDao.getMatchById(matchid).isNow()){
            response.getWriter().print(-2);
        } else {
            int workid = workDao.add(url, matchid, teamid);
            if(workid!=-1) response.getWriter().print(workid);
            else response.getWriter().print(-3);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
