<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<style>
table {
	text-align: center;
}
</style>
</head>

<body>

<c:if test="${!empty result}">

	<script>
		alert("처리 완료!");
		location.href = "${rPath}/levelinfo";
	</script>
</c:if>

<c:if test="${!empty resultD}">
	<script>
		alert("${resultD}개 삭제 완료!");
		location.href = "${rPath}/levelinfo";
	</script>
</c:if>

<br>

<button>검색</button>

<input type="text" id="sch" name="liname"> 
<select name="op">
	<option value="linum">번호</option>
	<option value="lilevel">레벨</option>
	<option value="liname">이름</option>
	<option value="lidesc">기타</option>
</select><br><br>

	<table border="1">
		<thead id="tHead">
			<tr>
				<th><input type="checkbox" onclick="chkAll(this)">
				<th>넘버</th>
				<th>레벨</th>
				<th>이름</th>
				<th>기타</th>
			</tr>
		</thead>

		<tbody id="tBody">

			<c:if test="${empty liList}">
				<tr>
					<td colspan="5">레벨 목록이 ㅇ벗슴니다</td>
				</tr>
			</c:if>

			<c:forEach var="li" items="${liList}">
				<tr>
					<td><input type="checkbox" name="chk" value="${li.linum}"></td>
					<td>${li.linum}</td>
					<td>${li.lilevel}</td>
					<td><a href="${rPath}/levelinfoview/${li.linum}">${li.liname}</a></td>
					<td>${li.lidesc}</td>
				</tr>

			</c:forEach>

		</tbody>

	</table><br>

<button name="insert">등록</button>
<button name="delete" formmethod="delete">삭제</button>

<script>
var tbody = document.querySelector("#tBody");
var thead = document.querySelector("#tHead");
var head = '';
var body = '';


 window.addEventListener('load', function(){
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status == 200){
					JSON.parse(xhr.response).forEach((e) => {
						if(!head){
							head += '<tr><th><input type="checkbox" onclick="chkAll(this)"></th>';
							for(var k in e){
								head += '<th>' + k + '</th>';	
							}
							head +='</tr>';
							thead.innerHTML = head;
						}
						
						body += '<tr>';
						body += '<td><input type="checkbox" name="chk" value='+ e["linum"] + '></td>';
						for(var k in e){
							if(k.indexOf("name") >= 0){
								body += '<td><a href="${rPath}/levelinfoview/' + e["linum"] + '">' + e[k] + '</a></td>';
							}else{
								body += '<td>' + e[k] + '</td>';								
							}
						}
						body += '</tr>';
						
					});
					
					tbody.innerHTML = body;
				
					var lis = document.querySelector("#lv42 #liname").value;
					alert(lis);
					
			}else{
				alert(JSON.parse(xhr.response).error)
			}
		}
	}
	
	xhr.open("GET", "${rPath}/levelinfo");
	xhr.send();
	
});
 
 


document.querySelector("button[name=insert]").onclick = function(){
	location.href = "${rPath}/url/levelinfo:insert";
}

document.querySelector("button[name=delete]").onclick = function(){
	var chks = document.querySelectorAll("input[name=chk]:checked");
	var params = [];
	
	chks.forEach((e) => {
		params.push(e.value);
	});
	
	location.href = "${rPath}/levelinfodelete?linum=" + params;
}

function chkAll(e){
	document.querySelectorAll("input[name=chk]").forEach((k) =>{
		k.checked = e.checked;
	});
}



</script>
</body>