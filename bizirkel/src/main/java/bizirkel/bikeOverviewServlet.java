package bizirkel;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DaoController;
import objects.Bike;
import objects.Reservation;
import objects.ReservationItem;
import utils.BikeHelper;
import utils.DateHelper;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DaoController dao = new DaoController();

		// get bikes from database
		ArrayList<Bike> bikes = null;
		try {
			bikes = dao.getAllBikes();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// sort bikes depending on the selected sort algorithm
		if (bikes != null) {
			String sortPrice = request.getParameter("sortPrice");
			if (sortPrice != null)
				bikes = BikeHelper.sortBikes(sortPrice, bikes);
			request.getSession().setAttribute("bikes", bikes);

			// filter e-bikes
			String ebike = request.getParameter("filterEbike");
			if (ebike != null && !ebike.equals("E-Bike / Non E-Bike...")) {
				Boolean isEbike = Boolean.parseBoolean(ebike);
				bikes = BikeHelper.filterEbikes(isEbike, bikes);
			}

			// set the filtered bikes to session
			request.getSession().setAttribute("bikes", bikes);

			// filter Bikes according to the selected category
			String category = request.getParameter("category");
			if (category == null) {
				category = (String) request.getSession().getAttribute("category");
				if (category == null) {
					request.setAttribute("page", "rent");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
			bikes = BikeHelper.getBikes(category, bikes);

			request.getSession().setAttribute("category", category);
		}

		// reduce the amount of available bikes considering the reservations for choosen
		String dateString = request.getParameter("date");
		Cookie[] cookies = request.getCookies();
		Object[] dates = DateHelper.getStartEndDate(dateString, cookies);
		java.util.Date startdate = (java.util.Date) dates[0];
		java.util.Date enddate = (java.util.Date) dates[1];
		String startdateString = (String) dates[2];
		String enddateString = (String) dates[3];
		ArrayList<Reservation> reservations = null;
		try {
			reservations = dao.getAllReservations();
		} catch (SQLException | InterruptedException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ArrayList<Bike> bikesafterres = new ArrayList<Bike>();
		bikesafterres = bikes;
		bikesafterres = BikeHelper.removeReservatedAmounts(bikesafterres, startdate, enddate, reservations);

		request.setAttribute("startdate", DateHelper.changeDate(startdateString));
		request.setAttribute("enddate", DateHelper.changeDate(enddateString));
		request.getSession().setAttribute("bikesafterre", bikesafterres);
		request.getSession().setAttribute("reservations", reservations);
		request.setAttribute("decide", request.getSession().getAttribute("decide"));
		request.setAttribute("page", "bikeOverview");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
