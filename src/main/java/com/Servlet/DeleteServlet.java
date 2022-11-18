package com.Servlet;

import java.io.IOException;

import com.DB.DBconnect;
import com.Dao.PostDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteServlet")
public class DeleteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Integer noteid = Integer.parseInt(request.getParameter("note_id"));
		PostDao dao = new PostDao(DBconnect.getCon());
		
		boolean f=dao.DeleteNotes(noteid);
		
		HttpSession session;
		if(f) {
			session = request.getSession();
			session.setAttribute("delete-Msg", "Delete Note Successfully..!!");
			response.sendRedirect("showNotes.jsp");
		}
		else {
			session=request.getSession();
			session.setAttribute("wrong-Msg", "Something Went Wrong on Server");
			response.sendRedirect("showNotes.jsp");
		}
	}
}
