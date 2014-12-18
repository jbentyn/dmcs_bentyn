package com.dmcs.bentyn

import org.apache.commons.lang.builder.HashCodeBuilder

class EmployeeRole implements Serializable {

	private static final long serialVersionUID = 1
	

	Employee employee
	Role role

	boolean equals(other) {
		if (!(other instanceof EmployeeRole)) {
			return false
		}

		other.employee?.id == employee?.id &&
		other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (employee) builder.append(employee.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static EmployeeRole get(long employeeId, long roleId) {
		EmployeeRole.where {
			employee == Employee.load(employeeId) &&
			role == Role.load(roleId)
		}.get()
	}

	static boolean exists(long employeeId, long roleId) {
		EmployeeRole.where {
			employee == Employee.load(employeeId) &&
			role == Role.load(roleId)
		}.count() > 0
	}

	static EmployeeRole create(Employee employee, Role role, boolean flush = false) {
		def instance = new EmployeeRole(employee: employee, role: role)
		instance.save(flush: flush, insert: true)
		instance
	}

	static boolean remove(Employee u, Role r, boolean flush = false) {
		if (u == null || r == null) return false

		int rowCount = EmployeeRole.where {
			employee == Employee.load(u.id) &&
			role == Role.load(r.id)
		}.deleteAll()

		if (flush) { EmployeeRole.withSession { it.flush() } }

		rowCount > 0
	}

	static void removeAll(Employee u, boolean flush = false) {
		if (u == null) return

		EmployeeRole.where {
			employee == Employee.load(u.id)
		}.deleteAll()

		if (flush) { EmployeeRole.withSession { it.flush() } }
	}

	static void removeAll(Role r, boolean flush = false) {
		if (r == null) return

		EmployeeRole.where {
			role == Role.load(r.id)
		}.deleteAll()

		if (flush) { EmployeeRole.withSession { it.flush() } }
	}

	static constraints = {
		role validator: { Role r, EmployeeRole ur ->
			if (ur.employee == null) return
			boolean existing = false
			EmployeeRole.withNewSession {
				existing = EmployeeRole.exists(ur.employee.id, r.id)
			}
			if (existing) {
				return 'userRole.exists'
			}
		}
	}

	static mapping = {
		id composite: ['role', 'employee']
		version false
	}
}
