package utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

import javax.servlet.http.Cookie;

public class DateHelper {
	public static String changeDate(String date) {
		String s1 = date.substring(0,4);
		String s2 = date.substring(5,7);
		String s3 = date.substring(8,10);
		return s2+"/"+s3+"/"+s1;
	}
	
	public static String changeDateForInsert(String date) {
        String s1 = date.substring(0,2);
        String s2 = date.substring(3,5);
        String s3 = date.substring(6,10);
        return s3+"-"+s1+"-"+s2;
    }
	
	public static Object[] getStartEndDate(String dateString, Cookie[] cookies) {
		java.util.Date startdate = null;
		java.util.Date enddate = null;
		String startdateString = "";
		String enddateString = "";
		if (dateString == null || dateString == "") {
			if (cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if (cookie.getName().equals("date"))
						dateString = cookie.getValue();
				}
			}
			if (dateString == null || dateString == "") {
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
		
		Object[] dates = {startdate, enddate, startdateString, enddateString};
		return dates;
	}
	
	public static int getDaysBetween(java.util.Date startdate, java.util.Date enddate) {
		long diff = (enddate.getTime() - startdate.getTime()) / (1000*60*60*24) + 1;
		return (int) diff;
	}
}
