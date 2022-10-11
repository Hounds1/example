<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	/**
	 * All script functions have been repaired.
	 * xhr.readyState has been repaired.
	 */
	function checkId() {
		/**
		 * const value 선언 시 해당 요소에 class or id를 부여하고 querySelector or getElementById or getElementsByClassName()로 선택할 것.
		 * 다만, class 이름은 중복이 가능하기 때문에 여러 개의 요소가 선택 될 수 있으니 추천하지 않음.
		 * ex) <input type="text" id="exam" class="exam">
		 *     		const examVal = document.querySelector('#exam').value;
		 *     		const examVal = document.getElementById('exam').value;
		 *     		const examVal = document.getElementByClassName('exam').value;
		 *
		 * script 작성 시 body 최하단부에 작성하는 것을 추천. document는 위에서 밑으로 읽어내려오기 때문에 정상작동하지 않을 수 있을 뿐더러
		 * 상단부에 위치하면 나중에 추가하게 될 resources(.css .js .etc) 또는 뷰포트의 가독성에 영향을 주게 됨.
		 * 가장 좋은 방법은 .js 파일로 빼서 링크해주는 것.
		 */

		/**
		 * 기존 변수선언들의 문법을 수정했습니다.
		 */
		const idDuplicateChk = document.querySelector('#id').value;
		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId/" + idDuplicateChk, false);
		/**
		 * URL checkId/로 매개변수 idDuplicateChk를 담아 Get 요청대기. 비동기처리 비활성화.
		 */
		xhr.send();
		/**
		 * 상단 요청 양식 전송.
		 */
		console.log(document.querySelector("#id").value);
		/**
		 * input 태그 입력 id값 확인.
		 */
		const result = xhr.responseText;
		/**
		 * Backend 응답 수신 후 result에 저장.
		 */
		console.log("[동기] 응답: " + result);
		/**
		 * 응답값 확인.
		 */
		if (result == "OK") {
			alert("[동기]사용 가능한 아이디 입니다");

		} else
			alert(" [동기]이미 사용중인 아이디 입니다");

		/**
		 * 응답 결과값에 따른 처리.
		 */
	}
	function checkId_Async() {
		/**
		 * 기존 변수선언들의 문법을 수정했습니다.
		 * 기존 Ajax 요청문을 상단으로 이동시켰습니다. (요청 없이 값을 받고 readyState를 판단 할 수 없음.)
		 */

		const idDuplicateChk = document.querySelector('#id').value;
		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId/" + idDuplicateChk , true);
		/**
		 * 비동기처리 활성화로 요청 중 다른 행동 가능(ex.다른 요청 등)
		 */
		xhr.send();

		xhr.onreadystatechange = function (){
			console.log(xhr.readyState);
			
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
				
					const result = xhr.responseText;
					console.log("[비동기] 응답: " + result);

					if (result == "OK") {
						alert("[비동기]사용 가능한 아이디 입니다");

					} else
						alert(" [비동기]이미 사용중인 아이디 입니다");

					
				}
			}
		};

		
	}

	function signup() {
		/**
		 * 기존 선언된 변수들의 문법이 전체적으로 수정되었습니다.
		 * .focus 기능이 정상작동 합니다.
		 */
		const idValueChk = document.querySelector('#id').value;

		if (idValueChk == "") {
			alert("아이디를 입력 해 주세요");
			idValueChk.focus();
			return;
		}

		const passValueChk = document.querySelector('#passwd').value;
		if (passValueChk == "") {
			alert("비밀번호를 입력 해 주세요");
			passValueChk.focus();
			return;
		}
		const passValidateChk = document.querySelector('#passwd_valid').value;
		if (passValidateChk == "") {
			alert("비밀번호를 확인 해 주세요");
			passValidateChk.focus();
			return;
		}

		if (passValueChk != passValidateChk) {
			alert("비밀번호가 일치하지 않습니다");
			form.passwd.focus();
			return;
		}

		const nameValueChk = document.querySelector('#name').value;
		if (nameValueChk == "") {
			alert("이름을 입력 해 주세요");
			nameValueChk.focus();
			return;
		}

		form.submit();
	}
</script>
</head>
<body>
	<div>
		<div>
			<h3>회원가입</h3>
		</div>
		<div>
			<!-- Member Sign up Form start -->
			<!-- form 태그 내의 모든 요소에 id가 부여되었습니다. -->
			<form name="signup_form" method="post">
				<div>
					<label>아이디: </label> <input type="text" name="id" id="id"
						placeholder="아이디를 입력해주세요">
					<button type="button" onclick="checkId()">[동기]중복확인</button>
					<button type="button" onclick="checkId_Async()">[비동기]중복확인</button>
				</div>
				<div>
					<label>비밀번호: </label> <input type="password" name="passwd" id="passwd">
				</div>
				<div>
					<label>비밀번호확인: </label> <input type="password" name="passwd_valid" id="passwd_valid">
				</div>
				<div>
					<label>이름: </label> <input type="text" name="name" id="name"
						placeholder="이름을 입력하세요">
				</div>
				<div>
					<button type="button" onclick="signup()">회원가입</button>
					<a href="/"><button type="button">취소</button></a>
				</div>
			</form>
			<!-- Member Sign up Form end -->
		</div>
	</div>

</body>
</html>