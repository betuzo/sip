
<%@ page import="org.valledelbit.sip.Habitante" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'habitante.label', default: 'Habitante')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-habitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-habitante" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noHabitante" title="${message(code: 'habitante.noHabitante.label', default: 'No Habitante')}" />
					
						<g:sortableColumn property="datosHabitante" title="${message(code: 'habitante.datosHabitante.label', default: 'Datos Habitante')}" />
					
						<th><g:message code="habitante.calle.label" default="Calle" /></th>
					
						<g:sortableColumn property="descDomicilio" title="${message(code: 'habitante.descDomicilio.label', default: 'Desc Domicilio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${habitanteInstanceList}" status="i" var="habitanteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${habitanteInstance.id}">${fieldValue(bean: habitanteInstance, field: "noHabitante")}</g:link></td>
					
						<td>${fieldValue(bean: habitanteInstance, field: "datosHabitante")}</td>
					
						<td>${fieldValue(bean: habitanteInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: habitanteInstance, field: "descDomicilio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${habitanteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
