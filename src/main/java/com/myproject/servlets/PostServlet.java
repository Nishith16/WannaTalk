package com.myproject.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.myproject.dao.PostDao;
import com.myproject.entities.Post;
import com.myproject.entities.User;
import com.myproject.helper.ConnectionProvider;
import com.myproject.helper.Helper;

/**
 * Servlet implementation class PostServlet
 */
@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		//Fetch all data
		String PostContent = request.getParameter("postcontent");
		Part part = request.getPart("pPic");
		//getting user 
		HttpSession session  = request.getSession();
		User user = (User)session.getAttribute("currentUser");
	
		Post p = new Post(PostContent,part.getSubmittedFileName(), null, user.getId());
		PostDao dao  = new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p)) {
			
			 String path = request.getRealPath("/") + "imgs" + File.separator + part.getSubmittedFileName();
             Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		}
		else {
			out.println("error");
		}
	}

}
