<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spr"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
<a href='<c:url value="${param.url}"/>' >
<span class="ui-icon ui-icon-search" title="<spr:message code="tooltip.details"/>"></span>
</a>
</div>
