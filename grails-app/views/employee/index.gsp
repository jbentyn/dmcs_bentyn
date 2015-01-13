
<%@ page import="com.dmcs.bentyn.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:set var="isAdmin" value="${false}" />
	<sec:access expression="hasRole('ROLE_ADMIN')">
		<g:set var="isAdmin" value="${true}" />
	</sec:access>
	<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
				<g:if test="${isAdmin}">
					<li><g:link class="create" action="create">
							<g:message code="default.new.label" args="[entityName]" />
						</g:link></li>
				</g:if>
		
		</ul>
	</div>
	<div id="list-employee" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>


		<table>

			<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" resource="${employeeInstance}">
								<g:render template="details" bean="${employeeInstance}" var="employeeInstance"></g:render>
								</g:link>
								<%--Only current user or admin--%>
								
									<g:if test="${employeeInstance.id.toString()==sec.loggedInUserInfo(field: 'id').toString() || isAdmin }">
										<fieldset class="buttons">


											<g:link class="edit" action="edit" resource="${employeeInstance}">
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link>

										</fieldset>
									</g:if>
								
							</td>

					</tr>
				</g:each>
			</tbody>
		</table>

	</div>
</body>
</html>
