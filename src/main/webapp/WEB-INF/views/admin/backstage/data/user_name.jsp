<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<script type="text/javascript" src="${basePath}/static/js/data/jsapi.js"></script>
<script type="text/javascript" src="${basePath}/static/js/data/corechart.js"></script>		
<script type="text/javascript" src="${basePath}/static/js/data/jquery.gvChart-1.0.1.min.js"></script>
<script type="text/javascript" src="${basePath}/static/js/data/data.js"></script>
<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
	$('#myTable5').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>

<script type="text/javascript">
gvChartInit();
$(document).ready(function(){
		$('#myTable1').gvChart({
			chartType: 'PieChart',
			gvSettings: {
			vAxis: {title: 'No of players'},
			hAxis: {title: 'Month'},
			width: 600,
			height: 350
		}
	});
});
</script>

</head>


<body>
	<div style="width:1200px;margin:0;display: -webkit-inline-box">
	   <table id='myTable5' >
			<caption>会员地区分布</caption>
			<thead>
				<tr>
					<th></th>
					<th>河北</th>
					<th>河南</th>
					<th>湖北</th>
					<th>湖南</th>
					<th>山东</th>
					<th>山西</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>1200</th>
					<td>540</td>
					<td>300</td>
					<td>150</td>
					<td>180</td>
					<td>120</td>
					<td>180</td>
				</tr>
			</tbody>
		</table>  

	   <table id='myTable1'style="float:right;">
			<caption>会员性别分布</caption>
			<thead>
				<tr>
					<th></th>
					<th>男</th>
					<th>女</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th id="total"></th>
					<td id="totalM"></td>
					<td id="totalF"></td>
					</tr>
			</tbody>
		</table>  
	
	</div>	

