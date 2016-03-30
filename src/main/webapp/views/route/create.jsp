<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

       <script type="text/javascript">
            $(function () {
                $('#datetimepicker1').datepicker({
           	     format: "dd/mm/yyyy",
           	     clearBtn: true,
           	     todayHighlight: true,
           	     daysOfWeekHighlighted: "0",
                })});
       </script>
       
       <script type="text/javascript">
            $(function () {
                $('#datetimepicker2').datepicker({
           	     format: "dd/mm/yyyy",
           	     clearBtn: true,
           	     todayHighlight: true,
           	     daysOfWeekHighlighted: "0",
                })});
       </script>

   <div class="container">

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
       <form:form class="contact_form" action="route/create.do" modelAttribute="tripForm">
        <h2 align="center">Please complete this form with your preferences to calculate a route:</h2>
          <br><br>
          <div class="container">
            <div class='col-md-5'>
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker1'>
                        <form:input path="startingDate" class="form-control" placeholder="Enter date..." />
					    <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <form:errors cssClass="error" path="startingDate" />
                </div>
            </div>
            <div class='col-md-5'>
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker2'>
                        <form:input path="endDate" class="form-control" placeholder="Enter date..." />
						<span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <form:errors cssClass="error" path="endDate" />
                </div>
            </div>
            <div class='col-md-2'>
              <div class="input-group">
                <form:input path="cost" class="form-control" placeholder="Budget..." />
				<form:errors cssClass="error" path="cost" />
                 <span class="input-group-addon">
                    <span class="glyphicon glyphicon-euro"></span>
                 </span>
              </div>
            </div>
          </div>
          <div class="container">
            <div class="row" >
            <div class="col-md-2"> 
            </div> 
              <div class="col-md-5">        
                 <div class="checkbox">
                    <label>
                      <form:checkbox path="checkCulturalCategory"/>
                      <spring:message code="route.checkCultural" />
                    </label>
                  </div>
                  <div class="checkbox">
                    <label>
                      <form:checkbox path="checkMuseumsCategory"/>
                      <spring:message code="route.checkMuseums" />
                   </label>
                  </div>
                  <div class="checkbox">
                   <label>
                      <form:checkbox path="checkChurchesCategory"/>
                      <spring:message code="route.checkChurches" />
                   </label>
                  </div>
                  <div class="checkbox">
                   <label>
                      <form:checkbox path="checkRestaurantsCategory"/>
                      <spring:message code="route.checkRestaurants" />
                   </label>
                  </div>
              </div>
              <div class="col-md-5">
                  <div class="checkbox">
                   <label>
 					  <form:checkbox path="checkDrinksCategory"/>
                      <spring:message code="route.checkDrinks" />
                   </label>
                  </div>
                  <div class="checkbox">
                   <label>
  					  <form:checkbox path="checkPaintingsCategory"/>
                      <spring:message code="route.checkPaintings" />
                   </label>
                  </div>
                  <div class="checkbox">
                   <label>
  					  <form:checkbox path="checkMusicCategory"/>
                      <spring:message code="route.checkMusic" />
                   </label>
                  </div>
                  <div class="checkbox">
                   <label>
					  <form:checkbox path="checkMonumentsCategory"/>
                      <spring:message code="route.checkMonuments" />
                   </label>
                  </div>
              </div>
            </div>
          </div>
        <p align="right">
          	<input class="btn btn-lg btn-primary" type="submit" name="create"
					value="<spring:message code="route.createTrip" />" />&nbsp; 
            </p>
       </form:form>
      </div>
      </div> 