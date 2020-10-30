<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<c:url value="/resources/css/common.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/main_style.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/order_style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/css/best.css" />">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@300&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200&display=swap"	rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
	<script src="<c:url value="/resources/js/script.js" />"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>구매페이지입니다.</title>
    <script type="text/javascript">
    
   	 $(document).ready(function() {
	
		/* let a = $('#price').text();
		$('.price_show').text(a); 
		
		let b = $('#charge').text();
		$('.charge_show').text(b);
		
		let c = $('#totalprice').text();
		$('.totalprice_show').text(c); */
		
		/* $('#order_btn').click(function(){
			if(!$("input:checked[id='pay_check']").is(":checked")){
				alert("동의체크 하세요");
				$("#pay_check").focus(); 
				return; 
			}
			else{
				alert("결재완료 되었습니다");
			}
		}); */
		
 	 });
   	 
   	function setDisplay(){
		if($('#m_o').is(':checked')){
	   	    $('.div_hide').hide();
			$('#m_option').show();
	   	    
		}
		else if($('#c_o').is(':checked')){
			$('.div_hide').hide();
			$('#c_option').show();
		}
		else if($('#p_o').is(':checked')){
			$('.div_hide').hide();
			$('#p_option').show();
		}
		else if($('#b_o').is(':checked')){
			$('.div_hide').hide();	
			$('#b_option').show();
		}
			
	}
   	 
   	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
   	
   	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
        
    }
        function submitClick(){
        	console.log("들어옴");
        	
        	$("#myform").submit();
        }
   	
  </script>
</head>
<body> 
	<%@ include file="../header.jsp" %>

	<div style="padding: 200px 0">
	
    <div class="Buy_Top_Box">
    <h2>주문서작성</h2> 
        <div class="Buy_Top_Box1">
         	<p>배송상품 주문내역</p>
            <div class="Buy_Top_Box2"> 
	            <div class="magin">	
	                <ul class="order_info">
	                   <li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
	                </ul>
	                <ul id="Buy_Top_title">
	                     <li>상품이름</li>
	                     <li>판매가</li>
	                     <li>수량</li>
	                     <li>포인트</li>
	                     <li>배송구분</li> 
	                     <li>배송비</li> 
	                     <li>합계</li> 
	                </ul>
	                <form action="orderinsert.ord" name="myform" id="myform" method="get"> 
	                <c:forEach items="${lists1 }" var="order">
	                	<input type="hidden" name="onum" value="${order.onum }">
	                	<input type="hidden" name="opname" value="${order.opname }">
	                	<input type="hidden" name="oid" value="${order.oid }">
	                	<input type="hidden" name="opcharge" value="${order.opcharge }">
	                	<input type="hidden" name="oppricesum" value="${order.opprice * order.opcount + order.opcharge}">
	                <ul id="Buy_Top_menu">
	                    <li><input type="text" class="upload-name" name="opname" value="${order.opname }" disabled="disabled" size="7"></li>                   
	                    <li><input type="text" class="upload-name" id="price" name="opprice" value="${order.opprice }" disabled="disabled" size="7"></li>                    
	                    <li><input type="text" class="upload-name" name="opcount" value="${order.opcount }" disabled="disabled" size="7"></li>                   
	                    <li><input type="text" class="upload-name" name="oppoint" value="${order.oppoint }" disabled="disabled" size="7"></li>                
	                    <li><input type="text" class="upload-name" name="opop" value="${order.opop }" disabled="disabled" size="7"></li>
	                    <li><input type="text" class="upload-name" id="charge"name="opcharge"value="${order.opcharge }" disabled="disabled" size="7"></li>
	                    <li><input type="text" class="upload-name" id="totalprice"name="oppricesum" value="${order.opprice * order.opcount + order.opcharge}" disabled="disabled" size="7"></li>
	                </ul>
	                </c:forEach>

                 </div>
            </div>
           	<p style="margin-top: 50px;">주문 정보</p>
            <div class="Buy_Mid_Box1">
                    <ul class="flexshow">
                        <li class="star">주문하시는 분</li>
                        <li class="star li_height" style="padding-top: 60px;">주소</li>
                        <li class="star" style="padding-top:30px">핸드폰</li> 
                        <li class="star" style="padding-top:30px">이메일</li>
                    </ul>
                    <ul class="addr">
                        <li><input type="text" class="upload-name" name="oname" value="" placeholder="주문자명"></li>
                        <li class="addr_st">
                        	<input type="text"  class="upload-name" id="sample4_postcode" name="postcode" placeholder="우편번호">
                        	<input type="button"  class="upload-name" style="margin-left: 10px;" class="font_myeongjo" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                        	<input type="text"  class="upload-name" id="sample4_roadAddress" name="roadaddress"placeholder="도로명주소">
                        </li>
                        <li>
							<input type="text"  class="upload-name" id="sample4_jibunAddress" name="jibunaddress" placeholder="지번주소">
							<span id="guide"  class="upload-name" style="color:#999;display:none"></span>
							<input type="text"  class="upload-name" id="sample4_detailAddress" name="detailaddress"placeholder="상세주소">
                        </li>
                        <li>
                            <select name="ophone">
                                <option value="010">010</option>
                                <option value="011">011</option>
                            </select>
                            <input type="text"  class="upload-name" name="ophone2" size="4" maxlength="4" value=""> 
                            <input type="text"  class="upload-name" name="ophone3" size="4" maxlength="4" value="">
                        </li>
                        <li><input type="text"  class="upload-name" name="oemail" value="">@<input type="text"  class="upload-name"  name="oemail2" value=""></li>
                    </ul>
            </div>
          	 <p style="margin-top: 50px;">배송 정보</p>
            <div class="Buy_Mid_Box1">
                
                    <ul class="flexshow">
                        <li class="star">주문하시는 분</li>
                        <li class="star li_height" style="padding-top: 30px;">주소</li>
                        <li class="star" style="margin-top: -42px;">핸드폰</li> 
                        <li class="star" style="margin-top: -5px;">배송메세지</li> 
                    </ul>
                    <ul class="addr">
                        <li><input type="text" class="upload-name" name="oprename" value="" placeholder="수령자명"></li>
                        <li class="addr_st">
                        	<input type="text"  class="upload-name" id="postcode" name="repostcode" placeholder="우편번호">
                        	<input type="button"  class="upload-name" style="margin-left: 10px;" class="font_myeongjo" onclick="execDaumPostcode()" value="우편번호 찾기">
                        	<input type="text"  class="upload-name" id="roadAddress" name="reroadaddress" placeholder="도로명주소">
                        </li>
                        <li>
							<input type="text"  class="upload-name" id="jibunAddress" name="rejibunaddress" placeholder="지번주소">
							<span id="guide" class="upload-name"  style="color:#999;display:none"></span>
							<input type="text"  class="upload-name" id="detailAddress" name="redetailaddress" placeholder="상세주소">
                        </li>
                        <li>
                            <select name="dphone">
                                <option value="010">010</option>
                                <option value="011">011</option>
                            </select>
                            <input type="text"  class="upload-name" name="dphone2" size="4" maxlength="4" value="">
                            <input type="text" class="upload-name"  name="dphone3" size="4" maxlength="4" value="">
                        </li>
                        <li>
                            <textarea maxlength="255" cols="70" name="dms"   class="upload-name" ></textarea>
                        </li>
                    </ul>
            </div>

                    <div class="Buy_Bottom_Box1">
                    <p>결제 예정 금액</p>
                        <ul class="margin-top20"  style="margin-top: 20px;">
                            <li>총 주문 금액</li>
                            <li>부가결제 금액(배송비)</li>
                            <li>총 결제예정 금액</li>
                        </ul>
                        <ul class="margin-top20"  style="margin-top: 20px;">
                            <li>${lists1.get(0).opprice }</li>
                            <li>${lists1.get(0).opcharge }</li>
                            <li>${lists1.get(0).opprice * lists1.get(0).opcount + lists1.get(0).opcharge }</li>
                        </ul>
                    </div>
                    <p>결제수단</p>
                    <div class="div_pay_area">
                        <div class="div_method">
                            <ul class="margin-top20">
                                <li style="padding: 10px;">
                                   <!--  <input type="radio" name="order_method" id="m_o" value="무통장 입금" onchange="setDisplay()">무통장 입금 -->
                                    <input type="radio" name="ordermethod" id="c_o" value="카드 결제" onchange="setDisplay()">카드 결제
                                    <input type="radio" name="ordermethod" id="p_o" value="휴대폰 결제" onchange="setDisplay()">휴대폰 결제
                                    <!-- <input type="radio" name="order_method" id="b_o" value="계좌이체" onchange="setDisplay()">계좌이체 -->
                                 </li>
                            </ul>

                        </div>
                        <div class="div_total">
                            <ul class="margin-top20" style="margin-top: 20px;">
                                <li>
                                	최종결제 금액
                                </li>
                            </ul>
                            <ul style="margin-top: 20px" class="totalprice_show">
                                <li>
                                </li>
                            </ul>
                            <ul class="margin-top20" style="margin-top: 20px;">
                                <li>
                                    <input type="checkbox" id="paycheck" name="paycheck">결제정보를 확인하였으며, 구매진행에 동의합니다.
                                </li>
                            </ul>
                            <ul class="margin-top20" style="margin-top: 20px;">
                            	<li>
                                <input type="button" class="upload-name"  class="font_myeongjo" style="width:250pt;height:100pt;" id="orderbtn" onclick="submitClick()" value="결제하기">
                           		</li>
                           		
                            </ul>         
                        </div>
                        </form>
                        <div class="div_option">
                            <!-- 무통장입금결제 -->
                            <!-- <div class="div_hide" id="m_option">
                            <ul class="margin-top20">
                                <li style="padding: 55px;">입금자명</li>
                                <li style="padding: 52px;">입금은행</li>
                            </ul>
                            <ul class="margin-top10">
                                <li style="padding: 35px;"><input type="text" name="moo_name" size="10"></li>
                                <li style="padding: 47px;">
                                    <select name="b_bank">
                                        <option value="국민은행">국민은행</option>
                                        <option value="신한은행">신한은행</option>
                                        <option value="우리은행">우리은행</option>
                                        <option value="기업은행">기업은행</option>
                                    </select>
                                </li>
                            </ul>
                            <ul class="m_top20_left20">
                              <li class="m_option">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
                            </ul>
                            </div> -->
                            <!-- 카드결제 -->
                            <div class="div_hide" id="c_option">
                            <ul class="m_top20_left20">
                                <li>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
                            </ul>
                            <ul class="m_top20_left20">
                                <li>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
                            </ul>
                            </div>
                            <!-- 휴대폰결제 -->
                            <div class="div_hide" id="p_option">
                            <ul class="m_top20_left20">
                                <li>소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</li>
                            </ul>
                            </div>
                            <!-- 실시간 계좌이체 -->
                            <!-- <div class="div_hide" id="b_option">
                            <ul class="m_top20_left20">
                                <li style="padding: 35px;">예금주명</li>
                                <li style="padding: 35px;"><input type="text" name="sil_name" size="10"></li>
                            </ul>
                           </div> -->
                       </div>
                   </div>
                   
      		 </div>
   	 	</div>
    </div>
</body>
</html>