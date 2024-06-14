package com.nendrasys.commerce.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String url = (String)httpServletRequest.getSession().getAttribute("url");
        if(url != null) {
            httpServletResponse.sendRedirect("http://localhost:8080/MVCMainProject_war_exploded/"+url);
        }
        httpServletResponse.sendRedirect("http://localhost:8080/MVCMainProject_war_exploded/");
    }
}
