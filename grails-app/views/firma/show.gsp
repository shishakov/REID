
<%@ page import="com.reid.REID.Firma" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'firma.label', default: 'Firma')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-firma" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-firma" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list firma">
			
				<g:if test="${firmaInstance?.name_firm}">
				<li class="fieldcontain">
					<span id="name_firm-label" class="property-label"><g:message code="firma.name_firm.label" default="Namefirm" /></span>
					
						<span class="property-value" aria-labelledby="name_firm-label"><g:fieldValue bean="${firmaInstance}" field="name_firm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.e_mail}">
				<li class="fieldcontain">
					<span id="e_mail-label" class="property-label"><g:message code="firma.e_mail.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="e_mail-label"><g:fieldValue bean="${firmaInstance}" field="e_mail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.addressS}">
				<li class="fieldcontain">
					<span id="addressS-label" class="property-label"><g:message code="firma.addressS.label" default="Address S" /></span>
					
						<span class="property-value" aria-labelledby="addressS-label"><g:fieldValue bean="${firmaInstance}" field="addressS"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.indexX}">
				<li class="fieldcontain">
					<span id="indexX-label" class="property-label"><g:message code="firma.indexX.label" default="Index X" /></span>
					
						<span class="property-value" aria-labelledby="indexX-label"><g:fieldValue bean="${firmaInstance}" field="indexX"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.lantitudeS}">
				<li class="fieldcontain">
					<span id="lantitudeS-label" class="property-label"><g:message code="firma.lantitudeS.label" default="Lantitude S" /></span>
					
						<span class="property-value" aria-labelledby="lantitudeS-label"><g:fieldValue bean="${firmaInstance}" field="lantitudeS"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.longitudeD}">
				<li class="fieldcontain">
					<span id="longitudeD-label" class="property-label"><g:message code="firma.longitudeD.label" default="Longitude D" /></span>
					
						<span class="property-value" aria-labelledby="longitudeD-label"><g:fieldValue bean="${firmaInstance}" field="longitudeD"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.hash_record}">
				<li class="fieldcontain">
					<span id="hash_record-label" class="property-label"><g:message code="firma.hash_record.label" default="Hashrecord" /></span>
					
						<span class="property-value" aria-labelledby="hash_record-label"><g:fieldValue bean="${firmaInstance}" field="hash_record"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${firmaInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="firma.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${firmaInstance?.user?.id}">${firmaInstance?.user?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:firmaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${firmaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
