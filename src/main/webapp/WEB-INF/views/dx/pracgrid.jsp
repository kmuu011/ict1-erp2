<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<link rel="stylesheet" href="${skyPath}/dhtmlx.css"/>
</head>
<body>
	<div id="dxGrid" style="width:400px; height:300px"></div>

<script>
window.addEventListener('load', doInit);
var mData = [{id:'delete',text:'delete'},
	{id:'add',text:'Add Row'}];
	
	var dxGrid,dxMenu;
	
	function doInit(){
		dxMenu = new dhtmlXMenuObject();
		dxMenu.setIconsPath("../common/images/");
		dxMenu.renderAsContextMenu();
		
		dxMenu.attachEvent("onClick", function(mId,type){
			if(mId == 'delete'){
				var rId = dxGrid.getSelectedRowId();
				
				if(!rId){
					alert('삭제할 로우를 선택해주세요');
					return;
				}
				
				var cIdx = dxGrid.getColIndexById('linum');
				var linum = dxGrid.cells(rId,cIdx).getValue();
				dhx.ajax.del('${rPath}/levelinfos/' + linum, function(res){
					alert(res.xmlDoc.response);
				});
				
			}else if(mId == 'add'){
				alert('추가하즈ㅏ')
			}
			
		});
		
		dxMenu.loadStruct(mData);
		dxGrid = new dhtmlXGridObject('dxGrid');
		dxGrid.setImagePath('${skyPath}/imgs/');
		dxGrid.setHeader('번호,레벨,이름,설명');
		dxGrid.setColumnIds('linum,lilevel,liname,lidesc');
		dxGrid.setColTypes('ro,ed,ed,ed');
		dxGrid.enableContextMenu(dxMenu);
		dxGrid.init();
		
		dhx.ajax.get('${rPath}/levelinfos', function(res){
			var data = JSON.parse(res.xmlDoc.response);
			dxGrid.parse(data,'js');
		});
		
		
	}
	                        

</script>

</body>
</html>