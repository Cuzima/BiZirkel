package utils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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
}
