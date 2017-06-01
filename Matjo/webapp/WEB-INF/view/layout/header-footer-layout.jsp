<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> <decorator:title default="맛조"/> </title>
	
	<c:import url="/WEB-INF/view/layout/header.jsp"></c:import>
	
	<decorator:head />
</head>
<body>

	<div> 
		<!-- 공통 모달 -->
		<!-- Modal -->
           <div class="modal fade" id="write_layerpop">
            <div class="modal-dialog">
                <div class="modal-content modal-content_write">
                    <div class="modal-header">
                        <h3 class="modal-title">로그인</h3>
                    </div>
                    <div class="modal-body">
                       <div class="input_row" id="id_area">
						<span class="input_box">
							<input type="text" id="id" name="id" tabindex="7" accesskey="L" placeholder="이메일" class="int" maxlength="41" value="">@
							<input type="text" id="email" name="id" tabindex="7" accesskey="L" placeholder="" class="int" maxlength="41" value="">
							<select id="emailselect" value="직접입력">
							     <option selected="selected">gmail.com</option>
                                <option>naver.com</option>
                                <option>daum.net</option>
                                <option>lycos.co.kr</option>
							</select>
						</span>
					
					</div>
					<div class="input_row" id="pw_area">
						<span class="input_box">
							<input type="password" id="pw" name="pw" tabindex="8" placeholder="비밀번호" class="int" maxlength="16" onkeypress="capslockevt(event);getKeysv2();" onkeyup="checkShiftUp(event);" onkeydown="checkShiftDown(event);" >
						</span>
                    </div>
					<div class="check_info" >
						<div class="login_check">
							<span class="login_check_box">
								<input type="checkbox" name="nvlong" class="login_chk" tabindex="9"  value="off"  onchange="savedLong(this);nclks_chk('login_chk', 'log.keepon', 'log.keepoff',this,event)" onclick="msieblur(this);"/>
								<label for="login_chk" id="label_login_chk" class="sp">자동 로그인</label>
							</span>
						</div>
                    </div>
                    <div class="modal-footer">
                        <span id="loginbutton">
                          <input type="submit" title="로그인" alt="로그인" tabindex="12" value="로그인" class="btn_global" lang="ko"    onclick="nclks('log.login',this,event)">
                         </span>
                         <span id="cacaologinbutton">
                        <input type="submit" title="카카오톡 로그인" alt="로그인" tabindex="12" value="카카오톡 로그인" class="btn_sns" lang="ko" onclick="nclks('log.login',this,event)">
                        </span>
                    </div>
                    </div>
                </div>
           </div>
        </div>
      
    </div>

	<div>
		<!-- 내용 -->
		<decorator:body />
		
		
		<!-- 공통 네비 메뉴 -->
	            <!-- Nav -->
            <nav id="nav">
                <a href="/index.do"><img src="/resources/images/logo_white.png" /></a>
                <ul>
                    <li>
                        <a href="/index.do">맛조?</a>
                        <ul>
                            <li><a href="showService.html">서비스 소개</a></li>
                            <li><a href="showHistory.html">히스토리</a></li>
                            <li><a href="showMembers.html">멤버</a></li>
                        </ul>
                    </li>
                    <li><a href="selectRank.html">랭크</a></li>
                    <li><a href="selectPromo.html">프로모션</a></li>
                    <li>
                        <a href="selectNoticeList.html">맛조센터</a>
                        <ul>
                            <li><a href="selectNoticeList.html">공지사항</a></li>
                            <li><a href="selectInquiryList.html">문의사항</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="member_menu">
                    <a class="login">로그인</a>
                    <a class="register" href="insertMemberForm.html">회원가입</a>
                </div>
            </nav>
	</div>

	<!-- 공통 푸터 -->
	<div id="footer">
		<div class="install_div">
                <ul class="install_area">
                    <li class="install_item_1">
                        <img src="/resources/images/icon_android.png" />
                        <div class="install_item_content">
                            <h3>안드로이드 버전 설치하기</h3>
                            <p>더 편리하게 이용할 수 있는 꿀~팁!<br/>안드로이드 앱을 설치하면 된다구 !</p>
                        </div>
                    </li>
                    <li class="install_item_2">
                        <img src="/resources/images/icon_store.png" />
                        <div class="install_item_title">
                            <h3>마켓으로 가기</h3>
                        </div>
                    </li>
                    <li class="install_item_2">
                        <img src="/resources/images/icon_share.png" />
                        <div class="install_item_title">
                            <h3>친구에게 공유하기</h3>
                        </div>
                    </li>
                </ul>
            </div>

            <!-- Copyright -->
            <div class="copyright">
                <ul class="menu">
                    <li>&copy; Matjo 2017 05. All rights reserved.</li>
                    <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                </ul>
            </div>
	</div>
</body>
</html>
