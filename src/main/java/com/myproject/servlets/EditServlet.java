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

import com.myproject.dao.UserDao;
import com.myproject.entities.Message;
import com.myproject.entities.User;
import com.myproject.helper.ConnectionProvider;
import com.myproject.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
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
		PrintWriter out = response.getWriter();

		
		//Fetch all data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String useremail = request.getParameter("useremail");
		String password = request.getParameter("password");
		Part part = request.getPart("image");
		String imageName =part.getSubmittedFileName();
		
		//get the user from session.
		
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		
		user.setFirstname(firstName);		
		user.setLastname(lastName);
		user.setEmail(useremail);	
		user.setPassword(password);
		String oldFile = user.getProfile();
		user.setProfile(imageName);
		
		//update db
		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userdao.updateUser(user);
		if(ans) {
			
			
            @SuppressWarnings("deprecation")
			String path = request.getRealPath("/") + "imgs" + File.separator + user.getProfile();
			String pathOldFile = request.getRealPath("/")+"imgs"+File.separator+oldFile;
			
//			if(!oldFile.equals("default.png"))
//				Helper.deleteFile(pathOldFile);
			
			
			if(Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile done");
					Message msg = new Message("Profile Successfully Updated..!", "Success", "alert-success");
					s.setAttribute("msg", msg);
			}
			
		}
		else {
			Message msg = new Message("SomeThing Wents Wrong !! Try Again", "error", "alert-danger");
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

}
