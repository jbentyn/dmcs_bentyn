<%@ page import="com.dmcs.bentyn.Employee"%>

<div class="employee-container">



	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'image', 'error')} required">
		<g:if test="${employeeInstance.image}">
			<div class="img-edit">
				<img src="${createLink(controller:'employee', action:'renderImage', id:employeeInstance.id )}" />
			</div>
		</g:if>
		<label for="image"> <g:message code="employee.image.label" default="Image" /> <span class="required-indicator">*</span>
		</label> <input type="file" name="image" id="image" />

	</div>


	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'name', 'error')} required">
		<label for="name"> <g:message code="employee.name.label" default="Name" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="name" required="" value="${employeeInstance?.name}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} required">
		<label for="lastName"> <g:message code="employee.lastName.label" default="Last Name" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="lastName" required="" value="${employeeInstance?.lastName}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} required">
		<label for="email"> <g:message code="employee.email.label" default="Email" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="email" required="" value="${employeeInstance?.email}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} required">
		<label for="phone"> <g:message code="employee.phone.label" default="Phone" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="phone" required="" value="${employeeInstance?.phone}" />
	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'webpage', 'error')} ">
		<label for="webpage"> <g:message code="employee.webpage.label" default="Webpage" />

		</label>
		<g:textField name="webpage" value="${employeeInstance?.webpage}" />

	</div>





	<h2>User properties</h2>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">
		<label for="username"> <g:message code="employee.username.label" default="Username" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="username" required="" value="${employeeInstance?.username}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
		<label for="password"> <g:message code="employee.password.label" default="Password" /> <span class="required-indicator">*</span>
		</label>
		<g:textField name="password" required="" value="${employeeInstance?.password}" />

	</div>

	<h2>Admin settings</h2>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'passwordExpired', 'error')} ">
		<label for="passwordExpired"> <g:message code="employee.passwordExpired.label" default="Password Expired" />

		</label>
		<g:checkBox name="passwordExpired" value="${employeeInstance?.passwordExpired}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'accountExpired', 'error')} ">
		<label for="accountExpired"> <g:message code="employee.accountExpired.label" default="Account Expired" />

		</label>
		<g:checkBox name="accountExpired" value="${employeeInstance?.accountExpired}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'accountLocked', 'error')} ">
		<label for="accountLocked"> <g:message code="employee.accountLocked.label" default="Account Locked" />

		</label>
		<g:checkBox name="accountLocked" value="${employeeInstance?.accountLocked}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'enabled', 'error')} ">
		<label for="enabled"> <g:message code="employee.enabled.label" default="Enabled" />

		</label>
		<g:checkBox name="enabled" value="${employeeInstance?.enabled}" />

	</div>

</div>

