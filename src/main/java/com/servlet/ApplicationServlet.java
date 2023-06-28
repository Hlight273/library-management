package com.servlet;

import com.dao.MatchDao;
import com.dao.MemberDao;
import com.dao.TeamDao;
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

@WebServlet(name = "ApplicationServlet", value = "/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("teamName");
        String description= request.getParameter("description");
        int matchId= Integer.parseInt(request.getParameter("matchId"));
        User user= (User) request.getSession().getAttribute("user");
        int member1= Integer.parseInt(request.getParameter("member1"));
        int member2= Integer.parseInt(request.getParameter("member2"));
        int member3= Integer.parseInt(request.getParameter("member3"));
        TeamDao teamDao=new TeamDao();
        MemberDao memberDao=new MemberDao();
        MatchDao matchDao=new MatchDao();
        //验证是否参赛
        List<Member> memberList = memberDao.getMemberByUserId(user.getId());
        ArrayList<Team> teamList=new ArrayList<>();
        ArrayList<Match> matchList=new ArrayList<>();
        //通过成员列表中teamID获得某人参与的团队列表
        for (int i=0; i < memberList.size(); i++) {
            teamList.add(teamDao.getTeamById(memberList.get(i).getTeamId()));

        }
        //通过团队列表中teamID获得某人参与的竞赛列表
        for (int i=0; i < teamList.size(); i++) {
            matchList.add(matchDao.getMatchById(teamList.get(i).getMatchId()));

        }
        for (int i=0; i < matchList.size(); i++) {
            if(matchList.get(i).getId()==matchId){
                request.setAttribute("msg","已报名参赛！");
                request.getRequestDispatcher("/detail.jsp").forward(request,response);
            }

        }
        //验证重名
        if(teamDao.verifyName(teamName,matchId) != null){
            request.setAttribute("msg","团队名重复！");
            request.getRequestDispatcher("/application.jsp").forward(request,response);
        }
        int teamId = teamDao.add( teamName, description, matchId);
        if (teamId != 0) {
            memberDao.add(user.getId(), teamId);
            if(member1 != 0){
                memberDao.add(member1,teamId);
            }
            if(member2 != 0){
                memberDao.add(member2,teamId);
            }
            if(member3 != 0){
                memberDao.add(member3,teamId);
            }
            request.setAttribute("msg","报名成功！");
            request.getRequestDispatcher("/detail.jsp").forward(request,response);
        }
        else {
            request.setAttribute("msg","报名失败！");
            request.getRequestDispatcher("/application.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
