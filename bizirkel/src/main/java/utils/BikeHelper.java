package utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import db.DaoController;
import objects.Bike;
import objects.Reservation;
import objects.ReservationItem;

public class BikeHelper {
	public static ArrayList<Bike> getBikes(String category, ArrayList<Bike> bikes) {
		if (category == null)
			return bikes;
		ArrayList<Bike> resultBikes = new ArrayList<Bike>();
		if (bikes != null) {
			for (Bike bike : bikes) {
				if (bike.getCategory().equals(category)) {
					resultBikes.add(bike);
				}
			}
		}
		return resultBikes;
	}

	public static ArrayList<Bike> sortBikes(String sortAlgorithm, ArrayList<Bike> bikes) {
		bikes.sort((Bike b1, Bike b2) -> {
			if (b1.getPrice() > b2.getPrice())
				return 1;
			if (b1.getPrice() < b2.getPrice())
				return -1;
			return 0;
		});

		if (sortAlgorithm.equals("descending")) {
			Collections.reverse(bikes);
		}

		return bikes;
	}

	public static ArrayList<Bike> filterEbikes(boolean isEbike, ArrayList<Bike> bikes) {
		ArrayList<Bike> resultBikes = new ArrayList<Bike>();
		for (Bike bike : bikes) {
			if (bike.isEbike() == isEbike) {
				resultBikes.add(bike);
			}
		}
		return resultBikes;
	}

	public static ArrayList<Bike> removeReservatedAmounts(ArrayList<Bike> bikesafterres, java.util.Date startdate,
			java.util.Date enddate, ArrayList<Reservation> reservations) {
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

		return bikesafterres;
	}

	public static ArrayList<Bike> getCartBikes(DaoController dao, HttpServletRequest request) {
		ArrayList<Bike> resultbikes = new ArrayList<Bike>();
		ArrayList<Bike> bikes = null;
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
		Cookie[] bikesCookie = request.getCookies();
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
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}

		return resultbikes;
	}

	public static String checkAvailability(ArrayList<Bike> bikesafterres, ArrayList<Bike> cartbikes) {
		String notavailable = "";
		int amount = 0;
		for(Bike bike:bikesafterres) {
				for(Bike cartbike:cartbikes) {
					if(cartbike.getId() == bike.getId()) {
						amount = cartbike.getAmount();
						if(amount < bike.getAmount()) {
							notavailable += bike.getId() + "-";
						}
					}
				}
		}
		
		return notavailable;
	}
}
