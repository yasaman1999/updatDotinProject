package com.dotin.controller;

import com.dotin.bean.LoanType;
import com.dotin.dao.LoanTypeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class LoanListControllerServlet
 */
public class LoanListControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(LoanListControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LoanTypeDao loanTypeDao = LoanTypeDao.getInstance();

		logger.info("before get loanType list ");
		List<LoanType> list = loanTypeDao.getAllLoanTypes();
		logger.info("after get loanType list ");

		request.setAttribute("list", list);

		RequestDispatcher rd = request.getRequestDispatcher("loan-list-page.jsp");
		rd.forward(request, response);

	}
}
