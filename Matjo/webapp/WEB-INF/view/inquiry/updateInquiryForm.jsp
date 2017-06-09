<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<title>맛조: 고객의 소리- 게시글 수정</title>
	<meta http-equiv="Content-Type" content="text/htm" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
	<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
</head>
	<script type="text/javascript">
		$(function() {
			// 게시글 정보 취득
			$.ajax({
				type :"POST",
				url : "/inquiry/inquiryDetailViewProc.do",
				data: {
					inquiryNo: "${param.inquiryNo}"
				},
				datatype : "json",
				success:function(data) {
					if(data.result == "ok") {
						// 현재시간 찾기
						var Now = new Date();
						var NowTime = Now.getFullYear();
						NowTime += '-' + (Now.getMonth() + 1) ;
						NowTime += '-' + Now.getDate();
						NowTime += ' ' + Now.getHours();
						NowTime += ':' + Now.getMinutes();
						NowTime += ':' + Now.getSeconds();

						var notice = data.inquiryBean;
						
						//수정날짜 입력
						notice.noticeUpdate = NowTime;

						$("#inquiryTitle").val( notice.inquiryTitle );
						$("#inquiryContent").val( notice.inquiryContent );
					} else {
						alert(data.resultMsg);
					}
				}
			}); // end of ajax
			
		});
		
		// 게시글 수정 : button의 onclick 이름
		function updateInquiry() {
			// 게시글 수정
			$.ajax({
				type : "POST",
				url : "/inquiry/inquiryUpdateProc.do",
				data: $("#updateInquiryForm").serialize(),
				datatype: "json",
				success: function(data) {
					if(data.result == "ok") {
						location.replace("/inquiry/selectInquiryList.do");
						return;
					} else {
						alert(data.resultMsg);
					}
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					// HoldOn.close();
					alert("error\nxhr : " + xhr + ", status : " +status +", error : " + error);
				}
			});
		};
	</script>
	</head>
<body class="no-sidebar">
	<div id="page-wrapper">
	<div class="wrapper style1">
	<div class="container">
						<article id="main" class="special">
							<section>
                                <div class="notice">
                                   <div>
                                        <button type="button" class="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryList.do';">목록</button>
                                    </div>
                                    <form  name="updateInquiryForm" id="updateInquiryForm">
                                    <input type="hidden" name="inquiryNo" value="${ param.inquiryNo }"/>
                                    <table class="detail">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                       </colgroup>
										 <tr>
                                            <th>제목</th>
                                            <td colspan="2">
                                                <input type="text" maxlength="16" id ="inquiryTitle" name="inquiryTitle" required autofocus/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td colspan="2">${inquiry.inquiryMember}</td>
                                        </tr>
                                        <tr>
                                           <td class="table_content" colspan="3">
                                            <textarea name="inquiryContent" id="inquiryContent" cols="20" rows="20"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                
                                            </td>
                                            <td class="submit_btn" colspan="2">
                                                <button class="sch_smit" type="button" onclick="updateInquiry(); return false;">작성 완료</button>
                                                <button class="sch_smit" type="button" onclick="javascript:history.back();">취소</button>
                                            </td>
                                        </tr>
                                    </table>
                                    </form>
                                </div>
                            </section>
						</article>
						<hr />
					</div>
				</div>
				</div>
	
<!-- 	<form name="updateInquiryForm" id="updateInquiryForm" > -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th>제목</th> -->
<!-- 				<td><input type="textArea" id ="inquiryTitle" name="inquiryTitle"/> </td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th> 내용 </th> -->
<!-- 				<td> <textarea  name="inquiryContent" id="inquiryContent" rows="10" cols="30"></textarea> </td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<button onclick="updateInquiry(); return false;">수정</button>&nbsp;  -->
<!-- 		<button onclick="javascript:history.back()">취소</button> -->
<!-- 	</form> -->

</body>
</html>