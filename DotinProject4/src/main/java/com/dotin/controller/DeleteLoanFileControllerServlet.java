package com.dotin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dotin.bean.LoanFile;
import com.dotin.dao.LoanFileDao;


public class DeleteLoanFileControllerServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext servletcontext = getServletContext();
		LoanFile loanFile =(LoanFile) servletcontext.getAttribute("loanFileDetail");
		int i = loanFile.getId();
		LoanFileDao loanFileDao = LoanFileDao.getInstance();
		loanFileDao.deleteLoanFile(i);
		
		
	}

}


