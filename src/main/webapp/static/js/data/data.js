$(function() {
	

function genderStatistics(){
	$.ajax({
		url : "genderStatistics",
		type : "post",
		success : function(result) {
			var gender= result.extend.gender;
			 var total =result.extend.gender.length;
			 var totalM=0;
			 var totalF=0;
			 for(var i=0;i<total;i++){
				var gender3=gender[i].gender;
				 if(gender3=='M'){
					 totalM=totalM+1;
				 }else{
					 totalF=totalF+1;
				 }
			 }
			 document.getElementById("total").innerHTML=total;
			 document.getElementById("totalM").innerHTML=totalM;
			 document.getElementById("totalF").innerHTML=totalF;
		}

	});
}});