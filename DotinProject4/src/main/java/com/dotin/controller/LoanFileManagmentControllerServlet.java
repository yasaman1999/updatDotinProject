package com.dotin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dotin.bean.Customer;
import com.dotin.bean.GrantCondition;
import com.dotin.bean.LoanFile;
import com.dotin.dao.CustomerDao;
import com.dotin.dao.LoanFileDao;

/**
 * Servlet implementation class LoanFileManagmentControllerServlet
 */
public class LoanFileManagmentControllerServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int customerNumber=0;
		int loanAmountFrom=0;
		int loanAmountTo=0;
		int loanPeriodFrom=0;
		int loanPeriodTo=0;
		if(request.getParameter("customerNumber") != "") {
		 customerNumber = Integer.parseInt(request.getParameter("customerNumber"));
		}
		if(request.getParameter("loanAmountFrom") != "") {
		 loanAmountFrom = Integer.parseInt(request.getParameter("loanAmountFrom"));
		}
		if(request.getParameter("loanAmountTo") != "") {
		 loanAmountTo = Integer.parseInt(request.getParameter("loanAmountTo"));
		}
		if(request.getParameter("loanPeriodFrom") != "") {
		 loanPeriodFrom = Integer.parseInt(request.getParameter("loanPeriodFrom"));
		}
		if(request.getParameter("loanPeriodTo") != "") {
		 loanPeriodTo = Integer.parseInt(request.getParameter("loanPeriodTo"));
		}
		
	
		
		List<LoanFile> loanFiles = new ArrayList<LoanFile>();
		List<LoanFile> notActiveloanFiles = new ArrayList<LoanFile>();
		
		LoanFileDao loanFileDao = LoanFileDao.getInstance();
		List<LoanFile> loanFilesList = (List<LoanFile>) loanFileDao.getLoanFile(customerNumber,loanAmountFrom,loanAmountTo,loanPeriodFrom,loanPeriodTo);
		if(loanFilesList != null) {
		for(int i=0;i < loanFilesList.size();i++) {
				loanFiles.add(loanFilesList.get(i));
				
				
			
			}
		String select = (String) request.getParameter("id");
		if (select != null) {
		
		List<LoanFile> notActiveloanFilesList = (List<LoanFile>) loanFileDao.getNotActiveLoanFile(customerNumber, loanAmountFrom, loanAmountTo, loanPeriodFrom, loanPeriodTo);
		if(notActiveloanFilesList != null) {
		for(int i=0;i < notActiveloanFilesList.size();i++) {
			notActiveloanFiles.add(notActiveloanFilesList.get(i));
				
			}
		}
		
		}
		
		long countActiveLoanFile = loanFileDao.countLoanFile(customerNumber, loanAmountFrom, loanAmountTo, loanPeriodFrom, loanPeriodTo);
		long countNotActiveLoanFile = loanFileDao.countNotActiveLoanFile(customerNumber, loanAmountFrom, loanAmountTo, loanPeriodFrom, loanPeriodTo);
		
			HttpSession session = request.getSession();
			session.setAttribute("loanFiles", loanFiles);
			session.setAttribute("notActiveloanFiles", notActiveloanFiles);
			request.setAttribute("countActiveLoanFile", countActiveLoanFile);
			request.setAttribute("countNotActiveLoanFile", countNotActiveLoanFile);
			request.setAttribute("customerNumber", customerNumber);
			request.setAttribute("loanAmountFrom", loanAmountFrom);
			request.setAttribute("loanAmountTo", loanAmountTo);
			request.setAttribute("loanPeriodFrom", loanPeriodFrom);
			request.setAttribute("loanPeriodTo", loanPeriodTo);
			request.getRequestDispatcher("loan-file-managment.jsp").forward(request, response);
			
			
		}
		
		}

	}


	

