package com.example.dopza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dopza.service.EmailService;
import jakarta.mail.MessagingException; // jakarta.mail 패키지를 사용합니다.

@Controller
public class RecepientsController {

	@GetMapping("/reservationSuccess")
	public String reservationSuccess() {
		// 예약 성공 시 보여줄 JSP 페이지 이름 (예: success.jsp)
		return "success"; 
	}
	
	@Autowired
	private EmailService emailService;
	
	@PostMapping("/reservation.do")
	public String handleReservation(
		// 폼 데이터 바인딩
		@RequestParam("applicant_name") String applicantName,
		@RequestParam("phone_number") String phoneNumber,
		@RequestParam("patient_name") String patientName,
		
		// ⭐️ 주소 필드를 세분화된 값으로 받도록 수정
		@RequestParam("zipCode") String zipCode,
		@RequestParam("streetAdr") String streetAdr,
		@RequestParam("detailAdr") String detailAdr,
		
		@RequestParam("patient_gender") String patientGender,
		@RequestParam("age") String age,
		@RequestParam("height") String height,
		@RequestParam("weight") String weight,
		@RequestParam("diagnosis") String diagnosis,
		@RequestParam("care_type") String careType,
		@RequestParam("preferred_caregiver_gender") String preferredCaregiverGender,
		@RequestParam("living_arrangement") String livingArrangement,
		@RequestParam("pet_presence") String petPresence,
		@RequestParam("cctv_presence") String cctvPresence,
		@RequestParam("patient_meal_support") String patientMealSupport,
		@RequestParam("caregiver_meal_provided") String caregiverMealProvided,
		@RequestParam("request_details") String requestDetails,
		
		// 리다이렉트 시 메시지 전달용
		RedirectAttributes redirectAttributes) 
	{
		// ⭐️ 주소 정보를 하나의 문자열로 합칩니다: [우편번호] 도로명 주소 (상세 주소)
		String address = String.format("[%s] %s (%s)", zipCode, streetAdr, detailAdr);
		
		try {
			// emailService 호출 시 합쳐진 주소 (fullAddress)를 전달
			emailService.sendRecepeientsEmail(
				applicantName, 
				phoneNumber, 
				patientName, 
				address, // 합쳐진 주소 전달
				patientGender, 
				age, 
				height, 
				weight, 
				diagnosis,
				careType, 
				preferredCaregiverGender, 
				livingArrangement, 
				petPresence, 
				cctvPresence, 
				patientMealSupport, 
				caregiverMealProvided, 
				requestDetails
			);
			
			// 성공 처리
			redirectAttributes.addFlashAttribute("reservationResult", "success");
			redirectAttributes.addFlashAttribute("message", "예약 신청이 완료되었습니다. 곧 연락드리겠습니다.");
			
		} catch (MessagingException e) {
			// 메일 전송 실패 처리 및 로깅
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("reservationResult", "fail");
			redirectAttributes.addFlashAttribute("message", "예약 신청 중 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
		}
		
		return "redirect:/reservationSuccess"; 
	}
}
