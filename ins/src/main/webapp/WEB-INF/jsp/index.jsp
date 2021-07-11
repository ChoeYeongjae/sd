<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <title>Let's find a coin - ���� ã��</title>
      <link rel="icon" type="image/x-icon" href="/assets/img/favicon.ico" />
      <!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/css/styles.css" rel="stylesheet" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<title>Insert title here</title>
</head>

<style type = "text/css"> <!-- �ε��ٽ�Ÿ�� -->
	body
	{
	 text-align: center;
	 margin: 0 auto;
	}
	#Progress_Loading
	{
	 position: absolute;
	 left: 50%;
	 background: #ffffff;
	}
		
	#input1 {
    	width: 300px;
        height: 50px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
    }
  	#input2 {
    	width: 100px;
        height: 48px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
        margin-bottom : 197px;
    }
		
	#input3 {
    	width: 300px;
        height: 50px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
    }
  	#input4 {
    	width: 100px;
        height: 48px;
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom : 3px solid black;
        margin-bottom : 197px;
    }	
		
		
	</style>
	
	<script>
    
    $(document).ready(function(){ $('#Progress_Loading').hide();
     })
   	.ajaxStart(function(){ $('#Progress_Loading').show(); })
   	.ajaxStop(function(){ $('#Progress_Loading').hide(); });
    
    $(document).ready(function() {

    	$('#Progress_Loading').hide();
		
    		$("#close_modal").click(function() {
            	$("#exampleModal").modal("hide");
        	});
    		
			$.ajax({
				url : "/launchingCrawling",
				type : "get",
				data : "json",
				success : function(data) {
					$.each(data, function(key, value) {
						$('.flex-grow-1').append("<h3 class='mb-0'>" + value.names + "</h3>");
						$('.flex-grow-1').append("<div class='subheading mb-3'>" + value.contract + "</div>");
						$('.flex-grow-1').append("<span class='text-primary'>" + value.data + "</span>");
						$('.flex-grow-1').append("<p>" + value.discpt + "</p>");
					});
				
				}
			});
			
		});
	
    	
    	// ������Ʈ ���� 
	    function websiteVerification() {
    		
    		if( $("#input1").val() == '' ) {
    			alert("������Ʈ�� �Է����ּ���.")
    			return false;
    		}
    		
			$.ajax({
				url : "/websiteVerification",
				type: 'POST',
                data: {"urls" : $("#input1").val()},
                dataType: 'text',
				success : function(data) {
					
					if(data == "") {
						alert("�׿� �Դϴ�.")
					} else {
						alert(data + "�Դϴ�.")		
					}
				
				}
			});
		};
		
		// BSC ���� 
	    function bscVerification() {
			
            if( $("#input3").val() == '' ) {
    			alert("��Ʈ��Ʈ �ּҸ� �Է����ּ���.")
    			return false;
    		}
            
			$.ajax({
				url : "/bscVerification",
				type: 'POST',
                data: {"contract" : $("#input3").val()},
                dataType: 'json',
				success : function(data) {
					$("#exampleModal").modal("show");
					
					if( data.mint != null ) {
						var m = "O";
						$('.modal-body').append("<p> MINT : " + m + "</p>");
					} 
					
					if ( data.delegatecall != null ) {
						var d = "O";
						$('.modal-body').append("<p> Delegatecall : " + d + "</p>");	
					} 
					
					if ( data.migrator != null ) {
						var mi = "O";
						$('.modal-body').append("<p> Migrator : " + mi + "</p>");
					}
					
					$('.modal-body').append("<p> Holders : " + data.holders + "</p>");
					
				}
			});
		};

	
    </script>

<body id="page-top">

<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark  fixed-top" id="sideNav" style="background-color: #4374D9 !important;">
            <a class="navbar-brand js-scroll-trigger" href="#page-top">
                <span class="d-block d-lg-none">Let's find a coin - ���� ã��</span>
                <span class="d-none d-lg-block"><img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="assets/img/logo.jpg" alt="..." /></span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">�Ұ�</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#experience">���� ��Ī</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#education">���� ����</a></li>
                    <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#skills">QNA</a></li> -->
                    <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#interests">Interests</a></li>
                    <li class="nav-item"><a class="nav-link js-scroll-trigger" href="#awards">Awards</a></li> -->
                </ul>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <h2 class="mb-0">
                        Let's find a coin -
                        <span class="text-primary" style="color: #6799FF !important">���� ã��</span>
                    </h2>
                    <p class="lead mb-5">�ȳ��ϼ���. ���� ��Ī ��¥ Ȯ�� �� ���� �����ϴ� LFAC�Դϴ�. ���� ��� ��Ź�帳�ϴ�.</p>
                    <div class="social-icons">
                        <a class="social-icon" href="https://open.kakao.com/o/gl2GUWdd"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- ���� ��Ī -->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">���� ��Ī</h2>
                    
                    <div id="Progress_Loading"><!-- �ε��� -->
						<img src="/assets/img/progress.gif"/>
					</div>
					
					<div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                       	<div class="flex-grow-1">
                       	</div>
                    </div>
                </div>
            </section>
            <hr class="m-0" />
            <!-- Education-->
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    <h2 class="mb-5">���� ���� - DApp����</h2>
                    <h3>������Ʈ ����</h3>
					<input type="text" id="input1"  placeholder="������Ʈ �ּҸ� �Է����ּ���."><button type="button" id="input2" onclick="websiteVerification()">����</button>
					<h3>BSC ����</h3>
					<input type="text" id="input3" placeholder="��Ʈ��Ʈ �ּҸ� �Է����ּ���."><button type="button" id="input4" onclick="bscVerification()" >����</button>
					<!-- <a id="send-to-btn" href="#" onclick="sendTo();">
		  				<img src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg" />
					</a> -->
                </div>
            </section>
            <hr class="m-0" />
            <!-- Skills-->
            <!-- <section class="resume-section" id="skills">
                <div class="resume-section-content">
                    <h2 class="mb-5">Skills</h2>
                    <div class="subheading mb-3">Programming Languages & Tools</div>
                    <ul class="list-inline dev-icons">
                        <li class="list-inline-item"><i class="fab fa-html5"></i></li>
                        <li class="list-inline-item"><i class="fab fa-css3-alt"></i></li>
                        <li class="list-inline-item"><i class="fab fa-js-square"></i></li>
                        <li class="list-inline-item"><i class="fab fa-angular"></i></li>
                        <li class="list-inline-item"><i class="fab fa-react"></i></li>
                        <li class="list-inline-item"><i class="fab fa-node-js"></i></li>
                        <li class="list-inline-item"><i class="fab fa-sass"></i></li>
                        <li class="list-inline-item"><i class="fab fa-less"></i></li>
                        <li class="list-inline-item"><i class="fab fa-wordpress"></i></li>
                        <li class="list-inline-item"><i class="fab fa-gulp"></i></li>
                        <li class="list-inline-item"><i class="fab fa-grunt"></i></li>
                        <li class="list-inline-item"><i class="fab fa-npm"></i></li>
                    </ul>
                    <div class="subheading mb-3">Workflow</div>
                    <ul class="fa-ul mb-0">
                        <li>
                            <span class="fa-li"><i class="fas fa-check"></i></span>
                            Mobile-First, Responsive Design
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-check"></i></span>
                            Cross Browser Testing & Debugging
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-check"></i></span>
                            Cross Functional Teams
                        </li>
                        <li>
                            <span class="fa-li"><i class="fas fa-check"></i></span>
                            Agile Development & Scrum
                        </li>
                    </ul>
                </div>
            </section> -->
        </div>
        
        <!-- Modal -->
	    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">BSC ���� ���</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-primary" id="close_modal">Close</button>

	                </div>
	            </div>
	        </div>
	    </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="/js/scripts.js"></script>


</body>
</html>