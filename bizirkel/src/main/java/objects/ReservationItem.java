package objects;

public class ReservationItem {
	public void setId(int id) {
		this.id = id;
	}
	public void setBikeid(int bikeid) {
		this.bikeid = bikeid;
	}
	public int getReservationid() {
		return reservationid;
	}
	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
	}
	private int id;
	private int reservationid;
	private int bikeid;
	private int amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getId() {
		return id;
	}
	public int getBikeid() {
		return bikeid;
	}
}
