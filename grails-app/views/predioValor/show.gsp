
<%@ page import="org.valledelbit.sip.PredioValor" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predioValor.label', default: 'PredioValor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-predioValor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-predioValor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list predioValor">
			
				<g:if test="${predioValorInstance?.noPredioValor}">
				<li class="fieldcontain">
					<span id="noPredioValor-label" class="property-label"><g:message code="predioValor.noPredioValor.label" default="No Predio Valor" /></span>
					
						<span class="property-value" aria-labelledby="noPredioValor-label"><g:fieldValue bean="${predioValorInstance}" field="noPredioValor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioValorInstance?.a–o}">
				<li class="fieldcontain">
					<span id="a–o-label" class="property-label"><g:message code="predioValor.a–o.label" default="A–o" /></span>
					
						<span class="property-value" aria-labelledby="a–o-label"><g:formatDate date="${predioValorInstance?.a–o}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioValorInstance?.valorFiscal}">
				<li class="fieldcontain">
					<span id="valorFiscal-label" class="property-label"><g:message code="predioValor.valorFiscal.label" default="Valor Fiscal" /></span>
					
						<span class="property-value" aria-labelledby="valorFiscal-label"><g:fieldValue bean="${predioValorInstance}" field="valorFiscal"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioValorInstance?.valorCatastral}">
				<li class="fieldcontain">
					<span id="valorCatastral-label" class="property-label"><g:message code="predioValor.valorCatastral.label" default="Valor Catastral" /></span>
					
						<span class="property-value" aria-labelledby="valorCatastral-label"><g:fieldValue bean="${predioValorInstance}" field="valorCatastral"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioValorInstance?.valorComercial}">
				<li class="fieldcontain">
					<span id="valorComercial-label" class="property-label"><g:message code="predioValor.valorComercial.label" default="Valor Comercial" /></span>
					
						<span class="property-value" aria-labelledby="valorComercial-label"><g:fieldValue bean="${predioValorInstance}" field="valorComercial"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${predioValorInstance?.id}" />
					<g:link class="edit" action="edit" id="${predioValorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
