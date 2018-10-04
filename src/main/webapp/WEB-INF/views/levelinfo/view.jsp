<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>
<body>
<c:if test="${resultU eq 1}">
	<script>
		alert("업데이트 완료!");
		location.href="${rPath}/levelinfo";
	</script>
</c:if>


<form action="${rPath}/levelinfoupdate" method="post">
<table border="1">
<thead>
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>레벨</th>
		<th>설명</th>
	</tr>
</thead>

<tbody id="tBody">
	<tr>
		<td>${list.linum}</td>
		<td>${list.liname}</td>
		<td>${list.lilevel}</td>
		<td>${list.lidesc}</td>
	</tr>
	<tr>
		<td colspan="4"><button type="button" onclick="goUp()">수정하기</button></td>
	</tr>
</tbody>

</table>




</form>

<script>
	function goUp(){
		var html='';
		var tbody = document.querySelector("#tBody");
		
		html += '<tr>';
		html += '<td>${list.linum}</td>';
		html += '<td><input type="text" value="${list.liname}" name="liname"></td>';
		html += '<td><input type="number" value="${list.lilevel}" name="lilevel"></td>';
		html += '<td><input type="text" value="${list.lidesc}" name="lidesc"></td>';
		html += '<input type="hidden" value="${list.linum}" name="linum">';
		html += '</tr>';
		
		html += '<tr>';
		html += '<td colspan="4"><button>수정 완료</button></td>';
		html += '</tr>';
		
		tbody.innerHTML = html;
		
	}
</script>

</body>
</html>