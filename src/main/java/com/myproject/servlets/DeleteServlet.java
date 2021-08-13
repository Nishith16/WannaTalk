package com.myproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myproject.dao.PostDao;
import com.myproject.entities.Message;
import com.myproject.helper.ConnectionProvider;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
		//fetch data
		int PostId = Integer.parseInt(request.getParameter("postid"));
		PostDao pd = new PostDao(ConnectionProvider.getConnection());
		boolean ans = pd.deletePost(PostId);
		if(ans) {
			Message msg = new Message("post is deleted..!", "Success", "alert-warning");
			s.setAttribute("msg", msg);
		}else {
			Message msg = new Message("SomeThing Wents Wrong !! Try Again", "error", "alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
