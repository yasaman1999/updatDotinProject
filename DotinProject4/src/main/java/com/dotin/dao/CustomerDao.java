package com.dotin.dao;

import com.dotin.bean.Customer;
import com.dotin.db.HibernateManager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CustomerDao {

	private static CustomerDao customerDao = new CustomerDao();

	private CustomerDao() {
	}

	public static CustomerDao getInstance() {
		return customerDao;
	}

	public void addCustomerDetails(String name, String family, String fatherName, boolean gender, String birthday,
			String nationalCode, String placeOfBirth, String address, String mobileNumber, String phoneNumber) {
		Session session = HibernateManager.openSession();
		try {
			Transaction transaction = session.beginTransaction();

			Customer customer = new Customer();
			customer.setName(name);
			customer.setFamily(family);
			customer.setFatherName(fatherName);
			customer.setGender(gender);
			customer.setBirthday(birthday);
			customer.setNationalCode(nationalCode);
			customer.setPlaceOfBirth(placeOfBirth);
			customer.setAddress(address);
			customer.setMobileNumber(mobileNumber);
			customer.setPhoneNumber(phoneNumber);

			String SQL_QUERY = "select COALESCE(max(customerNumber),0)from Customer customer";
			Query query = session.createQuery(SQL_QUERY);
			int customerNumber = (Integer) query.uniqueResult() + 1;
			customer.setCustomerNumber(customerNumber);

			session.save(customer);
			transaction.commit();
		} finally {
			session.close();
		}
	}

	public Customer getCustomer(int customerNumber) {
		Session session = HibernateManager.openSession();
		try {
			return (Customer) session
					.createQuery("select customer from Customer customer WHERE customer.customerNumber=:customerNumber")
					.setParameter("customerNumber", customerNumber).uniqueResult();
		} finally {
			session.close();
		}
	}

	public Customer loadCustomer(int customerNumber) {
		Session session = HibernateManager.openSession();
		try {
			int customerId = (Integer) session
					.createQuery(
							"select customer.id from Customer customer WHERE customer.customerNumber=:customerNumber")
					.setParameter("customerNumber", customerNumber).uniqueResult();

			return (Customer) session.load(Customer.class, customerId);
		} finally {
			session.close();
		}
	}
}
