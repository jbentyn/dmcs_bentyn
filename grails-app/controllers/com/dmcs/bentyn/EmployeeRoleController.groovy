package com.dmcs.bentyn



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmployeeRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EmployeeRole.list(params), model:[employeeRoleInstanceCount: EmployeeRole.count()]
    }

    def show(EmployeeRole employeeRoleInstance) {
        respond employeeRoleInstance
    }

    def create() {
        respond new EmployeeRole(params)
    }

    @Transactional
    def save(EmployeeRole employeeRoleInstance) {
        if (employeeRoleInstance == null) {
            notFound()
            return
        }

        if (employeeRoleInstance.hasErrors()) {
            respond employeeRoleInstance.errors, view:'create'
            return
        }

        employeeRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), employeeRoleInstance.id])
                redirect employeeRoleInstance
            }
            '*' { respond employeeRoleInstance, [status: CREATED] }
        }
    }

    def edit(EmployeeRole employeeRoleInstance) {
        respond employeeRoleInstance
    }

    @Transactional
    def update(EmployeeRole employeeRoleInstance) {
        if (employeeRoleInstance == null) {
            notFound()
            return
        }

        if (employeeRoleInstance.hasErrors()) {
            respond employeeRoleInstance.errors, view:'edit'
            return
        }

        employeeRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EmployeeRole.label', default: 'EmployeeRole'), employeeRoleInstance.id])
                redirect employeeRoleInstance
            }
            '*'{ respond employeeRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EmployeeRole employeeRoleInstance) {

        if (employeeRoleInstance == null) {
            notFound()
            return
        }

        employeeRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EmployeeRole.label', default: 'EmployeeRole'), employeeRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'employeeRole.label', default: 'EmployeeRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
