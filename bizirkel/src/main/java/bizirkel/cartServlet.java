package bizirkel;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DaoController;
import objects.Bike;
import objects.Reservation;
import utils.BikeHelper;
import utils.DateHelper;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cart")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie bikesCookie[] = request.getCookies();
		DaoController dao = new DaoController();
		ArrayList<Bike> bikes = null;
		// Bike[] resultbikes = new Bike[10];
		ArrayList<Bike> resultbikes = new ArrayList<Bike>();
		String bikesids = "";
		bikes = (ArrayList<Bike>) request.getSession().getAttribute("bikes");
		if (bikes == null) {
			try {
				bikes = dao.getAllBikes();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String dateString = "";
		String startdateString = "";
		String enddateString = "";
		if (bikesCookie != null) {
			for (Cookie bikeCookie : bikesCookie) {
				try {
					if (bikeCookie.getName().equals("date"))
						dateString = bikeCookie.getValue();
					int bikeid = Integer.parseInt(bikeCookie.getName());
					String bikeamount = bikeCookie.getValue();
					for (Bike bike : bikes) {
						if (bikeid == bike.getId()) {
							bike.setAmount(Integer.parseInt(bikeamount));
							resultbikes.add(bike);
//					for(int i = 0; i < resultbikes.length; i++) {
//						resultbikes[i] = bike;	
//					}
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}

//		startdateString = (String) DateHelper.getStartEndDate(dateString, bikesCookie)[2];
//		enddateString = (String) DateHelper.getStartEndDate(dateString, bikesCookie)[3];
		if (dateString != "") {
			// 20/20/2020
			startdateString = dateString.substring(0, 10);
			enddateString = dateString.substring(10, 20);
			request.setAttribute("startdate", DateHelper.changeDate(startdateString));
			request.setAttribute("enddate", DateHelper.changeDate(enddateString));
		}

		try {
			bikes = dao.getAllBikes();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		// reduce the amount of available bikes considering the reservations for choosen
		Cookie[] cookies = request.getCookies();
		Object[] dates = DateHelper.getStartEndDate(dateString, cookies);
		java.util.Date startdate = (java.util.Date) dates[0];
		java.util.Date enddate = (java.util.Date) dates[1];
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
		
//		for(Bike bike:bikesafterres) {
//			for(Bike bikefinish:resultbikes) {
//				if(bikefinish.getId() == bike.getId()) {
//					bikefinish.setAmount(bike.getAmount());
//				}
//			}
//		}
		
		int daysbetween = DateHelper.getDaysBetween(startdate, enddate);

		request.setAttribute("daysbetween", daysbetween);
		request.setAttribute("cartbikes", resultbikes);
		request.getSession().setAttribute("bikesafterre", bikesafterres);
		request.setAttribute("page", "cart");
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
