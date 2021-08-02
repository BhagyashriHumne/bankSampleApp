package com.sample.bankingApp.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.sample.bankingApp.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query
	User findByEmailID(@Param("email") String email);
	
	@Query
	List<User> getUserByRole(@Param("role") String role);
}
