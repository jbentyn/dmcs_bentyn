
<%@ page import="com.dmcs.bentyn.EmployeeRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employeeRole.label', default: 'EmployeeRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-employeeRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-employeeRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list employeeRole">
			
				<g:if test="${employeeRoleInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="employeeRole.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:link controller="role" action="show" id="${employeeRoleInstance?.role?.id}">${employeeRoleInstance?.role?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeRoleInstance?.employee}">
				<li class="fieldcontain">
					<span id="employee-label" class="property-label"><g:message code="employeeRole.employee.label" default="Employee" /></span>
					
						<span class="property-value" aria-labelledby="employee-label"><g:link controller="employee" action="show" id="${employeeRoleInstance?.employee?.id}">${employeeRoleInstance?.employee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:employeeRoleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${employeeRoleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
