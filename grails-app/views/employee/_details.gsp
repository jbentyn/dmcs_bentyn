<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />

</head>

<body>
	<div class="employee-container">
		<div class="img-container">
			<g:if test="${employeeInstance.image}">
				<div class="fieldcontain">
					<img src="${createLink(controller:'employee', action:'renderImage', id:employeeInstance.id )}" />
				</div>
			</g:if>
		</div>

		<ol class="property-list employee">

			<g:if test="${employeeInstance.name}">
				<li class="fieldcontain"><span id="name-label" class="property-label"><g:message code="employee.name.label" default="Name" /></span> <span
					class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${employeeInstance}" field="name" /></span></li>
			</g:if>

			<g:if test="${employeeInstance.lastName}">
				<li class="fieldcontain"><span id="lastName-label" class="property-label"><g:message code="employee.lastName.label"
							default="Last Name" /></span> <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${employeeInstance}"
							field="lastName" /></span></li>
			</g:if>


			<g:if test="${employeeInstance.email}">
				<li class="fieldcontain"><span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span> <span
					class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email" /></span></li>
			</g:if>

			<g:if test="${employeeInstance.phone}">
				<li class="fieldcontain"><span id="phone-label" class="property-label"><g:message code="employee.phone.label" default="Phone" /></span> <span
					class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${employeeInstance}" field="phone" /></span></li>
			</g:if>

			<g:if test="${employeeInstance.webpage}">
				<li class="fieldcontain"><span id="webpage-label" class="property-label"><g:message code="employee.webpage.label" default="Webpage" /></span>
					<span class="property-value" aria-labelledby="webpage-label"><g:fieldValue bean="${employeeInstance}" field="webpage" /></span></li>
			</g:if>


		</ol>
	</div>
</body>

</html>