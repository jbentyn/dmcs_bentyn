package com.dmcs.bentyn



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeController {

	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	private static final imageTypes = ['image/png', 'image/jpeg', 'image/gif']

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Employee.list(params), model:[employeeInstanceCount: Employee.count()]
	}

	def show(Employee employeeInstance) {
		respond employeeInstance
	}

	def create() {
		respond new Employee(params)
	}

	@Transactional
	def save(Employee employeeInstance) {
		if (employeeInstance == null) {
			notFound()
			return
		}

		getImageforEmployee(employeeInstance,  request)
		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'create'
			return
		}

		employeeInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [message(code: 'employee.label', default: 'Employee'), employeeInstance.id])
				redirect employeeInstance
			}
			'*' { respond employeeInstance, [status: CREATED] }
		}
	}

	def edit(Employee employeeInstance) {
		respond employeeInstance
	}

	@Transactional
	def update(Employee employeeInstance) {
		if (employeeInstance == null) {
			notFound()
			return
		}

		getImageforEmployee(employeeInstance,  request)
		if (employeeInstance.hasErrors()) {
			respond employeeInstance.errors, view:'edit'
			return
		}

		employeeInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [message(code: 'Employee.label', default: 'Employee'), employeeInstance.id])
				redirect employeeInstance
			}
			'*'{ respond employeeInstance, [status: OK] }
		}
	}

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
	protected void getImageforEmployee(Employee employeeInstance, def request){
		def file = request.getFile('image')

		// List of OK mime-types
		if (!imageTypes.contains(file.getContentType())) {
			flash.message = "Image must be one of: ${imageTypes}"
			redirect employeeInstance
		}

		// Save the image and mime type
		employeeInstance.image = file.bytes
		employeeInstance.imageType = file.contentType

	}

	def renderImage() {
		def employee = Employee.get(params.id)
		if (!employee || !employee.image || !employee.imageType) {
			response.sendError(404)
			return
		}
		response.contentType = employee.imageType
		response.contentLength = employee.image.size()
		OutputStream out = response.outputStream
		out.write(employee.image)
		out.close()
	}
}
