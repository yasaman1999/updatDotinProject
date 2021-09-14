package com.dotin.controller;

import com.dotin.dao.LoanTypeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class LoanTypeControolerServlet
 */
public class LoanTypeControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(LoanTypeControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		int interestRate = Integer.parseInt(request.getParameter("interestRate"));

		request.setAttribute("name", name);
		request.setAttribute("interestRate", interestRate);

		LoanTypeDao loanTypeDao = LoanTypeDao.getInstance();
		logger.info("before create loanType ");
		loanTypeDao.addLoanTypeDetails(name, interestRate);
		logger.info("loanType created with name " + name + " and interestRate " + interestRate);
		RequestDispatcher rd = request.getRequestDispatcher("grant-condition.jsp");
		rd.forward(request, response);

	}
}

	
