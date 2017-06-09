<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>맛조::고객의 소리</title>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="/resources/assets/css/mj-custom.css" />
		<link rel="stylesheet" href="/resources/assets/css/mj-responsive.css" />
	
	<script type="text/javascript">
	function updateInquiryPage(){
		location.href="/inquiry/updateInquiryForm.do?inquiryNo=${param.inquiryNo}";
	}
	$(function() {
		
			selectInquiry();
			
		});//end ready
		
		function selectInquiry() {
			
			$.ajax({
				type: "post",
				url: "/inquiry/inquiryDetailViewProc.do",
				data: {
					inquiryNo: "${param.inquiryNo}"
					},
				dataType: "json",
				success: function(data) {
					printLog(data);
					if(data.result == "ok") {
						var inquiry = data.inquiryBean;
						
						if(inquiry == null) {
							alert("글조회에 실패 하였습니다.");
							return;
						}	
						$("#inquiryNo").text(inquiry.inquiryNo);
						$("#inquiryMember").text(inquiry.inquiryMember);
						$("#inquiryTitle").text( inquiry.inquiryTitle );
						$("#inquiryContent").text( inquiry.inquiryContent );
						$("#inquiryCnt").text( inquiry.inquiryCnt );
						$("#inquiryDate").text( inquiry.inquiryDate );
						$("#inquiryUpdate").text( inquiry.inquiryUpdate );
						$("#inquiryReply").text( inquiry.inquiryReply );
						$("#inquiryRepDate").text( inquiry.inquiryRepDate );
						
						
					} else {
						alert(data.resultMsg);
					}
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
			
		};
		
		function inquiryDelete(){
			$.ajax({
				type: "post",
				url: "/inquiry/inquiryDeleteProc.do",
				data: { 
					inquiryNo: "${param.inquiryNo}"
				},
				dataType: "json",
				success: function(data) {
					console.log(data);
					if(data.result == "ok") {
						location.replace("/inquiry/selectInquiryList.do");
					} else {
						alert(data.resultMsg);
					}
					
				},
				error: function(xhr, status, error) {
					HoldOn.close();
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
		};//end of inquiryDelete
		
		function inquiryReplyProc() {

			$.ajax({
					type: "post",
					url: "/inquiry/inquiryReplyProc.do",
					data: {
						"inquiryNo": $("#inquiryNo").text(),
						"inquiryReply": $("#inputInquiryReply").val()
					},
					dataType: "json",
	                success: function(data){
	                	alert(data.resultMsg);
	                	if(data.result == "ok") {
	                		//화면이동 처리
							selectInquiry();
							return;
						} else {
							alert(data.resultMsg);
							return;
						}
	                },//success
	                error: function(xhr, status, error) {
						console.log(xhr);
						alert("error\nxhr : " + xhr + ", status : " 
								+ status + ", error : " + error);      
					}
	            });

		};//end function
	</script>
</head>
<body class="no-sidebar">
	<div id="page-wrapper">
<!-- Header -->
		<div id="header">
<!-- Inner -->
		<div class="inner">
		</div>
	</div>
	
<!-- Main -->
	<div class="wrapper style1">
	<div class="container">
			<article id="main" class="special">
				<section>
                    <div class="notice">
                     <div class="other_btn">
                     <button type = "button" class="sch_smit" onclick="updateInquiryPage();">수정</button>
						&nbsp;<button type="button"  class="sch_smit" onclick="inquiryDelete(); return false;">삭제</button>
                             </div>
                                <table class="detail">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                           <col width="10%">
                                       </colgroup>
                                       <tr>
                                            <th>제목</th>
                                            <td class="title"><span id="inquiryTitle"></span></td>
                                            <th>조회수</th>
                                            <td class="count"><span id="inquiryCnt"></span></td>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td><span id="inquiryMember"></span></td>
                                            <td colspan="2">
                                              <span id="inquiryDate"></span> 
                                            </td>
                                        </tr>
                                        <tr>
                                           <td class="table_content" colspan="4">
                                           <pre>
							                  <span id="inquiryContent"></span>
                                            </pre>
                                            </td>
                                        </tr>
                                        
                                        <!-- 댓글 보여주기 -->
                                        <tr>
                                           <th>게시글[
							                  <span id="inquiryNo"></span>
							                  	]의 답변
							                  </th>
							                  <td>
							                  <span id="inquiryReply"></span>
                                            </td>
                                        </tr>
                                    </table>
                                     <button type="button" class="sch_smit" onclick="javascript:location.href='/inquiry/selectInquiryList.do';">목록</button>
                                     <br/>
                                </div>
                                   <a name="reply"></a>
                                <div class="notice">
                                    <form action="/inquiry/inquiryDetailView.do?inquiryNo=${inquiry.inquiryNo}" method="get">
                                    <table class="detail">
                                      <caption>:■ 답글달기</caption>
                                       <colgroup>
                                           <col width="20%">
                                           <col width="*">
                                           <col width="20%">
                                       </colgroup>
                                    <tr>
                                            <th colspan="3">
                                                <!-- RE) 게시글 제목 -->
                                               <span id="inquiryTitle"> RE) </span> 
                                            </th>
                                        </tr>
                                        <tr>
                                            <th>작성자</th>
                                            <td colspan="2">관리자</td>
                                        </tr>
                                	 	<tr>
                                           <td class="table_content" colspan="3">
                                            <textarea cols="20" rows="10" id="inputInquiryReply"></textarea>
                                            </td>
                                        </tr>
                                       	<tr>
                                            <td colspan="2">
                                            </td>
                                            <td class="submit_btn">
                                                <button type="button" class="sch_smit" onclick="inquiryReplyProc(); return;">답글 달기</button>
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