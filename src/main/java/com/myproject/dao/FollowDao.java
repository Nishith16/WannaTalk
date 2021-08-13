package com.myproject.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.myproject.entities.*;


public class FollowDao {
	private Connection con;
	
	public FollowDao(Connection con) {
		this.con = con;
	}
	public boolean saveFollower(Follow flw) {
		boolean f = false;
		try {
			String q = "insert into follow(sender,reciever) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setInt(1,flw.getSender());
			pstmt.setInt(2,flw.getReciever());
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean DeleteFollower(Follow flw) {
		boolean f = false;
		try {
			String q = "delete from follow where sender=? and reciever=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			
			pstmt.setInt(1,flw.getSender());
			pstmt.setInt(2,flw.getReciever());
			
			pstmt.executeUpdate();
			f=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean checkFollow(int senderid,int recieverid) {
		try {
			String q = "select * from follow where sender=? and reciever=?";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, senderid);
			pstmt.setInt(2, recieverid);
			ResultSet set = pstmt.executeQuery();
			int count=0;
			while(set.next()) {
				count++;
			}
			if(count>0) {
				return true;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
		
		
	}
	
	public List<Integer> getAllFollowingId(int senderid){
		List<Integer> list = new ArrayList<>();
		try {
			String q = "select reciever from follow where sender=?";
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, senderid);			
			ResultSet set = p.executeQuery();
			while(set.next() || set.previous()) {
				list.add(set.getInt(senderid));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Integer> getAllFollowerId(int recieverid){
		List<Integer> followerlist = new ArrayList<>();
		try {
			String q = "select sender from follow where reciever=?";
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, recieverid);			
			ResultSet set = p.executeQuery();
			while(set.next() || set.previous()) {
				followerlist.add(set.getInt(recieverid));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return followerlist;
	}

}
