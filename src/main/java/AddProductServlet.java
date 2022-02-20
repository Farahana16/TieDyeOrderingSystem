

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Statement;
import db.ConnectionManager;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String cName = request.getParameter("cName");
		String pName = request.getParameter("pName");
		String pDesc = request.getParameter("pDesc");
		//String pPics = request.getParameter("pPics");
		float price = Float.parseFloat(request.getParameter("price"));
		int pQty = Integer.parseInt(request.getParameter("pQty"));
		int cID = 4;
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><html><body>");
		out.print("Category:" + cName + "<br>");
		out.print("Product Name:"+ pName + "<br>");
		out.print("Product Details:" + pDesc + "<br>");
		//out.print("Product images:" + pPics + "<br>");
		out.print("Price: RM " + price + " <br>");
		out.print("Quantity: " + pQty + " <br>");
		
		out.print("</body></html>");
		
		try 
		{
            
            Connection conn = ConnectionManager.getConnection();
            Statement st = (Statement) conn.createStatement();
           
            String sql = "insert into product (pID, pName, pDesc, pPics, price, pQty, cID) values('','"+pName+"','"+pDesc+"','-','"+price+"','"+pQty+"','"+cID+"')";

            st.executeUpdate(sql);
            out.println("<script type=\"text/javascript\">");
            out.println("alert(\"Please reenter the username/Password\")");
            out.println("</script>");
        	response.sendRedirect("product.jsp");
        }
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
        } 
		catch (SQLException e) 
		{
            e.printStackTrace();
        }
	}
}
