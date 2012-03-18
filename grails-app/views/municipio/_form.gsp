<%@ page import="org.valledelbit.sip.Municipio" %>



<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'noMunicipio', 'error')} required">
	<label for="noMunicipio">
		<g:message code="municipio.noMunicipio.label" default="No Municipio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noMunicipio" maxlength="10" required="" value="${municipioInstance?.noMunicipio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="municipio.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="70" required="" value="${municipioInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipioInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="municipio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="estado" name="estado.id" from="${org.valledelbit.sip.Estado.list()}" optionKey="id" required="" value="${municipioInstance?.estado?.id}" class="many-to-one"/>
</div>

