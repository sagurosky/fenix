<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.js"/>"></script>
<script src="<c:url value="/static/js/jquery.ui.draggable" />" type="text/javascript" >
</script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" >
</script>
<link href="<c:url value="/static/css/ui-lightness/jquery.alerts.css" />" rel="stylesheet" type="text/css" media="screen">
<script type="text/javascript">
	function submitForm(url,id){
		document.forms[0].action=url;
		document.forms[0].submit();
	} 
</script>    
 <script type="text/javascript">

        $(document).ready(function() {
                    
                jAlert('error', '${message}', 'Alerta');
            
            $("#alert2").click(function() {
                jAlert('warning', 'This is the warning dialog along with some <u>html</u>.', 'Warning Dialog');
            });

            $("#alert3").click(function() {
                jAlert('success', 'This is the success dialog.', 'Success Dialog');
            });

            $("#alert4").click(function() {
                jAlert('info', 'This is the info dialog.', 'Info Dialog');
            });

            $("#confirm").click(function() {
                jConfirm('Can you confirm this?', 'Confirmation Dialog', function(r) {
                    jAlert('success', 'Confirmed: ' + r, 'Confirmation Results');
                });
            });

            $("#prompt").click(function() {
                jPrompt('Type something:', 'Prefilled value', 'Prompt Dialog', function(r) {
                    if (r) alert('You entered ' + r);
                });
            });
        });
			
    </script>    
	
<body>
</body>
<form action="">
</form>
</html>