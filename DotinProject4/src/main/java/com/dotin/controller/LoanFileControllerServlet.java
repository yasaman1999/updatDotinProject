package com.dotin.controller;

import com.dotin.bean.Customer;
import com.dotin.dao.CustomerDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class LoanFileControllerServlet
 */
public class LoanFileControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(LoanFileControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int customerNumber = Integer.parseInt(request.getParameter("customerNumber"));

		ServletContext servletcontext = getServletContext();
		servletcontext.setAttribute("customerNumber", customerNumber);

		CustomerDao customerDao = CustomerDao.getInstance();
		logger.info("search customer with customerNumber" + customerNumber);
		Customer customer = (Customer) customerDao.getCustomer(customerNumber);
		logger.info("get customer with customerNumber " + customerNumber);
		if (customer != null) {

			String name = (String) customer.getName();
			String family = (String) customer.getFamily();
			String nationalCode = (String) customer.getNationalCode();

			request.setAttribute("name", name);
			request.setAttribute("family", family);
			request.setAttribute("nationalCode", nationalCode);
		}

		else {
			System.out.println("null input");
		}

		String customerSearch = String.valueOf(customerNumber);
		request.setAttribute("customerSearch", customerSearch);
		RequestDispatcher rd = request.getRequestDispatcher("loan-file.jsp");
		rd.forward(request, response);
	}

}





