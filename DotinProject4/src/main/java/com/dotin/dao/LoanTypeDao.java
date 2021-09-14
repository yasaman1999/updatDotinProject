package com.dotin.dao;

import com.dotin.bean.LoanType;
import com.dotin.db.HibernateManager;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import java.util.List;

public class LoanTypeDao {

	private static LoanTypeDao loanTypeDao = new LoanTypeDao();

	private LoanTypeDao() {
	}

	public static LoanTypeDao getInstance() {
		return loanTypeDao;
	}

	public void addLoanTypeDetails(String name, int interestRate) {
		Session session = HibernateManager.openSession();
		try {
			Transaction transaction = session.beginTransaction();
			LoanType loanType = new LoanType();
			loanType.setName(name);
			loanType.setInterestRate(interestRate);
			transaction.commit();

		} finally {
			session.close();
		}
	}

	public List<LoanType> getAllLoanTypes() {
		Session session = HibernateManager.openSession();
		try {
			Query query = session.createQuery("select loanType.id,loanType.name from LoanType loanType ");

			return (List<LoanType>) query.list();
		} finally {
			session.close();
		}
	}

	public LoanType getLoanType(int loanTypeId) {
		Session session = HibernateManager.openSession();
		try {
			LoanType loanType = session.load(LoanType.class, loanTypeId);
			if (loanType != null) {
				Hibernate.initialize(loanType.getGrantConditions());
			}
			return loanType;
		} finally {
			session.close();
		}
	}
}
