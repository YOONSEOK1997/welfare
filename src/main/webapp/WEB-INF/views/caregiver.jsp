<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요양보호사 신청서</title>

    <!-- TailwindCSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Bootstrap Icons (for calendar/check icons) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Daum 주소 API / jQuery -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <script>
        // 카카오 주소 검색
        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    let roadAddr = data.roadAddress; 
                    let jibunAddr = data.jibunAddress;
                    $("#zipCode").val(data.zonecode);
                    $("#streetAdr").val(roadAddr !== '' ? roadAddr : jibunAddr);
                    $("#detailAdr").focus();
                }
            }).open();
        }

        // 주소 유효성 검사
        function addrCheck() {
            if ($("#zipCode").val() === '' || $("#streetAdr").val() === '') {
                alert("우편번호 찾기를 클릭해 주소를 입력해주세요.");
                $("#zipCode").focus();
                return false;
            }
            return true;
        }

        // 개인정보 동의 확인
        function validateForm() {
            if (!$("#agreePrivacy").is(":checked")) {
                alert("개인정보 수집 및 이용에 동의해주셔야 신청이 가능합니다.");
                return false;
            }
            return addrCheck();
        }
    </script>
</head>

<body class="bg-gray-100 font-sans text-gray-800">
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<main>
    <section class="max-w-2xl mx-auto my-28 bg-white rounded-xl shadow-lg p-8">
        <h2 class="text-2xl font-bold text-teal-800 text-center mb-8 flex items-center justify-center">
            <i class="bi bi-calendar-check mr-2"></i> 요양보호사 지원
        </h2>

        <form id="caregiverForm" 
              action="<%= request.getContextPath() %>/caregiver.do" 
              method="post" 
              onsubmit="return validateForm();" 
              class="space-y-8">

            <!-- 1. 기본 인적 사항 -->
            <div>
                <h3 class="text-lg font-semibold border-b pb-2 mb-4 border-gray-200 text-gray-700">기본 인적 사항</h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label for="name" class="block font-medium mb-1">성함</label>
                        <input type="text" id="name" name="name" placeholder="실명" required
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                    <div>
                        <label for="phone" class="block font-medium mb-1">연락처</label>
                        <input type="text" id="phone" name="phone" placeholder="010-XXXX-XXXX" required
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-4">
                    <div>
                        <label for="birth_year" class="block font-medium mb-1">출생연도</label>
                        <input type="number" id="birth_year" name="birth_year" placeholder="예: 1955" required
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                    <div>
                        <label for="nationality" class="block font-medium mb-1">국적</label>
                        <input type="text" id="nationality" name="nationality" placeholder="대한민국" required
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                </div>

                <div class="mt-4">
                    <label class="block font-medium mb-1">성별</label>
                    <div class="flex flex-wrap gap-4">
                        <label><input type="radio" name="gender" value="남성" required class="mr-1"> 남성</label>
                        <label><input type="radio" name="gender" value="여성" class="mr-1"> 여성</label>
                    </div>
                </div>

                <div class="mt-4">
                    <label class="block font-medium mb-1">주소</label>
                    <div class="flex gap-2 mb-2">
                        <input type="text" id="zipCode" name="zipCode" placeholder="우편번호" readonly
                            class="w-1/2 border border-gray-300 rounded-md p-2 bg-gray-100">
                        <button type="button" onclick="sample4_execDaumPostcode()"
                            class="px-3 py-2 bg-gray-300 hover:bg-gray-400 text-gray-700 rounded-md">우편번호 찾기</button>
                    </div>
                    <input type="text" id="streetAdr" name="streetAdr" placeholder="도로명 주소" readonly
                        class="w-full border border-gray-300 rounded-md p-2 bg-gray-100 mb-2">
                    <input type="text" id="detailAdr" name="detailAdr" placeholder="상세주소 입력"
                        class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                </div>
            </div>

            <!-- 2. 희망 근무 조건 -->
            <div>
                <h3 class="text-lg font-semibold border-b pb-2 mb-4 border-gray-200 text-gray-700">희망 근무 조건</h3>

                <div class="mb-4">
                    <label for="desired_work_location" class="block font-medium mb-1">희망 근무 지역</label>
                    <input type="text" id="desired_work_location" name="desired_work_location" placeholder="예: 서울 강남구, 경기 수원시" required
                        class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                </div>

                <div class="mb-4">
                    <label class="block font-medium mb-1">선호 근무 형태</label>
                    <div class="flex flex-wrap gap-4">
                        <label><input type="radio" name="work_type" value="기간제 간병 (24시간 이상)" required class="mr-1"> 기간제 (입주)</label>
                        <label><input type="radio" name="work_type" value="시간제 간병 (24시간 미만)" class="mr-1"> 시간제 (출퇴근)</label>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="block font-medium mb-1">선호 환자 성별</label>
                    <div class="flex flex-wrap gap-4">
                        <label><input type="radio" name="preferred_patient_gender" value="남성" required class="mr-1"> 남성</label>
                        <label><input type="radio" name="preferred_patient_gender" value="여성" class="mr-1"> 여성</label>
                        <label><input type="radio" name="preferred_patient_gender" value="성별무관" class="mr-1"> 무관</label>
                    </div>
                </div>

                <div>
                    <label for="available_schedule" class="block font-medium mb-1">근무 가능 요일과 시간대</label>
                    <textarea id="available_schedule" name="available_schedule" rows="3" placeholder="예) 월, 수, 금 / 오후 1시 ~ 5시" required
                        class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none"></textarea>
                </div>
            </div>

            <!-- 3. 경력 및 강점 -->
            <div>
                <h3 class="text-lg font-semibold border-b pb-2 mb-4 border-gray-200 text-gray-700">경력 및 강점</h3>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label for="experience_years" class="block font-medium mb-1">간병 경력</label>
                        <input type="number" id="experience_years" name="experience_years" min="0" max="50" placeholder="총 경력 (년)" required
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                    <div>
                        <label for="other_licenses" class="block font-medium mb-1">요양보호사 외 자격증</label>
                        <input type="text" id="other_licenses" name="other_licenses" placeholder="간호조무사, 사회복지사 등"
                            class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none">
                    </div>
                </div>

                <div class="mt-4">
                    <label for="strengths" class="block font-medium mb-1">본인의 강점</label>
                    <textarea id="strengths" name="strengths" rows="4" maxlength="500" required
                        placeholder="성격, 환자 응대 능력, 전문 기술 등을 기술해 주세요."
                        class="w-full border border-gray-300 rounded-md p-2 focus:ring-2 focus:ring-teal-500 focus:outline-none"></textarea>
                </div>
            </div>

            <!-- 개인정보 동의 -->
            <div>
                <h3 class="text-lg font-semibold border-b pb-2 mb-4 border-gray-200 text-gray-700">개인정보 수집 및 이용 동의</h3>
                <div class="border border-gray-300 bg-gray-50 rounded-md p-4 text-sm text-gray-700 max-h-56 overflow-y-auto leading-relaxed">
                    <p class="mb-2">본인은 아래의 내용에 따라 개인정보를 수집 및 이용하는 것에 동의합니다.</p>
                    <ul class="list-disc list-inside space-y-1">
                        <li>① 수집 항목: 이름, 연락처, 주소, 생년월일, 성별, 경력사항 등 신청서 기재 정보</li>
                        <li>② 이용 목적: 요양보호사 서비스 신청 및 매칭, 본인 확인, 서비스 관련 안내</li>
                        <li>③ 보유 및 이용기간: 서비스 종료 후 1년 이내 또는 이용자의 요청 시 즉시 파기</li>
                        <li>④ 동의 거부권: 동의를 거부할 수 있으나, 이 경우 신청이 제한될 수 있습니다.</li>
                    </ul>
                    <p class="mt-2 text-gray-600">※ 개인정보는 「개인정보보호법」에 따라 안전하게 관리됩니다.</p>
                </div>
                <div class="text-center mt-3">
                    <label class="inline-flex items-center text-sm font-medium">
                        <input type="checkbox" id="agreePrivacy" name="agreePrivacy" required class="mr-2">
                        위의 개인정보 수집 및 이용에 동의합니다.
                    </label>
                </div>
            </div>

            <!-- 제출 버튼 -->
            <button type="submit"
                class="w-full bg-teal-700 hover:bg-teal-800 text-white font-bold py-3 rounded-md shadow-md transition-colors duration-200">
                신청서 제출
            </button>
        </form>
    </section>
</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
