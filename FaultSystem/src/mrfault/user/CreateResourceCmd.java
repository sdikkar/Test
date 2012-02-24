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
 * Servlet implementation class CreateResourceCmd
 */
@WebServlet("/CreateResourceCmd")
public class CreateResourceCmd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateResourceCmd() {
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
		
		String logonId = (String) request.getParameter("logonId");
		String password = (String) request.getParameter("password");
		String firstname = (String) request.getParameter("firstname");
		String lastname = (String) request.getParameter("lastname");
		String email = (String) request.getParameter("email");
		String usertype = (String) request.getParameter("usertype");
		
		String query1 = "insert into mrfault.USERS values ("+"'"+ logonId + "',"+"'"+ password + "',"+"'"+ firstname + "',"+"'"+ lastname + "',"+"'"+ email + "',"+"'"+ usertype + "',"+"'',"+"'',"+"'',"+"'',"+"''"+")";
				
		try {
			MySQLAccess db = new MySQLAccess();
			db.executeCreateUpdateQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msgString = "User " + logonId +" successfully created";
		
		request.setAttribute("msg", msgString);
		RequestDispatcher view = request.getRequestDispatcher("jsps/results.jsp");
		view.forward(request, response);
		
	}

}
