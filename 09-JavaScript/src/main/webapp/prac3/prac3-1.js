
function doSubmit() {
	var fm = document.fm;
//else if를 사용하면 rerturn false생략이 가능하다! 간결한 코드
//txst 요소 검사
	if (!fm.id.value) {
		alert("이름을 입력해 주세요.");
		fm.id.focus();
	}
	else if (!fm.tel.value) {
		alert("전화번호를 입력해 주세요.");
		fm.tel.focus();
	}
//password 요소 검사
	else if (!fm.pw.value) {
		alert("비밀번호를 입력해 주세요.");
		fm.pw.focus();
	}
	else if (!fm.jumin.value) {
		alert("주민번호를 입력해 주세요.");
		fm.jumin.focus();
	}
//email 타입
	else if (!fm.email.value) {
		alert("이메일을 입력해 주세요");
		fm.email.focus();
	}
//select 선택여부
	else if (fm.job.selectedIndex < 1) {
		alert("직업을 선택해 주세요");
		fm.job.focus();
	}
//url 타입
	else if (!fm.url.value) {
		alert("url를 입력해 주세요.");
		fm.url.focus();
	}
//라디오버튼 검사
	else if (!fm.sex[0].checked && !fm.sex[1].checked) {
		alert("성별을 선택해주세요");
		fm.sex[0].focus();
		return false;
	}
	
//checkbox 입력여부 검사
	var chk = false;
	for (var i = 0; i < fm.hobby.length; i++) {
		if (fm.hobby[i].checked) {
			chk = true;
			break;
		}
	}
	if (!chk) {
		alert("취미를 선택하세요");
		fm.hobby[0].focus();
		return false;
	}
}
