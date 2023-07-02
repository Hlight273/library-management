package com.servlet;

import com.dao.MatchDao;
import com.dao.TeamDao;
import com.domain.Match;
import com.domain.Team;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailServlet", value = "/DetailServlet")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int matchId= Integer.parseInt(request.getParameter("matchId"));
        MatchDao matchDao=new MatchDao();
        TeamDao teamDao=new TeamDao();
        Match match=matchDao.getMatchById(matchId);
        request.getSession().setAttribute("match",match);
        List<Team> teamList = teamDao.getTeamByMatchId(matchId);
        request.getSession().setAttribute("teamList",teamList);
        response.sendRedirect(request.getContextPath() + "/detail.jsp");
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
