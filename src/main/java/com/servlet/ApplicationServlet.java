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

@WebServlet(name = "ApplicationServlet", value = "/ApplicationServlet")
public class ApplicationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String teamName = request.getParameter("teamName");
        String description= request.getParameter("description");
        int matchId= Integer.parseInt(request.getParameter("matchId"));
        User user= (User) request.getSession().getAttribute("user");
        String member1= request.getParameter("member1");
        String member2= request.getParameter("member2");
        String member3= request.getParameter("member3");
        if(member1.equals("")){
            member1="0";
        }
        if(member2.equals("")){
            member2="0";
        }
        if(member3.equals("")){
            member3="0";
        }
        TeamDao teamDao=new TeamDao();
        MemberDao memberDao=new MemberDao();
        MatchDao matchDao=new MatchDao();
        boolean captainFlag = false;//是否为队长
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
                if(teamList.get(i).getCaptainId()== user.getId()) {
                    captainFlag = true;
                    request.setAttribute("msg","已作为队长报名参赛！");
                    request.getRequestDispatcher("/detail.jsp").forward(request,response);
                }
                else{
                    request.setAttribute("msg","已作为队员参赛，不能以队长身份报名！");
                    request.getRequestDispatcher("/detail.jsp").forward(request,response);
                }
            }

        }
        //验证重名
        if(teamDao.verifyName(teamName,matchId).size()!=0){
            request.setAttribute("msg","团队名重复！");
            request.getRequestDispatcher("/application.jsp").forward(request,response);
        }
        int teamId = teamDao.add(teamName, description, matchId, user.getId());
        if (teamId != 0) {
            memberDao.add(user.getId(), teamId);
            if(!member1.equals("0")){
                memberDao.add(Integer.parseInt(member1),teamId);
            }
            if(!member2.equals("0")){
                memberDao.add(Integer.parseInt(member2),teamId);
            }
            if(!member3.equals("0")){
                memberDao.add(Integer.parseInt(member3),teamId);
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
