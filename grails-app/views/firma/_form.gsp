<%@ page import="com.reid.REID.Firma" %>



<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'name_firm', 'error')} required">
	<label for="name_firm">
		<g:message code="firma.name_firm.label" default="Namefirm" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name_firm" required="" value="${firmaInstance?.name_firm}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'e_mail', 'error')} required">
	<label for="e_mail">
		<g:message code="firma.e_mail.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="e_mail" required="" value="${firmaInstance?.e_mail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'addressS', 'error')} required">
	<label for="addressS">
		<g:message code="firma.addressS.label" default="Address S" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="addressS" required="" value="${firmaInstance?.addressS}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'indexX', 'error')} required">
	<label for="indexX">
		<g:message code="firma.indexX.label" default="Index X" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="indexX" required="" value="${firmaInstance?.indexX}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'lantitudeS', 'error')} required">
	<label for="lantitudeS">
		<g:message code="firma.lantitudeS.label" default="Lantitude S" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lantitudeS" required="" value="${firmaInstance?.lantitudeS}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'longitudeD', 'error')} required">
	<label for="longitudeD">
		<g:message code="firma.longitudeD.label" default="Longitude D" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="longitudeD" required="" value="${firmaInstance?.longitudeD}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'hash_record', 'error')} required">
	<label for="hash_record">
		<g:message code="firma.hash_record.label" default="Hashrecord" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hash_record" required="" value="${firmaInstance?.hash_record}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: firmaInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="firma.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.reid.REID.User.list()}" optionKey="id" required="" value="${firmaInstance?.user?.id}" class="many-to-one"/>

</div>

