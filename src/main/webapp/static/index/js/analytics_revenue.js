var INET =INET ||{};
console.log(1111);
INET.data={
    distrbution:{
      id:'pie',
      title:'User Package Distribution',
      type:'pie',
        stack:'',
      data:['Transaction','Weekly Subscriber','Monthly Subscriber','Annual Subscriber','Others'],
      color:['#087cff','#3ad4e0','#4de0a6','#ffc62c','#8b71fa'],
      value:[21,13,37,19,10]
  },
    Arpu:{
        id:'arpu',
        title:'ARPU',
        type:'line',
        interval:'auto',
        min:9.3,
        max:9.55,
        name:'',
        xData:['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
        yData:[9.375,9.39,9.43,9.455,9.55,9.505,9.51,9.48,9.41,9.42,9.525]
    },
    revenue:{
        id:'daily',
        title:'Daily Revenue',
        type:'bar',
        interval:1,
        name:'$K',
        min:0,
        max:60,
        xData:['11/01','11/02','11/03','11/04','11/05','11/06','11/07','11/08','11/09','11/10','11/11','11/12','11/13','11/14','11/15','11/16','11/17','11/18','11/19','11/20','11/21','11/22','11/23','11/24','11/25','11/26','11/27','11/28','11/29'],
        yData:[10,11,13,14,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,30,35,40,45,48,49,50,52,55]
    },
    montly:{
        id:'montly',
        title:'Monthly Revenue',
        type:'line',
        interval:'auto',
        name:'$k',
        min:0,
        max:500,
        xData:['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
        yData:[20,50,80,100,150,220,310,350,290,190,105,50]
    },
    total:{
        id:'total',
        title:'Total Revenue',
        type:'line',
        interval:'auto',
        name:'M',
        min:0,
        max:6,
        xData:['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
        yData:[0.5,1,1.3,1.6,1.8,2.1,2.5,2.8,3.8,4.6,4.9,5.9]
    }
};
console.log(1111);

INET.Revenue =function () {
  this.drawPie(INET.data.distrbution);
  this.drawEcharts(INET.data.Arpu);
  this.drawEcharts(INET.data.revenue);
  this.drawEcharts(INET.data.montly);
  this.drawEcharts(INET.data.total);
    console.log(1111);
},
INET.Revenue.prototype={
    constructor:INET.Revenue,

    drawPie:function (obj) {
        var chart = echarts.init(document.getElementById(obj.id));
        console.log(1111);

        var data =[];
        var value = obj.value;
        var len = value.length;

        for(var i=0;i<len;i++){
            data[i] = {
                value: value[i], name:obj.data[i]
            };
        }
        var option = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },

            color:obj.color,
            legend: {
                orient: 'vertical',
                right:'0%',
                top:'25%',
                height:200,
                itemHight:14,
                itemWidth:14,
                itemGap:25,
                textStyle: {
                    color:'#72788a',
                    fontSize:14
                },
                data:obj.data
            },
            series: [
                {
                    name:obj.title,
                    type:'pie',
                    top:'10%',
                    radius: ['25%', '55%'],
                    center: ['25%', '50%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: true,
                            position: 'inside',
                            formatter:'{d}%',
                            color:'#fff',
                            fontSize: '17'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '14',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            length2:0,
                            length:5,
                            show: false
                        }
                    },
                    itemStyle: {
                        normal: {
                            borderWidth: 5,
                            borderColor: '#ffffff',
                        }
                    },
                    data:data
                }
            ]
        };
        chart.setOption(option);
        $(window).resize(function () {
            chart.resize();
        });
    },
    drawEcharts:function (obj) {
        var myChart = echarts.init(document.getElementById(obj.id));
        var option = {
            color:['#0078FF','#2ED3E1'],
            title: {
                text: '',
                textStyle:{
                    color:'#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top:'2%',
                left:'1%'
            },
            tooltip: {
                show: true,
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                show: false,
                itemWidth: 16,
                itemHeight: 8,
                data: [obj.title],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '15%',
                left: '0%',
                right: '0%',
                bottom: '1%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel:{
                    interval: obj.interval,
                    textStyle:{
                        fontSize: 14,
                        color:'#627a99'
                    }
                },
                axisLine: {
                    show:true,
                    lineStyle: {
                        color: '#69AFFF'
                    }
                },
                data: obj.xData,
            }],
            yAxis: [{
                type: 'value',
                name: obj.name,
                min:obj.min,
                max:obj.max,
                nameTextStyle:{
                    color:'#72788a',
                    fontSize: 16
                },
                axisTick: {
                    show: false
                },
                axisLine: {
                    show: false,
                    lineStyle: {
                        color: '#57617B'
                    }
                },
                axisLabel: {
                    formatter:'{value}',
                    margin: 10,
                    textStyle: {
                        fontSize: 14,
                        color:'#889eb2'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#F2F2F2',
                        type: 'dotted'
                    }
                }
            }],
            series: [{
                name: obj.title,
                type: obj.type,
                barWidth:'25%',
                symbolSize: 8,
                smooth: false,
                itemStyle:{
                    normal:{
                        barBorderRadius:10
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgba(1,120,255, 0.3)'
                        }, {
                            offset: 0.9,
                            color: 'rgba(1,120,255, 0)'
                        }], false),
                        shadowColor: 'rgba(0, 0, 0, 0.1)',
                        shadowBlur: 10
                    }
                },
                data: obj.yData
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
};
var revenue = new INET.Revenue();