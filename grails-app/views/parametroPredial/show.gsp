
<%@ page import="org.valledelbit.sip.ParametroPredial" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parametroPredial.label', default: 'ParametroPredial')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parametroPredial" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parametroPredial" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parametroPredial">
			
				<g:if test="${parametroPredialInstance?.noParametroPredial}">
				<li class="fieldcontain">
					<span id="noParametroPredial-label" class="property-label"><g:message code="parametroPredial.noParametroPredial.label" default="No Parametro Predial" /></span>
					
						<span class="property-value" aria-labelledby="noParametroPredial-label"><g:fieldValue bean="${parametroPredialInstance}" field="noParametroPredial"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroPredialInstance?.anio}">
				<li class="fieldcontain">
					<span id="anio-label" class="property-label"><g:message code="parametroPredial.anio.label" default="Anio" /></span>
					
						<span class="property-value" aria-labelledby="anio-label"><g:formatDate date="${parametroPredialInstance?.anio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroPredialInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="parametroPredial.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${parametroPredialInstance}" field="tipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroPredialInstance?.base}">
				<li class="fieldcontain">
					<span id="base-label" class="property-label"><g:message code="parametroPredial.base.label" default="Base" /></span>
					
						<span class="property-value" aria-labelledby="base-label"><g:fieldValue bean="${parametroPredialInstance}" field="base"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroPredialInstance?.impuest}">
				<li class="fieldcontain">
					<span id="impuest-label" class="property-label"><g:message code="parametroPredial.impuest.label" default="Impuest" /></span>
					
						<span class="property-value" aria-labelledby="impuest-label"><g:fieldValue bean="${parametroPredialInstance}" field="impuest"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parametroPredialInstance?.id}" />
					<g:link class="edit" action="edit" id="${parametroPredialInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
