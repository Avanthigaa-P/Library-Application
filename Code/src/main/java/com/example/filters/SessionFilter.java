package com.example.filters;

import com.example.model.Member;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionFilter implements Filter {



    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);

        Member loggedInUser = null;
        if (session != null) {
            loggedInUser = (Member) session.getAttribute("loggedInMember");
        }

        if (loggedInUser != null) {
            request.setAttribute("user", loggedInUser);
        }

        chain.doFilter(request, response);
    }

}
