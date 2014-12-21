<%@ page import="com.dmcs.bentyn.EmployeeRole" %>





<div class="fieldcontain ${hasErrors(bean: employeeRoleInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="employeeRole.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${com.dmcs.bentyn.Employee.list()}" optionKey="id" required="" value="${employeeRoleInstance?.employee?.id}" class="many-to-one"/>

</div>

