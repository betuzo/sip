
<%@ page import="org.valledelbit.sip.PredioPropietario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predioPropietario.label', default: 'PredioPropietario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-predioPropietario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-predioPropietario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noPredioPropietario" title="${message(code: 'predioPropietario.noPredioPropietario.label', default: 'No Predio Propietario')}" />
					
						<th><g:message code="predioPropietario.predio.label" default="Predio" /></th>
					
						<th><g:message code="predioPropietario.habitante.label" default="Habitante" /></th>
					
						<g:sortableColumn property="fechaInicioPropiedad" title="${message(code: 'predioPropietario.fechaInicioPropiedad.label', default: 'Fecha Inicio Propiedad')}" />
					
						<g:sortableColumn property="fechaFinPropiedad" title="${message(code: 'predioPropietario.fechaFinPropiedad.label', default: 'Fecha Fin Propiedad')}" />
					
						<g:sortableColumn property="statusPropiedad" title="${message(code: 'predioPropietario.statusPropiedad.label', default: 'Status Propiedad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${predioPropietarioInstanceList}" status="i" var="predioPropietarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${predioPropietarioInstance.id}">${fieldValue(bean: predioPropietarioInstance, field: "noPredioPropietario")}</g:link></td>
					
						<td>${fieldValue(bean: predioPropietarioInstance, field: "predio")}</td>
					
						<td>${fieldValue(bean: predioPropietarioInstance, field: "habitante")}</td>
					
						<td><g:formatDate date="${predioPropietarioInstance.fechaInicioPropiedad}" /></td>
					
						<td><g:formatDate date="${predioPropietarioInstance.fechaFinPropiedad}" /></td>
					
						<td><g:formatBoolean boolean="${predioPropietarioInstance.statusPropiedad}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${predioPropietarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
