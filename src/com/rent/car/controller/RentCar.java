package com.rent.car.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rent.car.bean.Booking;
import com.rent.car.bean.UserLog;

@WebServlet("/rentcar")
public class RentCar extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getSession().getAttribute("session_id");
		UserController user = (UserController) request.getSession().getAttribute("user_controller");

		if (id != null && !user.getFirstName(id).equals("")) {

			// Getting the necessary objects from session
			UserLog userBook = new UserLog();
			UserLogController userLog = (UserLogController) request.getSession().getAttribute("user_log_controller");
			BookingController booking = (BookingController) request.getSession().getAttribute("booking_controller");

			// Taking data from the previous page
			String fromLocation = request.getParameter("from_location");
			String toLocation = request.getParameter("to_location");
			String startTime = request.getParameter("start_date") + " " + request.getParameter("start_time");
			String endTime = request.getParameter("end_date") + " " + request.getParameter("end_time");
			String calculatedCost = request.getParameter("calculated_cost");
			String carId = request.getParameter("car_id");
			
			// String details = "fromLocation: " + fromLocation + " toLocation: " + toLocation + " startTime:" + startTime
			//		+ " endTime: " + endTime + " calculatedCost: " + calculatedCost;
			
			userBook.setUserId(id);
			userBook.setCurrentLocation(fromLocation);
			userBook.setDropLocation(toLocation);
			userBook.setDeliveredTime(startTime);
			userBook.setStartTime(startTime);
			userBook.setEndTime(endTime);
			
			String newWalletBalance = new Integer(Integer.parseInt(user.getWallet(id))-Integer.parseInt(calculatedCost)).toString();
			user.updateWallet(id, newWalletBalance);
			
			userBook.setPaidAmount(newWalletBalance);
			userBook.setTotalAmount(calculatedCost);
			userBook.setSecretKey(new Integer((int)((Math.random() * 9000000)+1000000)).toString());
			
			System.out.println();
			
			if(userLog.setBookingDetail(userBook) && (!booking.bookCarofId(carId).equals("")))	{
				response.getWriter().print("success");
			}
			else	{
				response.getWriter().print("failure");
			}
		}
		else	{
			response.sendRedirect("Index.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
