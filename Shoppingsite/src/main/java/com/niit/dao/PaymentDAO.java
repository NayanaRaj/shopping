package com.niit.dao;

import org.springframework.stereotype.Repository;

import com.niit.model.Payment;


@Repository("paymentDAO")
public interface PaymentDAO {

	public void paymentsave(Payment payment);
	
}