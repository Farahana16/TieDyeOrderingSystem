package model;

public class Feedback {
	int feedbackId;
    String  feedbackRating;
	String feedbackComment;
	int orderId;
	
	public int getFeedbackId() {return feedbackId;}
	public String getFeedbackComment() {return feedbackComment;}
	public String getFeedbackRating() {return feedbackRating;}
	public int getOrderId() {return orderId;}
	
	public void setFeedbackRating(String feedbackRating) {this.feedbackRating = feedbackRating;}
	public void setOrderId(int orderId) {this.orderId = orderId;}
	public void setFeedbackId(int feedbackId) {this.feedbackId = feedbackId;}
	public void setFeedbackComment(String feedbackComment) {this.feedbackComment = feedbackComment;}
	

}
