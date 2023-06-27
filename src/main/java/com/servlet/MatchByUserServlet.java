package com.servlet;

import com.dao.MatchDao;
import com.dao.MemberDao;
import com.dao.TeamDao;
import com.dao.UserDao;
import com.domain.Match;
import com.domain.Member;
import com.domain.Team;
import com.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MatchByUserServlet", value = "/MatchByUserServlet")
public class MatchByUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) request.getSession().getAttribute("user");
        MemberDao memberDao=new MemberDao();
        TeamDao teamDao=new TeamDao();
        List<Team> teamList=null;
        MatchDao matchDao=new MatchDao();
        List<Match> matchList=null;
        List<Member> memberList=memberDao.getMemberByUserId(user.getId());
        for (Member member : memberList) {
            teamList.add(teamDao.getTeamById(member.getTeamId()));
        }
        for (Team team : teamList) {
            matchList.add(matchDao.getMatchById(team.getMatchId()));
        }
        request.getSession().setAttribute("teamList",teamList);
        request.getSession().setAttribute("matchList",matchList);
        response.sendRedirect(request.getContextPath() + "/fineList.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
