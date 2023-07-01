package com.servlet;

import com.dao.MatchDao;
import com.dao.MemberDao;
import com.dao.TeamDao;
import com.domain.*;

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
        MemberDao memberDao=new MemberDao();
        Match match=matchDao.getMatchById(matchId);
        request.setAttribute("match",match);
        if(user.isAdmin()){
            Award award = teamDao.getAward(matchId);
            List<Team> teamList = teamDao.getTeamByMatchId(matchId);
            request.setAttribute("teamList",teamList);
            request.setAttribute("award",award);
        }
        else{
            ArrayList<Team> teamList = new ArrayList<>();
            //获得某人参与的成员列表
            List<Member> memberList = memberDao.getMemberByUserId(user.getId());
            //通过成员列表中teamID获得某人参与的团队列表
            for (int i = 0; i < memberList.size(); i++) {
                if(teamDao.getTeamById(memberList.get(i).getTeamId()).getMatchId()==matchId){
                    teamList.add(teamDao.getTeamById(memberList.get(i).getTeamId()));
                    request.setAttribute("teamList",teamList);
                }
            }
        }
        request.getRequestDispatcher("/userDetail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
