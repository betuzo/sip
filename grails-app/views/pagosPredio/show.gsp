
<%@ page import="org.valledelbit.sip.PagosPredio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pagosPredio.label', default: 'PagosPredio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pagosPredio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pagosPredio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pagosPredio">
			
				<g:if test="${pagosPredioInstance?.noPago}">
				<li class="fieldcontain">
					<span id="noPago-label" class="property-label"><g:message code="pagosPredio.noPago.label" default="No Pago" /></span>
					
						<span class="property-value" aria-labelledby="noPago-label"><g:fieldValue bean="${pagosPredioInstance}" field="noPago"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.folio}">
				<li class="fieldcontain">
					<span id="folio-label" class="property-label"><g:message code="pagosPredio.folio.label" default="Folio" /></span>
					
						<span class="property-value" aria-labelledby="folio-label"><g:fieldValue bean="${pagosPredioInstance}" field="folio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="pagosPredio.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${pagosPredioInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.predio}">
				<li class="fieldcontain">
					<span id="predio-label" class="property-label"><g:message code="pagosPredio.predio.label" default="Predio" /></span>
					
						<span class="property-value" aria-labelledby="predio-label"><g:link controller="predio" action="show" id="${pagosPredioInstance?.predio?.id}">${pagosPredioInstance?.predio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.dependenciaPersonal}">
				<li class="fieldcontain">
					<span id="dependenciaPersonal-label" class="property-label"><g:message code="pagosPredio.dependenciaPersonal.label" default="Dependencia Personal" /></span>
					
						<span class="property-value" aria-labelledby="dependenciaPersonal-label"><g:link controller="dependenciaPersonal" action="show" id="${pagosPredioInstance?.dependenciaPersonal?.id}">${pagosPredioInstance?.dependenciaPersonal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.habitante}">
				<li class="fieldcontain">
					<span id="habitante-label" class="property-label"><g:message code="pagosPredio.habitante.label" default="Habitante" /></span>
					
						<span class="property-value" aria-labelledby="habitante-label"><g:link controller="habitante" action="show" id="${pagosPredioInstance?.habitante?.id}">${pagosPredioInstance?.habitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.cantidad}">
				<li class="fieldcontain">
					<span id="cantidad-label" class="property-label"><g:message code="pagosPredio.cantidad.label" default="Cantidad" /></span>
					
						<span class="property-value" aria-labelledby="cantidad-label"><g:fieldValue bean="${pagosPredioInstance}" field="cantidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.concepto}">
				<li class="fieldcontain">
					<span id="concepto-label" class="property-label"><g:message code="pagosPredio.concepto.label" default="Concepto" /></span>
					
						<span class="property-value" aria-labelledby="concepto-label"><g:fieldValue bean="${pagosPredioInstance}" field="concepto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.predioValor}">
				<li class="fieldcontain">
					<span id="predioValor-label" class="property-label"><g:message code="pagosPredio.predioValor.label" default="Predio Valor" /></span>
					
						<span class="property-value" aria-labelledby="predioValor-label"><g:link controller="predioValor" action="show" id="${pagosPredioInstance?.predioValor?.id}">${pagosPredioInstance?.predioValor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${pagosPredioInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="pagosPredio.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${pagosPredioInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pagosPredioInstance?.id}" />
					<g:link class="edit" action="edit" id="${pagosPredioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
