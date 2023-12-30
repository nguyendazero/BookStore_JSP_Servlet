package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Comment;
import model.Product;

public class CommentDAO {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CommentDAO(Connection con) {
		this.con = con;
	}
	
	public List<Comment> getAllCommentByIdProduct(int id_p){
		List<Comment> comments = new ArrayList<Comment>();
		
		try {
			query = "SELECT * FROM COMMENT WHERE id_p = ?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id_p);
			rs = pst.executeQuery();
			while(rs.next()) {
				Comment row = new Comment();
				row.setId_comment(rs.getInt("id_comment"));
				row.setId_u(rs.getString("id_u"));
				row.setId_p(rs.getInt("id_p"));
				row.setContent(rs.getString("content"));
				row.setDate(rs.getString("date"));
				
				comments.add(row);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return comments;
	}
	
	public void addComment(String id_u, int id_p, String content, String date) {
		try {
			query = "INSERT INTO comment(id_u, id_p, content, DATE)\n"
					+ "	VALUES(?, ?, ?, ?)";
			pst = con.prepareStatement(query);
			pst.setString(1,id_u);
			pst.setInt(2,id_p);
			pst.setString(3,content);
			pst.setString(4, date);
		
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public Comment getCommentByID(int id_c) {
		Comment row = null;
		try {
			query = "SELECT * FROM comment WHERE id_comment = ?";
			pst = con.prepareStatement(query);
			pst.setInt(1, id_c);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				row = new Comment();
				row.setId_comment(rs.getInt("id_comment"));
				row.setId_u(rs.getString("id_u"));
				row.setId_p(rs.getInt("id_p"));
				row.setContent(rs.getString("content"));
				row.setDate(rs.getString("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return row;
	}
	
	public void deleteComment(int id_c) {
		try {
			query = "delete from comment WHERE id_comment = ?";
			pst = con.prepareStatement(query);
			pst.setInt(1,id_c);
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
	
	public void updateCommentById(String content, int id_c){
		try {
			query = "UPDATE comment\n"
					+ "SET content = ?\n"
					+ "WHERE id_comment = ?";
			pst = con.prepareStatement(query);
			pst.setString(1,content);
			pst.setInt(2,id_c);
			
			pst.executeUpdate();
		} catch (Exception e) {
			
		}
	}
}
