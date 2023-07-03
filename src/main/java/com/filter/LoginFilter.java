package com.filter;

import com.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *  登陆验证的过滤器
 */

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        //过滤器，根据条件，一步一步放行 (chain.doFilter(request, response);)

        //这些是不需要过滤的
        String[] urls = {
                "/login.jsp",
                "/index.jsp",
                "/detail.jsp",
                "/img/",
                "/image/",
                "/css/",
                "/js/",
                "/font/",
                "/LoginServlet","/RegisterServlet","/IndexServlet","/MatchListServlet","/DetailServlet","/MatchSearchServlet"
        };
        //指定这些是只有管理员能进的
        String[] adminUrls = {
                "/stat.jsp",
                "/matchcreate.jsp",
                "/matchedit.jsp",
                "/MatchServlet","/MatchCreateServlet","/MatchEditServlet","/SetAwardServlet","/StatServlet"
        };
        //需要的参数
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session =req.getSession();
        User user = (User) session.getAttribute("user");

        //下面开始过滤和放行
        // 1.如果当前URL是无需过滤的，则放行
        String url = req.getRequestURL().toString();
        for (String u:urls) {
            if (url.contains(u)){
                chain.doFilter(request, response);
                return;
            }
        }
        // 2.判断user是否为null
        if (user != null){
            if(user.isAdmin()){
                //是管理员全部放行
                chain.doFilter(request, response);
            }
            else {
                for (String u:adminUrls) {
                    if (url.contains(u)){
                        request.setAttribute("msg","请登录管理员帐号！");
                        request.getRequestDispatcher("/login.jsp").forward(req,response);
                    }
                }
                //如果不是管理员页面，则放行
                chain.doFilter(request, response);
            }
        }
        else {
            // 为null，说明用户未登录 （跳转到登录页面）
            request.setAttribute("msg","您尚未登陆！");
            request.getRequestDispatcher("/login.jsp").forward(req,response);
        }
    }




    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }
}
