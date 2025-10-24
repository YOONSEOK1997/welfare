package com.example.dopza.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    private static final String ADMIN_EMAIL = "wntmd122@naver.com";

    // --- 기존 수급자 예약 메일 전송 로직 ---
    public void sendRecepeientsEmail(
        String applicantName, String phoneNumber, String patientName, String address, String patientGender,
        String age, String height, String weight, String diagnosis, String careType, String preferredCaregiverGender,
        String livingArrangement, String petPresence, String cctvPresence, String patientMealSupport,
        String caregiverMealProvided, String requestDetails) throws MessagingException {

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(ADMIN_EMAIL);
            helper.setFrom("somang-f@naver.com", "소망재가복지센터 예약 시스템");
            helper.setSubject("재가복지센터 신규 수급자 접수 - 신청자 : " + applicantName);

            String htmlContent = generateHtmlContent(
                applicantName, phoneNumber, patientName, address, patientGender, age, height, weight,
                diagnosis, careType, preferredCaregiverGender, livingArrangement, petPresence,
                cctvPresence, patientMealSupport, caregiverMealProvided, requestDetails
            );

            helper.setText(htmlContent, true);
            mailSender.send(message);

        } catch (Exception e) {
            System.err.println("예약 메일 전송 실패: " + e.getMessage());
            throw new MessagingException("메일 전송 실패: " + e.getMessage());
        }
    }
    
    // 새로운 간병인 신청 
    public void sendCaregiverEmail(
        String name, String phone, String birthYear, String nationality, String gender, String address,
        String desiredWorkLocation, String workType, String preferredPatientGender,
        String availableSchedule, String experienceYears, String otherLicenses, String strengths) throws MessagingException {

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

            helper.setTo(ADMIN_EMAIL);
            helper.setFrom("somang-f@naver.com", "재가복지센터");
            helper.setSubject("요양보호사 신규 채용 신청 - 성함: " + name + " / 연락처: " + phone);

            String htmlContent = generateCaregiverHtmlContent(
                name, phone, birthYear, nationality, gender, address,
                desiredWorkLocation, workType, preferredPatientGender,
                availableSchedule, experienceYears, otherLicenses, strengths
            );

            helper.setText(htmlContent, true);
            mailSender.send(message);

        } catch (Exception e) {
            System.err.println("간병인 신청 메일 전송 실패: " + e.getMessage());
            throw new MessagingException("메일 전송 실패: " + e.getMessage());
        }
    }

    // --- 기존 수급자 예약 HTML 내용 생성 ---
    private String generateHtmlContent(
        String applicantName, String phoneNumber, String patientName, String address, String patientGender,
        String age, String height, String weight, String diagnosis, String careType, String preferredCaregiverGender,
        String livingArrangement, String petPresence, String cctvPresence, String patientMealSupport,
        String caregiverMealProvided, String requestDetails) {

        return """
            <html>
            <head>
                <meta charset='UTF-8'>
                <style>
                    body {
                        font-family: '맑은 고딕', Arial, sans-serif;
                        font-size: 18px;
                        color: #2c3e50;
                        margin: 20px;
                        background-color: #ffffff;
                    }
                    h2 {
                        color: #34495e;
                        text-align: center;
                        font-size: 26px;
                        margin-bottom: 15px;
                    }
                    table {
                        width: 90%%;
                        max-width: 800px;
                        border-collapse: collapse;
                        margin: 0 auto 20px auto;
                        font-size: 18px;
                    }
                    th, td {
                        border: 1px solid #bdc3c7;
                        padding: 12px 16px;
                        line-height: 1.6;
                    }
                    tr:nth-child(even) {
                        background-color: #f8f9fa;
                    }
                    tr.section-header td {
                        background-color: #ecf0f1;
                        font-weight: bold;
                        text-align: left;
                        color: #2c3e50;
                    }
                    .footer {
                        text-align: center;
                        color: #c0392b;
                        font-weight: bold;
                        margin-top: 20px;
                        font-size: 17px;
                    }
                </style>
            </head>
            <body>
                <h2>소망재가복지센터 신규 예약 접수 상세 정보</h2>
                <hr style='border: 1px solid #34495e; width: 90%%;'>
                <table>
                    <tr class='section-header'><td colspan='2'>[1] 신청인 정보</td></tr>
                    <tr><td style='width:30%%; font-weight:bold;'>신청자 이름</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>연락처</td><td>%s</td></tr>

                    <tr class='section-header'><td colspan='2'>[2] 수급자(환자) 기본 정보</td></tr>
                    <tr><td style='font-weight:bold;'>수급자 이름</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>주소</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>진단명 (필수)</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>성별 / 나이</td><td>%s / %s세</td></tr>
                    <tr><td style='font-weight:bold;'>키 / 몸무게</td><td>%scm / %skg</td></tr>

                    <tr class='section-header'><td colspan='2'>[3] 간병 및 환경 요청 사항</td></tr>
                    <tr><td style='font-weight:bold;'>필요 간병 서비스</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>선호 요양보호사 성별</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>동거인 정보</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>반려동물 여부</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>홈캠/CCTV 유무</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>환자 식사 보조 여부</td><td>%s</td></tr>
                    <tr><td style='font-weight:bold;'>간병인 식사 제공 여부</td><td>%s</td></tr>

                    <tr class='section-header'><td colspan='2'>[4] 요청 및 특이사항</td></tr>
                    <tr><td colspan='2' style='line-height:1.8;'>%s</td></tr>
                </table>
                <hr style='border: 1px solid #34495e; width: 90%%;'>
                <p class='footer'>센터 관리자께서는 즉시 확인 후 연락 바랍니다.</p>
            </body>
            </html>
            """.formatted(
                applicantName, phoneNumber,
                patientName, address, diagnosis,
                patientGender, age, height, weight,
                careType, preferredCaregiverGender,
                livingArrangement, petPresence, cctvPresence,
                patientMealSupport, caregiverMealProvided,
                requestDetails.replace("\n", "<br>")
            );
    }
    
    // --- 새로운 간병인 신청 HTML 내용 생성 ---
    private String generateCaregiverHtmlContent(
        String name, String phone, String birthYear, String nationality, String gender, String address,
        String desiredWorkLocation, String workType, String preferredPatientGender,
        String availableSchedule, String experienceYears, String otherLicenses, String strengths) {

        return """
            <html>
            <head>
                <meta charset='UTF-8'>
                <style>
                    body { font-family: '맑은 고딕', Arial, sans-serif; font-size: 18px; color: #1e3a47; margin: 20px; background-color: #f7f7f7; }
                    h2 { color: #164e63; text-align: center; font-size: 26px; margin-bottom: 20px; border-bottom: 3px solid #67a9a7; padding-bottom: 10px; }
                    table { width: 95%%; max-width: 800px; border-collapse: collapse; margin: 0 auto 20px auto; font-size: 17px; background-color: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
                    th, td { border: 1px solid #e0e7e9; padding: 14px 18px; line-height: 1.5; text-align: left; }
                    th { background-color: #f0f4f5; width: 30%%; font-weight: bold; color: #164e63; }
                    td { background-color: #ffffff; }
                    tr.section-header th, tr.section-header td { background-color: #164e63; color: white; font-size: 20px; text-align: center; }
                    .footer { text-align: center; color: #164e63; font-weight: bold; margin-top: 30px; font-size: 17px; }
                </style>
            </head>
            <body>
                <h2>요양보호사 신규 채용 신청서 접수</h2>
                <table>
                    <tr class='section-header'><td colspan='2'>[1] 기본 인적 사항</td></tr>
                    <tr><th>성함</th><td>%s</td></tr>
                    <tr><th>연락처</th><td>%s</td></tr>
                    <tr><th>출생연도/나이</th><td>%s년 (%s세)</td></tr>
                    <tr><th>성별 / 국적</th><td>%s / %s</td></tr>
                    <tr><th>거주지 주소</th><td>%s</td></tr>

                    <tr class='section-header'><td colspan='2'>[2] 희망 근무 조건</td></tr>
                    <tr><th>희망 근무 지역</th><td>%s</td></tr>
                    <tr><th>선호 근무 형태</th><td>%s</td></tr>
                    <tr><th>선호 환자 성별</th><td>%s</td></tr>
                    <tr><th>근무 가능 요일/시간</th><td>%s</td></tr>
                    
                    <tr class='section-header'><td colspan='2'>[3] 경력 및 강점</td></tr>
                    <tr><th>총 간병 경력</th><td>%s년</td></tr>
                    <tr><th>기타 소유 자격증</th><td>%s</td></tr>
                    <tr><th>본인 강점 및 장점</th><td style='white-space: pre-wrap;'>%s</td></tr>
                </table>
                <p class='footer'>인사 담당자는 신청서를 즉시 검토 후, 전화 연락을 진행해 주시기 바랍니다.</p>
            </body>
            </html>
            """.formatted(
                name, phone,
                birthYear, (2025 - Integer.parseInt(birthYear)), gender, nationality, address,
                desiredWorkLocation, workType, preferredPatientGender,
                availableSchedule.replace("\n", "<br>"), experienceYears, otherLicenses,
                strengths.replace("\n", "<br>")
            );
    }
}
