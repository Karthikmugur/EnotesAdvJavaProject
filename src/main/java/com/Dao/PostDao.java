package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean AddNotes(String ctitle, String cdesc, int userid) {
		boolean f=false;
		try {
			String query = "insert into postnotes(ctitle, cdesc, userid) values (?,?,?)";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1, ctitle);
			pd.setString(2, cdesc);
			pd.setInt(3, userid);
			
			int i = pd.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			
		}
		
		return f;
		
	}
	
	public List<Post> getData(int id){
		List<Post> list = new ArrayList<Post>();
		Post post = null; 
		
		try {
			String query = "select * from postnotes where userid=? order by Cid DESC";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, id);
			
			ResultSet rs = pd.executeQuery();
			
			while(rs.next()) {
				post = new Post();
				post.setCid(rs.getInt(1));
				post.setCtitle(rs.getString(2));
				post.setCdesc(rs.getString(3));
				list.add(post);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Post getDataById(int noteid) {
		Post p = null;
		try {
			String query="select * from postnotes where cid=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, noteid);
			
			ResultSet rs = pd.executeQuery();
			
			if(rs.next()) {
				p=new Post();
				p.setCid(rs.getInt(1));
				p.setCtitle(rs.getString(2));
				p.setCdesc(rs.getString(3));
			}
			
		}catch(Exception e) {
			
		}
		
		
		return p;
	}
	
	public boolean PostUpdate(int nid, String ti, String de) {
		boolean f=false;
		try {
			String query="update postnotes set ctitle=?, cdesc=? where cid=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1, ti);
			pd.setString(2, de);
			pd.setInt(3, nid);
			int i =  pd.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	
	public boolean DeleteNotes(int nid) {
		boolean f=false;
		
		try {
			String query="delete from postnotes where cid=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, nid);
			int i =  pd.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
}
