<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page language="java" contentType="text/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	JSONObject json = new JSONObject();
	json.put("title","Javascript + jQuery + Ajax 완벽가이드");
	json.put("description","Javascript 강의 학생용 자료 입니다. 각 게시판의 다운로드 권한은 매 강의 개강시마다 부여됩니다.");
	json.put("total",4);

	JSONArray items = new JSONArray();
	JSONObject item = new JSONObject();
	item.put("no","공지");
	item.put("subject","'Javascript + jQuery + Ajax 완벽가이드' 강의 자료실 입니다.");
	item.put("hit",3);
	item.put("date","2018.01.29");
	//배열에 추가
	items.put(0, item);		//(인덱스, 값)
	
	item = new JSONObject();
	item.put("no", 3);
	item.put("subject","Javascript + jQuery + Ajax 완벽가이드 3일차 강의자료 입니다.");
	item.put("hit",6);
	item.put("date","2018.02.08");
	//배열에 추가
	items.put(1, item);
	
	item = new JSONObject();
	item.put("no",2);
	item.put("subject","Javascript + jQuery + Ajax 완벽가이드 2일차 강의자료 입니다.");
	item.put("hit",15);
	item.put("date","2018.02.07");
	//배열에 추가
	items.put(2, item);
	
	item = new JSONObject();
	item.put("no",1);
	item.put("subject","Javascript + jQuery + Ajax 완벽가이드 1일차 강의자료 입니다.");
	item.put("hit",19);
	item.put("date","2018.02.05");
	//배열에 추가
	items.put(3, item);
	
	//배열을 json에 추가
	json.put("item",items);		// ("이름", 값 );
	
	System.out.println(json);
%>

<%=json%>








