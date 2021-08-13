package com.myproject.entities;
import java.sql.*;
public class User {
	private int id;
	private String firstname;
	private String lastname;
	private String email;
	private String password;
    private String profile;
    private int followers;
    private int following;
	
	public User(int id, String firstname,String lastname, String email, String password,int followers,int following) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.followers = followers;
		this.following = following;
	}
	public User() {
		super();
		
	}
	public User(String firstname,String lastname, String email, String password,int followers,int following) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.password = password;
		this.followers = followers;
		this.following = following;
	}
	
	
	public User(String sendersid, String recieversid) {
		this.firstname = sendersid;
		this.lastname = recieversid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getFollowers() {
		return followers;
	}
	public void setFollowers(int followers) {
		this.followers = followers;
	}
	public int getFollowing() {
		return following;
	}
	public void setFollowing(int following) {
		this.following = following;
	}
}
