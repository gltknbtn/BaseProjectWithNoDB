<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid" ng-controller="mainpageController">

	<!-- Portfolio Grid Section -->
	<jsp:include page="portfolio.jsp"/>
	
	<!-- About Section -->
	<jsp:include page="about.jsp"/>

    <!-- Contact Section -->
	<jsp:include page="contact.jsp"/>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

</div>

<script src="<c:url value="/resources/js_fadlarec/pages/mainpage_fadlarec.js" />"></script>
