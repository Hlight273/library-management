package com.servlet;

import com.dao.MatchDao;
import com.dao.TeamDao;
import com.domain.Match;
import com.domain.Team;
import com.domain.User;
import com.domain.Work;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserDetailServlet", value = "/UserDetailServlet")
public class UserDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int matchId= Integer.parseInt(request.getParameter("matchId"));
        MatchDao matchDao=new MatchDao();
        TeamDao teamDao=new TeamDao();
        Match match=matchDao.getMatchById(matchId);
        request.getSession().setAttribute("match",match);
        if(user.isAdmin()){
            List<Team> teamList = teamDao.getTeamByMatchId(matchId);
            request.getSession().setAttribute("teamList",teamList);
        }
        else{
            Team teamList = teamDao.getTeamByUserIdAdnMatchId(user.getId(),matchId);
        }
        response.sendRedirect(request.getContextPath() + "/userDetail.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}