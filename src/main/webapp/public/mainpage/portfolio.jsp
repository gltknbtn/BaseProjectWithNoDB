<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="row-fluid" ng-controller="portfolioController">

	<!-- Portfolio Grid Section -->
	<section id="portfolio">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>CARS PORTFOLIO</h2>
				<hr class="star-primary">
			</div>
		</div>
		<!-- Carousel başlangıç -->
		<div class="container">
			<div id="MySlide" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li class="" style="margin: 2px;" ng-class="{active:!$index}"
						data-target="#MySlide" data-slide-to="{{$index}}"
						ng-repeat="row in imageList"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="item" ng-class="{active:!$index}"
						ng-repeat="parentItem in imageList">
						<div class="container">
							<div class="row">
								<div class="portfolio-item">
									<a href="#portfolioModal1"
										ng-click="selectImage(parentItem);" class="portfolio-link"
										data-toggle="modal">
										<div class="caption">
											<div class="caption-content">
												<i class="fa fa-search-plus fa-3x"></i>
											</div>
										</div> <img
										src="data:image/png;base64,{{parentItem.imgBase64Str}}"
										class="img-responsive img-rounded img-centered" alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#MySlide" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#MySlide" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		<!-- Carousel bitiş -->
		<div class="container col-lg-12">
			<div ng-show="showProgress"
				class="progress-bar progress-bar-striped active" role="progressbar"
				aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
				style="width: 100%">
				<span class="sr-only">100% Complete</span>Processing
			</div>
		</div>
			
			<form method="post" id="fromFileUpload" enctype="multipart/form-data"
				ng-submit="detectTempFaces()">
				<div class="container form-group col-lg-12 col-md-12 col-sm-12">

					<input id="file" class="file img-responsive" type="file"
						name="file" ng-model="file" data-rule-required="true"
						accept=".jpg, .jpeg, ,.bmp, .png" ng-click="clearDetectedFace()">
						
						 <span id="vaildFile" class="text-success icon-ok hide">Valid File</span>
						 <span id="invaildFile" class="text-error icon-remove hide">Invalid File</span>

					<hr>
				</div>
			</form>
			
			<!-- Cropped TempFaces showed -->		
			<div ng-repeat="croppedTempFace in croppedTempFaceList">
				<div
					class="container col-lg-3 col-md-4">
					<div>
						<img
							src="data:image/png;base64, {{croppedTempFace.tempFaceBase64Str}}"
							class="img-responsive" alt="">
					</div>

					<div>
						<button type="button"
							title="<spring:message code="recognize"/>&nbsp;<spring:message code="recognize"/>"
							class="btn btn-default"
							ng-click="recognizeTempFace(croppedTempFace.tempFaceId)">
							<i class="glyphicon glyphicon-ok"></i>
						</button>
					</div>

				</div>
			</div>
  
		</div>

	</section>

	<!-- Portfolio Modals -->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 col-lg-offset-2">
						<div class="modal-body">
							<h2>Project Title</h2>
							<hr class="star-primary">
							<div
								class="col-lg-offset-2 col-lg-8 col-md-offset-3 col-md-6 col-sm-offset-3 col-sm-6 col-xs-offset-3 col-xs-6">
								<img
									src="data:image/png;base64,{{queryFaceBase64str}}"
									class="img-responsive img-centered " alt="">

							</div>

							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">

								<p>Candidates</p>
								<div class="col-lg-3 col-md-4 col-sm-4 col-xs-6" ng-repeat="mainFaceDTO in candidateFaceList">
									<img
										src="data:image/png;base64,{{mainFaceDTO.mainFaceBase64Str}}"
										class="img-responsive img-centered img-thumbnail" alt="">
										{{mainFaceDTO.score}}
								</div>

								<p>
									Use this area of the page to describe your project. The icon
									above is part of a free icon set by <a
										href="https://sellfy.com/p/8Q9P/jV3VZ/">Flat Icons</a>. On
									their website, you can download their free set with 16 icons,
									or you can purchase the entire set with 146 icons for only $12!
								</p>
								<ul class="list-inline item-details">
									<li>Client: <strong><a
											href="http://startbootstrap.com">Start Bootstrap</a> </strong>
									</li>
									<li>Date: <strong><a
											href="http://startbootstrap.com">April 2014</a> </strong>
									</li>
									<li>Service: <strong><a
											href="http://startbootstrap.com">Web Development</a> </strong>
									</li>
								</ul>
								<button type="button" class="btn btn-default" id="btnClose"
									data-dismiss="modal">
									<i class="fa fa-times"></i> Close
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Loading Modal -->
	<div class="portfolio-modal modal fade" id="loadingModal"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content" style="vertical-align: middle !important">
			<h2>PROCESSING</h2>
		</div>
	</div>

</div>
<script
	src="<c:url value="/resources/js_fadlarec/pages/portfolio.js" />"></script>

