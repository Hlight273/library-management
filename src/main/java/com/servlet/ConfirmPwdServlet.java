package com.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConfirmPwdServlet", value = "/ConfirmPwdServlet")
public class ConfirmPwdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newpwd1 = request.getParameter("newpwd1");
        String newpwd2 = request.getParameter("newpwd2");
        PrintWriter out =response.getWriter();
        if(!newpwd1.equals(newpwd2)){
            out.print("false");
        }
        else{
            out.print("true");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
