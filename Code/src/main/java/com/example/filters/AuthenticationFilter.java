package com.example.filters;

import com.example.dao.MemberInterface;
import com.example.dao.MemberService;
import com.example.model.Member;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    private MemberInterface memberService;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        memberService = new MemberService();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Member loggedInMember = authenticate(username, password, role);

        if (loggedInMember != null) {
            HttpSession session = ((HttpServletRequest) request).getSession();
            session.setAttribute("loggedInMember", loggedInMember);
            chain.doFilter(request, response);
        } else {
            request.setAttribute("errorMsg", "Authentication failed. Invalid username or password.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private Member authenticate(String username, String password, String role) {
        Member member = memberService.getUser(username, password, role);

        return member != null && member.getPassword().equals(password) ? member : null;
    }


}
