import grails.converters.JSON;

import com.dmcs.bentyn.Employee
import com.dmcs.bentyn.EmployeeRole;
import com.dmcs.bentyn.Event;
import com.dmcs.bentyn.EventColors;
import com.dmcs.bentyn.Role

class BootStrap {
	def springSecurityService
	
    def init = { servletContext ->
		//JSON marshaler for events
		JSON.registerObjectMarshaller( Event ) { Event event ->
			def color=EventColors.BASIC.value ;
			if (event.repeatable){
				color=EventColors.REPEATABLE.value;
			}
			return [
			id : event.id,
			title : event.title,
			start : event.startDate,
			end : event.endDate,
			allDay : event.allDay,
			repeatable:event.repeatable,
			color:color
			]
		}
		
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"))
		
		//SECURITY
		def userRole = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
		def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)
		
		def adminUser = Employee.findByUsername('admin') ?: new Employee(
			username: 'admin',
			password: 'admin',
			name:'Adam',
			lastName:'Adminowicz',
			enabled: true).save(failOnError: true)

	if (!adminUser.authorities.contains(adminRole)) {
		EmployeeRole.create adminUser, adminRole
	}
    }
    def destroy = {
    }
}
