
<%@ page import="org.valledelbit.sip.DependenciaPersonal" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dependenciaPersonal.label', default: 'DependenciaPersonal')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dependenciaPersonal" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dependenciaPersonal" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dependenciaPersonal">
			
				<g:if test="${dependenciaPersonalInstance?.noDependenciaPersonal}">
				<li class="fieldcontain">
					<span id="noDependenciaPersonal-label" class="property-label"><g:message code="dependenciaPersonal.noDependenciaPersonal.label" default="No Dependencia Personal" /></span>
					
						<span class="property-value" aria-labelledby="noDependenciaPersonal-label"><g:fieldValue bean="${dependenciaPersonalInstance}" field="noDependenciaPersonal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.personal}">
				<li class="fieldcontain">
					<span id="personal-label" class="property-label"><g:message code="dependenciaPersonal.personal.label" default="Personal" /></span>
					
						<span class="property-value" aria-labelledby="personal-label"><g:link controller="personal" action="show" id="${dependenciaPersonalInstance?.personal?.id}">${dependenciaPersonalInstance?.personal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.dependencia}">
				<li class="fieldcontain">
					<span id="dependencia-label" class="property-label"><g:message code="dependenciaPersonal.dependencia.label" default="Dependencia" /></span>
					
						<span class="property-value" aria-labelledby="dependencia-label"><g:link controller="dependencia" action="show" id="${dependenciaPersonalInstance?.dependencia?.id}">${dependenciaPersonalInstance?.dependencia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.puesto}">
				<li class="fieldcontain">
					<span id="puesto-label" class="property-label"><g:message code="dependenciaPersonal.puesto.label" default="Puesto" /></span>
					
						<span class="property-value" aria-labelledby="puesto-label"><g:link controller="puesto" action="show" id="${dependenciaPersonalInstance?.puesto?.id}">${dependenciaPersonalInstance?.puesto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.fechaIngreso}">
				<li class="fieldcontain">
					<span id="fechaIngreso-label" class="property-label"><g:message code="dependenciaPersonal.fechaIngreso.label" default="Fecha Ingreso" /></span>
					
						<span class="property-value" aria-labelledby="fechaIngreso-label"><g:formatDate date="${dependenciaPersonalInstance?.fechaIngreso}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="dependenciaPersonal.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${dependenciaPersonalInstance}" field="usuario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dependenciaPersonalInstance?.contrasena}">
				<li class="fieldcontain">
					<span id="contrasena-label" class="property-label"><g:message code="dependenciaPersonal.contrasena.label" default="Contrasena" /></span>
					
						<span class="property-value" aria-labelledby="contrasena-label"><g:fieldValue bean="${dependenciaPersonalInstance}" field="contrasena"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dependenciaPersonalInstance?.id}" />
					<g:link class="edit" action="edit" id="${dependenciaPersonalInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
