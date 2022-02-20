package feedback;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.FeedbackDAO;
import model.Feedback;

/**
 * Servlet implementation class addFeedbackController
 */
@WebServlet(name = "addFeedbackControllerr", urlPatterns = { "/addFeedbackControllerr" })
public class addFeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FeedbackDAO dao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addFeedbackController() {
        super();
        dao = new FeedbackDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Feedback f = new Feedback();
		f.setFeedbackRating(request.getParameter("feedbackrating"));
		f.setFeedbackComment(request.getParameter("feedbackcomment"));
		f.setOrderId(Integer.parseInt(request.getParameter("orderID")));
		
		int custID = Integer.parseInt(request.getParameter("custID"));
	
		
		dao.addFeedback(f);
		request.setAttribute("feed",FeedbackDAO.getAllFeed());
		RequestDispatcher view = request.getRequestDispatcher("ListFeedback.jsp?custID=" +custID);
		view.forward(request, response);
	}

}
