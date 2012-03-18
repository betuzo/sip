
<%@ page import="org.valledelbit.sip.PredioPropietario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'predioPropietario.label', default: 'PredioPropietario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-predioPropietario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-predioPropietario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list predioPropietario">
			
				<g:if test="${predioPropietarioInstance?.noPredioPropietario}">
				<li class="fieldcontain">
					<span id="noPredioPropietario-label" class="property-label"><g:message code="predioPropietario.noPredioPropietario.label" default="No Predio Propietario" /></span>
					
						<span class="property-value" aria-labelledby="noPredioPropietario-label"><g:fieldValue bean="${predioPropietarioInstance}" field="noPredioPropietario"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.predio}">
				<li class="fieldcontain">
					<span id="predio-label" class="property-label"><g:message code="predioPropietario.predio.label" default="Predio" /></span>
					
						<span class="property-value" aria-labelledby="predio-label"><g:link controller="predio" action="show" id="${predioPropietarioInstance?.predio?.id}">${predioPropietarioInstance?.predio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.habitante}">
				<li class="fieldcontain">
					<span id="habitante-label" class="property-label"><g:message code="predioPropietario.habitante.label" default="Habitante" /></span>
					
						<span class="property-value" aria-labelledby="habitante-label"><g:link controller="habitante" action="show" id="${predioPropietarioInstance?.habitante?.id}">${predioPropietarioInstance?.habitante?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.fechaInicioPropiedad}">
				<li class="fieldcontain">
					<span id="fechaInicioPropiedad-label" class="property-label"><g:message code="predioPropietario.fechaInicioPropiedad.label" default="Fecha Inicio Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="fechaInicioPropiedad-label"><g:formatDate date="${predioPropietarioInstance?.fechaInicioPropiedad}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.fechaFinPropiedad}">
				<li class="fieldcontain">
					<span id="fechaFinPropiedad-label" class="property-label"><g:message code="predioPropietario.fechaFinPropiedad.label" default="Fecha Fin Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="fechaFinPropiedad-label"><g:formatDate date="${predioPropietarioInstance?.fechaFinPropiedad}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.statusPropiedad}">
				<li class="fieldcontain">
					<span id="statusPropiedad-label" class="property-label"><g:message code="predioPropietario.statusPropiedad.label" default="Status Propiedad" /></span>
					
						<span class="property-value" aria-labelledby="statusPropiedad-label"><g:formatBoolean boolean="${predioPropietarioInstance?.statusPropiedad}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="predioPropietario.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${predioPropietarioInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.drenaje}">
				<li class="fieldcontain">
					<span id="drenaje-label" class="property-label"><g:message code="predioPropietario.drenaje.label" default="Drenaje" /></span>
					
						<span class="property-value" aria-labelledby="drenaje-label"><g:formatBoolean boolean="${predioPropietarioInstance?.drenaje}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.empedrado}">
				<li class="fieldcontain">
					<span id="empedrado-label" class="property-label"><g:message code="predioPropietario.empedrado.label" default="Empedrado" /></span>
					
						<span class="property-value" aria-labelledby="empedrado-label"><g:formatBoolean boolean="${predioPropietarioInstance?.empedrado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.alumbrado}">
				<li class="fieldcontain">
					<span id="alumbrado-label" class="property-label"><g:message code="predioPropietario.alumbrado.label" default="Alumbrado" /></span>
					
						<span class="property-value" aria-labelledby="alumbrado-label"><g:formatBoolean boolean="${predioPropietarioInstance?.alumbrado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.aguaPotable}">
				<li class="fieldcontain">
					<span id="aguaPotable-label" class="property-label"><g:message code="predioPropietario.aguaPotable.label" default="Agua Potable" /></span>
					
						<span class="property-value" aria-labelledby="aguaPotable-label"><g:formatBoolean boolean="${predioPropietarioInstance?.aguaPotable}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${predioPropietarioInstance?.pavimento}">
				<li class="fieldcontain">
					<span id="pavimento-label" class="property-label"><g:message code="predioPropietario.pavimento.label" default="Pavimento" /></span>
					
						<span class="property-value" aria-labelledby="pavimento-label"><g:formatBoolean boolean="${predioPropietarioInstance?.pavimento}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${predioPropietarioInstance?.id}" />
					<g:link class="edit" action="edit" id="${predioPropietarioInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
