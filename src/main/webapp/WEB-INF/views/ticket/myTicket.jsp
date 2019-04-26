<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
 .item-cate h4  {
    height: 29px;
    background: #656565;
    line-height: 29px;
    color: #fff;
    font-weight: bold;
    text-align: center;
}
.item-detail-large {
    margin-bottom: 25px;
    border-bottom: 1px solid #dedede;
        PADDING-LEFT: 38%;
}

.modal-dialog, .modal-content {
    height: auto;
}
.modal{
 color: #000;

}
.modalLabels{
width: 25%;}
.ticketInfo{
padding-left: 10%;}
</style>



<div class="item-detail-large">
	<ul>
		<li class="item-cate">
			<h4>티켓 잔여일</h4>
			<div>
				<p>
					<span>${totalPeriod}</span>일
				</p>
			</div>
		</li>
		<li class="item-cate even">
			<h4>티켓사용기한</h4>
			<div>
				<p>
					<span>${endDt}</span>&nbsp;까지
				</p>
			</div>
		</li>
	</ul>
</div>



<table border="3">
	<tr>
		<th rowspan="2">티켓번호</th>
		<th colspan='3' style="text-align: center;">티켓 상세</th>
		<th rowspan="2">환불 신청 여부</th>
		<th rowspan="2">환불 신청 날짜</th>
		<th rowspan="2">환불 여부</th>
		<th rowspan="2">환불 된 날짜</th>
		<th rowspan="2">환불 신청</th>
	</tr>
	<tr>
		<th>티켓 구매일</th>
		<th>티켓명</th>
		<th>티켓 가격</th>
		
	</tr>
	
		<c:forEach items="${myTicketList}" var="ticket">
	<tr class="refTr" data-ticketbuyno="${ticket.TICKETBUYNO }"  >
		<td>${ticket.TICKETNO }</td>
		<td>${ticket.TICKETBUYDT }</td>
		<td>${ticket.TICKETCONTENT }</td>
		<td>${ticket.TICKETPRICE }</td>
		<td>${ticket.REFUNDapllyCk }</td>
		<td>${ticket.REFUNDAPLLY }</td>
		<td>${ticket.REFUNDREQDT }</td>
		
		<c:choose>
			<c:when test="${ticket.REFUND_RESPDT ==null }">
				<td>-</td>
					<c:choose>
						<c:when
							test="${ticket.REFUND_RESPDT ==null && ticket.REFUNDAPLLY != null}">
							<td   class="refTd" data-ref="Waiting">환불대기</td>
						</c:when>
						<c:otherwise>
							<td class="refTd" data-ticketbuyno="${ticket.TICKETBUYNO }" style="cursor: pointer;"  data-target="#ticketRefApplyModal" class="modifyModal" data-toggle="modal">환불신청</td>
						</c:otherwise>
					</c:choose>
				</c:when>
			<c:otherwise>
			<td>${ticket.REFUND_RESPDT }</td>
			<td class="refTd"  data-ref="complete">환불완료</td>
			</c:otherwise>
		</c:choose>
		</tr>
		</c:forEach>
</table>

<!--=================환불신청 모달창=======================  -->
<div class="modal modal-center fade" id="ticketRefApplyModal"
	tabindex="1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	<div class="modal-dialog modal-80size modal-center" role="document">
		<div class="modal-content modal-80size">
			<div class="modal-header">
				<label>| 환불신청</label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span> 
				</button>
			</div>
			<div class="modal-body">

				<div class="form-group">
					<label class="modalLabels">Ticket정보</label>
				</div>

				<div class="form-group">
					<label class="ticketInfo">티켓번호</label>
					<label class="labelContext" id="ticketno">내용</label> 
				</div>
				<div class="form-group">
					<label class="ticketInfo">티켓</label>
					<label class="labelContext" id="ticketcontent">내용</label> 
				</div>
				<div class="form-group">
					<label class="ticketInfo">티켓구매일</label>
					<label class="labelContext" id="ticketbuydt">내용</label> 
				</div>
				<div class="form-group">
					<label class="ticketInfo">티켓가격</label>
					<label class="labelContext" id="ticketperiod">내용</label> 
				</div>

				<div class="form-group">
					<label class="modalLabels">Account</label> <input type="text" placeholder="'-'자 없이 입력해주세요"
						class="ipt_cardnumber" name="ticketPrice" id="ticketPrice">
				</div>

				<div class="pass form-group">
					<label class="modalLabels">BANK</label> 
					    <select id="vcdbank" name="vcdbank">
                     <option selected="selected" value="">은행선택</option>
                     <option id="D01" value="W003">기업은행</option>
                     <option id="D02" value="W005">외환은행</option>
                     <option id="D03" value="W004">국민은행</option>
                     <option id="D04" value="W011">농협중앙회</option>
                     <option id="D05" value="W020">우리은행</option>
                     <option id="D06" value="W088">신한은행</option>
                     <option id="D07" value="W023">SC제일은행</option>
                     <option id="D08" value="W027">씨티은행</option>
                     <option id="D09" value="W031">대구은행</option>
                     <option id="D10" value="W032">부산은행</option>
                     <option id="D11" value="W034">광주은행</option>
                     <option id="D13" value="W039">경남은행</option>
                     <option id="D14" value="W071">우체국</option>
                     <option id="D15" value="W081">KEB 하나은행</option>
                     <option id="D19" value="W007">수협중앙회</option>
                  </select>
				</div>

				<div class="form-group">
					<label class="modalLabels">ACCOUNTHOLDER<br/>(예금주명)</label> <input type="text"
						name="ticketPeriod" id="ticketPeriod">
				</div>
			</div>
			<div id="modalBtn" class="modal-footer">
				<button type="button" id="insertBtn" class="btn btn-default" data-dismiss="modal">환불신청</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

<script>

	$(".refTd").on("click",function(){
		if($(this).data("ref")=="complete"){
			alert("환불처리가 완료된 티켓입니다")
		}else if($(this).data("ref")=="Waiting"){
			alert("환불 승인을 기다리고 있습니다.")
		}else{			
		alert($(this).data("ticketbuyno"));
		ticketBuyInfo($(this).data("ticketbuyno"));
		}
	
		//ticketBuyInfo($(this).data("ticketbuyno"));
	});
	
	  $(".ipt_cardnumber").on("keyup", function(e) {
          $(this).val($(this).val().replace(/[^0-9]/g,""));
      })
	$("#insertBtn").on("click",function(){
        if (confirm("환불신청을 하시겠습니까???") == true) {
        	
        }else{
        	return false;
        }
		
	});
      function ticketBuyInfo(ticketBuyNo) {
    	  $.ajax({
				url : "${cp}/ticket/ticketBuyInfoAjax",
				data : {
					ticketBuyNo : ticketBuyNo
					
				},
				success : function(data) {
					console.log(data);
					 $.each(data, function(idx, val) {      
						 console.log(idx)
						 
						 $("#ticketno").html(val.TICKETNO);
						 $("#ticketcontent").html(val.MEMTEL);
						 $("#ticketbuydt").html(val.MEMEMAIL);
						 $("#ticketperiod").html(val.ticketContext);
					 }); 
				}
			});
		
	}
</script>
	
