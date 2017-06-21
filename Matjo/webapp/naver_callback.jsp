<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">


  var naver_id_login = new naver_id_login("rJcQNBJ0RQ1vngwezHdZ", "http://localhost:8080/naver_callback.jsp");
  // 접근 토큰 값 출력
//   alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  
  var formData="";
  
  function naverSignInCallback() {
	  
	 	formData = new FormData();
	    
	 	var email = naver_id_login.getProfileData('email');
	    var nickname = naver_id_login.getProfileData('name');
	    var image = naver_id_login.getProfileData('profile_image');
    
	   
    formData.append("memberId",email);
    formData.append("memberName",nickname);
    formData.append("memberImg",image);
    
    $.ajax({
		type: "post",
		url: "/member/selectMemberProc.do",
		dataType: "json",
		data: { 
			memberId : naver_id_login.getProfileData('email'), 
			memberName : naver_id_login.getProfileData('name'), 
			memberImg : naver_id_login.getProfileData('profile_image'), 
		},
		success: function(data) {
			if(data.result == "success") {
                //네이버 아이디 이미 저장되어 있으므로 로그인 페이지로 이동
				naverLoginSignCallback();
			} else {
				//네이버아이디 저장 -네이버 아이디 새롭게 저장
				naverInsertSignCallback();
			}
		},
		error: function(xhr, status, error) {
			HoldOn.close();
			console.log(xhr);
			alert("error\nxhr : " + xhr + ", status : " 
					+ status + ", error : " + error);      
		}
	});
  }
  
  function naverInsertSignCallback() {
	  $.ajax({
			type: "post",
			url: "/member/insertMemberProc.do",
			data: { 
				memberId : naver_id_login.getProfileData('email'), 
				memberName : naver_id_login.getProfileData('name'), 
				memberImg : naver_id_login.getProfileData('profile_image'), 
			}, 
			dataType: "json",
			success: function(data) {
				if(data.result == "success") {
	              //네이버아이디 저장했으니 다시 로그인하러 가자
					naverLoginSignCallback();
				} else {
					return;
				}
				
			},
			error: function(xhr, status, error) {
				HoldOn.close();
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " 
						+ status + ", error : " + error);      
			}
	});
  }
  
  
  //로그인 성공시 url변경 후, 팝업창 없애기
  function naverLoginSignCallback() {
	  $.ajax({
			type: "post",
			url: "/member/loginMemberProc.do",
			data: { 
				memberId : naver_id_login.getProfileData('email'), 
				memberName : naver_id_login.getProfileData('name'), 
				memberImg : naver_id_login.getProfileData('profile_image'), 
			}, 
			dataType: "json",
			success: function(data) {
				if(data.result == "success") {
					opener.parent.location="/index.do"; 
	                window.close();
				} else {
					return;
				}
				
			},
			error: function(xhr, status, error) {
				HoldOn.close();
				console.log(xhr);
				alert("error\nxhr : " + xhr + ", status : " 
						+ status + ", error : " + error);      
			}
	});
  }
  
  
  
</script>
</body>
</html>