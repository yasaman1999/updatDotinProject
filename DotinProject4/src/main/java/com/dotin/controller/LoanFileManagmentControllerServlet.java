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
		
		
		int customerNumber = Integer.parseInt(request.getParameter("customerNumber"));
		int loanAmountFrom = Integer.parseInt(request.getParameter("loanAmountFrom"));
		int loanAmountTo = Integer.parseInt(request.getParameter("loanAmountTo"));
		int loanPeriodFrom = Integer.parseInt(request.getParameter("loanPeriodFrom"));
		int loanPeriodTo = Integer.parseInt(request.getParameter("loanPeriodTo"));
		
	
		
		List<LoanFile> loanFiles = new ArrayList<LoanFile>();
		
		LoanFileDao loanFileDao = LoanFileDao.getInstance();
		List<LoanFile> loanFilesList = (List<LoanFile>) loanFileDao.getLoanFile(customerNumber,loanAmountFrom,loanAmountTo,loanPeriodFrom,loanPeriodTo);
		if(loanFilesList != null) {
		for(int i=0;i < loanFilesList.size();i++) {
				loanFiles.add(loanFilesList.get(i));
				System.out.print(loanFiles.get(i).getState() + "helloooooooooo");
				
			
			}
		
			
		
			HttpSession session = request.getSession();
			session.setAttribute("loanFiles", loanFiles);
			
			request.getRequestDispatcher("loan-file-managment.jsp").forward(request, response);
			
			
		}
		
		}

	}

	

