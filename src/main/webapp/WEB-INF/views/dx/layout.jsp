<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
</head>

<style>
	#lay{
	width:100%;
	height:100%;
	margin:auto 0px;
	}
</style>


<body>

<div id="lay"></div>

</body>


<script>
	window.addEventListener('load', doInit);
	
	var dxlay;
	
	function doInit(){
		var conf = {
				parent:'lay',
				pattern:'4H',
				cells:[
					{id:"a", text:"Left", fix_size:[true,null]},
					{id:"b", text:"middle top"},
					{id:"c", text:"middle bottom"},
					{id:"d", text:"Right"}
				]
		};
		
		dxlay = new dhtmlXLayoutObject(conf);
		dxlay.attachEvent('onDblClick', function(id){
			alert(id);
		});
	}

</script>
</html>