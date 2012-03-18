
<%@ page import="org.valledelbit.sip.ParametroPredial" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parametroPredial.label', default: 'ParametroPredial')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parametroPredial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parametroPredial" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noParametroPredial" title="${message(code: 'parametroPredial.noParametroPredial.label', default: 'No Parametro Predial')}" />
					
						<g:sortableColumn property="anio" title="${message(code: 'parametroPredial.anio.label', default: 'Anio')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'parametroPredial.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="base" title="${message(code: 'parametroPredial.base.label', default: 'Base')}" />
					
						<g:sortableColumn property="impuest" title="${message(code: 'parametroPredial.impuest.label', default: 'Impuest')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parametroPredialInstanceList}" status="i" var="parametroPredialInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parametroPredialInstance.id}">${fieldValue(bean: parametroPredialInstance, field: "noParametroPredial")}</g:link></td>
					
						<td><g:formatDate date="${parametroPredialInstance.anio}" /></td>
					
						<td>${fieldValue(bean: parametroPredialInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: parametroPredialInstance, field: "base")}</td>
					
						<td>${fieldValue(bean: parametroPredialInstance, field: "impuest")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parametroPredialInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
