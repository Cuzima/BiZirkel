package db;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import objects.Bike;
import objects.Reservation;
import objects.ReservationItem;

public class DaoController {
	public ArrayList<Bike> getAllBikes() throws SQLException {

		ArrayList<Bike> bikeList = new ArrayList<Bike>();
		while (bikeList.isEmpty()) {
			try (Connection con = Dao.getInstance().getConnection()) {
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM bike2");

				while (rs.next()) {
					Bike bike = new Bike();
					bike.setId(rs.getInt(1));
					bike.setName(rs.getString(2));
					bike.setDescription(rs.getString(3));
					bike.setType(rs.getString(4));
					bike.setPrice(rs.getDouble(5));
					bike.setAmount(rs.getInt(6));
					bike.setCategory(rs.getString(7));
					bike.setImg(rs.getString(8));
					bike.setEbike(rs.getBoolean(9));

					bikeList.add(bike);
				}

				for (Bike bike : bikeList) {
					System.out.print(bike.getId());
					System.out.print(bike.getName());
					System.out.println();
				}

				return bikeList;

			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;

	}

	public ArrayList<Reservation> getAllReservations() throws SQLException, InterruptedException, ParseException {
		ArrayList<ReservationItem> reservationitemList = new ArrayList<ReservationItem>();
		while (reservationitemList.isEmpty()) {
			try (Connection con = Dao.getInstance().getConnection()) {
				Statement stmt = con.createStatement();
				ResultSet rs2 = stmt.executeQuery("SELECT * FROM reservationitem");

				if (rs2 != null) {
					while (rs2.next()) {
						ReservationItem reservationitem = new ReservationItem();
						reservationitem.setId(rs2.getInt(1));
						reservationitem.setReservationid(rs2.getInt(2));
						reservationitem.setBikeid(rs2.getInt(3));
						reservationitem.setAmount(rs2.getInt(4));
						reservationitemList.add(reservationitem);
					}
				}
				ArrayList<Reservation> reservationList = new ArrayList<Reservation>();

				while (reservationList.isEmpty()) {
					ResultSet rs = stmt.executeQuery("SELECT * FROM reservation");

					if (rs != null) {
						while (rs.next()) {
							Reservation reservation = new Reservation();
							reservation.setId(rs.getInt(1));
							reservation.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(2)));
							reservation.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(3)));
							reservation.setName(rs.getString(4));
							reservation.setSurname(rs.getString(5));
							reservation.setEmail(rs.getString(6));
							reservation.setPhone(rs.getString(7));

							// get reservationitems
							ArrayList<ReservationItem> reservationitemadd = new ArrayList<ReservationItem>();
							for (ReservationItem reservationitem : reservationitemList) {
								if (reservationitem.getReservationid() == reservation.getId()) {
									reservationitemadd.add(reservationitem);
								}
							}

							reservation.setReservationItems(reservationitemadd);
							reservationList.add(reservation);
						}
					}
					return reservationList;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		}
		return null;
	}
//	public ArrayList<Bike> getAllBikes() throws SQLException, InterruptedException {
//		Dao dao = new Dao();
//		ArrayList<Bike> bikeList = new ArrayList<Bike>();
//		ResultSet rs = dao.getResult("SELECT * FROM bike");
//		if (rs != null) {
//			while (rs.next()) {
//				Bike bike = new Bike();
//				bike.setId(rs.getInt(1));
//				bike.setName(rs.getString(2));
//				bike.setDescription(rs.getString(3));
//				bike.setType(rs.getString(4));
//				bike.setPrice(rs.getDouble(5));
//				bike.setAmount(rs.getInt(6));
//				bike.setCategory(rs.getString(7));
//				bike.setImg(rs.getString(8));
//
//				bikeList.add(bike);
//
//			}
//
//			for (Bike bike : bikeList) {
//				System.out.print(bike.getId());
//				System.out.print(bike.getName());
//				System.out.println();
//			}
//		}
//
//		if (rs != null)
//			rs.close();
//		if (dao != null)
//			dao.closeTransaktion();
//		return bikeList;
//	}
//	
//	public ArrayList<Reservation> getAllReservations() throws SQLException, InterruptedException, ParseException{
//		Dao dao = new Dao();
//		ResultSet rs2 = dao.getResult("SELECT * FROM reservationItems");
//		ArrayList<ReservationItem> reservationitemList = new ArrayList<ReservationItem>();
//		if(rs2 != null) {
//			while(rs2.next()) {
//				ReservationItem reservationitem = new ReservationItem();
//				reservationitem.setId(rs2.getInt(1));
//				reservationitem.setReservationid(rs2.getInt(2));
//				reservationitem.setBikeid(rs2.getInt(3));
//				reservationitem.setAmount(rs2.getInt(4));
//			}
//		}
//		
//		ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
//		ResultSet rs = dao.getResult("SELECT * FROM Reservation");
//		if(rs != null) {
//			while(rs.next()) {
//				Reservation reservation = new Reservation();
//				reservation.setId(rs.getInt(1));
//				reservation.setStartDate(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(2)));
//				reservation.setEndDate(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(3)));
//				reservation.setName(rs.getString(4));
//				reservation.setSurname(rs.getString(5));
//				reservation.setEmail(rs.getString(6));
//				reservation.setPhone(rs.getString(7));
//				
//				//get reservationitems
//				ArrayList<ReservationItem> reservationitemadd = new ArrayList<ReservationItem>();
//				for(ReservationItem reservationitem:reservationitemList) {
//					if(reservationitem.getReservationid() == reservation.getId()) {
//						reservationitemadd.add(reservationitem);
//					}
//				}
//				
//				reservation.setReservationItems(reservationitemadd);
//				reservationList.add(reservation);
//			}
//		}
//
//		if (rs != null)
//			rs.close();
//		if (rs2 != null)
//			rs2.close();
//		if (dao != null)
//			dao.closeTransaktion();
//		return reservationList;
//	}
	
	public int getReservationId()throws SQLException, InterruptedException, ParseException {
		ArrayList<Reservation> reservationId = new ArrayList<Reservation>();
		try (Connection con = Dao.getInstance().getConnection()) {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT Max(id) FROM reservation");

			while (rs.next()) {
				Reservation reservation= new Reservation();
				reservation.setId(rs.getInt(1));
				reservationId.add(reservation);
			}

			int id = 0;
			for (Reservation reservation : reservationId) {
				id = reservation.getId();
			}

			return id;

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	} 
	
	public void setReservation(int id, Date startDate, Date endDate, String email, String firstName, String lastName)throws SQLException, InterruptedException, ParseException {
		
		try (Connection con = Dao.getInstance().getConnection()) {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("INSERT INTO RESERVATION(id, startdate, enddate, email, name, surname)" + 
					"VALUES('"+id+"', '"+startDate+"', '"+endDate+"', '"+email+"', '"+firstName+"', '"+lastName+"')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int getReservationItemId()throws SQLException, InterruptedException, ParseException {
		ArrayList<Reservation> reservationId = new ArrayList<Reservation>();
		try (Connection con = Dao.getInstance().getConnection()) {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT Max(id) FROM reservationitem");

			while (rs.next()) {
				Reservation reservation= new Reservation();
				reservation.setId(rs.getInt(1));
				reservationId.add(reservation);
			}

			int id = 0;
			for (Reservation reservation : reservationId) {
				id = reservation.getId();
			}

			return id;

		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	} 
	
	public void setReservationItem(int id, int reservationId, int bikeId, int amount)throws SQLException, InterruptedException, ParseException {
		
		try (Connection con = Dao.getInstance().getConnection()) {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("INSERT INTO RESERVATIONITEM(id, reservationid, bikeid, amount)" + 
					"VALUES('"+id+"', '"+reservationId+"', '"+bikeId+"', '"+amount+"')");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
