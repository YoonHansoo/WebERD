<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
select{
	color: black;
}

.modal_container_sys{
	border: 2px solid #fff;
   background-color : #1e1e1e;
   width : auto;
   color: #fff; 
   
   width:300px;
   position:relative;
   margin:100px auto 0;
   
   padding-bottom:20px;
 
}

.modal_container_sys input, .modal_container_sys select{
margin-left:20px;
}

#erdAddFrm{
	padding:20px;
}

.btn-style1{
display:inline-block;
width:100px;
opacity:1;
}

.cancle-btn99{
background-color:rgba(94, 92, 93,0.9);
}

.cancle-btn99:hover{
background-color:rgba(94, 92, 93,1);
}

.submit-btn99{
background-color:rgba(224, 51, 122,0.9);
}

.submit-btn99:hover{
background-color:rgba(224, 51, 122,1);
}

</style>   

		<div class="modal_container_sys">
			
			<h1 class="erd-add h1">Create ERD</h1>
			<form action="/erd/erdAdd" id="erdAddFrm" method="post">
				<div class="input-box">
					<label>제목 : </label>
					<input type="text" id="title" name="erdTitle" placeholder="제목">
				</div>
				<div class="input-box">
					<label>태그 : </label>
					<input type="text" placeholder="태그" name="tag">
				</div>
				<div class="input-box">
					<label>공유</label>
					<div>
						<div>
							<input type="radio" name="erdScope" value="public" checked="checked">
							<label>공개</label>
						</div>
						<div>
							<input type="radio" name="erdScope" value="private">
							<label>비공개</label>
						</div>
						<div>
							<input type="radio" name="erdScope" value="team">
							<label>팀</label>
							
						</div>
					</div>
				</div>
				
				<!-- 팀 라디오 버튼 선택 시 나타나야 함 -->
				<div class="input-box" id="selTeam">
					<label>팀 : </label>
					<select name="teamNo">
						<option value="0">팀 선택</option>
						<c:forEach var="teamInfoList" items="${teamInfoList}">
							<option value="${teamInfoList.teamNo }">${teamInfoList.teamNm }</option>
						</c:forEach>
					</select>
				</div>
			</form>
			<div style="margin: 0 auto; text-align:center; ">
				<div class="cancle-btn99 btn-style1">취소</div>
				<div class="submit-btn99 btn-style1" id="erdAdd">만들기</div>
			</div>
		</div>
		<script>
			var clickTeam = false;	
			$("#selTeam").hide();
		
			$("#erdAdd").on("click", function(){
				var selTeam = $("select[name=teamNo]").val();
				if(selTeam == 0 && clickTeam == true){
					alert("팀을 선택해 주세요.");
					return;
				}else
 					$("#erdAddFrm").submit();
 			});
			
			$('input[type=radio][name=erdScope]').change(function() {
			    if (this.value == 'team') {
			    	$("#selTeam").show();
			    	clickTeam = true;
			    }else{
			    	$("#selTeam").hide();
			    	clickTeam = false;
			    }
			});

		</script>
		
