<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<!-- default header name is X-CSRF-TOKEN -->
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>PDF</title>
    <style>
        body{
            font-family: "NanumGothicCoding";
            font-size: 10px;
        }

        table{
            wid 100%;
            border-collapse: collapse;
        }

        tr{
            page-break-inside: avoid; 
        }

        th, td {
            height: 40px;
            text-align: center;
            
        }

        td img{
            wid 132.2px;
            height: 170px;
        }

        @page {

            size: A4;
            
            @bottom-center{
                content: "Page " counter(page) " of " counter(pages);
            }

            @bottom-right {
                wid 100px;
                height: 100px;
                background-image: url("file:///home/init/gitrepo/resume/init/src/main/resources/static/img/logo.png");
                background-size: 100px 20px;
                background-repeat: no-repeat;
                background-position:  right;
            }
        }
    </style>
</head>
<body>
    <div id="table">
        <!-- 개인정보 -->
        <table border="1" >
            <colgroup>
                <col width="10%"/>
                <col width="10%"/>
                <col width="15%"/>
                <col width="25%"/>
                <col width="15%"/>
                <col width="25%"/>  
            </colgroup>
            <thead>
                <tr>
                    <td colspan="6" bgcolor="#D8D8D8" style="height: 80px; font-size: 30px;">
                        PROFILE
                    </td>
                </tr>
            </thead>
            <tbody each="detail : ${detail}">
                <tr>
                    <td colspan="2" rowspan="4">
                        <img if="${img} != null" src="@{|file:///home/init/gitrepo/resume/init/src/main/resources/static/img/${img.imgname}|}"/>
                    </td>   
                    <td>성&nbsp;&nbsp;명</td>
                    <td text="${detail?.name}"></td>
                    <td>생년월일</td>
                    <td text="${detail?.birth}"></td>
                </tr>
                <tr>
                    <td>휴대폰</td> 
                    <td text="${detail?.phone}"></td>
                    <td>이메일</td>
                    <td text="${detail?.email}"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td colspan="3" text="|${detail?.address} ${detail?.detailaddress}|"></td>

                </tr>
                <tr>
                    <td>경력</td>
                    <td text="${detail?.career_age}"></td>
                    <td>주요직무</td>
                    <td text="|${detail?.occupation}/${detail?.task}|"></td>
                </tr>
            </tbody>
        </table>
        <!-- 근무경력 -->
        <table border="1" cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td colspan="4" bgcolor="#D8D8D8">근무경력</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>회사명</td>
                    <td>근무기간</td>
                    <td>담당업무</td>
                    <td>부서/직위</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(work)}" each="work : ${work}">
                    <td text="${work?.company_name}"></td>
                    <td text="|${work?.start_date} ~ ${work?.end_date}|"></td>
                    <td text="${work?.task}"></td>
                    <td text="|${work?.department}/${work?.spot}|"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(work)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <!-- 자격증 -->
        <table border="1" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
            </colgroup>
            <thead>
                <tr>
                    <td colspan="4" bgcolor="#D8D8D8">기술자격</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>자격증명</td>
                    <td>등록번호</td>
                    <td>취득일</td>
                    <td>발급기관</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(qualfi)}" each="qualfi : ${qualfi}">
                    <td text="${qualfi?.name}"></td>
                    <td text="${qualfi?.reg_num}"></td>
                    <td text="${qualfi?.reg_date}"></td>
                    <td text="${qualfi?.issuer}"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(qualfi)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <!-- 학력 -->
        <table border="1" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="23%"/>
                <col width="23%"/>
                <col width="21%"/>
                <col width="33%"/>
            </colgroup>
            <thead>
                <tr>
                    <td colspan="4" bgcolor="#D8D8D8">학력</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>학교명</td>
                    <td>학과(전공)</td>
                    <td>학위</td>
                    <td>수학기간</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(education)}" each="education : ${education}">
                    <td text="${education?.name}"></td>
                    <td text="${education?.department}"></td>
                    <td text="${education?.degree}"></td>
                    <td text="|${education?.start_date} ~ ${education?.end_date}|"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(education)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <!-- 교육 -->
        <table border="1"  cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
            </colgroup>
            <thead>
                <tr>
                    <td colspan="4" bgcolor="#D8D8D8">교육</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>과정명</td>
                    <td>교육기관명</td>
                    <td>수료번호</td>
                    <td>기간</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(edumatter)}" each="edumatter : ${edumatter}">
                    <td text="${edumatter?.course_name}"></td>
                    <td text="${edumatter?.institation}"></td>
                    <td text="${edumatter?.completion_number}"></td>
                    <td text="|${edumatter?.start_date} ~ ${edumatter?.end_date}|"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(edumatter)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <!-- 상훈 -->
        <table border="1" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
                <col width="25%"/>
            </colgroup>
            <thead>
                <tr>
                    <td colspan="4" bgcolor="#D8D8D8">상훈</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>상훈명</td>
                    <td>상훈기관</td>
                    <td>연월일</td>
                    <td>근거</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(prize)}" each="prize : ${prize}">
                    <td text="${prize?.name}"></td>
                    <td text="${prize?.agency}"></td>
                    <td text="${prize?.reg_date}"></td>
                    <td text="${prize?.evidence}"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(prize)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <!-- 기술경력 -->
        <table border="1" cellspacing="0" cellpadding="0">
            <colgroup>
                <col width="28%"/>
                <col width="15%"/>
                <col width="15%"/>
                <col width="15%"/>
                <col width="27%"/>
            </colgroup>
            <thead>
                <tr>
                    <td colspan="6" bgcolor="#D8D8D8">기술경력</td>
                </tr>
            </thead>    
            <tbody>
                <tr>
                    <td>사업명</td>
                    <td>사 업 기 간</td>
                    <td>발주자</td>
                    <td>업무</td>
                    <td>상세업무</td>
                </tr>
                <!-- 반복 -->
                <tr if="${not #lists.isEmpty(career)}" each="career : ${career}">
                    <td text="${career?.project_name}"></td>
                    <td text="|${career?.start_date} ~ ${career?.end_date}|"></td>
                    <td text="${career?.client_name}"></td>
                    <td text="${career?.task}"></td>
                    <td text="${career?.occupation}"></td>
                </tr>
                <tr unless="${not #lists.isEmpty(career)}">
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>   
                </tr>
            </tbody>
        </table>
    </div>
    <div id="div-bottom-right"></div>
</body>
</html>