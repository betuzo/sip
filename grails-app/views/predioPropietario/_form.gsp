<%@ page import="org.valledelbit.sip.PredioPropietario" %>



<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'noPredioPropietario', 'error')} required">
	<label for="noPredioPropietario">
		<g:message code="predioPropietario.noPredioPropietario.label" default="No Predio Propietario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPredioPropietario" maxlength="25" required="" value="${predioPropietarioInstance?.noPredioPropietario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'predio', 'error')} required">
	<label for="predio">
		<g:message code="predioPropietario.predio.label" default="Predio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="predio" name="predio.id" from="${org.valledelbit.sip.Predio.list()}" optionKey="id" required="" value="${predioPropietarioInstance?.predio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'habitante', 'error')} required">
	<label for="habitante">
		<g:message code="predioPropietario.habitante.label" default="Habitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="habitante" name="habitante.id" from="${org.valledelbit.sip.Habitante.list()}" optionKey="id" required="" value="${predioPropietarioInstance?.habitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'fechaInicioPropiedad', 'error')} required">
	<label for="fechaInicioPropiedad">
		<g:message code="predioPropietario.fechaInicioPropiedad.label" default="Fecha Inicio Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInicioPropiedad" precision="day"  value="${predioPropietarioInstance?.fechaInicioPropiedad}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'fechaFinPropiedad', 'error')} required">
	<label for="fechaFinPropiedad">
		<g:message code="predioPropietario.fechaFinPropiedad.label" default="Fecha Fin Propiedad" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaFinPropiedad" precision="day"  value="${predioPropietarioInstance?.fechaFinPropiedad}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'statusPropiedad', 'error')} ">
	<label for="statusPropiedad">
		<g:message code="predioPropietario.statusPropiedad.label" default="Status Propiedad" />
		
	</label>
	<g:checkBox name="statusPropiedad" value="${predioPropietarioInstance?.statusPropiedad}" />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="predioPropietario.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="50" required="" value="${predioPropietarioInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'drenaje', 'error')} ">
	<label for="drenaje">
		<g:message code="predioPropietario.drenaje.label" default="Drenaje" />
		
	</label>
	<g:checkBox name="drenaje" value="${predioPropietarioInstance?.drenaje}" />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'empedrado', 'error')} ">
	<label for="empedrado">
		<g:message code="predioPropietario.empedrado.label" default="Empedrado" />
		
	</label>
	<g:checkBox name="empedrado" value="${predioPropietarioInstance?.empedrado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'alumbrado', 'error')} ">
	<label for="alumbrado">
		<g:message code="predioPropietario.alumbrado.label" default="Alumbrado" />
		
	</label>
	<g:checkBox name="alumbrado" value="${predioPropietarioInstance?.alumbrado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'aguaPotable', 'error')} ">
	<label for="aguaPotable">
		<g:message code="predioPropietario.aguaPotable.label" default="Agua Potable" />
		
	</label>
	<g:checkBox name="aguaPotable" value="${predioPropietarioInstance?.aguaPotable}" />
</div>

<div class="fieldcontain ${hasErrors(bean: predioPropietarioInstance, field: 'pavimento', 'error')} ">
	<label for="pavimento">
		<g:message code="predioPropietario.pavimento.label" default="Pavimento" />
		
	</label>
	<g:checkBox name="pavimento" value="${predioPropietarioInstance?.pavimento}" />
</div>

