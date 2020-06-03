package db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import objects.Bike;

public class DaoController {
	
	
	
	public ArrayList<Bike> getAllBikes() throws SQLException {
		Dao dao = new Dao();
		ArrayList<Bike> bikeList = new ArrayList<Bike>();
		ResultSet rs = dao.getResult("SELECT * FROM bike");
		
		while (rs.next()) {
			Bike bike = new Bike();
			bike.setId(rs.getString(1));
			bike.setName(rs.getString(2));
			bike.setDescription(rs.getString(3));
			bike.setType(rs.getString(4));
			bike.setPrice(rs.getDouble(5));
			bike.setAmount(rs.getInt(6));
			bike.setCategory(rs.getString(7));
			bike.setImg(rs.getString(8));

			bikeList.add(bike);
			
		}

		for (Bike bike : bikeList) {
			System.out.print(bike.getId());
			System.out.print(bike.getName());
			System.out.println();
		}
		
		rs.close();
		dao.closeTransaktion();
		return bikeList;
	}
}
