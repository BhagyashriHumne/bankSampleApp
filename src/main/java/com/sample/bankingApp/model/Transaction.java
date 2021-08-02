package com.sample.bankingApp.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

/**
 * The persistent class for the BankingApp database table.
 * 
 */
@Entity
@Table(name = "transaction")

public class Transaction implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@NotNull
	@Column(name = "accountId")
	private int accountId;

	@Column(name = "amount")
	private double amount;

	@Column(name = "balance")
	private double balance;

	@Column(name = "operation")
	private String operation;

	/*
	 * @Temporal(TemporalType.TIMESTAMP)
	 * 
	 * @Column(name = "date", columnDefinition =
	 * "TIMESTAMP DEFAULT CURRENT_TIMESTAMP") private Date date;
	 */
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/*
	 * public Date getDate() { return date; }
	 * 
	 * public void setDate(Date date) { this.date = date; }
	 */

	
}
