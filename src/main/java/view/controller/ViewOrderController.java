package view.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import dao.ViewOrderDAO;
/**
 * Servlet implementation class ViewTicketController
 */
@WebServlet("/ViewOrderController")
public class ViewOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ViewOrderDAO dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOrderController() {
        super();
        dao = new ViewOrderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int custID = Integer.parseInt(request.getParameter("custID"));
		
		request.setAttribute("products", ViewOrderDAO.getAllViewByCustID(custID));
		RequestDispatcher view = request.getRequestDispatcher("ViewOrder.jsp?custID=" +custID);
		view.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int custID = Integer.parseInt(request.getParameter("custID"));
		
		request.setAttribute("products", ViewOrderDAO.getAllViewByCustID(custID));
		RequestDispatcher view = request.getRequestDispatcher("ViewOrder.jsp?custID=" +custID);
		view.forward(request,response);
		
	}

}