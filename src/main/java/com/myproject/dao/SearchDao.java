package com.myproject.dao;

import java.sql.*;

public class SearchDao {
	Connection con;

    public SearchDao(Connection con) {
        this.con = con;
    }
    
	public boolean getSearch(String search) {	
		boolean f = false;
		try{
			 Statement st = con.createStatement();
			 String sql = "select * from register where firstname LIKE '"+search+"%' ";
			 
			 ResultSet rs = st.executeQuery(sql);
			 while(rs.next()){
				 rs.getInt("id");
				 rs.getString("firstName");
				}
			 f = true;
			 System.out.println("done");
			}catch(Exception e){
				e.printStackTrace();
			}
		return f;
		
	}
}
