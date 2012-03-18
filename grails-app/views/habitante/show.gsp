
<%@ page import="org.valledelbit.sip.Habitante" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'habitante.label', default: 'Habitante')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-habitante" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-habitante" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list habitante">
			
				<g:if test="${habitanteInstance?.noHabitante}">
				<li class="fieldcontain">
					<span id="noHabitante-label" class="property-label"><g:message code="habitante.noHabitante.label" default="No Habitante" /></span>
					
						<span class="property-value" aria-labelledby="noHabitante-label"><g:fieldValue bean="${habitanteInstance}" field="noHabitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${habitanteInstance?.datosHabitante}">
				<li class="fieldcontain">
					<span id="datosHabitante-label" class="property-label"><g:message code="habitante.datosHabitante.label" default="Datos Habitante" /></span>
					
						<span class="property-value" aria-labelledby="datosHabitante-label"><g:fieldValue bean="${habitanteInstance}" field="datosHabitante"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${habitanteInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="habitante.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:link controller="calle" action="show" id="${habitanteInstance?.calle?.id}">${habitanteInstance?.calle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${habitanteInstance?.descDomicilio}">
				<li class="fieldcontain">
					<span id="descDomicilio-label" class="property-label"><g:message code="habitante.descDomicilio.label" default="Desc Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="descDomicilio-label"><g:fieldValue bean="${habitanteInstance}" field="descDomicilio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${habitanteInstance?.id}" />
					<g:link class="edit" action="edit" id="${habitanteInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
