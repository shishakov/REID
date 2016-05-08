<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <title><g:message code="dashboard.header"/></title>
    <style type='text/css' media='screen'>
    #login {
        margin: 15px 0px;
        padding: 0px;
        text-align: center;
    }
    </style>
</head>
<body>
<sec:link controller="user" expression="hasRole('ROLE_ADMIN')">1)User Service / </sec:link>
<sec:link controller="userRole" expression="hasRole('ROLE_ADMIN')">2)Control of access rights / </sec:link>
<sec:link controller="firma" expression="hasRole('ROLE_USER')">1)Manage Firma Information / </sec:link>
</body>
</html>