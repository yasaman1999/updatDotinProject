package com.dotin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowDetailControllerServlet
 */
public class ShowDetailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int contractPeriod;
		int amount;
		int customerNumber;
		if(request.getAttribute("contractPeriod") != null){
			contractPeriod= (Integer) request.getAttribute("contractPeriod");
			System.out.print("ddddddddddddddddddddddd"+ contractPeriod);
			
			
		}
		if(request.getAttribute("amount") != null){
			 amount= (Integer) request.getAttribute("amount");
			 System.out.print("ddddddddddddddddddddddd"+ amount);
			 
			
		}
		if(request.getAttribute("customerNumber") != null){
			 customerNumber= (Integer) request.getAttribute("customerNumber");
			System.out.print("ddddddddddddddddddddddd"+ customerNumber);
			
		}
	}

	

}
