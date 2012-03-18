
<%@ page import="org.valledelbit.sip.TipoPredio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipoPredio.label', default: 'TipoPredio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipoPredio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipoPredio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipoPredio">
			
				<g:if test="${tipoPredioInstance?.noTipoPredio}">
				<li class="fieldcontain">
					<span id="noTipoPredio-label" class="property-label"><g:message code="tipoPredio.noTipoPredio.label" default="No Tipo Predio" /></span>
					
						<span class="property-value" aria-labelledby="noTipoPredio-label"><g:fieldValue bean="${tipoPredioInstance}" field="noTipoPredio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipoPredioInstance?.descripcionTipoPredio}">
				<li class="fieldcontain">
					<span id="descripcionTipoPredio-label" class="property-label"><g:message code="tipoPredio.descripcionTipoPredio.label" default="Descripcion Tipo Predio" /></span>
					
						<span class="property-value" aria-labelledby="descripcionTipoPredio-label"><g:fieldValue bean="${tipoPredioInstance}" field="descripcionTipoPredio"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${tipoPredioInstance?.id}" />
					<g:link class="edit" action="edit" id="${tipoPredioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
