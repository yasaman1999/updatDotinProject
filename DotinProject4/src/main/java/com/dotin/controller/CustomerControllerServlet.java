package com.dotin.controller;

import com.dotin.CustomerManagement;
import com.dotin.dao.CustomerDao;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import java.io.IOException;

/**
 * Servlet implementation class CustomerControllerServlet
 */
public class CustomerControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(CustomerControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String family = request.getParameter("family");
		String fatherName = request.getParameter("fatherName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String nationalCode = request.getParameter("nationalCode");
		String placeOfBirth = request.getParameter("placeOfBirth");
		String address = request.getParameter("address");
		String mobileNumber = request.getParameter("mobileNumber");
		String phoneNumber = request.getParameter("phoneNumber");

		CustomerManagement customerManagement = CustomerManagement.getInstance();

		if (customerManagement.validationNationalCode(nationalCode)) {

			CustomerDao customerDao = CustomerDao.getInstance();

			logger.info("before create customer ");

			customerDao.addCustomerDetails(name, family, fatherName, Boolean.parseBoolean(gender), birthday,
					nationalCode, placeOfBirth, address, mobileNumber, phoneNumber);
			logger.info("customer created with " + nationalCode + " nationalCode");
			response.sendRedirect("info-add-successful.jsp");

		} else {
			response.sendRedirect("invalid-national-code-error-page.jsp");
		}

	}
}

