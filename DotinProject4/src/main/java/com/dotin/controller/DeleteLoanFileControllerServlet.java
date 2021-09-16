package com.dotin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dotin.bean.LoanFile;
import com.dotin.dao.LoanFileDao;

/**
 * Servlet implementation class DeleteLoanFileControllerServlet
 */
public class DeleteLoanFileControllerServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoanFile loanFile = (LoanFile) request.getAttribute("loanFile");
		LoanFileDao loanFileDao = LoanFileDao.getInstance();
		loanFileDao.deleteLoanFile(loanFile);
		
	}

}


