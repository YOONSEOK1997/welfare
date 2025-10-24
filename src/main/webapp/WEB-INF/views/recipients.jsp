<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>수급자 신청</title>

  <!-- Tailwind CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

  <!-- Daum 주소검색 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

  <script>
    // 카카오 주소 검색
    function sample4_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function (data) {
          let roadAddr = data.roadAddress;
          let jibunAddr = data.jibunAddress;
          $("#zipCode").val(data.zonecode);
          $("#streetAdr").val(roadAddr !== '' ? roadAddr : jibunAddr);
          $("#detailAdr").focus();
        }
      }).open();
    }

    // 주소 확인
    function addrCheck() {
      if ($("#zipCode").val() === '' || $("#streetAdr").val() === '') {
        alert("우편번호 찾기를 클릭해 주소를 입력해주세요.");
        $("#zipCode").focus();
        return false;
      }
      return true;
    }
  </script>
</head>

<body class="bg-gray-100 font-sans text-gray-700">
  <jsp:include page="/WEB-INF/views/common/header.jsp" />

  <main>
    <section class="max-w-2xl mx-auto mt-32 mb-16 p-8 bg-white shadow-lg rounded-2xl">
      <h2 class="text-center text-2xl font-bold text-[rgb(16,78,86)] mb-8 flex justify-center items-center">
        <i class="bi bi-calendar-check mr-2 text-[rgb(16,78,86)]"></i> 
        수급자(요양보호사 요청) 신청
      </h2>

      <form action="<%= request.getContextPath() %>/reservation.do" method="post" onsubmit="return addrCheck();">

        <!-- 신청인 정보 -->
        <h3 class="text-lg font-semibold text-gray-700 border-b pb-2 mb-4">신청인 정보</h3>
        <div class="mb-4">
          <label class="block font-medium mb-1">신청자 성함</label>
          <input type="text" name="applicant_name" required 
                 class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
        </div>
        <div class="mb-4">
          <label class="block font-medium mb-1">연락처</label>
          <input type="text" name="phone_number" required placeholder="예: 010-1234-5678"
                 class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
        </div>

        <!-- 수급자 기본 정보 -->
        <h3 class="text-lg font-semibold text-gray-700 border-b pb-2 mt-8 mb-4">수급자(환자) 기본 정보</h3>
        <div class="mb-4">
          <label class="block font-medium mb-1">수급자 성함</label>
          <input type="text" name="patient_name" required 
                 class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
        </div>

        <!-- 주소 -->
        <div class="mb-4">
          <label class="block font-medium mb-1">주소</label>
          <div class="flex gap-2 mb-2">
            <input type="text" id="zipCode" name="zipCode" placeholder="우편번호" readonly 
                   class="w-1/2 border border-gray-300 rounded-md p-2 bg-gray-100 cursor-not-allowed" />
            <button type="button" onclick="sample4_execDaumPostcode()"
                    class="bg-gray-200 hover:bg-gray-300 text-gray-700 rounded-md px-4 py-2">
              우편번호 찾기
            </button>
          </div>
          <input type="text" id="streetAdr" name="streetAdr" placeholder="도로명 주소" readonly 
                 class="w-full border border-gray-300 rounded-md p-2 mb-2 bg-gray-100 cursor-not-allowed" />
          <input type="text" id="detailAdr" name="detailAdr" placeholder="상세주소 입력"
                 class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
        </div>

        <div class="mb-4">
          <label class="block font-medium mb-1">환자 진단명</label>
          <input type="text" name="diagnosis" required 
                 class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
        </div>

        <div class="flex gap-4 mb-4">
          <div class="flex-1">
            <label class="block font-medium mb-1">성별</label>
            <select name="patient_gender" required
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
              <option value="남">남</option>
              <option value="여">여</option>
            </select>
          </div>
          <div class="flex-1">
            <label class="block font-medium mb-1">출생년도</label>
            <input type="number" name="age" placeholder="예: 1955"
                   class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
          </div>
        </div>

        <div class="flex gap-4 mb-4">
          <div class="flex-1">
            <label class="block font-medium mb-1">키 (cm)</label>
            <input type="number" name="height" required min="0"
                   class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
          </div>
          <div class="flex-1">
            <label class="block font-medium mb-1">몸무게 (kg)</label>
            <input type="number" name="weight" required min="0"
                   class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none" />
          </div>
        </div>

        <!-- 간병 서비스 요청 -->
        <h3 class="text-lg font-semibold text-gray-700 border-b pb-2 mt-8 mb-4">간병 서비스 요청 사항</h3>
        <div class="mb-4">
          <label class="block font-medium mb-1">필요한 간병 서비스 유형</label>
          <select name="care_type" required
                  class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
            <option value="기간제 간병">기간제 간병</option>
            <option value="시간제 간병">시간제 간병</option>
          </select>
        </div>

        <div class="mb-4">
          <label class="block font-medium mb-1">선호하는 요양사 성별</label>
          <select name="preferred_caregiver_gender" required
                  class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
            <option value="성별무관">성별 무관</option>
            <option value="남">남</option>
            <option value="여">여</option>
          </select>
        </div>

        <!-- 생활 환경 -->
        <h3 class="text-lg font-semibold text-gray-700 border-b pb-2 mt-8 mb-4">생활 환경 및 추가 요청</h3>
        <div class="mb-4">
          <label class="block font-medium mb-1">환자와 함께 사는 동거인 정보</label>
          <select name="living_arrangement" required
                  class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
            <option value="독거">독거</option>
            <option value="2~3인 (환자 포함)">2~3인 (환자 포함)</option>
            <option value="4인이상 (환자 포함)">4인 이상 (환자 포함)</option>
          </select>
        </div>

        <div class="flex gap-4 mb-4">
          <div class="flex-1">
            <label class="block font-medium mb-1">반려동물 여부</label>
            <select name="pet_presence" required
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
              <option value="O">O</option>
              <option value="X">X</option>
            </select>
          </div>
          <div class="flex-1">
            <label class="block font-medium mb-1">집 내부 홈캠/CCTV 유무</label>
            <select name="cctv_presence" required
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
              <option value="O">O</option>
              <option value="X">X</option>
            </select>
          </div>
        </div>

        <div class="flex gap-4 mb-4">
          <div class="flex-1">
            <label class="block font-medium mb-1">환자 식사 보조 여부</label>
            <select name="patient_meal_support" required
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
              <option value="O">O</option>
              <option value="X">X</option>
            </select>
          </div>
          <div class="flex-1">
            <label class="block font-medium mb-1">간병인 식사 제공 여부</label>
            <select name="caregiver_meal_provided" required
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none">
              <option value="O">O</option>
              <option value="X">X</option>
            </select>
          </div>
        </div>

        <div class="mb-6">
          <label class="block font-medium mb-1">환자의 정보/보호자 요청사항</label>
          <textarea name="request_details" rows="4"
                    placeholder="환자의 특이사항, 선호 간병 방식 등을 자유롭게 적어주세요."
                    class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-[rgb(16,78,86)] focus:outline-none"></textarea>
        </div>

        <!-- 개인정보 동의 -->
        <h3 class="text-lg font-semibold text-gray-700 border-b pb-2 mt-8 mb-4">개인정보 수집 및 이용 동의</h3>
        <div class="border border-gray-300 rounded-md bg-gray-50 p-4 text-sm text-gray-600 mb-4 max-h-48 overflow-y-auto leading-6">
          <p>본인은 아래의 내용에 따라 개인정보를 수집 및 이용하는 것에 동의합니다.</p>
          <ul class="list-disc ml-5 mt-2">
            <li>① 수집 항목: 이름, 연락처, 주소, 생년월일, 성별 등 신청서 기재 정보</li>
            <li>② 이용 목적: 요양보호사 서비스 신청 및 매칭, 본인 확인, 안내</li>
            <li>③ 보유 및 이용기간: 서비스 종료 후 1년 이내 또는 요청 시 즉시 파기</li>
            <li>④ 동의 거부권: 동의를 거부할 수 있으나, 신청이 제한될 수 있음</li>
          </ul>
          <p class="mt-2 text-gray-500">※ 개인정보는 「개인정보보호법」에 따라 안전하게 관리됩니다.</p>
        </div>

        <div class="text-center mb-6">
          <label class="inline-flex items-center">
            <input type="checkbox" id="agreePrivacy" name="agreePrivacy" required class="mr-2 accent-[rgb(16,78,86)]" />
            위의 개인정보 수집 및 이용에 동의합니다.
          </label>
        </div>

        <!-- 제출 버튼 -->
        <button type="submit"
                class="w-full py-3 rounded-md bg-[rgb(16,78,86)] text-white font-bold hover:bg-[rgb(10,50,55)] transition">
          예약 신청 및 전송
        </button>

      </form>
    </section>
  </main>

  <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
