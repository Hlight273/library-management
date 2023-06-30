package com.servlet;

import com.dao.WorkDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "WorkDeleteServlet", value = "/WorkDeleteServlet")
public class WorkDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int workid = Integer.parseInt(request.getParameter("workid"));
        WorkDao workDao = new WorkDao();
        boolean success = workDao.delete(workid);
        if(!success) response.getWriter().print(603);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
