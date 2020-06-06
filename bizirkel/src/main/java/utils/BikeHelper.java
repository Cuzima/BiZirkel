package utils;

import java.util.ArrayList;

import objects.Bike;

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
}
