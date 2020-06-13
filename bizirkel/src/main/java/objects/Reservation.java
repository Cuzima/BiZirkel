package objects;

import java.sql.Date;
import java.util.ArrayList;

public class Reservation {
	public void setId(int id) {
		this.id = id;
	}

	public void setStartDate(java.util.Date startDate) {
		this.startDate = startDate;
	}

	public void setEndDate(java.util.Date endDate) {
		this.endDate = endDate;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	private int id;
	private java.util.Date startDate;
	private java.util.Date endDate;
	private ArrayList<ReservationItem> reservationItems;
	private String email;
	private String name;
	private String surname;
	private String phone;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getId() {
		return id;
	}

	public java.util.Date getStartDate() {
		return startDate;
	}

	public java.util.Date getEndDate() {
		return endDate;
	}

	public ArrayList<ReservationItem> getReservationItems() {
		return reservationItems;
	}

	public String getEmail() {
		return email;
	}

	public String getName() {
		return name;
	}

	public String getSurname() {
		return surname;
	}

	public void setReservationItems(ArrayList<ReservationItem> reservationItems) {
		this.reservationItems = reservationItems;
	}

}
