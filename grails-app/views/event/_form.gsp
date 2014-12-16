<%@ page import="com.dmcs.bentyn.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'allDay', 'error')} ">
	<label for="allDay">
		<g:message code="event.allDay.label" default="All Day" />
		
	</label>
	<g:checkBox name="allDay" value="${eventInstance?.allDay}" />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'employee', 'error')} required">
	<label for="employee">
		<g:message code="event.employee.label" default="Employee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="employee" name="employee.id" from="${com.dmcs.bentyn.Employee.list()}" optionKey="id" required="" value="${eventInstance?.employee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="event.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${eventInstance?.endDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="event.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${eventInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="event.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${eventInstance?.title}"/>

</div>

