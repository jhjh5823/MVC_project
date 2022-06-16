/**
 * aa.js
 */
function check(){
	if($('#writer').val()==''){
		alert("작성자를 입력하세요.");
		$('#writer').focus();
		return false;
	}
	
	if($('#subject').val()==''){
		alert("글제목을 입력하세요.");
		$('#subject').focus();
		return false;
	}
	
	if($('#content').val()==''){
		alert("글내용을 입력하세요.");
		$('#content').focus();
		return false;
	}
	
	if($('#pw').val()==''){
		alert("암호를 입력하세요.");
		$('#pw').focus();
		return false;
	}
	return true;
}