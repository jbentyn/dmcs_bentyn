package com.dmcs.bentyn



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured;
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

	static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

	private static final imageTypes = ['image/png', 'image/jpeg', 'image/gif']

	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
	}
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	def show(Employee employeeInstance) {
		respond employeeInstance
	}
	@Secured(['ROLE_ADMIN'])
	def create() {
		respond new Employee(params)
	}
	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	def edit(Employee employeeInstance) {
		respond employeeInstance
	}

	@Secured(['ROLE_ADMIN'])
	@Transactional
	def save(Employee employeeInstance) {
		println 'password before:'+employeeInstance.password
		if ( !saveEmployee( params,employeeInstance)){
			return false
		} 

		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'create'
			return
		}

			
		if ( !employeeInstance.save(flush:true) ){
			respond employeeInstance.errors, view:'create'
			return
		}
		
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
				redirect employeeInstance
			}
			'*' { respond employeeInstance, [status: CREATED] }
		}
	}

	
	@Secured(['ROLE_USER','ROLE_ADMIN'])
	@Transactional
	def update(Employee employeeInstance) {
		if ( !saveEmployee( params,employeeInstance)){
			return false
		}

		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'edit'
			return
		}

			if ( !employeeInstance.save(flush:true) ){
			respond employeeInstance.errors, view:'edit'
			return
		}

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
				redirect employeeInstance
			}
			'*'{ respond employeeInstance, [status: OK] }
		}
	}

	@Secured(['ROLE_ADMIN'])
	@Transactional
	def delete(Employee employeeInstance) {

		if (employeeInstance == null) {
			notFound()
			return
		}

		employeeInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}


	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'employee.label', default: 'Employee'), params.id])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}

	protected boolean saveEmployee(def params, Employee employeeInstance){

		if (employeeInstance == null) {
			notFound()
			return false
		}

		println params

		getRolesForUser(params, employeeInstance)

		getImageforEmployee(employeeInstance,  request)

		changePassword(params,employeeInstance)
		return true
	}

	protected boolean getImageforEmployee(Employee employeeInstance, def request){
		def file = request.getFile('image')

		if(file.size != 0){
			if (!imageTypes.contains(file.getContentType())) {
				employeeInstance.errors.reject( "Image must be one of: ${imageTypes}")
				return false
			}

			employeeInstance.image = file.bytes
			employeeInstance.imageType = file.contentType

		}
		return true
	}
	@Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
	public renderImage() {
		def employee = Employee.get(params.id)
		if ( !employee.image || !employee.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = employee.imageType
		response.contentLength = employee.image.size()
		OutputStream out = response.outputStream
		out.write(employee.image)
		out.close()
	}

	protected void getRolesForUser(def params, Employee employeeInstance){
		def roles = params.list('roles[]')
		if (! roles.isEmpty()){
			def oldRoles= EmployeeRole.findAllByEmployee(employeeInstance);
			def newRoles = Role.getAll(roles)

			oldRoles.each {
				it.delete flush :true
			}

			newRoles.each{
				def er = new EmployeeRole (employee:employeeInstance, role:it)
				er.save flush:true
			}
		}
	}

	protected void changePassword(def params,Employee employeeInstance){
		String newPassword =params.newPassword;
		String confirmPassword = params.confirmPassword;

		if ("".equals(newPassword) ){
			if( confirmPassword == newPassword){
				employeeInstance.password=newPassword;
			}else{
				employeeInstance.errors.reject("New password and password confirmation doesn't match")
			}
		}
	}
}
