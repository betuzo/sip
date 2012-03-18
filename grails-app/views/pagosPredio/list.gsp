
<%@ page import="org.valledelbit.sip.PagosPredio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagosPredio.label', default: 'PagosPredio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-pagosPredio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-pagosPredio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noPago" title="${message(code: 'pagosPredio.noPago.label', default: 'No Pago')}" />
					
						<g:sortableColumn property="folio" title="${message(code: 'pagosPredio.folio.label', default: 'Folio')}" />
					
						<g:sortableColumn property="fecha" title="${message(code: 'pagosPredio.fecha.label', default: 'Fecha')}" />
					
						<th><g:message code="pagosPredio.predio.label" default="Predio" /></th>
					
						<th><g:message code="pagosPredio.dependenciaPersonal.label" default="Dependencia Personal" /></th>
					
						<th><g:message code="pagosPredio.habitante.label" default="Habitante" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pagosPredioInstanceList}" status="i" var="pagosPredioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${pagosPredioInstance.id}">${fieldValue(bean: pagosPredioInstance, field: "noPago")}</g:link></td>
					
						<td>${fieldValue(bean: pagosPredioInstance, field: "folio")}</td>
					
						<td><g:formatDate date="${pagosPredioInstance.fecha}" /></td>
					
						<td>${fieldValue(bean: pagosPredioInstance, field: "predio")}</td>
					
						<td>${fieldValue(bean: pagosPredioInstance, field: "dependenciaPersonal")}</td>
					
						<td>${fieldValue(bean: pagosPredioInstance, field: "habitante")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pagosPredioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
