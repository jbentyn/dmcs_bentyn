
<%@ page import="com.dmcs.bentyn.Employee" %>
<g:set var="isAdmin" value="${false}" />
	<sec:access expression="hasRole('ROLE_ADMIN')">
		<g:set var="isAdmin" value="${true}" />
	</sec:access>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	
	<body>
	
	
		<a href="#show-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<g:if test="${isAdmin}">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</g:if>
			</ul>
		</div>

	<div id="show-employee" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>


		<g:render template="details" />
		
		<g:if test="${employeeInstance.id.toString()==sec.loggedInUserInfo(field: 'id').toString() || isAdmin }">
			<g:render template="userProperties" />
			<g:if test="${isAdmin}">
				<g:render template="adminProperties" />
			</g:if>
		</g:if>
		<g:set var="calendarEditable" value="${false}" />
		<g:render template="calendar" />


		<g:if test="${employeeInstance.id.toString()==sec.loggedInUserInfo(field: 'id').toString() || isAdmin }">
			<g:form url="[resource:employeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${employeeInstance}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:if test="${isAdmin}">
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</g:if>
				</fieldset>
			</g:form>
		</g:if>
	</div>
</body>
</html>
