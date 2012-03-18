<%@ page import="org.valledelbit.sip.Puesto" %>



<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'noPuesto', 'error')} required">
	<label for="noPuesto">
		<g:message code="puesto.noPuesto.label" default="No Puesto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPuesto" maxlength="10" required="" value="${puestoInstance?.noPuesto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="puesto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="60" required="" value="${puestoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: puestoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="puesto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${puestoInstance?.descripcion}"/>
</div>

