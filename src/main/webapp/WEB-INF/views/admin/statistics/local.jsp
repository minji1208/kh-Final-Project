<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
	
	<!-- chart chartist js --> 
    <script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
    <script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
    <script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>
  	<style>
  		button {
		    width: 30px;
		    height: 30px;
		    border: solid 1px black;
		    background-color: white;
		    margin:0;
		}
		input {
		    height: 30px;
		    border: solid 1px black;
		    width: 170px;
		    text-align: center;
		    margin:0;
		}
		.bottomDiv{
			padding:20px;
		}
		.local{
			margin-inline: auto;
		}
  	</style>
    <script type="text/javascript">
    	function template(local, mon1, mon2, mon3, mon4, mon5, mon6, mon7, mon8, mon9, mon10, mon11, mon12, total){
    		let $tbody = $(".local-content");
    		let $tb = $("#item").clone().removeAttr("id");
    		
    		$tb.find('.item').html(local);
    		$tb.find('.item1').html(mon1);
    		$tb.find('.item2').html(mon2);
    		$tb.find('.item3').html(mon3);
    		$tb.find('.item4').html(mon4);
    		$tb.find('.item5').html(mon5);
    		$tb.find('.item6').html(mon6);
    		$tb.find('.item7').html(mon7);
    		$tb.find('.item8').html(mon8);
    		$tb.find('.item9').html(mon9);
    		$tb.find('.item10').html(mon10);
    		$tb.find('.item11').html(mon11);
    		$tb.find('.item12').html(mon12);
    		$tb.find('.total').html(total);
    		
    		$tbody.append($tb);
    		
    	}
		$(function(){
			let admin = "<c:out value='${adminLogin.a_no }'/>";
			if(admin == ""){
				alert("잘못된 접근입니다.");
				location.href="/admin/login";
			}
			$.ajax({
				url : "/admin/statistics/tradeLocal",
				type:"get",
				dataType:"json",
				contentType:"application/json; charset=utf-8",
				success:function(data){
					var labelsList = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
					var labelList = new Array();
					var valueList = new Array();
					var colorList = new Array();
					var datas = new Array();
					$.each(data, function(key, value){
						labelList.push(this["LOCAL"]) 
						let local = this["LOCAL"];
						console.log(local);
						var valuesList = new Array();
						for(let i = 1; i < 13; i++){
							valuesList.push(this[i+"월"]);
						}
						valueList.push(this["총합"]);
						template(local, valuesList[0], valuesList[1], valuesList[2], valuesList[3], valuesList[4], valuesList[5], valuesList[6], valuesList[7], valuesList[8], valuesList[9],
								valuesList[10], valuesList[11], this["총합"]);
						/* 색 랜덤으로 추가하기 */
						var rcolor = 0;
						rcolor = Math.random() * 0xffffff;
						rcolor = parseInt(rcolor);
						rcolor = rcolor.toString(16);
						for(let color in colorList){
							if(rcolor == color){
								rcolor = Math.random() * 0xffffff;
								rcolor = parseInt(rcolor);
								rcolor = rcolor.toString(16);
							}
						}
						colorList.push("#"+rcolor);
					});
					
					const ctx = document.getElementById('myChart').getContext('2d');
					
					var myChart = new Chart(ctx, {
						type:"pie",
						data : {
							labels:labelList,
							datasets : [{
									label:'지역별',
									data:valueList,
									backgroundColor:colorList
							}]
						},
						options : {
							
							responsive:true,
							interaction:{
								intersect:true,
							},
							legend:{
								position:'left'
							}
						}
					});  
					
					const ctx2 = document.getElementById('myChart2').getContext('2d');
					
					var myChart2 = new Chart(ctx2, {
						type:"bar",
						data : {
							labels:labelList,
							datasets : [{
									label:'',
									data:valueList,
									backgroundColor:colorList
								}
						]
						},
						options : {
							
							responsive:true,
							tooltips:{
								mode:'index',
								intersect:false
							},
							hover:{
								intersect:false,
								mode:'index'
							},
							scales:{
								yAxes : [{
									ticks:{
										beginAtZero:true,
										stepSize: 5
									}
								}]
							},
							legend:{
									display:false	
							}
						}
					});  
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
		
		});
	</script>
	</head>
	<body>
	<c:if test='${not empty adminLogin }'>
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
                    <!-- simple pie chart  -->
                    <!-- ============================================================== -->
                    <div>
                    	<h2>선호 지역 통계</h2>
                    </div>
                    <div class="row">
                    	<div class="col-x1-6 col-lg-6 col-md-6 col-sm-12 col-12">
	                        <div class="card">
	                            <h5 class="card-header">지역 통계</h5>
	                            <div class="card-body">
	                                <canvas id="myChart"></canvas>
	                            </div>
	                        </div>
                        </div>
                    	<div class="col-x1-6 col-lg-6 col-md-6 col-sm-12 col-12">
	                        <div class="card">
	                            <h5 class="card-header">지역 통계</h5>
	                            <div class="card-body">
	                                <canvas id="myChart2"></canvas>
	                            </div>
	                        </div>
                        </div>
                    </div>
                    <div class="bottomDiv">
	                    <div>
	                    	<table class="table table-hover cateTb">
	                    		<thead>
	                    			<tr>
	                    				<td>지역명</td>
	                    				<td>1월</td>
	                    				<td>2월</td>
	                    				<td>3월</td>
	                    				<td>4월</td>
	                    				<td>5월</td>
	                    				<td>6월</td>
	                    				<td>7월</td>
	                    				<td>8월</td>
	                    				<td>9월</td>
	                    				<td>10월</td>
	                    				<td>11월</td>
	                    				<td>12월</td>
	                    				<td>총합</td>
	                    			</tr>
	                    		</thead>
	                    		<tbody class="local-content">
	                    			<tr id="item">
	                    				<td class="item"></td>
	                    				<td class="item1"></td>
	                    				<td class="item2"></td>
	                    				<td class="item3"></td>
	                    				<td class="item4"></td>
	                    				<td class="item5"></td>
	                    				<td class="item6"></td>
	                    				<td class="item7"></td>
	                    				<td class="item8"></td>
	                    				<td class="item9"></td>
	                    				<td class="item10"></td>
	                    				<td class="item11"></td>
	                    				<td class="item12"></td>
	                    				<td class="total"></td>
	                    			</tr>
	                    		</tbody>
	                    	</table>
	                    </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end simple pie chart  -->
                    <!-- ============================================================== -->
		</div>
		</c:if>
	</body>
</html>
