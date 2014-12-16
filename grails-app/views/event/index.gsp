
<%@ page import="com.dmcs.bentyn.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-event" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="allDay" title="${message(code: 'event.allDay.label', default: 'All Day')}" />
					
						<th><g:message code="event.employee.label" default="Employee" /></th>
					
						<g:sortableColumn property="endDate" title="${message(code: 'event.endDate.label', default: 'End Date')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'event.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'event.title.label', default: 'Title')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventInstanceList}" status="i" var="eventInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "allDay")}</g:link></td>
					
						<td>${fieldValue(bean: eventInstance, field: "employee")}</td>
					
						<td><g:formatDate date="${eventInstance.endDate}" /></td>
					
						<td><g:formatDate date="${eventInstance.startDate}" /></td>
					
						<td>${fieldValue(bean: eventInstance, field: "title")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
