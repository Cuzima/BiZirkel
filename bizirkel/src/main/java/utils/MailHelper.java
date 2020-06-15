package utils;

import java.sql.Date;

public class MailHelper {

    public static int[] parseToInt(String[]bikeId) {

        int[] intBikeId = new int[bikeId.length];
        for(int i = 0; i<bikeId.length; i++) {
            intBikeId[i] = Integer.parseInt(bikeId[i]);
        }

        return intBikeId;
    }

}