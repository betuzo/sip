<%@ page import="org.valledelbit.sip.DependenciaPersonal" %>



<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'noDependenciaPersonal', 'error')} required">
	<label for="noDependenciaPersonal">
		<g:message code="dependenciaPersonal.noDependenciaPersonal.label" default="No Dependencia Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noDependenciaPersonal" maxlength="10" required="" value="${dependenciaPersonalInstance?.noDependenciaPersonal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'personal', 'error')} required">
	<label for="personal">
		<g:message code="dependenciaPersonal.personal.label" default="Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="personal" name="personal.id" from="${org.valledelbit.sip.Personal.list()}" optionKey="id" required="" value="${dependenciaPersonalInstance?.personal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'dependencia', 'error')} required">
	<label for="dependencia">
		<g:message code="dependenciaPersonal.dependencia.label" default="Dependencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dependencia" name="dependencia.id" from="${org.valledelbit.sip.Dependencia.list()}" optionKey="id" required="" value="${dependenciaPersonalInstance?.dependencia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'puesto', 'error')} required">
	<label for="puesto">
		<g:message code="dependenciaPersonal.puesto.label" default="Puesto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="puesto" name="puesto.id" from="${org.valledelbit.sip.Puesto.list()}" optionKey="id" required="" value="${dependenciaPersonalInstance?.puesto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'fechaIngreso', 'error')} required">
	<label for="fechaIngreso">
		<g:message code="dependenciaPersonal.fechaIngreso.label" default="Fecha Ingreso" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaIngreso" precision="day"  value="${dependenciaPersonalInstance?.fechaIngreso}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="dependenciaPersonal.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="usuario" maxlength="25" required="" value="${dependenciaPersonalInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dependenciaPersonalInstance, field: 'contrasena', 'error')} required">
	<label for="contrasena">
		<g:message code="dependenciaPersonal.contrasena.label" default="Contrasena" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="contrasena" maxlength="25" required="" value="${dependenciaPersonalInstance?.contrasena}"/>
</div>

