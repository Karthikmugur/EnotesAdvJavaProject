package com.Servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("userl");
			
			HttpSession session2 = request.getSession();
			
			session.setAttribute("logout-Msg", "Logout Successfuly..!!");
			response.sendRedirect("login.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


}
