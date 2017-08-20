package com.jwt.redeem.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jwt.redeem.entities.User;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {
	 User findByEmail(String email);
	 User findByUsername(String username);
}