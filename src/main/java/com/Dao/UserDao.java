package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.User.UserList;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean adduser(UserList ul) {
		boolean f=false;
		
		try {
			String query="insert into userlist(name, email, password) values(?,?,?)";
			PreparedStatement pd=con.prepareStatement(query);
			pd.setString(1, ul.getName());
			pd.setString(2, ul.getEmail());
			pd.setString(3, ul.getPassword());
			int rs=pd.executeUpdate();
			
			if(rs==1) {
				f=true;
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public UserList loginUser(UserList ul) {

		UserList user=null;
		
		try {
			String query = "select * from userlist where email=? and password=?";
			
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1, ul.getEmail());
			pd.setString(2, ul.getPassword());
			
			ResultSet rs = pd.executeQuery();
			
			if(rs.next()) {
				user = new UserList();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
			
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		
		return user;
	}
}
