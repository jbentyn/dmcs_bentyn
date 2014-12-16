<%@ page import="com.dmcs.bentyn.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${employeeInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="employee.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${employeeInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="employee.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${employeeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="employee.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${employeeInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'webpage', 'error')} required">
	<label for="webpage">
		<g:message code="employee.webpage.label" default="Webpage" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="webpage" required="" value="${employeeInstance?.webpage}"/>

</div>

