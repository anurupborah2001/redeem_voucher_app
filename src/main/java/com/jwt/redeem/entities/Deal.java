package com.jwt.redeem.entities;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Cacheable
//Caching STrategy
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Entity
@Table(name ="jwt_deal")
public class Deal {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "jwt_deal_id")
	private int jwt_deal_id;
	
	@Column(name="jwt_deal_code",length=50)
	private String jwt_deal_code;
	
	@Column(name="jwt_deal_short_desc",length=500)
	private String jwt_deal_short_desc;
	
	@Column(name="jwt_deal_long_desc",columnDefinition = "TEXT")
	private String jwt_deal_long_desc;
	
	@Column(name="jwt_deal_shop_location",length=50)
	private String jwt_deal_shop_location;
	
	@Column(name="jwt_deal_quota",columnDefinition = "int")
	private int jwt_deal_quota;
	
	@Column(name = "jwt_deal_is_active",columnDefinition = "TINYINT")
	private int is_active;
	
	@Column(name="jwt_deal_long_logo",length=100)
	private String jwt_deal_long_logo;
	
	@Column(name="jwt_deal_inserted_at")
	private LocalDateTime jwt_deal_inserted_at;
	
	@Column(name="jwt_deal_updated_at")
	private LocalDateTime jwt_deal_updated_at;
	
	@OneToOne(fetch = FetchType.LAZY,cascade=CascadeType.PERSIST)
	@PrimaryKeyJoinColumn(name="jwt_deal_shop_id") 
	private Shop shop;
	
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "deals")
	private Set<User> user = new HashSet<User>();
	

	public Deal() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public int getIs_active() {
		return is_active;
	}



	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}



	public int getJwt_deal_id() {
		return jwt_deal_id;
	}

	public void setJwt_deal_id(int jwt_deal_id) {
		this.jwt_deal_id = jwt_deal_id;
	}

	public String getJwt_deal_code() {
		return jwt_deal_code;
	}

	public void setJwt_deal_code(String jwt_deal_code) {
		this.jwt_deal_code = jwt_deal_code;
	}

	public String getJwt_deal_short_desc() {
		return jwt_deal_short_desc;
	}

	public void setJwt_deal_short_desc(String jwt_deal_short_desc) {
		this.jwt_deal_short_desc = jwt_deal_short_desc;
	}

	public String getJwt_deal_long_desc() {
		return jwt_deal_long_desc;
	}

	public void setJwt_deal_long_desc(String jwt_deal_long_desc) {
		this.jwt_deal_long_desc = jwt_deal_long_desc;
	}

	public String getJwt_deal_shop_location() {
		return jwt_deal_shop_location;
	}

	public void setJwt_deal_shop_location(String jwt_deal_shop_location) {
		this.jwt_deal_shop_location = jwt_deal_shop_location;
	}

	public int getJwt_deal_quota() {
		return jwt_deal_quota;
	}

	public void setJwt_deal_quota(int jwt_deal_quota) {
		this.jwt_deal_quota = jwt_deal_quota;
	}

	public String getJwt_deal_long_logo() {
		return jwt_deal_long_logo;
	}

	public void setJwt_deal_long_logo(String jwt_deal_long_logo) {
		this.jwt_deal_long_logo = jwt_deal_long_logo;
	}



	public LocalDateTime getJwt_deal_inserted_at() {
		return jwt_deal_inserted_at;
	}

	public void setJwt_deal_inserted_at(LocalDateTime jwt_deal_inserted_at) {
		this.jwt_deal_inserted_at = jwt_deal_inserted_at;
	}

	public LocalDateTime getJwt_deal_updated_at() {
		return jwt_deal_updated_at;
	}

	public void setJwt_deal_updated_at(LocalDateTime jwt_deal_updated_at) {
		this.jwt_deal_updated_at = jwt_deal_updated_at;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	public Set<User> getUser() {
		return user;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}



	@Override
	public String toString() {
		return "Deal [jwt_deal_id=" + jwt_deal_id + ", jwt_deal_code=" + jwt_deal_code + ", jwt_deal_short_desc="
				+ jwt_deal_short_desc + ", jwt_deal_long_desc=" + jwt_deal_long_desc + ", jwt_deal_shop_location="
				+ jwt_deal_shop_location + ", jwt_deal_quota=" + jwt_deal_quota + ", is_active=" + is_active
				+ ", jwt_deal_long_logo=" + jwt_deal_long_logo + ", jwt_deal_inserted_at=" + jwt_deal_inserted_at
				+ ", jwt_deal_updated_at=" + jwt_deal_updated_at + ", shop=" + shop + ", user=" + user + "]";
	}
	
	
	
}
