<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!-- default header name is X-CSRF-TOKEN -->
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>μ½λ μΈν</title>
	<link rel="shortcut icon" href="/images/favicon.ico">
	<link rel="stylesheet" type="text/css" media="screen" href="jquery-ui-1.12.1.custom/jquery-ui.min.css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="jqGrid/css/ui.jqgrid.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
    <link type="text/css" rel="stylesheet" href="css/detailpage.css"/>
    
    
    <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <script src="js/setting.js" type="text/javascript"></script>
    <!-- <script src="/jquery-ui-1.12.1.custom/jquery-ui.min.js" type="text/javascript"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    <script src="jqGrid/js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="jqGrid/js/i18n/grid.locale-kr.js" type="text/javascript"></script>
    <script src="jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="../layout/navbar.jsp"></jsp:include>

<div>
<ul class="nav nav-tabs m-3" id="pills-tab" role="tablist">
    <!-- κ³ κ°μ¬ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link active" id="pills-client-tab" data-bs-toggle="pill" data-bs-target="#pills-client" type="button" role="tab" aria-controls="pills-client" aria-selected="true">κ³ κ°μ¬</button>
    </li>
    <!-- κ΅μ‘κΈ°κ΄ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-institute-tab" data-bs-toggle="pill" data-bs-target="#pills-institute" type="button" role="tab" aria-controls="pills-institute" aria-selected="false">κ΅μ‘κΈ°κ΄</button>
    </li>
    <!-- μ§μ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-spot-tab" data-bs-toggle="pill" data-bs-target="#pills-spot" type="button" role="tab" aria-controls="pills-spot" aria-selected="false">μ§μ</button>
    </li>
    <!-- μ§μ’ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-occupation-tab" data-bs-toggle="pill" data-bs-target="#pills-occupation" type="button" role="tab" aria-controls="pills-occupation" aria-selected="false">μ§μ’</button>
    </li> 
    <!-- μ§λ¬΄ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-task-tab" data-bs-toggle="pill" data-bs-target="#pills-task" type="button" role="tab" aria-controls="pills-task" aria-selected="false">μ§λ¬΄</button>
    </li>   
    <!-- μ§μ­ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-area-tab" data-bs-toggle="pill" data-bs-target="#pills-area" type="button" role="tab" aria-controls="pills-area" aria-selected="false">μ§μ­</button>
    </li>
    <!-- μκ²©μ¦ -->
    <li class="nav-item1" role="presentation">
        <button class="nav-link" id="pills-qualifi-tab" data-bs-toggle="pill" data-bs-target="#pills-qualifi" type="button" role="tab" aria-controls="pills-qualifi" aria-selected="false">μκ²©μ¦</button>
    </li>
</ul>
<div class="tab-content m-3" id="pills-tabContent">
    <!-- κ³ κ°μ¬ -->
    <div class="tab-pane fade show active" id="pills-client" role="tabpanel" aria-labelledby="pills-client-tab">
        <table id="clientList"></table>
        <div id="clientListPager"></div>
    </div>
    <!-- κ΅μ‘κΈ°κ΄ -->
    <div class="tab-pane fade" id="pills-institute" role="tabpanel" aria-labelledby="pills-institute-tab">
        <table id="instituteList"></table>
        <div id="instituteListPager"></div>
    </div>
    <!-- μ§μ -->
    <div class="tab-pane fade" id="pills-spot" role="tabpanel" aria-labelledby="pills-spot-tab">
        <table id="spotList"></table>
        <div id="spotListPager"></div>
    </div>
    <!-- μ§μ’ -->
    <div class="tab-pane fade" id="pills-occupation" role="tabpanel" aria-labelledby="pills-occupation-tab">
        <table id="occupationList"></table>
        <div id="occupationListPager"></div>
    </div>
    <!-- μ§λ¬΄ -->
    <div class="tab-pane fade" id="pills-task" role="tabpanel" aria-labelledby="pills-task-tab">
        <table id="taskList"></table>
        <div id="taskListPager"></div>
    </div>
    <!-- μ§μ­ -->
    <div class="tab-pane fade" id="pills-area" role="tabpanel" aria-labelledby="pills-qualifi-tab">
        <table id="areaList"></table>
        <div id="areaListPager"></div>
    </div>
    <!-- μκ²©μ¦ -->
    <div class="tab-pane fade" id="pills-qualifi" role="tabpanel" aria-labelledby="pills-qualifi-tab">
        <table id="qualifiList"></table>
        <div id="qualifiListPager"></div>
    </div>
    <div class="d-flex justify-content-end" style = "margin-top : 30px; margin-left : 15px; font-size : 12px;">
    <button type="button" class="btn btn-primary" id="option-add-btn">μΆκ°</button>
    </div>
</div>  


<!-- μΆκ° λͺ¨λ¬ -->
<div class="modal fade" id="addSetting" tabindex="-1" aria-labelledby="addSettingLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addModalLabel">μΆκ°</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <!-- κ³ κ°μ¬ -->
                    <form name="clientForm" method="post">
                    <table border="0" class="addTable client">
                        <colgroup>
                            <col width="20%"/>
                            <col width="80%"/>
                        </colgroup>
                        <tbody>
                            <tr>
                                <td>κ³ κ°μ¬</td>
                                <td>
                                    <input type="text" id="client_name" name="name" class="form-control client" placeholder="κ³ κ°μ¬">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                    <!-- κ΅μ‘κΈ°κ΄ -->
                    <form name="instituteForm" method="post">
                        <table border="0" class="addTable institute">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>κ΅μ‘κΈ°κ΄λͺ</td>
                                    <td>
                                        <input type="text" id="institute_name" name="name" class="form-control institute" placeholder="κ΅μ‘κΈ°κ΄λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§μ -->
                    <form name="spotForm" method="post">
                        <table border="0" class="addTable spot">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μλͺ</td>
                                    <td>
                                        <input type="text" id="spot_name" name="name" class="form-control spot" placeholder="μ§μλͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§μ’ -->
                    <form name="occupationForm" method="post">
                        <table border="0" class="addTable occupation">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μ’λͺ</td>
                                    <td>
                                        <input type="text" id="occupation_name" name="name" class="form-control occupation" placeholder="μ§μ’λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§λ¬΄ -->
                    <form name="taskForm" method="post">
                        <table border="0" class="addTable task">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§λ¬΄λͺ</td>
                                    <td>
                                    	<select name="occupation" id="upper_task_nm" class ="form-select task" >
					                        <option value="">μ§μ’ μ ν</option>
					                        <c:forEach var="occupation" items="${occupation}">
					                        <option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
					                        </c:forEach>
					                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>μ§λ¬΄λͺ</td>
                                    <td>
                                        <input type="text" id="task_name" name="name" class="form-control task" placeholder="μ§λ¬΄λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§μ­ -->
                    <form name="areaForm" method="post">
                        <table border="0" class="addTable area">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μ­λͺ</td>
                                    <td>
                                        <input type="text" id="arae_name" name="name" class="form-control area" placeholder="μ§μ­λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μκ²©μ¦ -->
                    <form name="qualifiForm" method="post">
                        <table border="0" class="addTable qualifi">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μκ²©μ¦λͺ</td>
                                    <td>
                                        <input type="text" id="qualifi_name" name="qualifi_name" class="form-control qualifi" placeholder="μκ²©μ¦λͺ">
                                    </td>
                                </tr>
                                <tr>
                                    <td>λ°νκΈ°κ΄</td>
                                    <td>
                                        <input type="text" id="qualifi_issuer" name="issuer" class="form-control qualifi" placeholder="λ°νκΈ°κ΄">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="option-save-btn">μ μ₯</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">λ«κΈ°</button>
            </div>
        </div>
    </div>
</div>


<!-- μμ  λͺ¨λ¬ -->
<div class="modal fade" id="updateSetting" tabindex="-1" aria-labelledby="updateSettingLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateModalLabel">μμ </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
                <div class="modal-body">
                    <!-- κ³ κ°μ¬ -->
                    <form name="clientUpdateForm" method="post">
                        <input type="hidden" id="update_client_nm" name="client_nm">
                        <table border="0" class="addTable client">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>κ³ κ°μ¬</td>
                                    <td>
                                        <input type="text" id="update_client_name" name="name" class="form-control client" placeholder="κ³ κ°μ¬">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- κ΅μ‘κΈ°κ΄ -->
                    <form name="instituteUpdateForm" method="post">
                        <input type="hidden" id="update_institute_nm" name="institute_nm">
                        <table border="0" class="addTable institute">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>κ΅μ‘κΈ°κ΄λͺ</td>
                                    <td>
                                        <input type="text" id="update_institute_name" name="name" class="form-control institute" placeholder="κ΅μ‘κΈ°κ΄λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§μ -->
                    <form name="spotUpdateForm" method="post">
                        <input type="hidden" id="update_spot_nm" name="spot_nm">
                        <table border="0" class="addTable spot">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μλͺ</td>
                                    <td>
                                        <input type="text" id="update_spot_name" name="name" class="form-control spot" placeholder="μ§μλͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§μ’ -->
                    <form name="occupationUpdateForm" method="post">
                        <input type="hidden" id="update_occupation_nm" name="occupation_nm">
                        <table border="0" class="addTable occupation">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μ’λͺ</td>
                                    <td>
                                        <input type="text" id="update_occupation_name" name="name" class="form-control occupation" placeholder="μ§μ’λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <!-- μ§λ¬΄ -->
                    <form name="taskUpdateForm" method="post">
                        <input type="hidden" id="update_task_nm" name="task_nm">
                        <table border="0" class="addTable task">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μ’λͺ</td>
                                    <td>
                                    	<select name="occupation" id="update_occupation" class ="form-select task" >
					                        <option value="">μ§μ’ μ ν</option>
					                        <c:forEach var="occupation" items="${occupation}">
					                        <option value="${occupation.occupation_nm}"><c:out value="${occupation.name}"/></option>
					                        </c:forEach>
					                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>μ§λ¬΄λͺ</td>
                                    <td>
                                        <input type="text" id="update_task_name" name="name" class="form-control task" placeholder="μ§λ¬΄λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>  
                    <!-- μ§μ­ -->
                    <form name="areaUpdateForm" method="post">
                    <input type="hidden" id="update_id" name="id">
                        <table border="0" class="addTable area">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μ§μ­λͺ</td>
                                    <td>
                                        <input type="text" id="update_area_name" name="name" class="form-control area" placeholder="μ§μ­λͺ">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>                  
                    <!-- μκ²©μ¦ -->
                    <form name="qualifiUpdateForm" method="post">
                        <input type="hidden" id="update_qualifi_nm" name="qualifi_nm">
                        <table border="0" class="addTable qualifi">
                            <colgroup>
                                <col width="20%"/>
                                <col width="80%"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>μκ²©μ¦λͺ</td>
                                    <td>
                                        <input type="text" id="update_qualifi_name" name="qualifi_name" class="form-control qualifi" placeholder="μκ²©μ¦λͺ">
                                    </td>
                                </tr>
                                <tr>
                                    <td>λ°κΈκΈ°κ΄</td>
                                    <td>
                                        <input type="text" id="update_qualifi_issuer" name="issuer" class="form-control qualifi" placeholder="λ°κΈκΈ°κ΄">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="option-update-btn">μμ </button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">λ«κΈ°</button>
            </div>
        </div>
    </div>
</div>
</div>

</body>
</html>