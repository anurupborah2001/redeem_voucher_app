package com.jwt.redeem.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Repository
@Entity
@Table(name = "users")
public class User implements UserDetails{

	private static final long serialVersionUID = 7608016352377567337L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="user_id")
	private int user_id;
	
	@Column(name = "email",length = 100, nullable = false)
	@Length(max = 90, message = "Your password must have at most least 90 characters")
	@Email(message = "*Please provide a valid Email")
	@NotEmpty(message = "*Please provide an email")
	private String email;
	
	@Column(name = "password",length = 200, nullable = false)
	@Length(min = 5, message = "*Your password must have at least 5 characters")
	@NotEmpty(message = "*Please provide your password")
	@Transient
	private String password;
	
	@Column(name = "first_name",length = 50, nullable = false)
	@NotEmpty(message = "*Please provide your First Name")
	private String first_name;
	
	@Column(name = "last_name",length = 50, nullable = false)
	@NotEmpty(message = "*Please provide your last name")
	private String last_name;
	
	@Column(name = "username",length = 50,unique = true, nullable = false)
	@NotEmpty(message = "*Please provide your username")
	private String 	username;
	
	@Column(name = "enabled",columnDefinition = "TINYINT")
	private int enabled;
	
	
	
	@ManyToMany(fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
	//@Cascade({CascadeType.SAVE_UPDATE})
	@JoinTable(name = "user_role", joinColumns = { @JoinColumn(name = "user_id",nullable = false) }, inverseJoinColumns = { @JoinColumn(name = "role_id",nullable = false) } )
	@JsonManagedReference
	@JsonIgnore
	private Set<Role> roles = new HashSet<Role>();

	
	@ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
	//@Cascade({CascadeType.SAVE_UPDATE})
	@JoinTable(name = "jwt_user_deal", joinColumns = { @JoinColumn(name = "user_id",nullable = false) }, inverseJoinColumns = { @JoinColumn(name = "deal_id",nullable = false) } )
	@JsonManagedReference
	@JsonIgnore
	private Collection<Deal> deals = new ArrayList<Deal>();
	
	
		
	public Collection<Deal> getDeals() {
		return deals;
	}

	public void setDeals(Collection<Deal> deals) {
		this.deals = deals;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUser_id() {
		return user_id;
	}

	
	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", email=" + email + ", password=" + password + ", first_name=" + first_name
				+ ", last_name=" + last_name + ", username=" + username + ", enabled=" + enabled + ", roles=" + roles
				+ "]";
	}
	
	

}