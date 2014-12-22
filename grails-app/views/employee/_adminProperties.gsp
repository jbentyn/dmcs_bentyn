<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />


</head>

<body>

<h2>Admin settings</h2>
	<div class="property-container">

		<ol class="property-list employee">
		
		
				<li class="fieldcontain"><span id="accountExpired-label"
					class="property-label"><g:message
							code="employee.accountExpired.label" default="Account Expired" /></span>

					<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
							boolean="${employeeInstance?.accountExpired}" /></span></li>
			

			
				<li class="fieldcontain"><span id="accountLocked-label"
					class="property-label"><g:message
							code="employee.accountLocked.label" default="Account Locked" /></span>

					<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
							boolean="${employeeInstance?.accountLocked}" /></span></li>
			
		
			
				<li class="fieldcontain"><span id="enabled-label"
					class="property-label"><g:message
							code="employee.enabled.label" default="Enabled" /></span> <span
					class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
							boolean="${employeeInstance?.enabled}" /></span></li>
			
			
			
			
				<li class="fieldcontain"><span id="passwordExpired-label"
					class="property-label"><g:message
							code="employee.passwordExpired.label" default="Password Expired" /></span>

					<span class="property-value"
					aria-labelledby="passwordExpired-label"><g:formatBoolean
							boolean="${employeeInstance?.passwordExpired}" /></span></li>
			
		
		</ol>
	</div>
</body>

</html>