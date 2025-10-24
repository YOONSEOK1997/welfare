package com.example.dopza.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dopza.service.EmailService;

@Controller
public class CaregiverController {
    
    @Autowired
    private EmailService emailService;
    
    /**
     * 요양보호사 신청 폼 데이터를 처리하고, 관리자에게 이메일을 전송합니다.
     * JSP 폼의 필드 이름(zipCode, streetAdr, detailAdr 등)에 맞춰 파라미터를 수정했습니다.
     * * @param redirectAttributes 리다이렉트 시 메시지 전달을 위함
     * @return 성공 페이지로 리다이렉트
     */
    @PostMapping("/caregiver.do")
    public String handleCaregiverApplication(
        @RequestParam("name") String name,
        @RequestParam("phone") String phone,
        @RequestParam("birth_year") String birthYear,
        @RequestParam("nationality") String nationality,
        @RequestParam("gender") String gender,
        
        // 주소 관련 파라미터 수정 (JSP 폼의 name 속성과 일치)
        @RequestParam("zipCode") String zipCode,
        @RequestParam("streetAdr") String streetAdr,
        @RequestParam("detailAdr") String detailAdr,
        
        @RequestParam("desired_work_location") String desiredWorkLocation,
        @RequestParam("work_type") String workType,
        @RequestParam("preferred_patient_gender") String preferredPatientGender,
        @RequestParam("available_schedule") String availableSchedule,
        @RequestParam("experience_years") String experienceYears,
        @RequestParam("other_licenses") String otherLicenses,
        @RequestParam("strengths") String strengths,
        RedirectAttributes redirectAttributes) {
        
        // 분리된 주소 정보를 하나의 문자열로 통합 (예: (06123) 서울특별시 강남구 역삼동 123-45)
        String address = "(" + zipCode + ") " + streetAdr + " " + detailAdr;
        
        // 간병인 신청 이메일 전송
        try {
            emailService.sendCaregiverEmail(
                name, phone, birthYear, nationality, gender, address, // 통합된 주소(fullAddress) 사용
                desiredWorkLocation, workType, preferredPatientGender,
                availableSchedule, experienceYears, otherLicenses, strengths
            );
        } catch (jakarta.mail.MessagingException e) {
            System.err.println("요양보호사 신청 이메일 전송 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
            
            // 이메일 전송 실패 시 처리
            redirectAttributes.addFlashAttribute("reservationResult", "failure");
            redirectAttributes.addFlashAttribute("message", "신청 중 오류가 발생했습니다. 다시 시도해 주세요.");
            return "redirect:/reservationFailure";
        }
        
        // 성공 시 메시지를 세션에 담아 성공 페이지로 리다이렉트합니다.
        redirectAttributes.addFlashAttribute("reservationResult", "success");
        redirectAttributes.addFlashAttribute("message", "요양보호사 지원 신청이 완료되었습니다. 곧 연락드리겠습니다.");
        
        return "redirect:/reservationSuccess"; 
    }
}
