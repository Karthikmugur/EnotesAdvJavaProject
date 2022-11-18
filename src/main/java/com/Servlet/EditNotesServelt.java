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

@WebServlet("/editNotesServlet")
public class EditNotesServelt extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("ctitle");
			String desc = request.getParameter("cdesc");
			
			PostDao dao = new PostDao(DBconnect.getCon());
			boolean f = dao.PostUpdate(noteid, title, desc);
			
			if(f) {
				System.out.print("Data updated success");
				HttpSession session = request.getSession();
				session.setAttribute("update-Msg", "Notes Updated Successfully..!!");
				response.sendRedirect("showNotes.jsp");
				
			}else {
				System.out.print("Data updated unsuccess");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
