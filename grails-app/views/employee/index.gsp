
<%@ page import="com.dmcs.bentyn.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-employee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
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
		<%--			<g:render template="details" collection="${employeeInstanceList}" var="employeeInstance"/>--%>

		<table>

			<tbody>
				<g:each in="${employeeInstanceList}" status="i" var="employeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:render template="details" bean="${employeeInstance}" var="employeeInstance"></g:render> <%--Only current user or admin--%>
							<fieldset class="buttons">
								<g:link class="edit" action="edit" resource="${employeeInstance}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<%--Only  admin--%>
								<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</fieldset></td>


					</tr>
				</g:each>
			</tbody>
		</table>

		<div class="pagination">
			<g:paginate total="${employeeInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
