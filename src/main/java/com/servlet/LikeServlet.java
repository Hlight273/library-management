package com.servlet;

import com.dao.HeartDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LikeServlet", value = "/LikeServlet")
public class LikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //接受参数
        int userid = Integer.parseInt(request.getParameter("userid"));
        int teamid = Integer.parseInt(request.getParameter("teamid"));

        //没重复，说明需要+赞，反之
        HeartDao heartDao = new HeartDao();
        boolean shouldAdd = !heartDao.isRepeat(userid,teamid);
        boolean success;
        if(shouldAdd) {
            success = heartDao.add(userid,teamid);
            response.getWriter().print(200);
        }
        else {
            success = heartDao.cancel(userid,teamid);
            response.getWriter().print(201);
        }

        //成功给前端返回msg 200说明成功点赞 201说明成功取赞
        if (!success) response.getWriter().print(601);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
