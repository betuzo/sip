<%@ page import="org.valledelbit.sip.PagosPredio" %>



<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'noPago', 'error')} required">
	<label for="noPago">
		<g:message code="pagosPredio.noPago.label" default="No Pago" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noPago" maxlength="10" required="" value="${pagosPredioInstance?.noPago}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'folio', 'error')} required">
	<label for="folio">
		<g:message code="pagosPredio.folio.label" default="Folio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="folio" maxlength="25" required="" value="${pagosPredioInstance?.folio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'fecha', 'error')} required">
	<label for="fecha">
		<g:message code="pagosPredio.fecha.label" default="Fecha" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fecha" precision="day"  value="${pagosPredioInstance?.fecha}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'predio', 'error')} required">
	<label for="predio">
		<g:message code="pagosPredio.predio.label" default="Predio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="predio" name="predio.id" from="${org.valledelbit.sip.Predio.list()}" optionKey="id" required="" value="${pagosPredioInstance?.predio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'dependenciaPersonal', 'error')} required">
	<label for="dependenciaPersonal">
		<g:message code="pagosPredio.dependenciaPersonal.label" default="Dependencia Personal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dependenciaPersonal" name="dependenciaPersonal.id" from="${org.valledelbit.sip.DependenciaPersonal.list()}" optionKey="id" required="" value="${pagosPredioInstance?.dependenciaPersonal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'habitante', 'error')} required">
	<label for="habitante">
		<g:message code="pagosPredio.habitante.label" default="Habitante" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="habitante" name="habitante.id" from="${org.valledelbit.sip.Habitante.list()}" optionKey="id" required="" value="${pagosPredioInstance?.habitante?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'cantidad', 'error')} required">
	<label for="cantidad">
		<g:message code="pagosPredio.cantidad.label" default="Cantidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cantidad" maxlength="25" required="" value="${pagosPredioInstance?.cantidad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'concepto', 'error')} required">
	<label for="concepto">
		<g:message code="pagosPredio.concepto.label" default="Concepto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="concepto" maxlength="25" required="" value="${pagosPredioInstance?.concepto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'predioValor', 'error')} required">
	<label for="predioValor">
		<g:message code="pagosPredio.predioValor.label" default="Predio Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="predioValor" name="predioValor.id" from="${org.valledelbit.sip.PredioValor.list()}" optionKey="id" required="" value="${pagosPredioInstance?.predioValor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pagosPredioInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="pagosPredio.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" maxlength="100" required="" value="${pagosPredioInstance?.descripcion}"/>
</div>

