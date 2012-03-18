
<%@ page import="org.valledelbit.sip.Predio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predio.label', default: 'Predio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-predio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-predio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noPredio" title="${message(code: 'predio.noPredio.label', default: 'No Predio')}" />
					
						<th><g:message code="predio.tipoPredio.label" default="Tipo Predio" /></th>
					
						<g:sortableColumn property="datosPred" title="${message(code: 'predio.datosPred.label', default: 'Datos Pred')}" />
					
						<th><g:message code="predio.calle.label" default="Calle" /></th>
					
						<g:sortableColumn property="descDomicilio" title="${message(code: 'predio.descDomicilio.label', default: 'Desc Domicilio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${predioInstanceList}" status="i" var="predioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${predioInstance.id}">${fieldValue(bean: predioInstance, field: "noPredio")}</g:link></td>
					
						<td>${fieldValue(bean: predioInstance, field: "tipoPredio")}</td>
					
						<td>${fieldValue(bean: predioInstance, field: "datosPred")}</td>
					
						<td>${fieldValue(bean: predioInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: predioInstance, field: "descDomicilio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${predioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
