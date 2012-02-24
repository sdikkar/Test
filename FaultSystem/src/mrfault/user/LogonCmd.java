package mrfault.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mrfault.mysql.MySQLAccess;

/**
 * Servlet implementation class LogonCmd
 */
@WebServlet("/LogonCmd")
public class LogonCmd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LogonCmd() {
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
		boolean isUserAuthentic = false;
		String logonId = (String) request.getParameter("logonId");
		String password = (String) request.getParameter("password");
		String query1 = "select * from mrfault.USERS where logonId ='"+ logonId +"'and password ='"+ password+"'";
		
		try {
			MySQLAccess db = new MySQLAccess();
			isUserAuthentic = db.executeLogonQuery(query1);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(isUserAuthentic){
			
			Cookie cookie = new Cookie ("logonid",logonId);
			cookie.setMaxAge(30 * 24 * 60 * 60);
			response.addCookie(cookie);
			response.sendRedirect("jsps/results.jsp");
		}else{
			String msgString = "Logon unsuccessfull. Please try a diffrent username or password.";
			request.setAttribute("msg", msgString);
			RequestDispatcher view = request.getRequestDispatcher("jsps/LogonPage.jsp");
			view.forward(request, response);
		}
	}

}
