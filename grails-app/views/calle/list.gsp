
<%@ page import="org.valledelbit.sip.Calle" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'calle.label', default: 'Calle')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-calle" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-calle" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noCalle" title="${message(code: 'calle.noCalle.label', default: 'No Calle')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'calle.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="calle.colonia.label" default="Colonia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${calleInstanceList}" status="i" var="calleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${calleInstance.id}">${fieldValue(bean: calleInstance, field: "noCalle")}</g:link></td>
					
						<td>${fieldValue(bean: calleInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: calleInstance, field: "colonia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${calleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
