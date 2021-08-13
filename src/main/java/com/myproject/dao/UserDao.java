package com.myproject.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.myproject.entities.Post;
import com.myproject.entities.User;
public class UserDao {
	
	private Connection con;
	public UserDao(Connection con) {
		this.con = con;
	}
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String query = "insert into register(firstname,lastname,email,password,followers,following) values (?,?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getLastname());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPassword());
			pstmt.setInt(5, user.getFollowers());
			pstmt.setInt(6, user.getFollowing());
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public User getUserByEmailAndPassword(String email, String password) {
	        User user = null;

	        try {

	            String query = "select * from register where email =? and password=?";
	            PreparedStatement pstmt = con.prepareStatement(query);
	            pstmt.setString(1, email);
	            pstmt.setString(2, password);

	            ResultSet set = pstmt.executeQuery();

	            if (set.next()) {
	                user = new User();

//	             data from db
	                String Firstname = set.getString("Firstname");
//	             set to user object
	                user.setFirstname(set.getString("firstname"));
	                user.setLastname(set.getString("lastname"));
	                user.setId(set.getInt("id"));
	                user.setEmail(set.getString("email"));
	                user.setPassword(set.getString("password"));
	               
	                user.setProfile(set.getString("profile"));
	                user.setFollowers(set.getInt("followers"));
	                user.setFollowing(set.getInt("following"));

	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }
	public boolean updateUser(User user) {

        boolean f = false;
        try {

            String query = "update register set firstname=? ,lastname=?, email=? , password=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getFirstname());
            p.setString(2, user.getLastname());
            p.setString(3, user.getEmail());
            p.setString(4, user.getPassword());
            p.setString(5, user.getProfile());
            p.setInt(6, user.getId()); 

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
	
	public boolean updateFF(User user) {

        boolean f = false;
        try {

            String query = "update register set followers=? ,following=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, user.getFollowers()); 
            p.setInt(2, user.getFollowing());
            p.setInt(3, user.getId()); 

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
		public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from register where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String firstname = set.getString("firstname");
//             set to user object
                user.setFirstname(set.getString("firstname"));
                user.setLastname(set.getString("lastname"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setProfile(set.getString("profile"));
                user.setFollowers(set.getInt("followers"));
                user.setFollowing(set.getInt("following"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
	
	
	
}
