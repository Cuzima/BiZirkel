package utils;

public class DateHelper {
	public static String changeDate(String date) {
		String s1 = date.substring(0,4);
		String s2 = date.substring(5,7);
		String s3 = date.substring(8,10);
		return s2+"/"+s3+"/"+s1;
	}
}
