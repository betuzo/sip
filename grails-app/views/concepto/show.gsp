
<%@ page import="org.valledelbit.sip.Concepto" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'concepto.label', default: 'Concepto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-concepto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-concepto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list concepto">
			
				<g:if test="${conceptoInstance?.noCocepto}">
				<li class="fieldcontain">
					<span id="noCocepto-label" class="property-label"><g:message code="concepto.noCocepto.label" default="No Cocepto" /></span>
					
						<span class="property-value" aria-labelledby="noCocepto-label"><g:fieldValue bean="${conceptoInstance}" field="noCocepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.descripcionConcepto}">
				<li class="fieldcontain">
					<span id="descripcionConcepto-label" class="property-label"><g:message code="concepto.descripcionConcepto.label" default="Descripcion Concepto" /></span>
					
						<span class="property-value" aria-labelledby="descripcionConcepto-label"><g:fieldValue bean="${conceptoInstance}" field="descripcionConcepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.noCuentaNOI}">
				<li class="fieldcontain">
					<span id="noCuentaNOI-label" class="property-label"><g:message code="concepto.noCuentaNOI.label" default="No Cuenta NOI" /></span>
					
						<span class="property-value" aria-labelledby="noCuentaNOI-label"><g:fieldValue bean="${conceptoInstance}" field="noCuentaNOI"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.dependencia}">
				<li class="fieldcontain">
					<span id="dependencia-label" class="property-label"><g:message code="concepto.dependencia.label" default="Dependencia" /></span>
					
						<span class="property-value" aria-labelledby="dependencia-label"><g:link controller="dependencia" action="show" id="${conceptoInstance?.dependencia?.id}">${conceptoInstance?.dependencia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conceptoInstance?.precio}">
				<li class="fieldcontain">
					<span id="precio-label" class="property-label"><g:message code="concepto.precio.label" default="Precio" /></span>
					
						<span class="property-value" aria-labelledby="precio-label"><g:fieldValue bean="${conceptoInstance}" field="precio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conceptoInstance?.id}" />
					<g:link class="edit" action="edit" id="${conceptoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
