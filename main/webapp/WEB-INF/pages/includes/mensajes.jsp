<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${error != null}">
	<div class="ui-state-error ui-corner-all" 
	     style="margin-top: 10px; padding: 0 .7em; font: normal; font-size: 13px; width: auto;  height: auto;">
	<p><span class="ui-icon ui-icon-alert"
		style="float: left; margin-right: .3em;"></span> <strong><c:out 
		value="${error}"></c:out></strong></p>
	</div>

</c:if>
<c:if test="${mensaje != null}">

	<div class="ui-state-highlight ui-corner-all"
		style="margin-top: 10px; padding: 0 .7em; width: auto; font: normal; font-size: 13px; vertical-align: middle; height: auto;">
	<p><span class="ui-icon ui-icon-info"
		style="float: left; margin-right: .3em;"> </span> <strong><c:out 
		value="${mensaje}"></c:out></strong></p>
	</div>

</c:if>
