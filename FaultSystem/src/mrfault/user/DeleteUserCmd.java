package mrfault.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mrfault.mysql.MySQLAccess;

/**
 * Servlet implementation class DeleteUserCmd
 */
@WebServlet("/DeleteUserCmd")
public class DeleteUserCmd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUserCmd() {
        super();
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
		String logonId = (String) request.getParameter("logonid");
		String query1 = "delete from mrfault.USERS where logonid ='"+ logonId + "'";
		
		try {
			MySQLAccess db = new MySQLAccess();
			db.executeCreateUpdateQuery(query1);			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		String msgString = "User "+logonId+" deleted successfully.";
		request.setAttribute("msg", msgString);
		RequestDispatcher view = request.getRequestDispatcher("jsps/AllUsers.jsp");
		view.forward(request, response);
	}

}
