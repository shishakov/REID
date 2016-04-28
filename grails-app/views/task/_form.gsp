<%@ page import="com.reid.REID.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="task.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="summary" required="" value="${taskInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'details', 'error')} required">
	<label for="details">
		<g:message code="task.details.label" default="Details" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="details" required="" value="${taskInstance?.details}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'deadline', 'error')} ">
	<label for="deadline">
		<g:message code="task.deadline.label" default="Deadline" />
		
	</label>
	<g:datePicker name="deadline" precision="day"  value="${taskInstance?.deadline}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'startdate', 'error')} ">
	<label for="startdate">
		<g:message code="task.startdate.label" default="Startdate" />
		
	</label>
	<g:datePicker name="startdate" precision="day"  value="${taskInstance?.startdate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'timespent', 'error')} required">
	<label for="timespent">
		<g:message code="task.timespent.label" default="Timespent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="timespent" type="number" value="${taskInstance.timespent}" required=""/>

</div>

