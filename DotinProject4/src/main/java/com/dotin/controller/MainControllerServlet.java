package com.dotin.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class loginControllerServlet
 */
public class MainControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		if ("/addCustomer".equalsIgnoreCase(servletPath)) {
			response.sendRedirect("customer-form.jsp");
		}

		if ("/chooseLoanType".equalsIgnoreCase(servletPath)) {
			response.sendRedirect("loan-type.jsp");
		}

		if ("/loanFile".equalsIgnoreCase(servletPath)) {
			response.sendRedirect("loan-file.jsp");
		}

		if ("/chooseGrantCondition".equals(servletPath)) {
			response.sendRedirect("grant-condition.jsp");
		}
		
		if ("/loanFileManagment".equals(servletPath)) {
			response.sendRedirect("loan-file-managment.jsp");
		}
		
	}
}
