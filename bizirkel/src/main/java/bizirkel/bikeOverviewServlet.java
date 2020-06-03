package bizirkel;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DaoController;
import objects.Bike;

/**
 * Servlet implementation class bikeOverviewServlet
 */

@WebServlet("/bikeOverview")
public class bikeOverviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bikeOverviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DaoController dao = new DaoController();
		ArrayList<Bike> bikes = null;
		try {
			bikes = dao.getAllBikes();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("hallo", "haldlo");
		request.setAttribute("bikes", bikes);
		request.setAttribute("page", "bikeOverview");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
