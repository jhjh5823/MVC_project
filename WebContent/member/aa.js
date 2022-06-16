/**
 * aa.js
 */
function updateCheck(){
	if($('#pw').val()==''){
		alert("비밀번호를 입력하세요.");
		$('#pw').focus();
		return false;
	}
	if($('#pw2').val()==''){
		alert("비밀번호 재확인을 입력하세요.");
		$('#pw2').focus();
		return false;
	}
	if($('#pw').val()!=$('#pw2').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw2').val('');
		$('#pw').val('').focus();
		return false;
	}
	if($('#name').val()==''){
		alert("이름을 입력하세요.");
		$('#name').focus();
		return false;
	}
	if($('#tel').val()==''){
		alert("전화번호를 입력하세요.");
		$('#tel').focus();
		return false;
	}
	if($('#zipcode').val()==''){
		alert("우편번호를 입력하세요.");
		$('#zipcode').focus();
		return false;
	}
	if($('#addr').val()==''){
		alert("주소를 입력하세요.");
		$('#addr').focus();
		return false;
	}
	if($('#addr2').val()==''){
		alert("상세주소를 입력하세요.");
		$('#addr2').focus();
		return false;
	}
	return true;
}//updateCheck()-end

function loginCheck(){
	var ff=eval("document.loginForm");
	if(ff.id.value==''){
		alert("아이디를 입력하세요.");
		ff.id.focus();
		return false;
	}
	if(ff.pw.value==''){
		alert("비밀번호를 입력하세요.");
		ff.pw.focus();
		return false;
	}
	return true;
}//loginCheck-end

function check(){
	if($('#id').val()==''){
		alert("아이디를 입력하세요.");
		$('#id').focus();
		return false;
	}
	if($('#pw').val()==''){
		alert("비밀번호를 입력하세요.");
		$('#pw').focus();
		return false;
	}
	if($('#pw2').val()==''){
		alert("비밀번호 재확인을 입력하세요.");
		$('#pw2').focus();
		return false;
	}
	if($('#pw').val()!=$('#pw2').val()){
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw2').val(''); //내용삭제
		$('#pw').val('').focus();
		return false;
	}
	if($('#name').val()==''){
		alert("이름을 입력하세요.");
		$('#name').focus();
		return false;
	}
	if($('#tel').val()==''){
		alert("전화번호를 입력하세요.");
		$('#tel').focus();
		return false;
	}
	if($('#zipcode').val()==''){
		alert("우편번호를 입력하세요.");
		$('#zipcode').focus();
		return false;
	}
	if($('#addr').val()==''){
		alert("주소를 입력하세요.");
		$('#addr').focus();
		return false;
	}
	if($('#addr2').val()==''){
		alert("상세주소를 입력하세요.");
		$('#addr2').focus();
		return false;
	}
	return true;
}//check()-end

// -----------------------
// Ajax
// -----------------------
function confirmIDcheck(){
	if($('#id').val()==''){
		alert("아이디를 입력하세요");
	}else{
		$.ajax({
			type:'POST',
			url:'confirmID.jsp',
			data:"id="+$('#id').val(),
			dataType:'JSON',
			success:function(data){
				//alert(data.x);
				if(data.x==1){
					alert("이미 존재하는 아이디입니다.");
					$('#id').val('').focus();
				}else{
					alert("사용 가능한 아이디입니다.");
					$('#pw').focus();
				}//else-end
			}//success-end
		});
	}//else-end
}//confirmIDcheck()-end