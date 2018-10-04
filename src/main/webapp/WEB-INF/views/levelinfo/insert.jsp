<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<form action="${rPath}/levelinfo" method="post">
	liname : <input type="text" name="liname"><br>
	lilevel : <input type="number" name="lilevel"><br>
	lidesc : <input type="text" name="lidesc"><br>
	<button>레벨 등록</button>
</form>

</body>
</html>