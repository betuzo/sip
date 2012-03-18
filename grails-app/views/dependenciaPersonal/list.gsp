
<%@ page import="org.valledelbit.sip.DependenciaPersonal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dependenciaPersonal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dependenciaPersonal" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="noDependenciaPersonal" title="${message(code: 'dependenciaPersonal.noDependenciaPersonal.label', default: 'No Dependencia Personal')}" />
					
						<th><g:message code="dependenciaPersonal.personal.label" default="Personal" /></th>
					
						<th><g:message code="dependenciaPersonal.dependencia.label" default="Dependencia" /></th>
					
						<th><g:message code="dependenciaPersonal.puesto.label" default="Puesto" /></th>
					
						<g:sortableColumn property="fechaIngreso" title="${message(code: 'dependenciaPersonal.fechaIngreso.label', default: 'Fecha Ingreso')}" />
					
						<g:sortableColumn property="usuario" title="${message(code: 'dependenciaPersonal.usuario.label', default: 'Usuario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dependenciaPersonalInstanceList}" status="i" var="dependenciaPersonalInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dependenciaPersonalInstance.id}">${fieldValue(bean: dependenciaPersonalInstance, field: "noDependenciaPersonal")}</g:link></td>
					
						<td>${fieldValue(bean: dependenciaPersonalInstance, field: "personal")}</td>
					
						<td>${fieldValue(bean: dependenciaPersonalInstance, field: "dependencia")}</td>
					
						<td>${fieldValue(bean: dependenciaPersonalInstance, field: "puesto")}</td>
					
						<td><g:formatDate date="${dependenciaPersonalInstance.fechaIngreso}" /></td>
					
						<td>${fieldValue(bean: dependenciaPersonalInstance, field: "usuario")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dependenciaPersonalInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
