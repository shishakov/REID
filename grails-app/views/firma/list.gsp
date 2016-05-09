<%@ page import="com.reid.REID.Firma" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">

    <g:set var="entityName" value="${message(code: 'firma.label', default: 'Firma')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <g:javascript library="jquery"/>

</head>
<body>
<div id="echoBox">
    importing user:
</div>

<g:remoteField controller="firma" action="shout" update="echoBox" name="field" oncomplete="showSpinner(true)"/>
<br><br>

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
    <g:form action="search" method="get">
        <g:textField name="q" value="${params.q}"/>
        <g:submitButton name="search"/>
    </g:form>
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
<div >
    <g:link class="btn btn-primary btn-md" role="button" action="create"><g:message code="default.new.label"
                                                                                    args="[entityName]"/></g:link>
</div>
</div>
<div class="col-md-7">
    <div id="map"  style="width:100%; height:450px">
    </div>

    <script>

        var map;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: -34.397, lng: 150.644},
                zoom: 8
            });

            var bounds = new google.maps.LatLngBounds();

            var latlng;
            <g:each in="${firmaInstanceList}" var="location">
            if(${location.lantitudeS}&&${location.longitudeD}) {
                latlng = new google.maps.LatLng(${location.lantitudeS}, ${location.longitudeD});
                var marker${location.id} = new google.maps.Marker({
                    position: latlng,
                    map: map
                });

                var contentString${location.id} = '<h3>${location.name_firm}</h3><p>${location.e_mail}</p><p>${location.addressS} ${location.indexX}</p>';

                var infowindow${location.id} = new google.maps.InfoWindow({
                    content: contentString${location.id}
                });

                marker${location.id}.addListener('click', function() {
                    infowindow${location.id}.open(map, marker${location.id});
                });

                bounds.extend(latlng);
            }
            </g:each>
            map.fitBounds(bounds);
        }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBlsVTMy_gNOBGGshqhMMDOWXQYnJGC8vU&callback=initMap"
            async defer></script>
</div>
</div>

</body>
</html>
