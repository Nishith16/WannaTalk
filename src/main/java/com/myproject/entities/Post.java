package com.myproject.entities;

import java.sql.*;

public class Post {
	private int postid;
	private String postcontent;
	private String pPic;
	private Timestamp postdate;
	private int userid;	

	public Post(int postid, String postcontent,String pPic,Timestamp postdate,int userid) {
		super();
		this.postid = postid;
		this.postcontent = postcontent;
		this.pPic = pPic;
		this.postdate = postdate;
		this.userid = userid;
	}


	public Post() {
		super();
	}

	public Post(String postcontent,String pPic, Timestamp postdate, int userid) {
		super();
		this.postcontent = postcontent;
		this.pPic = pPic;
		this.postdate = postdate;
		this.userid = userid;
	}

	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public String getPostcontent() {
		return postcontent;
	}

	public void setPostcontent(String postcontent) {
		this.postcontent = postcontent;
	}
	
	public String getpPic() {
		return pPic;
	}

	public void setpPic(String pPic) {
		this.pPic = pPic;
	}


	public Timestamp getPostdate() {
		return postdate;
	}

	public void setPostdate(Timestamp postdate) {
		this.postdate = postdate;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}


}
