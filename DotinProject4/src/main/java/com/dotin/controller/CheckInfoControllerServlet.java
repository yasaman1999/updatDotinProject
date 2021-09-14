package com.dotin.controller;

import com.dotin.bean.Customer;
import com.dotin.bean.GrantCondition;
import com.dotin.bean.LoanType;
import com.dotin.dao.CustomerDao;
import com.dotin.dao.LoanFileDao;
import com.dotin.dao.LoanTypeDao;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class CheckInfoControllerServlet
 */
public class CheckInfoControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(CheckInfoControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int loanTypeId = Integer.parseInt(request.getParameter("loanTypeId"));
		int contractPeriod = Integer.parseInt(request.getParameter("contractPeriod"));
		int amount = Integer.parseInt(request.getParameter("amount"));

		ServletContext servletcontext = getServletContext();
		int customerNumber = (Integer) servletcontext.getAttribute("customerNumber");

		CustomerDao customerDao = CustomerDao.getInstance();

		Customer customer = customerDao.loadCustomer(customerNumber);
		logger.info("load customer with customerNumber " + customerNumber);

		LoanTypeDao loanTypeDao = LoanTypeDao.getInstance();
		LoanType loanType = loanTypeDao.getLoanType(loanTypeId);
		logger.info("get loanType with loanTypeId  " + loanTypeId);

		boolean isMatch = false;
		if (loanType != null) {
			Set<GrantCondition> grantConditions = loanType.getGrantConditions();
			for (GrantCondition grantCondition : grantConditions) {

				int minimumContractPeriod = grantCondition.getMinimumContractPeriod();
				int maximumContractPeriod = grantCondition.getMaximumContractPeriod();
				int minimumContractAmount = grantCondition.getMinimumContractAmount();
				int maximumContractAmount = grantCondition.getMaximumContractAmount();

				if (contractPeriod >= minimumContractPeriod && contractPeriod <= maximumContractPeriod
						&& amount >= minimumContractAmount && amount <= maximumContractAmount) {
					isMatch = true;
					break;
				}
			}

			if (isMatch) {
				LoanFileDao loanFileDao = LoanFileDao.getInstance();
				loanFileDao.addLoanFileDetails(contractPeriod, amount, loanType, customer);
				logger.info("loanFile created with loanTypeId  " + loanTypeId);

				response.sendRedirect("create-loan-file.jsp");

			} else {
				response.sendRedirect("create-loan-file-error-page.jsp");

			}
		}
	}
}

