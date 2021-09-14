package com.dotin.controller;

import com.dotin.bean.GrantCondition;
import com.dotin.dao.GrantConditionDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * Servlet implementation class GrantConectionControllerServlet
 */
public class GrantConditionControllerServlet extends HttpServlet {
	private static final Logger logger = LogManager.getLogger(GrantConditionControllerServlet.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String loanName = (String) session.getAttribute("name");
		int interestRate = (Integer) session.getAttribute("interestRate");

		Set<GrantCondition> grantConditionSet = new HashSet<GrantCondition>();
		String[] grantConditions = request.getParameterValues("grantCondition");

		if (grantConditions == null) {
			response.sendRedirect("define-grant-condition.jsp");
		} else {
			for (int i = 0; i < grantConditions.length; i++) {
				StringTokenizer st = new StringTokenizer(grantConditions[i], "#");
				int maximumContractAmount = Integer.parseInt(st.nextToken());
				int minimumContractAmount = Integer.parseInt(st.nextToken());
				int maximumContractPeriod = Integer.parseInt(st.nextToken());
				int minimumContractPeriod = Integer.parseInt(st.nextToken());
				String name = st.nextToken();

				GrantCondition grantcondition = new GrantCondition();
				grantcondition.setName(name);
				grantcondition.setMinimumContractPeriod(minimumContractPeriod);
				grantcondition.setMaximumContractPeriod(maximumContractPeriod);
				grantcondition.setMinimumContractAmount(minimumContractAmount);
				grantcondition.setMaximumContractAmount(maximumContractAmount);

				grantConditionSet.add(grantcondition);
			}

			GrantConditionDao grantCondition = GrantConditionDao.getInstance();

			grantCondition.addGrantConditionDetails(grantConditionSet, loanName, interestRate);
			logger.info("grantCondition created with loanName " + loanName);

			response.sendRedirect("loan-type-add-successful.jsp");
		}
	}

}

