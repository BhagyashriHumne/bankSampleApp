package com.sample.bankingApp.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sample.bankingApp.model.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {

	@Query
	Account getAccountByAccountNo(@Param("accountNo") int accountNo);

}
