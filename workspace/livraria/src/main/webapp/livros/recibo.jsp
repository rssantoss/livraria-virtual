<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="pt-BR">
<html lang="pt-BR">
	<head>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <link rel="stylesheet" href="../_style/estilo_geral.css">
	    <link rel="shortcut icon" href="../_image/logo.png">
	    <title>Livraria Propera</title>
	</head>
	
	<body>
		<div>
			<figure class="circle">
		    	<img src="../_image/logo.png" title="logo" alt="Foto/simbolo"/>
		    </figure>
		</div>
		
		<br>
		<hr>

		<h3>Obrigado ${param.nome}.</h3><br>
		<jsp:useBean id="now" class="java.util.Date" />
		<jsp:setProperty name="now" property="time" value="${now.time+432000000}"/>
		Seus livros serão enviados para você em
		<fmt:formatDate value="${now}" type="date" dateStyle="full"/>.<br><br>
		<c:remove var="cart" scope="session" />
		<c:url var="url" value="livraria.jsp" />
		<strong>
		    <a class="comprar" href="${url}">Continuar comprando</a>
		</strong>
		
		<br>
		
		<footer><hr>Copyright 2021 Livraria Prospera</footer>
	</body>
</html>
