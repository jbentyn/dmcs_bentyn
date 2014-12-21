<%@ page contentType="text/html;charset=UTF-8"%>
<html>

<body>

<h2>User properties</h2>
	<div class="property-container">

		<ol class="property-list employee">
		
			<g:if test="${employeeInstance?.username}">
				<li class="fieldcontain"><span id="username-label"
					class="property-label"><g:message
							code="employee.username.label" default="Username" /></span> <span
					class="property-value" aria-labelledby="username-label"><g:fieldValue
							bean="${employeeInstance}" field="username" /></span></li>
			</g:if>
			
			
		</ol>
	</div>
</body>
</html>