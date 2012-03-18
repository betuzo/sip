
<%@ page import="org.valledelbit.sip.Concepto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'concepto.label', default: 'Concepto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-concepto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-concepto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noCocepto" title="${message(code: 'concepto.noCocepto.label', default: 'No Cocepto')}" />
					
						<g:sortableColumn property="descripcionConcepto" title="${message(code: 'concepto.descripcionConcepto.label', default: 'Descripcion Concepto')}" />
					
						<g:sortableColumn property="noCuentaNOI" title="${message(code: 'concepto.noCuentaNOI.label', default: 'No Cuenta NOI')}" />
					
						<th><g:message code="concepto.dependencia.label" default="Dependencia" /></th>
					
						<g:sortableColumn property="precio" title="${message(code: 'concepto.precio.label', default: 'Precio')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${conceptoInstanceList}" status="i" var="conceptoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${conceptoInstance.id}">${fieldValue(bean: conceptoInstance, field: "noCocepto")}</g:link></td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "descripcionConcepto")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "noCuentaNOI")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "dependencia")}</td>
					
						<td>${fieldValue(bean: conceptoInstance, field: "precio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${conceptoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
