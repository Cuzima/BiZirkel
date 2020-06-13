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
		ArrayList<Bike> bikes = null;
		bikes = (ArrayList<Bike>) request.getSession().getAttribute("bikes");
		// if (bikes == null) {
		try {
			bikes = dao.getAllBikes();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// }

		//Sort bikes depending on the selected sort
		String sortPrice = request.getParameter("sortPrice");
		if(sortPrice != null) bikes = BikeHelper.sortBikes(sortPrice, bikes);
		request.getSession().setAttribute("bikes", bikes);
		
		//Filter e-bikes
		String ebike = request.getParameter("filterEbike");
		
		if(ebike != null && !ebike.equals("E-Bike / Non E-Bike...")) {
			Boolean isEbike = Boolean.parseBoolean(ebike);
			bikes = BikeHelper.filterEbikes(isEbike, bikes);
		}
		request.getSession().setAttribute("bikes", bikes);

		// Get Bikes according to the selected category
		String category = request.getParameter("category");
		if (category == null) {
			category = (String) request.getSession().getAttribute("category");
			if(category == null) {
				request.setAttribute("page", "rent");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		}
		
		bikes = BikeHelper.getBikes(category, bikes);
		request.getSession().setAttribute("category", category);

		ArrayList<Bike> bikesafterres = new ArrayList<Bike>();
		bikesafterres = bikes;

		java.util.Date startdate = null;
		java.util.Date enddate = null;
		String dateString = request.getParameter("date");
		String startdateString = "";
		String enddateString = "";
		if (dateString == null) {
			Cookie[] cookies = request.getCookies();
			if (cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("date"))
						dateString = cookie.getValue();
				}
			}
			if (dateString == null) {
				Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime());
				startdate = today;
				enddate = today;
				startdateString = today.toString();
				enddateString = today.toString();
			} else {
				startdateString = dateString.substring(0, 10);
				enddateString = dateString.substring(10, 20);
				try {
					startdate = new SimpleDateFormat("yyyy/MM/dd").parse(startdateString);
					enddate = new SimpleDateFormat("yyyy/MM/dd").parse(enddateString);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} else {
			startdateString = dateString.substring(0, 10);
			enddateString = dateString.substring(10, 20);
			try {
				startdate = new SimpleDateFormat("yyyy/MM/dd").parse(startdateString);
				enddate = new SimpleDateFormat("yyyy/MM/dd").parse(enddateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ArrayList<Reservation> reservations = null;
		reservations = (ArrayList<Reservation>) request.getSession().getAttribute("reservations");
		if (reservations == null) {
			try {
				reservations = dao.getAllReservations();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (reservations != null) {
			for (Reservation reservation : reservations) {
				if ((startdate.after(reservation.getStartDate()) && startdate.before(reservation.getEndDate()))
						|| (enddate.after(reservation.getStartDate()) && enddate.before(reservation.getEndDate()))
						|| (startdate.after(reservation.getStartDate()) && enddate.before(reservation.getEndDate()))
						|| (startdate.before(reservation.getStartDate()) && enddate.after(reservation.getEndDate()))
						|| (startdate.compareTo(reservation.getStartDate()) == 0)
						|| (startdate.compareTo(reservation.getEndDate()) == 0)
						|| (enddate.compareTo(reservation.getStartDate()) == 0)
						|| (enddate.compareTo(reservation.getEndDate()) == 0)) {
					for (ReservationItem reservationitem : reservation.getReservationItems()) {
						for (Bike bike : bikesafterres) {
							if (bike.getId() == reservationitem.getBikeid()) {
								bike.setAmount(bike.getAmount() - reservationitem.getAmount());
							}
						}
					}
				}
			}
		}
		request.setAttribute("startdate", DateHelper.changeDate(startdateString));
		request.setAttribute("enddate", DateHelper.changeDate(enddateString));

		// ----
		request.getSession().setAttribute("bikesafterre", bikesafterres);
		// ----

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
