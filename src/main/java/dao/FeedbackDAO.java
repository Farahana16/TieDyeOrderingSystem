package dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import db.ConnectionManager;
import model.Feedback;

public class FeedbackDAO {
	static Connection con = null;
	static PreparedStatement ps = null;
	static Statement stmt = null;
	static ResultSet rs = null;
	private int feedbackid, orderid;
	private String feedbackcomment, feedbackrating;
	
	public void addFeedback(Feedback bean) {
		feedbackid = bean.getFeedbackId();
		feedbackrating = bean.getFeedbackRating();
		feedbackcomment = bean.getFeedbackComment();
		orderid = bean.getOrderId();
		
		try {
			con = ConnectionManager.getConnection();
			ps = con.prepareStatement("INSERT INTO feedbacks(feedbackrating, feedbackcomment,orderID) VALUES(?,?,?)");
			
			ps.setString(1, feedbackrating);
			ps.setString(2, feedbackcomment);
			ps.setInt(3, orderid);
		
			
			ps.executeUpdate();
			System.out.println("Succefully insert feedback");
			
			con.close();	
		}catch(Exception e) {e.printStackTrace();}
		
	} 
	//end add
	
	public static List<Feedback> getAllFeed() {
		List<Feedback> feed = new ArrayList<Feedback>();
		try {
			con = ConnectionManager.getConnection();
			stmt = con.createStatement();
			
			rs = stmt.executeQuery("SELECT * FROM feedback ORDER BY feedbackid");
			while(rs.next()) {
				Feedback f = new Feedback();
				f.setFeedbackId(rs.getInt("feedbackid"));
				f.setFeedbackRating(rs.getString("feedbackrating"));
				f.setFeedbackComment(rs.getString("feedbackcomment"));
				
				feed.add(f);
			} con.close();
		}catch (Exception e) {e.printStackTrace();}
		return feed;
	}

	public static Feedback getFeedbackById(int feedbackid) {
		Feedback f = new Feedback();
		try {
			con = ConnectionManager.getConnection();
			
			ps = con.prepareStatement("SELECT * FROM feedback WHERE feedbackid=?");
			ps.setInt(1, feedbackid);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				
				f.setFeedbackRating(rs.getString("feedbackrating"));
				f.setFeedbackComment(rs.getString("feedbackcomment"));
				
				
				
			} con.close();
		}catch(Exception e) {e.printStackTrace();}
		return f;
	}

public void deleteFeedback(int feedbackid) {
	try {
		con = ConnectionManager.getConnection();
		ps = con.prepareStatement("DELETE FROM feedback WHERE feedbackid=?");
		ps.setInt(1, feedbackid);
		ps.executeUpdate();
		
		con.close();
	}catch(Exception e) {e.printStackTrace();}
  }
}
