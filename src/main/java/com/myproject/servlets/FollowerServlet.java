package com.myproject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myproject.dao.FollowDao;
import com.myproject.dao.UserDao;
import com.myproject.entities.Follow;
import com.myproject.entities.Message;
import com.myproject.entities.User;
import com.myproject.helper.ConnectionProvider;

/**
 * Servlet implementation class FollowerServlet
 */
@WebServlet("/FollowerServlet")
public class FollowerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		ServletContext context=getServletContext();  
		int n  =(int)context.getAttribute("postid"); 
		HttpSession session  = request.getSession();
		User user = (User)session.getAttribute("currentUser");
		int senderId = user.getId();
		//fetch value
		int recieverid = Integer.parseInt(request.getParameter("userid"));
		
		int senderid = senderId;
		
		Follow flw = new Follow(senderid, recieverid);
		FollowDao dao = new FollowDao(ConnectionProvider.getConnection());
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		if(dao.saveFollower(flw)) {
			
		
		int recieverFollowers = userdao.getUserByUserId(recieverid).getFollowers()+1;
		int recieverFollowing = userdao.getUserByUserId(recieverid).getFollowing();
		
		user.setFollowers(recieverFollowers);
		user.setFollowing(recieverFollowing);
		user.setId(recieverid);
		
		userdao.updateFF(user);
			
		
		int senderFollowers = userdao.getUserByUserId(senderid).getFollowers();
		int senderFollowing = userdao.getUserByUserId(senderid).getFollowing()+1;
		
		user.setFollowers(senderFollowers);
		user.setFollowing(senderFollowing);
		user.setId(senderid);
		
		userdao.updateFF(user);
		
		}
		else {
			
		}
		String url = "eachUserDetail.jsp?postid="+n;
		response.sendRedirect(url);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request,response);
	}

}
