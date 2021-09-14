package com.dotin.dao;

import com.dotin.bean.Customer;
import com.dotin.bean.LoanFile;
import com.dotin.bean.LoanType;
import com.dotin.db.HibernateManager;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class LoanFileDao {

	private static LoanFileDao loanFileDao = new LoanFileDao();

	private LoanFileDao() {
	}

	public static LoanFileDao getInstance() {
		return loanFileDao;
	}

	public void addLoanFileDetails(int contractPeriod, int amount, LoanType loanType, Customer customer) {
		Session session = HibernateManager.openSession();
		try {
			Transaction transaction = session.beginTransaction();

			LoanFile loanFile = new LoanFile();
			loanFile.setContractPeriod(contractPeriod);
			loanFile.setAmount(amount);
			loanFile.setCustomer(customer);
			loanFile.setLoanType(loanType);
			session.save(loanFile);

			transaction.commit();

		} finally {
			session.close();
		}
	}
	
	public List<LoanFile> getLoanFile(int customerNumber,int loanAmountFrom,int loanAmountTo,int loanPeriodFrom,int loanPeriodTo) {
		Session session = HibernateManager.openSession();
		try {
			
			String queryStr = "select loanFile from LoanFile loanFile where 1=1";
			
	        if(customerNumber != 0) {
	        	queryStr = queryStr.concat(" and loanFile.customer.customerNumber = :customerNumber");	
	        }
	        if(loanAmountFrom != 0) {
	        	queryStr = queryStr.concat(" and loanFile.amount >= :loanAmountFrom");	
	        }
	        if(loanAmountTo != 0) {
	        	queryStr = queryStr.concat(" and loanFile.amount <= :loanAmountTo");	
	        }
	        if(loanPeriodFrom != 0) {
	        	queryStr = queryStr.concat(" and loanFile.contractPeriod >= :loanPeriodFrom");	
	        }
	        if(loanPeriodTo != 0) {
	        	queryStr = queryStr.concat(" and loanFile.contractPeriod <= :loanPeriodTo");	
	        }
			Query q = session.createQuery(queryStr);
			 if(customerNumber != 0) {
				 q.setParameter("customerNumber", customerNumber);
		        }
			 if(loanAmountFrom != 0) {
				 q.setParameter("loanAmountFrom", loanAmountFrom);	
		        }
			 if(loanAmountTo != 0) {
				 q.setParameter("loanAmountTo", loanAmountTo);	
		        }
			 if(loanPeriodFrom != 0) {
				 q.setParameter("loanPeriodFrom", loanPeriodFrom);	
		        }
			 if(loanPeriodTo != 0) {
				 q.setParameter("loanPeriodTo", loanPeriodTo);	
		        }
		
			List<LoanFile> loanFiles = q.list();
			return  loanFiles;
		} finally {
			session.close();
		}
	}
	
	}


