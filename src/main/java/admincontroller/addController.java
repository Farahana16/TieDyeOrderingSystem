
package admincontroller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import adminregister.dao.adminregisterDAO;
import adminregister.model.adminregister;

/**
 *
 * @author User
 */
@WebServlet("/addController")
public class addController extends HttpServlet {
    private static final long serialVersionUID=1L;
    private adminregisterDAO dao;
    
    public addController(){
        super();
        dao = new adminregisterDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		adminregister a = new adminregister();
		a.setAdminname(request.getParameter("adminname"));
		a.setAdminemail(request.getParameter("adminemail"));
		//a.setAdminid(Integer.parseInt(request.getParameter("adminid")));
		a.setAdminusername(request.getParameter("adminusername"));
		a.setAdminphonenum(Integer.parseInt(request.getParameter("adminphonenum")));
		a.setAdminpwd(request.getParameter("adminpwd"));
		
		
		dao.addgadminregister(a);
		
		request.setAttribute("adminregister", adminregisterDAO.getAlladminregister());
		RequestDispatcher view = request.getRequestDispatcher("adminIndex.html");
		view.forward(request, response);
	}
}

