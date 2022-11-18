package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DB.DBconnect;
import com.Dao.UserDao;
import com.User.UserList;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String name = req.getParameter("uname");
		String email = req.getParameter("uemail");
		String password = req.getParameter("upassword");
		
		UserList ul = new UserList();
		ul.setName(name);
		ul.setEmail(email);
		ul.setPassword(password);
		
		UserDao dao = new UserDao(DBconnect.getCon());
		boolean f=dao.adduser(ul);
		
		HttpSession session;
		if(f) {
			
			session = req.getSession();
			session.setAttribute("reg-success", "Registration Successful..!!");
			res.sendRedirect("register.jsp");
			
		}
		else {
			session = req.getSession();
			session.setAttribute("failed-msg", "Registration Not Successful..!!");
			res.sendRedirect("register.jsp");
			
		}
	}

}
