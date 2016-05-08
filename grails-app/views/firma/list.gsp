<%@ page import="com.reid.REID.Firma" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'firma.label', default: 'Firma')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

</head>
<body>
<a href="#list-firma" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        <li><g:link class="create" action="upload">Upload Data</g:link></li>
    </ul>
</div>
<div id="list-firma" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>


    <table>
        <thead>
        <tr>

            <g:sortableColumn property="name_firm" title="${message(code: 'firma.name_firm.label', default: 'Namefirm')}" />

            <g:sortableColumn property="e_mail" title="${message(code: 'firma.e_mail.label', default: 'Email')}" />

            <g:sortableColumn property="addressS" title="${message(code: 'firma.addressS.label', default: 'Address S')}" />

            <g:sortableColumn property="indexX" title="${message(code: 'firma.indexX.label', default: 'Index X')}" />

        </tr>
        </thead>
        <tbody>
        <g:each in="${firmaInstanceList}" status="i" var="firmaInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show" id="${firmaInstance.id}">${fieldValue(bean: firmaInstance, field: "name_firm")}</g:link></td>

                <td>${fieldValue(bean: firmaInstance, field: "e_mail")}</td>

                <td>${fieldValue(bean: firmaInstance, field: "addressS")}</td>

                <td>${fieldValue(bean: firmaInstance, field: "indexX")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${firmaInstanceCount ?: 0}" />
    </div>
</div>
</body>
</html>
