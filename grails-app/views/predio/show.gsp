
<%@ page import="org.valledelbit.sip.Predio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predio.label', default: 'Predio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-predio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-predio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list predio">
			
				<g:if test="${predioInstance?.noPredio}">
				<li class="fieldcontain">
					<span id="noPredio-label" class="property-label"><g:message code="predio.noPredio.label" default="No Predio" /></span>
					
						<span class="property-value" aria-labelledby="noPredio-label"><g:fieldValue bean="${predioInstance}" field="noPredio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioInstance?.tipoPredio}">
				<li class="fieldcontain">
					<span id="tipoPredio-label" class="property-label"><g:message code="predio.tipoPredio.label" default="Tipo Predio" /></span>
					
						<span class="property-value" aria-labelledby="tipoPredio-label"><g:link controller="tipoPredio" action="show" id="${predioInstance?.tipoPredio?.id}">${predioInstance?.tipoPredio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioInstance?.datosPred}">
				<li class="fieldcontain">
					<span id="datosPred-label" class="property-label"><g:message code="predio.datosPred.label" default="Datos Pred" /></span>
					
						<span class="property-value" aria-labelledby="datosPred-label"><g:fieldValue bean="${predioInstance}" field="datosPred"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioInstance?.calle}">
				<li class="fieldcontain">
					<span id="calle-label" class="property-label"><g:message code="predio.calle.label" default="Calle" /></span>
					
						<span class="property-value" aria-labelledby="calle-label"><g:link controller="calle" action="show" id="${predioInstance?.calle?.id}">${predioInstance?.calle?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioInstance?.descDomicilio}">
				<li class="fieldcontain">
					<span id="descDomicilio-label" class="property-label"><g:message code="predio.descDomicilio.label" default="Desc Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="descDomicilio-label"><g:fieldValue bean="${predioInstance}" field="descDomicilio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${predioInstance?.id}" />
					<g:link class="edit" action="edit" id="${predioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
