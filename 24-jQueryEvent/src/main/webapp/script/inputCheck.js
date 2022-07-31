$(function(){
	//입력검사(submit 이벤트가 발생하면 함수안에 내용 실행
	$("#join").submit(function(){
		//id 검사
		var user_id = $("input[name='user_id']").val();
		if(!user_id){
			alert("아이디를 입력하세요.");
			$("input[name='user_id']").focus();
			return false;	//submit 무효화
		}
		//비밀번호 검사
		if(!$("input[name='user_pw']").val()){
			alert("비밀번호를 입력하세요.");
			$("input[name='user_pw']").focus();
			return false;	
		}
		if(!$("input[name='jumin_no']").val()){
			alert("주민번호를 입력하세요.");
			$("input[name='jumin_no']").focus();
			return false;	
		}
		//라디오 버튼 검사
		// $("태그명").is(":checked")  =>체그일 경우: true
		if(!$("input[name='gender']").is(':checked')){
			alert("성별을 선택하세요.");
			$("input[name='gender']:eq(0)").focus();
			return false;	
		}
		if(!$("input[name='email']").val()){
			alert("이메일 주소를 입력하세요.");
			$("input[name='email']").focus();
			return false;	
		}
		if(!$("input[name='url']").val()){
			alert("url 주소를 입력하세요.");
			$("input[name='url']").focus();
			return false;	
		}
		if(!$("input[name='hpno']").val()){
			alert("핸드폰 번호를 입력하세요.");
			$("input[name='hpno']").focus();
			return false;	
		}

		//체크박스검사
		// $("태그명").is(":checked")  =>체그일 경우: true
		if(!$("input[name='hobby']").is(':checked')){
			alert("취미를 선택하세요.");
			$("input[name='hobby']:eq(0)").focus();
			return false;	
		}
		
		// select 태그 선택여부 검사
		if($("select[name='job'] > option:selected").index() <1){
			alert("직업을 선택하세요.");
			$("select[name='job'] ").focus();
			return false;	
		}
		//입력내용을 화면에 출력*/
		var user_id = $("input[name='user_id']").val();
		var user_pw = $("input[name='user_pw']").val();
		var jumin_no = $("input[name='jumin_no']").val();
		var gender = $("input[name='gender']:checked").val();
		var email = $("input[name='email']").val();
		var url = $("input[name='url']").val();
		var hpno = $("input[name='hpno']").val();
		var job = $("input[name='job'] > option:selected").val();
		
		
		//체크박스의 선택항목 값들 추출
		var hobby = $("input[name='hobby']:checked");
		var hobby_selected = ""; 
		
		// each(function(){}) : 체크박스의 선택된 개수만큼 반복적으로 function()이 호출된다.
		// $(this) : 선택되어진 태그
		hobby.each(function(){
			hobby_selected += $(this).val() + " ";
		});
			
		// 출력할 태그 문자열 만들기
			var result = "<ul>";
			result += "<li>아이디:"+user_id + "</li>";
			result += "<li>비밀번호 : "+user_pw + "</li>";
			result += "<li>주민번호 : "+jumin_no + "</li>";
			result += "<li>성별 : "+gender + "</li>";
			result += "<li>이메일 :"+email + "</li>";
			result += "<li>홈페이지 : "+url + "</li>";
			result += "<li>핸드폰번호 : "+hpno + "</li>";
			result += "<li>취미 : "+hobby_selected + "</li>";
			result += "<li>직업 : "+job + "</li>";
			result += "</ul>";
		
		$("body").html(result);
		//submit 무효화
		return false;
		
		
	});
	
});








