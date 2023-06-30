package com.servlet;

import com.dao.MemberDao;
import com.dao.TeamDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditTeamServlet", value = "/EditTeamServlet")
public class EditTeamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int teamId= Integer.parseInt(request.getParameter("teamId"));
        String teamName= request.getParameter("teamName");
        String description= request.getParameter("description");
        String way1= request.getParameter("way1");//检验队员1是新增还是修改
        String member1= request.getParameter("member1");//队员1的userId
        String member1Id=request.getParameter("member1Id");//原队员1的memberId
        String way2= request.getParameter("way2");//检验队员2是新增还是修改
        String member2= request.getParameter("member2");//队员2的userId
        String member2Id=request.getParameter("member2Id");//原队员2的memberId
        String way3= request.getParameter("way3");//检验队员3是新增还是修改
        String member3= request.getParameter("member3");//队员3的userId
        String member3Id=request.getParameter("member3Id");//原队员3的memberId
        if(member1.equals("")){
            member1="0";
        }
        if(member2.equals("")){
            member2="0";
        }
        if(member3.equals("")){
            member3="0";
        }//防止txt为空
        TeamDao teamDao = new TeamDao();
        MemberDao memberDao = new MemberDao();
        teamDao.edit(teamId, teamName, description);
        if(way1.equals("add") && !member1.equals("0")){
            memberDao.add(Integer.parseInt(member1),teamId);
        }
        else if(way1.equals("edit")){
            memberDao.edit(Integer.parseInt(member1Id),Integer.parseInt(member1));
        }
        if(way2.equals("add") && !member2.equals("0")){
            memberDao.add(Integer.parseInt(member2),teamId);
        }
        else if(way2.equals("edit")){
            memberDao.edit(Integer.parseInt(member2Id),Integer.parseInt(member2));
        }
        if(way3.equals("add") && !member3.equals("0")){
            memberDao.add(Integer.parseInt(member3),teamId);
        }
        else if(way3.equals("edit")){
            memberDao.edit(Integer.parseInt(member3Id),Integer.parseInt(member3));
        }
        response.sendRedirect(request.getContextPath() + "/user.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
