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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MatchByUserServlet", value = "/MatchByUserServlet")
public class MatchByUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user= (User) request.getSession().getAttribute("user");
        MemberDao memberDao=new MemberDao();
        TeamDao teamDao=new TeamDao();
        ArrayList<Team> teamList=new ArrayList<>();
        MatchDao matchDao=new MatchDao();
        ArrayList<Match> matchList=new ArrayList<>();
        //获得某人参与的成员列表
        List<Member> memberList=memberDao.getMemberByUserId(user.getId());
        //通过成员列表中teamID获得某人参与的团队列表
        for (int i=0; i < memberList.size(); i++) {
            teamList.add(teamDao.getTeamById(memberList.get(i).getTeamId()));

        }
        //通过团队列表中teamID获得某人参与的竞赛列表
        for (int i=0; i < teamList.size(); i++) {
            matchList.add(matchDao.getMatchById(teamList.get(i).getMatchId()));

        }
        request.getSession().setAttribute("teamList",teamList);
        request.getSession().setAttribute("matchList",matchList);
        response.sendRedirect(request.getContextPath() + "/user.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
