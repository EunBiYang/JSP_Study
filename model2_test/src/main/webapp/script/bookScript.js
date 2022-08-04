function checkInput(){
	
	var f = document.na;
	
	if(!f.code.value){
		alert("도서코드를 입력하세요");
		f.code.focus();
	}else if(!f.name.value){
		alert("도서명을 입력하세요");
		f.name.focus();
	}else if(!f.author.value){
		alert("저자를 입력하세요.");
		f.author.focus();
	}else{
		f.submit();
	}
}