package com.servlet;

import com.dao.TeamDao;
import com.domain.Team;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SetAwardServlet", value = "/SetAwardServlet")
public class SetAwardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int matchId= Integer.parseInt(request.getParameter("matchId"));
        int teamId = Integer.parseInt(request.getParameter("teamId"));
        int lv = Integer.parseInt(request.getParameter("lv"));
        TeamDao teamDao = new TeamDao();
        teamDao.setAward(teamId,lv);
        response.sendRedirect(request.getContextPath() + "/UserDetailServlet?matchId="+matchId);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
