<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common.jsp" %>   
<!DOCTYPE html>
<html lang="en">
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>Bootstrap Sign up Form Horizontal</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#mpw").val();
            var pwd2=$("#mpw2").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });	
</script>​
<style>
body {
	color: #999;
	background: #f3f3f3;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}
.form-control:focus {
	border-color: #BDBDBD;
}
.form-control, .btn {        
	border-radius: 3px;
}
.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #BDBDBD;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn1 {        
	font-size: 16px;
	font-weight: bold;
	background: black;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: black;
	outline: none !important;
}
.signup-form a {
	color: #828282;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #828282;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}

	.err{
	font-size: 9pt;
	color: red;
	font-weight: bold;
	}
</style>
</head>
<body>
<div class="signup-form">
	<form:form commandName="member" id="rgForm" method="post" class="form-horizontal" action="register.me">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2>Sign Up</h2>
			</div>	
      	</div>		
      	<div class="form-group row">
			<label class="col-form-label col-4">Username</label>
			<div class="col-8">
                <input type="hidden" class="form-control" name="mnum" value="${member.mnum }">
                <input type="text" class="form-control" name="mname" value="${member.mname }">
            	<form:errors cssClass="err" path="mname" />
            </div>        	
        </div>	
        <div class="form-group row">
			<label class="col-form-label col-4">ID</label>
			<div class="col-8">
                <input type="text" class="form-control" id="mid" name="mid" value="${member.mid }">
                <form:errors cssClass="err" path="mid" />
            </div>	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Password</label>
			<div class="col-8">
                <input type="password" class="form-control" name="mpw" id="mpw" value="${member.mpw }">
                <form:errors cssClass="err" path="mpw" />
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Confirm Password</label>
			<div class="col-8">
                <input type="password" class="form-control" name="mpw2" id="mpw2">
            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
            </div>        	

        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">Email Address</label>
			<div class="col-8">
                <input type="email" class="form-control" name="memail" value="${member.memail }">
                <form:errors cssClass="err" path="memail" />
                
            </div>        	
        </div>
		<div class="form-group row">
			<div class="col-8 offset-4">
				<p><label class="form-check-label"><input type="checkbox"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
				<input type="submit" class="btn1 btn-dark btn-lg" value="Sign Up">
			</div>  
		</div>		      
    </form:form>
	<div class="text-center">Already have an account? <a href="login.me">Login here</a></div>
</div>
</body>
</html>