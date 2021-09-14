package com.dotin.db;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class HibernateManager {
	private static final Logger logger = LogManager.getLogger(HibernateManager.class);

	private static SessionFactory sessionFactory;

	static {

		init();
	}

	private static void init() {
		BasicConfigurator.configure();
		logger.info("before buildSessionFactory ");
		sessionFactory = new Configuration().configure().buildSessionFactory();
		logger.info("after buildSessionFactory");
	}

	public static Session openSession() {
		return sessionFactory.openSession();
	}
}
