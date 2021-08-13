package com.myproject.entities;
import java.sql.*;
public class Follow {
	
	private int followid;
	private int sender;
	private int reciever;
	
	public Follow(int followid, int sender, int reciever) {
		super();
		this.followid = followid;
		this.sender = sender;
		this.reciever = reciever;
	}
	
	public Follow() {
		super();
	}
	
	public Follow(int sender, int reciever) {
		super();
		this.sender = sender;
		this.reciever = reciever;
	}



	public int getFollowid() {
		return followid;
	}
	public void setFollowid(int followid) {
		this.followid = followid;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getReciever() {
		return reciever;
	}
	public void setReciever(int reciever) {
		this.reciever = reciever;
	}
	
}
