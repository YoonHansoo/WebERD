<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	select{
		color: black;
	}
</style>   

		<h1 class="erd-add h1">ERD 설정</h1>
		<form action="" id="erdAddFrm" method="post">
			<div class="input-box">
				<label>제목</label>
				<input type="text" id="title" name="erdTitle" placeholder="제목">
			</div>
			<div class="input-box">
				<label>태그</label>
				<input type="text" placeholder="태그" name="tag" id="tag">
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
			<div class="input-box">
				<label>썸네일 이미지</label>
				<img alt="" src="" id="erdImg" width="200px"> 
				<input type="file" name="profileImg" onchange="loadImg(this)" style="width: 300px"> 
			</div>
			
			<!-- 팀 라디오 버튼 선택 시 나타나야 함 -->
			<div class="input-box" id="selTeam">
				<label>팀</label>
				<select name="teamNo">
					<c:forEach var="teamInfoList" items="${teamInfoList}">
						<option value="${teamInfoList.teamNo }">${teamInfoList.teamNm }</option>
					</c:forEach>
				</select>
			</div>
		</form>
		<div class="cancle-btn99 btn-style1">취소</div>
		<div class="submit-btn99 btn-style1" id="erdSave">저장</div>
		
<script>
	$("#selTeam").hide();

	$("#erdSave").on("click", function(){
	});
	
	
	
	$('input[type=radio][name=erdScope]').change(function() {
	    if (this.value == 'team') {
	    	$("#selTeam").show();
	    }
	});
	
	// 이미지 미리보기
	function loadImg(value){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#erdImg").attr('src', e.target.result);
			}
			reader.readAsDataURL(value.files[0]);
		}
	}

</script>
		