function checkTitle() {
	// 입력 여부
	var frm = document.boardWriteForm;

	if (!frm.subject.value) {
		alert("제목을 입력하세요.");
		frm.subject.focus();
	} else if (!frm.content.value) {
		alert("내용을 입력하세요.");
		frm.content.focus();
	} else {
		frm.submit();
	}
}

function checkBoardModify() {
	var frm1 = document.boardModifyForm;
	
	if (!frm1.subject.value) {
		alert("제목을 입력하세요.");
		frm1.subject.focus();
	} else if (!frm1.content.value) {
		alert("내용을 입력하시오.");
		frm1.content.focus();
	} else {
		frm1.submit();
	}
}

// 입력태그의 값 지우기
function reset1() {
	var frm1 = document.boardModifyForm;
	
	//alert(frm1.subject.value + "/" + frm1.content.value);
	
	frm1.subject.value = "";
	frm1.content.value = "";
}





