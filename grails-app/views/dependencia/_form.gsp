<%@ page import="org.valledelbit.sip.Dependencia" %>



<div class="fieldcontain ${hasErrors(bean: dependenciaInstance, field: 'noDependencia', 'error')} required">
	<label for="noDependencia">
		<g:message code="dependencia.noDependencia.label" default="No Dependencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noDependencia" maxlength="10" required="" value="${dependenciaInstance?.noDependencia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="dependencia.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="50" required="" value="${dependenciaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="dependencia.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" value="${dependenciaInstance?.descripcion}"/>
</div>

