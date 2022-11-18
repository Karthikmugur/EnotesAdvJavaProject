package com.Servlet;

import java.io.IOException;

import com.DB.DBconnect;
import com.Dao.UserDao;
import com.User.UserList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("usemail");
		String password=request.getParameter("uspassword");
		
		UserList ul = new UserList();
		ul.setEmail(email);
		ul.setPassword(password);
		
		UserDao dao = new UserDao(DBconnect.getCon());
		UserList user=dao.loginUser(ul);
		
		if(user!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userl", user);
			
			response.sendRedirect("home.jsp");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("login-error", "Invalid Email or Password");
			response.sendRedirect("login.jsp");
		}
	}

}
