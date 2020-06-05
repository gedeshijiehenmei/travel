/*window.onload = function(){
  /!*720代表设计师给的设计稿的宽度，你的设计稿是多少，就写多少;100代表换算比例，这里写100是
   为了以后好算,比如，你测量的一个宽度是100px,就可以写为1rem,以及1px=0.01rem等等*!/
  getRem(1920,100)
};
window.onresize = function(){
  getRem(1920,100)
};
function getRem(pwidth,prem){
  var html = document.getElementsByTagName("html")[0];
  var oWidth = document.body.clientWidth || document.documentElement.clientWidth;
  html.style.fontSize = oWidth/pwidth*prem + "px";
  console.log(oWidth/pwidth*prem);

}*/
//document.querySelector('.loading_box').style.display = 'none';
//
var element = layui.element;
$('.select_all').click(function () {
    var that = $(this);
    if (that.siblings('.select_item').hasClass('select_active')){
        that.addClass('select_active');
        that.siblings('.select_item').removeClass('select_active');
    }else {
        that.toggleClass('select_active');
        // that.removeClass('select_active');
        // that.siblings('.select_item').addClass('select_active');
    }
});
$('.select_item').click(function () {
    var that = $(this);
    that.siblings('.select_all').removeClass('select_active');
    that.toggleClass('select_active')
});

/** 表格插件 获取表格行数 **/
var Table = function (ele, opt) {
  this.$element = ele;
};

Table.prototype = {
  init: function () {

  },
  getNum:function () {
    var that = this;
    return that.$element.find('tbody tr[role="row"]').length;
  }
};

$.fn.tablePlugin = function (options) {
  var dataTable = new Table(this, options);
  return dataTable;
};
//new WOW().init();