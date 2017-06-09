<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>맛조: 공지사항- 게시글 수정</title>
	<meta http-equiv="Content-Type" content="text/htm" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
	<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
	<script type="text/javascript">
		$(function() {
			// 게시글 정보 취득
			$.ajax({
				type :"POST",
				url : "/notice/noticeDetailViewProc.do",
				data: {
					noticeNo: "${param.noticeNo}"
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

						var notice = data.noticeBean;
						
						//수정날짜 입력
						//notice.noticeUpdate = NowTime;

						$("#noticeTitle").val( notice.noticeTitle );
						$("#noticeContent").val( notice.noticeContent );
					} else {
						alert(data.resultMsg);
					}
				}
			}); // end of ajax
			
		});
		
		// 게시글 수정 : button의 onclick 이름
		function updateNotice() {
			
			// 게시글 수정
			$.ajax({
				type : "POST",
				url : "/notice/noticeUpdateProc.do",
				data: $("#updateNoticeForm").serialize(),
				datatype: "json",
				success: function(data) {
					if(data.result == "ok") {
						location.replace("/notice/selectNoticeList.do");
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
                                        <button type="button" class="sch_smit" onclick="javascript:location.href='/notice/selectNoticeList.do';">목록</button>
                                    </div>
                                    <form  name="updateNoticeForm" id="updateNoticeForm">
                                    <input type="hidden" name="noticeNo" value="${ param.noticeNo }"/>
                                    <table class="detail">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                       </colgroup>
										 <tr>
                                            <th>제목</th>
                                            <td colspan="2">
                                                <input type="text" maxlength="16" id ="noticeTitle" name="noticeTitle" required autofocus/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                           <td class="table_content" colspan="3">
                                            <textarea name="noticeContent" id="noticeContent" cols="20" rows="20"></textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                
                                            </td>
                                            <td class="submit_btn" colspan="2">
                                                <button class="sch_smit" type="button" onclick="updateNotice(); return false;">작성 완료</button>
                                                <button class="sch_smit" type="button" onclick="javascript:history.back()">취소</button>
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
				
</body>
</html>