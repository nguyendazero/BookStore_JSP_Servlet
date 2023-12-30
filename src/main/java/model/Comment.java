package model;

import java.util.Date;

public class Comment {
	private int id_comment;
	private String id_u;
	private int id_p;
	private String content;
	private String date;
	
	public Comment() {

	}
	
	public Comment(int id_comment, String id_u, int id_p, String content, String date) {
		this.id_comment = id_comment;
		this.id_u = id_u;
		this.id_p = id_p;
		this.content = content;
		this.date = date;
	}
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getId_u() {
		return id_u;
	}
	public void setId_u(String id_u) {
		this.id_u = id_u;
	}
	public int getId_p() {
		return id_p;
	}
	public void setId_p(int id_p) {
		this.id_p = id_p;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Comment [id_comment=" + id_comment + ", id_u=" + id_u + ", id_p=" + id_p + ", content=" + content
				+ ", date=" + date + "]";
	}
	
	
}
