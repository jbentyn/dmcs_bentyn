<%@ page import="com.dmcs.bentyn.Employee"%>
<%@ page import="com.dmcs.bentyn.Role"%>

<g:set var="isAdmin" value="${false}" />
	<sec:access expression="hasRole('ROLE_ADMIN')">
		<g:set var="isAdmin" value="${true}" />
	</sec:access>

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

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} ">
		<label for="email"> <g:message code="employee.email.label" default="Email" /> 
		</label>
		<g:textField name="email" value="${employeeInstance?.email}" />

	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'phone', 'error')} ">
		<label for="phone"> <g:message code="employee.phone.label" default="Phone" /> 
		</label>
		<g:textField name="phone" value="${employeeInstance?.phone}" />
	</div>

	<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'webpage', 'error')} ">
		<label for="webpage"> <g:message code="employee.webpage.label" default="Webpage" />

		</label>
		<g:textField name="webpage" value="${employeeInstance?.webpage}" />

	</div>




	<sec:ifLoggedIn>
		<g:if test="${employeeInstance.id.toString()==sec.loggedInUserInfo(field: 'id').toString() || isAdmin }">
			<h2>User properties</h2>
			<%-- Only current user	--%>
			<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'username', 'error')} required">
				<label for="username"> <g:message code="employee.username.label" default="Username" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="username" required="" value="${employeeInstance?.username}" />

			</div>
			<g:if test="${employeeInstance.id==null }">
				<div class="fieldcontain required">
					<label for="password"> <g:message code="employee.password.label" default="Password" />
					</label>
					<g:passwordField name="password" required="" />

				</div>
			</g:if>
			<g:if test="${actionName=='edit' }">
				<div class="fieldcontain">
					<label for="newPassword"> <g:message code="employee.newPassword.label" default="New password" />
					</label>
					<g:passwordField name="newPassword" value="" />

				</div>

				<div class="fieldcontain">
					<label for="confirmPassword"> <g:message code="employee.confirmPassword.label" default="Confirm new password" />
					</label>
					<g:passwordField name="confirmPassword" value="" />

				</div>
			</g:if>
			<g:if test="${isAdmin}">
				<h2>Admin settings</h2>
				<%-- Only admin	--%>

				<div class="fieldcontain">
					<label for="roles"> <g:message code="Roles" default="Roles" />
					</label>
					<g:each in="${Role.list()}">
						<g:set var="isChecked" value="false" scope="request" />
						<g:if test="${employeeInstance.id != null }">
							<g:set var="isChecked" value="${employeeInstance?.authorities.contains(it)}" />
						</g:if>
						<g:checkBox name="roles[]" value="${it.id}" checked="${isChecked }" />&nbsp;${it.authority }
					</g:each>

				</div>

				<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'passwordExpired', 'error')} ">
					<label for="passwordExpired"> <g:message code="employee.passwordExpired.label" default="Password Expired" /></label>
					<g:if test="${actionName=='create' || actionName=='save'}">
						<g:checkBox name="passwordExpired" value="true" checked="true" disabled="true" />
					</g:if>
					<g:else>
						<g:checkBox name="passwordExpired" value="${employeeInstance?.passwordExpired}" />
					</g:else>
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
			</g:if>
		</g:if>
	</sec:ifLoggedIn>
</div>

