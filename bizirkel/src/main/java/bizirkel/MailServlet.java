package bizirkel;

import java.io.*;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import db.DaoController;
import objects.Mail;
import objects.Reservation;
import utils.DateHelper;
import utils.MailHelper;

import javax.mail.*;
import javax.mail.internet.*;

/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/mail")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("mailservlet wird jetzt ausgeführt");

		// GetReservierungsId()
		DaoController dao = new DaoController();
		int reservationId = -1;
		try {
			reservationId = dao.getReservationId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ReservationId");
		System.out.println(reservationId);
		reservationId++;
		
	
//		SetReservationId()
		
		String bikeName = request.getParameter("name");
		String bikeId=request.getParameter("bikeId");
		String price=request.getParameter("price");
		String amount=request.getParameter("amount");
	
		String totalPrice = request.getParameter("totalPrice");
		
		String[] bikeNames = bikeName.split(";;");
		String[] bikePrices = price.split(";;");
		
		String[] bikeIds = bikeId.split(";;");
		String[] bikeAmounts=amount.split(";;");
		int[] intbikeIds = MailHelper.parseToInt(bikeIds);
		int[] intBikeAmounts = MailHelper.parseToInt(bikeAmounts);
		
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName"); 
	    String phone=request.getParameter("number");
	    String note=request.getParameter("note");
	    String email=request.getParameter("email");  
	    
	   
	    String daterange=request.getParameter("date");
	    if(daterange.equals("undefined")) {
	    	Date today = new java.sql.Date(Calendar.getInstance().getTime().getTime());
	    	daterange=today.toString();
	    	daterange = DateHelper.changeDate(daterange);
	    	daterange = daterange + " - " + daterange;
	    }
	    String []date=daterange.split(" ");
	    System.out.println(date[0]);
	    System.out.println(date[2]);
	    String newStartDate = DateHelper.changeDateForInsert(date[0]);
	    String newEndDate=DateHelper.changeDateForInsert(date[2]);
	    
	    System.out.println("Startdatum Neu: "+ newStartDate );
	    System.out.println("Enddatum Neu: "+ newEndDate );
	    
		
		System.out.println("Vorname "+firstName);
		System.out.println("Nachname: " + lastName);
		System.out.println( "BikeName: " + bikeName);
		System.out.println("preis: " + price); 
		System.out.println("menge: "+amount );
		
		try {
			dao.setReservation(reservationId, newStartDate, newEndDate, firstName, lastName, email, phone );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("Reservation inserted");
		
		
		
		//GetReservationItemId 
		dao = new DaoController();
		int reservationItemId = -1;
		try {
			reservationItemId = dao.getReservationItemId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("ReservationItemId");
		System.out.println(reservationItemId);
		reservationItemId++;
		
			
//		SetReservationItemId()
		
		for(int i = 0; i<bikeIds.length;i++) {
			try {
				dao.setReservationItem(reservationItemId, reservationId, intbikeIds[i], intBikeAmounts[i]);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			reservationItemId++;
		}
		
		System.out.println("ReservationItem inserted");
		

		

//				//Mail1
			    response.setContentType("text/html");  
//			    PrintWriter out = response.getWriter();  
			    String to=request.getParameter("email");  
			    String subject= "Reservierungsbestätigung #"+reservationId;
				String msg= "<!DOCTYPE html>\r\n" + 
						"<html lang=\"de\">\r\n" + 
						"<head>\r\n" + 
						"<meta charset=\"utf-8\" />\r\n" + 
						"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n" + 
						"<style>\r\n" + 
						"table, th, td, caption {\r\n" + 
						"	border: 1px solid black;\r\n" + 
						"}\r\n" + 
						"\r\n" + 
						"table {\r\n" + 
						"	border-collapse: collpase;\r\n" + 
						"	border-spacing: 0;\r\n" + 
						"	border-width: 1px 0 0 1px;\r\n" + 
						"	margin: 0 0 1em;\r\n" + 
						"	table-layout: auto;\r\n" + 
						"	max-width: 100%;\r\n" + 
						"	font-size: 12pt;\r\n" + 
						"}\r\n" + 
						"\r\n" + 
						"th {\r\n" + 
						"	font-weight: normal;\r\n" + 
						"	border: 1px solid black;\r\n" + 
						"}\r\n" + 
						"\r\n" + 
						"td {\r\n" + 
						"	font-weight: normal;\r\n" + 
						"	text-align: center;\r\n" + 
						"	border: 1px solid black;\r\n" + 
						"}\r\n" + 
						"\r\n" + 
						"th, caption {\r\n" + 
						"	background-color: #f1f3f4;\r\n" + 
						"	font-weight: 700;\r\n" + 
						"	border: 1px solid black;\r\n" + 
						"}\r\n" + 
						"\r\n" + 
						".middle {\r\n" + 
						"	font-weight: bold;\r\n" + 
						"	text-align: center;\r\n" + 
						"}\r\n" + 
						"</style>\r\n" + 
						"</head>\r\n" + 
						"<body>\r\n" + 
						"\r\n" + 
						"	<div>\r\n" + 
						"		<img\r\n" + 
						"			src='https://picture.yatego.com/images/5bec4787bb8692.7/big_3eb5d5c0fe1b8c40ef00d9e3de659acc-kqh/fahrrad-bike-sonnenuntergang-xxl-wandbild-kunstdruck-foto-poster-p0494.jpg'\r\n" + 
						"			style='width: 100%'>\r\n" + 
						"		<h2>Reservierungsnummer: #"+reservationId+"</h2>\r\n" + 
						"\r\n" + 
						"		<h4>Vielen Dank "+lastName+ " "+ firstName+" für Ihre Reservierung bei\r\n" + 
						"			BiZirkel.</h4>\r\n" + 
						"		<br>\r\n" + 
						"		<h3 style='font-weight: bold;text-decoration:underline;'>Reservierungsinformationen</h3>\r\n" + 
						"		<h3>Datum: "+date[0]+" bis " + date[2]+"</h3>"+
						"		<table style='width: 100%;border: 1px solid black;' >\r\n" + 
						"			<tr>\r\n" + 
						"				<th>Fahrradname</th>\r\n" + 
						"				<th class='middle'>Menge</th>\r\n" + 
						"				<th class='middle'>Preis</th>\r\n" + 
						"			</tr>\r\n" + 
						"			<tr>\r\n";
				
						String bikeTable = "";
							for(int i = 0; i < bikeNames.length; i++) {
								bikeTable += "<td>"+bikeNames[i]+"</td>\r\n" + 
											 "<td>"+bikeAmounts[i]+"</td>\r\n" + 
											 "<td>"+bikePrices[i]+"&euro; </td>\r\n" +
											 "</td>\r\n" + 
											 "</tr>\r\n";
							}
						
						msg += bikeTable;
						msg += "		</table>\r\n" + 
						"		<br>\r\n" + 
						"		<table style='width: 100%; border: 1px solid black;'>\r\n" + 
						"			<tr>\r\n" + 
						"				<th>Gesamtpreis</th>\r\n" + 
						"				<td>"+totalPrice+"&euro; </td>\r\n" + 
						"			</tr>\r\n" + 
						"		</table>\r\n" + 
						"		<br>\r\n" + 
						"		<h3 style='font-weight: bold; text-decoration:underline;'>Informationen</h3>\r\n" + 
						"		<h4>\r\n" + 
						"			Die Abholung kann an dem ersten Tag der Reservierung von 08:00 -\r\n" + 
						"			17:00 Uhr durchgeführt werden. Bei der Abholung bitte die\r\n" + 
						"			ReservierungsId bereithalten. Das BiZirkel Team bittet Sie, die\r\n" + 
						"			Zahlung bei der Abholung durchzuführen. An dem letzten Tag muss die\r\n" + 
						"			Rückgabe vor 17:00 Uhr erfolgen.<br> <br> Das BiZirkel Team\r\n" + 
						"			wünscht Ihnen noch einen schönen Tag.\r\n" + 
						"		</h4>\r\n" + 
						"	</div>\r\n" + 
						"\r\n" + 
						"\r\n" + 
						"\r\n" + 
						"\r\n" + 
						"</body>\r\n" + 
						"</html>";
		     
			    Mail.send(to, subject, msg); 
//			    out.print("message has been sent successfully an Käufer");  
//			    out.close();  
			    
			  //Mail an BiZirkel
			    

			    response.setContentType("text/html");  
//			    PrintWriter printWriter = response.getWriter();
			    String to2="bizirkelofficial@gmail.com"; 
			    String subject2= "Neue Reservierung";
				String msg2= "<!DOCTYPE html>\r\n" + 
						"<html lang=\"de\">\r\n" + 
						"<head>\r\n" + 
						"<meta charset=\"utf-8\" />\r\n" + 
						"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n" + 
						"<style>\r\n" + 
						"\r\n" + 
						"</style>\r\n" + 
						"</head>\r\n" + 
						"<body>\r\n" + 
						"	<div>\r\n" + 
						"	ReservationId: " + reservationId+"<br>\r\n" + 
						"	Vorname: "+firstName+"<br>\r\n" + 
						"	Nachname: "+lastName+ "<br>\r\n" + 
						"	Telefonnummer: "+phone+"<br>\r\n" + 
						"	Startdatum: "+date[0]+" <br>\r\n" + 
						"	Enddatum: " + date[2]+"<br>\r\n" + 
						"	<table style='width: 100%;border: 1px solid black;' >\r\n" + 
						"			<tr>\r\n" + 
						"				<th>Fahrradname</th>\r\n" + 
						"				<th class='middle'>Menge</th>\r\n" + 
						"			</tr>\r\n";
				
						String bikeTable2 = "";
		                for(int i = 0; i < bikeNames.length; i++) {
		                    bikeTable2 += "<tr>\r\n" +
		                             "<td style='text-align:center'>"+bikeNames[i]+"</td>\r\n" + 
		                                 "<td style='text-align:center'>"+bikeAmounts[i]+"</td>\r\n" + 
		                                 "</td>\r\n" + 
		                                 "</tr>\r\n";
		                }

						
						msg2 += bikeTable2;
						msg2 += "		</table>\r\n" + 
						" <br>\r\n" + 
						"	Gesamtpreis: "+totalPrice+ "&euro; <br>\r\n" + 
						"	Notiz an uns: "+note+"<br>\r\n" + 
						"	</div>\r\n" + 
						"</body>\r\n" + 
						"</html>";
				Mail.send(to2, subject2, msg2);  
//				printWriter.print("message has been sent successfully an Bizirkel");  
//				printWriter.close();  
			    
//				Alle Cockies löschen
			    Cookie[] allCookies =request.getCookies(); 
			    for (int i = 0; i < allCookies.length; i++){
		               Cookie cookie = allCookies[i];
		               cookie.setMaxAge(0);
		               response.addCookie(cookie);
		        }
			    
//				Weiterleitung auf leeren Warenkorb
			    response.sendRedirect("/cart");
			    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
