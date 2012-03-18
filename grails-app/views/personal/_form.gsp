<%@ page import="org.valledelbit.sip.Personal" %>



<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'noPersonal', 'error')} required">
	<label for="noPersonal">
		<g:message code="personal.noPersonal.label" default="No Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPersonal" maxlength="10" required="" value="${personalInstance?.noPersonal}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="personal.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="60" required="" value="${personalInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="personal.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" maxlength="40" required="" value="${personalInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'apellidoMaterno', 'error')} required">
	<label for="apellidoMaterno">
		<g:message code="personal.apellidoMaterno.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoMaterno" maxlength="40" required="" value="${personalInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'sexo', 'error')} required">
	<label for="sexo">
		<g:message code="personal.sexo.label" default="Sexo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sexo" maxlength="20" required="" value="${personalInstance?.sexo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento">
		<g:message code="personal.fechaNacimiento.label" default="Fecha Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"  value="${personalInstance?.fechaNacimiento}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: personalInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="personal.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${personalInstance?.email}"/>
</div>

