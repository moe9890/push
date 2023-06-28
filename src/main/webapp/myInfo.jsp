<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- html 주석: 지정=> crtl + shift + / , 해제는 =>ctrl + shift + \  -->
<%-- jsp 주석: jsp 요소는 html주석으로 저석 설정이 되지 않는다. --%>
<%--
	<%@~ %>:디렉티브 => 대부분 자동으로 입력된다. import 같이 설정에 관련된 정보를 적는다.
	<%!~%>: 선언부 => 프로그램에서 사용할 변수나 메소드를 정의한다. => 자바 파일로 뽑아내서 사용
 	<% =~%>: 표현식 => 변수에 저장된 결과나 연산 결과를 출력 => EL(${ ~ })로 대채해서 사용한다.
 	<% ~ %>: 스크립트릿 => 일반적인 jsp 코드를 적는다.=> jstl로 대채해서 사용한다.
--%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뭔가를 씀</title>
</head>
<body>

<!-- 
 html은 spacebar를 여러번 입력해도 1칸 밖에 떨어지지 않고 enter 키를 여러번 눌러도 줄이 변경되지 않는다.
 2칸 이상 연속해서 띄우려면 &nbsp; 를 띄울 칸의 개수만큼 입력하고 줄 바꾸려면 <br> 태그를 사용한다.
 -->

myInfo.jsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입니다. <br> <br> <br> <br> <br>반갑습니다.
<%
	out.println("출력할 내용<br>");
	out.println(application.getRealPath("/"));
%>
<!-- 
현재 페이지에 입력한 데이터를 특정 페이지로 전송하려면 전송할 데이터를 입력하는 코드를 
<form> ~ </from> 사이에 작성해야 한다.
 action 속성은 전송(type="submit") 버튼이 클릭되면 from에 입력한 데이터를 가지고 넘어갈 jsp 페이지
 이름을 쓴다. 아무것도 안쓰거나 "?"만 입력하면 현재 페이지를 요청한다.
 method 속성은 action 페이지로 데이터가 전송될때 정보가 url(주소) 창에 표시되는 여부를 지정한다.
 method 속성의 기본값은 "get"이고 "get" 방식은 전송 되는 데이터가 URl창에 표시되고 "post"로 
 변경하면 URL 창에 표시되지 않는다.
 -->

<form action="myInfoOK.jsp" method="post">
<label>
 	이름: <input type="text"name="name"><br>
</label><br>
<!-- type="password" 일 경우 한글을 타이핑해서 넣을 수 없다.  -->
<label>
 	ID: <input type="text"name="id"><br>
</label><br>
<label>
 	Password: <input type="password"name="password"><br>
</label><br>
<label>
 	나이: <input type="text"name="age"><br>
</label><br>

<!--
"radio" 와 checkbox는 같은 그룹끼리 반드시 같은 이름의 name 속석을 지정해서 그룹으로 묶어야 한다.
checked="checked" 속성을 지정하면 브라우저에 표시될 때 기본값으로 선택 여부를 지정할 수 있다.
checked="checked"속성은 radio에서는 맨 마지막에 지정한 속성이 유효한 속성으로 취급되고
checkbox에서는 지정하는 대로 선택된다.
"radio" 와 checkbox는 컨트롤을 화면에 표시하는 기능밖에 없기 때문에 선택했을 때 다음 체이지로 넘겨줄
데이터를 value 속성을 사용해서 넣어줘야 한다.
value 속성을 지정하지 않으면 선택한 경우 "on"이 선택하지 않으면 null이 다음 페이지로 넘어간다.
-->
<fieldset style="width: 120px">
<legend>성별</legend>
<input type="radio"  name="gender" value="true" checked>남자
<input type="radio"  name="gender" value="false" >여자
</fieldset><br>

<fieldset style="width: 200px">
<input type="checkbox" name="hobbies" value="등산">등산
<input type="checkbox" name="hobbies" value="바둑">바둑
<input type="checkbox" name="hobbies" value="낚시">낚시
</fieldset><br>

<!-- 
콤보 상자나 목록상자는 별도의 스타일을 지정하지 않으면 <option> 태그에 입력한 문자열 중
가장 긴 문자열 길이에 맞춰서 크기가 결정된다.
콤보상자는 첫 번째  <option> 태그에 입력한 내용이 기본적으로 표시되는데 selected="selected"
속성을 지정하면 이 속성이 지정된 <option> 태그에 입력한 내용을 기본값으로 표시할 수 있다.
 -->

<!--콤보상자 만들기  -->
<select name="trip" style="width: 200px; height: 30px;">
 	<option >괌</option>
 	<option selected="selected">코타키나발루</option>
 	<option>다낭</option>
	<option>나트랑</option>
	<option>푸꾸옥</option>
	<option>다낭</option>
	<option>보라카이</option>

</select><br>

<!--목록상자 만들기  -->
<!--  
<selet> 태그에 multiple="multiple 속성을 지정하면 목록상자가 만들어진다.
목록상자에 표시되는 아이템은 4개가 기본값으로 표시되고 size 속성을 지정하면
-->
<select name="travel" style="width: 200px; multiple = "multiple" size="7">
 	<option>괌</option>
 	<option>코타키나발루</option>
 	<option>다낭</option>
	<option>나트랑</option>
	<option>푸꾸옥</option>
	<option>다낭</option>
	<option>보라카이</option>
</select><br>
<!--  
<textarea>태그에는 value 속성이 없고 <textarea> ~ </textarea> tkdlfmf value로 취급한다.
<textarea> ~ </textarea> 사이에 공백을 두지 않는다.
-->
메모<br>
<textarea rows="10" cols="60" name="content" style="resize: nine;"></textarea><br>

	<input type="submit" value="정보보기">
	<input type="reset" value="취소">
	<input type="button" value="누르면 멍청이" onclick="alert('멍청이')">
	<button type="submit">정보보기</button>
	<button type="reset">취소</button>
	<button type="button" onclick="alert('잉?')">그냥 버튼</button>
	

</form>

</body>
</html>



















