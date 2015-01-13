package com.dmcs.bentyn

class Employee {

	transient springSecurityService

	String username
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	Long id;
	String name;
	String lastName;
	String phone;
	String email;
	String webpage;
	byte[] image
	String imageType
  

	
	static hasMany = [events: Event]

	static transients = ['springSecurityService']

	static constraints = {
		username  blank: false, unique: true
		password blank: false
		webpage nullable:true
		email email: true,nullable:true
		phone matches: "\\d{9}", nullable:true
		image nullable:true 
		imageType nullable:true
	}

	static mapping = {
		password column: '`password`'
		image lazy: false
		events cascade: 'all-delete-orphan'
	}

	Set<Role> getAuthorities() {
		EmployeeRole.findAllByEmployee(this).collect { it.role }
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
