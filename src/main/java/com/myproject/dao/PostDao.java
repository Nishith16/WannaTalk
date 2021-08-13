package com.myproject.dao;

import java.sql.*;
import java.util.*;

import com.myproject.entities.Post;

public class PostDao {
	Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

	
	public boolean savePost(Post p) {
		boolean f = false;
		try {
			String q = "insert into post(postcontent,pPic,userid) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setString(1,p.getPostcontent());
			pstmt.setString(2,p.getpPic());
			pstmt.setInt(3, p.getUserid());
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	//delete post from db
	public boolean deletePost(int postId) {
		boolean f = false;
		try {
			String q = "delete from post where postid = ?";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setInt(1, postId);
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	//get all the post
	public List<Post> getAllPost(){
		List<Post> list = new ArrayList<>();
		try {
			
			PreparedStatement p = con.prepareStatement("select * from post order by postid desc");
			
			ResultSet set = p.executeQuery();
			while(set.next()) {
				int postid = set.getInt("postid");
				String postcontent = set.getString("postcontent");
				Timestamp postdate = set.getTimestamp("postdate");
				int userid = set.getInt("userid");
				String pPic = set.getString("pPic");
				Post post = new Post(postid,postcontent,pPic, postdate, userid);
				list.add(post);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from post where postid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postId);
            ResultSet set = p.executeQuery();
			while(set.next()) {
				int postid = set.getInt("postid");
				String postcontent = set.getString("postcontent");
				Timestamp postdate = set.getTimestamp("postdate");
				int userid = set.getInt("userid");
				String pPic = set.getString("Ppic");
				post = new Post(postid,postcontent,pPic, postdate, userid);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
	
	
	public List<Post> getPostByUserId(int userId) {
		List<Post> list = new ArrayList<>();
        String q = "select * from post where userid=? order by postid desc";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();
			while(set.next()) {
				int postid = set.getInt("postid");
				String postcontent = set.getString("postcontent");
				Timestamp postdate = set.getTimestamp("postdate");
				int userid = set.getInt("userid");
				String pPic = set.getString("pPic");
				Post post = new Post(postid,postcontent,pPic, postdate, userid);
				list.add(post);
				
			}

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
