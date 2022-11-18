package com.User;

public class Post {
	
	private int cid;
	private String ctitle;
	private String cdesc;
	private UserList user;
	public Post() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Post(int cid, String ctitle, String cdesc, UserList user) {
		super();
		this.cid = cid;
		this.ctitle = ctitle;
		this.cdesc = cdesc;
		this.user = user;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCdesc() {
		return cdesc;
	}
	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}
	public UserList getUser() {
		return user;
	}
	public void setUser(UserList user) {
		this.user = user;
	}

}
