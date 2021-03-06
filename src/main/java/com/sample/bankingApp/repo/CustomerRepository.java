package com.sample.bankingApp.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sample.bankingApp.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

}
