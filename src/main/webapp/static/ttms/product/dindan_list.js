$(document).ready(function(){
	//在queryFormId对应对象的btn-search元素上注册click事件
	$("#queryFormId").on("click",
			".btn-search",doQueryObjects);
	//在禁用和启用按钮上注册点击事件
	/*$("#queryFormId").on(
			"click",
			".btn-valid,.btn-invalid",
			 doValidById);	*/	
	//在添加,修改按钮上注册点击事件
	$('#queryFormId')
	.on("click",".btn-add,.btn-update",doShowEditDialog);
	$("#queryFormId").on(
			"click",
			".btn-del",
			 doBtnDel);	
	//初始化页面数据
	doGetObjects();
	
});

function doBtnDel(){
	 var id=$(this).parents("tr").find("td:eq(1)").text();
		//alert($(this).parents("tr").find("td:eq(1)").text());
		if(confirm("您确定要删除【"+id+"】吗？")){
			$.ajax({
				url:"deleteDindanInfoByid/"+this.id,
				type:"DELETE",
				success:function(result){
					//alert(result.msg);
					alert("删除成功！")
					doGetObjects();
				}
				
			});
			
		}
}

/*点击添加按钮时执行一个动作
 *1)初始化index页面的模态框(bootstrap 框架提供)
 *2)在模态框内部显示project_edit.jsp
 * */
function doShowEditDialog(){
	var title;
	//1.定义模态框的标题
	if($(this).hasClass("btn-add")){
		title="添加新订单"
	}
	if($(this).hasClass("btn-update")){
		//模态框上绑定id值(在修改页面中要根据此值获取数据)
		//data(key,value)函数用于绑定数据
		//data(key)函数用于获取数据
		$("#modal-dialog").data("id",$(this).parent().parent().data("id"));
		//定义修改时的标题
		title="修改订单编号为"+$("#modal-dialog").data("id")+"订单信息";
	}
	//2.启动模态框,并加载页面
	//在模态框对应位置异步加载url
	var url="dindanInfo_edit";
	$("#modal-dialog .modal-body")
	.load(url,function(){//异步加载完成回调此函数
		//设置标题内容
		$(".modal-title").html(title);
		//显示模态框(index.jsp中)
		$("#modal-dialog").modal("show");
	});
}
/*执行禁用启用操作
 * 1.获得数据(禁用或启动哪些项目信息)
 * a)id(选中的那个checkbox的值)
 * b)valid(由点击按钮决定)
 * 2.发送异步请求,修改记录信息
 * a)url
 * b)params
 * c)post(url,params,functions(result){})
 */
/*function doValidById(){
 //debugger
 //1.获得页面数据(valid,checkedIds)
 //1.1 获得valid的值(根据点击的按钮)
 var valid;//定义一个变量(默认值undefined)
 //判定点击的按钮是启用还是禁用
 //hasClass用于判定对象上是否有某个选择器
 //$(this).attr("class"):课后了解此方法的含义及用法
 if($(this).hasClass("btn-valid")){
	 valid=1;//表示启用
 }
 if($(this).hasClass("btn-invalid")){
	 valid=2;//表示禁用
 }
 //1.2获得选中的id值(可能1个也可能是多个)
 var checkedIds=getCheckedIds();
 console.log("checkedIds="+checkedIds);
 if(checkedIds.length==0){
	 alert("请至少选择一项");
	 return;
 }
 //2.提交异步请求,更新对应记录的状态信息
 //2.1 定义url (对应控制器中的一个方法)
  var url="doValidById"
 //2.2 将数据封装为一个json对象
  var params={"checkedIds":checkedIds,"valid":valid};
  //2.3发起类型为post的ajax请求(类型为post)
  $.post(url,params,function(result){//回调函数
	 //debugger
	 //alert("result="+JSON.stringify(result));
	 if(result.code==100){//异步请求成功了
		 alert(result.message);//ok
		 doGetObjects();//重新查询
	 }else{//请求过程出现异常
		 alert(result.message);
	 }
  });
 }*/
function getCheckedIds(){//1,2,3,4,5
  var checkedIds="";
  //1.遍历所有的checkbox,获得选中的值
  /*$('tbody input[name="checkedItem"]').
    each(function(){
       if($(this).is(":checked")){}//课后了解
    })
  */
  $('#tbodyId input[name="checkedItem"]').each(function(){//each函数用于迭代对象
	  //判定当前对象是否是选中的
	  if($(this).prop("checked")){
		  if(checkedIds==""){
			  checkedIds+=$(this).val();//id
		  }else{
			 checkedIds+=","+$(this).val();
		 }
	 }
  });
  //2.返回获得的数据
  return checkedIds;
}


/*执行表单查询*/
function doQueryObjects(){
	//1.修改当前页的值为1
	$("#pageId").data("pageCurrent",1);
	//2.执行查询动作(重用doGetObjects方法)
	doGetObjects();
}
/*获得查询表单中的数据*/
function getQueryFormData(){
	//根据id获得具体对象的值,然后封装到JSON对象
	var params={
		userName:$("#searchNameId").val(),
		state:$("#searchValidId").val()
	};
	console.log(JSON.stringify(params));
	//一定要记得返回
    return params;
}
function doGetObjects(){
	//定义一个url(对应服务端控制器中的一个方法)
	var url="dindanInfo"
	//获取当前页的页码值,假如没有值,默认值设置为1
	var pageCurrent=$("#pageId").data("pageCurrent");
	if(!pageCurrent){
		pageCurrent=1;
	}
	//定义一个params对象
	var params=getQueryFormData();
	//动态的向params对象中添加key/value
	params.pageCurrent=pageCurrent;
	console.log(JSON.stringify(params))
	//底层发起ajax异步请求($.ajax({....}))
	//post方法是一个增强版的ajax方法
    $.ajaxSettings.async = true;
    $.post(url,params,function(result){//result为一个json对象(JsonResult)
    	//console.log("result="+result);
    	//将json对象转换为json字符串输出
    	//console.log(JSON.stringify(result));
    	//将json对象中的数据,填充到table的tbody元素中
    	if(result.code==100){//成功
    	//alert(result.message);//假如有需要
    	//显示记录信息
    	setTableBodyRows(result.extend.pageObject.list);//data属性的值对应一个json对象
    	//设置及显示分页信息
    	console.log(JSON.stringify(result.extend.pageObject))
    	setPagination(result.extend.pageObject);
    	}else{//失败了(获取数据时出现异常了)
    	alert(result.message);
    	}
    });	
}
//定义函数将json对象中的数据取出来填充到表格中
function setTableBodyRows(result){//result 为一个json对象
	//获得tbody对象(根据id获得)
	//在使用$函数获得某个id对应的对象一定要添加#
	var tBody=$("#tbodyId");
	//清空body中内容(假如方法不记得了怎么办)
	tBody.empty();//doc.tedu.cn
	//迭代json对象
	for(var i in result){//循环一次取一行[{"name":"AAA",...},{},{}]
	//构建一个tr对象
	var tr=$("<tr></tr>");
	//在tr对象上绑定一个值
	tr.data("id",result[i].id);//key/value
	//tr对象中追加td字符串对象
	var firstTd='<td><input type="checkbox" name="checkedItem" value="[id]"></td>';
	//将firstTd字符串中的[id]替换为一个具体指
	firstTd=firstTd.replace("[id]",result[i].id);
	tr.append(firstTd);	
	tr.append("<td>"+result[i].id+"</td>");
	tr.append("<td>"+result[i].userName+"</td>");
	tr.append("<td>"+result[i].name.slice(0,20)+"</td>");
	tr.append("<td>"+result[i].number+"</td>");
	tr.append("<td>"+result[i].total+"</td>");	
	var state='';
		if(result[i].state==1){
			state="待付款"
		}
		if(result[i].state==2){
			state="待出行"
		}
		if(result[i].state==3){
			state="待评论"
		}
		if(result[i].state==4){
			state="已完成"
		}
		if(result[i].state==5){
			state="待处理"
		}
	tr.append("<td>"+state+"</td>");
	tr.append("<td>"+result[i].contacts+"</td>");
	tr.append("<td>"+result[i].phone+"</td>");
	tr.append("<td>"+result[i].departureTime+"</td>");
	tr.append("<td>"+(result[i].creationTime)+"</td>");
	tr.append("<td><button type='button' class='btn btn-default btn-update'>修改</button></td>");
	tr.append("<td><button type='button' id="+result[i].id+" class='btn btn-default btn-del'>删除</button></td>");
	tBody.append(tr);//将每一行记录再追加到tbody中
	}
	
}

