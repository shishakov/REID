
<%@ page import="com.reid.REID.Task" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-task" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-task" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list task">
			
				<g:if test="${taskInstance?.summary}">
				<li class="fieldcontain">
					<span id="summary-label" class="property-label"><g:message code="task.summary.label" default="Summary" /></span>
					
						<span class="property-value" aria-labelledby="summary-label"><g:fieldValue bean="${taskInstance}" field="summary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.details}">
				<li class="fieldcontain">
					<span id="details-label" class="property-label"><g:message code="task.details.label" default="Details" /></span>
					
						<span class="property-value" aria-labelledby="details-label"><g:fieldValue bean="${taskInstance}" field="details"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.deadline}">
				<li class="fieldcontain">
					<span id="deadline-label" class="property-label"><g:message code="task.deadline.label" default="Deadline" /></span>
					
						<span class="property-value" aria-labelledby="deadline-label"><g:formatDate date="${taskInstance?.deadline}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.startdate}">
				<li class="fieldcontain">
					<span id="startdate-label" class="property-label"><g:message code="task.startdate.label" default="Startdate" /></span>
					
						<span class="property-value" aria-labelledby="startdate-label"><g:formatDate date="${taskInstance?.startdate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${taskInstance?.timespent}">
				<li class="fieldcontain">
					<span id="timespent-label" class="property-label"><g:message code="task.timespent.label" default="Timespent" /></span>
					
						<span class="property-value" aria-labelledby="timespent-label"><g:fieldValue bean="${taskInstance}" field="timespent"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:taskInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${taskInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
