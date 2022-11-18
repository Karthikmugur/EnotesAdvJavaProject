package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.DB.DBconnect;
import com.Dao.PostDao;
import com.User.Post;

@WebServlet("/addNotesServlet")
public class AddNotesServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userid=Integer.parseInt(request.getParameter("userid"));
		String ctitle = request.getParameter("ctitle");
		String cdesc = request.getParameter("cdesc");
		
		PostDao pdao = new PostDao(DBconnect.getCon());
		boolean f = pdao.AddNotes(ctitle, cdesc, userid);
		
		if(f) {
			System.out.print("Data inserted success");
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.print("Data  not inserted");
		}
	}

}
