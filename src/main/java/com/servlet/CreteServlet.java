package com.servlet;

import com.dao.MatchDao;
import com.dao.MemberDao;
import com.dao.TeamDao;
import com.domain.Match;
import com.domain.Member;
import com.domain.Team;
import com.domain.User;
import com.utils.ImageMarkUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "CreteServlet", value = "/CreteServlet")
public class CreteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
//        Match match = (Match) request.getSession().getAttribute("match");
        int matchId = Integer.parseInt(request.getParameter("matchId"));
        int teamId = Integer.parseInt(request.getParameter("teamId"));
        MatchDao matchDao = new MatchDao();
        Match match = matchDao.getMatchById(matchId);
        TeamDao teamDao = new TeamDao();
        Team team = teamDao.getTeamById(teamId);
        String pattern = "yyyy年MM月dd日";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(match.getEnd());
        String imgUrl = ImageMarkUtils.crete(request.getSession().getServletContext().getRealPath("/img/"),request.getContextPath(),date,user.getName(),match.getName(),team.getName(), team.getLvString());
        request.getSession().setAttribute("awardimg",imgUrl);
        response.sendRedirect(request.getContextPath() + "/img/award.png");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
