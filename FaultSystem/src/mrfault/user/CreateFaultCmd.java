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
 * Servlet implementation class CreateFaultCmd
 */
@WebServlet("/CreateFaultCmd")
public class CreateFaultCmd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateFaultCmd() {
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
		
		String faultId = (String) request.getParameter("faultId");
		String logonId = (String) request.getParameter("logonId");
		String shortdescription = (String) request.getParameter("shortdescription");
		String longdescription = (String) request.getParameter("longdescription");
		String reporter = (String) request.getParameter("reporter");
		String priority = (String) request.getParameter("priority");
		String status = (String) request.getParameter("status");
		
		String query1 = "insert into mrfault.FAULTS values ('"+ faultId + "','"+ logonId + "','"+ shortdescription + "','"+ longdescription + "','"+ reporter + "','"+ priority + "','"+ status + "','','','','','')";
				
		try {
			MySQLAccess db = new MySQLAccess();
			db.executeCreateUpdateQuery(query1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String msgString = "Fault " + faultId +" successfully created";
		
		request.setAttribute("msg", msgString);
		RequestDispatcher view = request.getRequestDispatcher("jsps/results.jsp");
		view.forward(request, response);
		
	}

}
