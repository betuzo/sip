<%@ page import="org.valledelbit.sip.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'noProducto', 'error')} required">
	<label for="noProducto">
		<g:message code="producto.noProducto.label" default="No Producto" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="noProducto" maxlength="10" required="" value="${productoInstance?.noProducto}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'marca', 'error')} required">
	<label for="marca">
		<g:message code="producto.marca.label" default="Marca" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="marca" maxlength="30" required="" value="${productoInstance?.marca}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="60" required="" value="${productoInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="producto.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" maxlength="100" value="${productoInstance?.descripcion}"/>
</div>

