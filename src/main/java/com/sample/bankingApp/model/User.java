package com.sample.bankingApp.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

/**
 * The persistent class for the BankingApp database table.
 * 
 */
@Entity
@Table(name = "user")
@NamedQueries({
		@NamedQuery(name = "User.findByEmailID", query = "SELECT u FROM User u where u.email = :email"),
		@NamedQuery(name = "User.getUserByRole", query = "SELECT u FROM User u where u.role = :role")})
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@NotNull
	@Size(min = 1, max = 15, message = "First Name must not empty and size must be between 1 and 15")
	@Column(name = "first_name")
	private String firstName;

	@NotNull
	@Size(min = 1, max = 15, message = "Last Name must not empty and size must be between 1 and 15")
	@Column(name = "last_name")
	private String lastName;

	@Column(name = "password")
	private String password;

	@NotNull
	@Size(min = 1, max = 15, message = "Contact must not empty and size must be between 1 and 15")
	@Column(name = "contact")
	private String contact;

	@NotNull
	@Size(min = 1, message = "eMail must not empty.")
	@Email
	@Column(name = "email")
	private String email;

	@Column(name = "role")
	private String role;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_on", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP", nullable = false)
	private Date createdOn;

	@Column(name = "active", nullable = false)
	private boolean active;

	@Column(name = "addressLine1")
	private String addressLine1;

	@Column(name = "addressLine2")
	private String addressLine2;

	@Column(name = "addressLine3")
	private String addressLine3;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Date getCreatedOn() {
		return createdOn;
	}

	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
