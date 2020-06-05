$(()=> {
    var insert = new Insert();
    var laydate = layui.laydate;
    setTimeout(()=> {

        insert.Echart1();
        insert.Echart2();
        insert.Echart3();
        insert.Echart4();
        insert.EchartPie('charts_5','54','#429AFD');
        insert.Echart6();
        insert.Echart7();
        insert.Echart8();
        insert.Echart9();
        insert.EchartPie('pie_1','35','#429AFD');
        insert.EchartPie('pie_2','37','#8CEAC5');
        insert.EchartPie('pie_3','13','#45D5DF');
        insert.EchartPie('pie_4','9','#FEC642');
        insert.EchartPie('pie_5','6','#675FF3');
        insert.Echart10();
        insert.Echart11();
        insert.Echart12();
    }, 300);

    laydate.render({
        elem: '#timer', lang: 'en', theme: '#323549', format: 'yyyy/MM/dd' , value: '2017/08/10'
    });
});


var Insert = function () {

};


Insert.prototype = {
    constructor: Insert,
    init: function () {
    },
    Echart1:()=>{
        var myChart = echarts.init(document.getElementById('charts_1'));

        var option = {
            color: ['#44D5DF', '#44D5DF', '#0078FF'],
            title: {
                text: '',
                textStyle: {
                    color: '#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top: '2%',
                left: '1%'
            },
            tooltip: {
                show: true,
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                show: true,
                itemWidth: 15,
                itemHeight: 8,
                data: [{
                    name: 'Registered Users',
                    icon: ''
                }, {
                    name: 'Paid Users',
                    icon: 'rect'
                }, {
                    name: 'Active Users',
                    icon: 'rect'
                }],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '30%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#69AFFF'
                    }
                },
                data: [
                    'JAN',
                    'FEB',
                    'MAR',
                    'APR',
                    'MAY'
                ]
            }],
            yAxis: [{
                type: 'value',
                name: 'Unit K',
                max: 400,
                nameTextStyle: {
                    color: '#72788a',
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
                    formatter: '{value}',
                    margin: 10,
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        color: '#F2F2F2',
                        type: 'dotted'
                    }
                }
            },
                {
                    type: 'value',
                    name: 'K',
                    max: 40,
                    nameTextStyle: {
                        color: '#72788a',
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
                        formatter: '{value}',
                        margin: 10,
                        textStyle: {
                            fontSize: 14,
                            color: '#72788a'
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
                name: 'Registered Users',
                type: 'line',
                yAxisIndex: 1,
                symbolSize: 8,
                smooth: false,
                lineStyle: {
                    width: 2
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: 'rgba(68,213,223, 0.3)'
                        }, {
                            offset: 0.7,
                            color: 'rgba(68,213,223, 0)'
                        }], false),
                        shadowColor: 'rgba(0, 0, 0, 0.1)',
                        shadowBlur: 10
                    }
                },
                data: [
                    18,
                    22,
                    30,
                    28,
                    38
                ]
            }, {
                name: 'Paid Users',
                type: 'bar',
                barWidth: '13%',
                data: [
                    120,
                    130,
                    140,
                    150,
                    160
                ]
            }, {
                name: 'Active Users',
                type: 'bar',
                barWidth: '13%',
                data: [
                    40,
                    50,
                    60,
                    70,
                    80
                ]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart2: function () {
        var myChart = echarts.init(document.getElementById('charts_2'));

        var option = {
            color: [ '#0078FF', '#44D5DF'],
            title: {
                text: '',
                textStyle: {
                    color: '#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top: '2%',
                left: '1%'
            },
            tooltip: {
                show: true,
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                show: true,
                itemWidth: 15,
                itemHeight: 8,
                data: [{
                    name: 'Un-subscribers',
                    icon: 'rect'
                }, {
                    name: 'Subscribers',
                    icon: 'rect'
                }],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '30%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#69AFFF'
                    }
                },
                data: [
                    'JAN',
                    'FEB',
                    'MAR',
                    'APR',
                    'MAY'
                ]
            }],
            yAxis: [{
                type: 'value',
                name: 'K',
                max: 120,
                nameTextStyle: {
                    color: '#72788a',
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
                    formatter: '{value}',
                    margin: 10,
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        color: '#F2F2F2',
                        type: 'dotted'
                    }
                }
            }],
            series: [{
                name: 'Subscribers',
                type: 'bar',
                barWidth: '20%',
                stack: 'value',
                label : {
                    normal:{
                        show:true,
                        position: 'insideTop',
                        formatter: '{c}',
                        textStyle : {
                            color:'#fff',
                            fontSize:16,
                            fontFamily: 'akkR',
                            fontWeight: 'normal'
                        }
                    }
                },
                data: [
                    19,
                    42,
                    57,
                    76,
                    89
                ]
            }, {
                name: 'Un-subscribers',
                type: 'bar',
                barWidth: '20%',
                stack: 'value',
                label : {
                    normal:{
                        show:true,
                        position: 'outside',
                        formatter: '{c}',
                        textStyle : {
                            color:'#72788a',
                            fontSize:16,
                            fontFamily: 'akkR',
                            fontWeight: 'normal'
                        }
                    }
                },
                data: [
                    5,
                    8,
                    10,
                    12,
                    14
                ]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart3: function () {
        var myChart = echarts.init(document.getElementById('charts_3'));

        var option = {
            color:['#0078FF','#44D5DF','#54E0A8','#FEC53F'],
            title: {
                text: "",
                textStyle:{
                    color:'#3f414c',
                    fontSize: 20,
                    fontWeight: 'normal'
                },
                top:'2%',
                left:'1%'
            },
            tooltip: {
                show:false,
                trigger: "item",
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                x: "center",
                y: "82%",
                data: ["Smartphone", "STB", "Tablet", "Website"],
                /*width: '50%',*/
                itemWidth: 14,
                itemHeight: 14,
                textStyle:{
                    color:"#999999"
                }
            },
            series: [{
                name: "ARPU($)",
                type: "pie",
                radius:['15%', '50%'],
                startAngle: -60,
                //roseType: "area",
                roseType : 'radius',
                labelLine:{
                    normal:{
                        length: 10,
                        lineStyle:{
                            color: '#E3E3E3',
                        }
                    },
                    emphasis:{
                        length: 10,
                        lineStyle:{
                            color: '#E3E3E3',
                        }
                    }
                },
                label: {
                    normal: {
                        formatter: '{a|{d}%}',
                        borderWidth: 0,
                        borderRadius: 4,
                        rich: {
                            a: {
                                color: '#666666',
                                fontSize: 16,
                                lineHeight: 20
                            },
                            hr: {
                                borderColor: '#333',
                                width: '100%',
                                borderWidth: 0.5,
                                height: 0
                            },
                            b: {
                                fontSize: 16,
                                lineHeight: 20,
                                color: '#666666'
                            }
                        }
                    }
                },
                data: [{
                    value: 48.6,
                    name: "Smartphone",

                }, {
                    value: 25.4,
                    name: "STB",

                }, {
                    value: 13.2,
                    name: "Tablet",
                }, {
                    value: 12.8,
                    name: "Website",

                }]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart4: function () {
        var myChart = echarts.init(document.getElementById('charts_4'));

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
                data: ['Net Adds'],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '27%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel:{
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
                data: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
            }],
            yAxis: [{
                type: 'value',
                name: 'Million',
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
                name: 'Net Adds',
                type: 'line',
                symbolSize: 8,
                smooth: false,
                lineStyle:{
                    normal:{
                        width: 2
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
                data: [22,11,13,9,15,28,21,28,20,32,30,32,40,33,30,26,28,24,16,22,20,18,20]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart6: function () {
        var myChart = echarts.init(document.getElementById('charts_6'));

        var appusage_data = [{
            name: "",
            value: 7
        }, {
            name: "",
            value: 10
        }, {
            name: "",
            value: 15
        }, {
            name: "",
            value: 22
        }, {
            name: "",
            value: 20
        }, {
            name: "",
            value: 26
        }];
        var full_data = [{
            name: "app11",
            value: 100
        }, {
            name: "app11",
            value: 100
        }, {
            name: "app8",
            value: 100
        }, {
            name: "app3",
            value: 100
        }, {
            name: "app16",
            value: 100
        }, {
            name: "app16",
            value: 100
        }];
        var data1 = [];

        var option = {
            color: ['#087CFF', '#F1F1F3'],
            title: {
                text: "",
                textStyle: {
                    color: "#bcbfff",
                    fontWeight: "bold",
                    fontSize: 14
                },
                top: "4%",
                left: "2.2%"
            },
            tooltip: {
                show: false,
                trigger: "axis",
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: "shadow" // 默认为直线，可选为：line | shadow
                }
            },
            grid: {
                left: "10%",
                top: "20%",
                right: "20%",
                bottom: "10%",
                containLabel: true
            },
            yAxis: [{
                type: "category",
                data: ["Others", "Guangdong", "Beijing", "Shanghai", "Jiangsu", "Zhejiang"],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false,
                    alignWithLabel: true
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 16,
                        color: "#8C91A0"
                    }
                }
            }],
            xAxis: [{
                type: "value",
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                splitLine: {
                    show: false
                }
            }],

            series: [{
                type: "bar",
                barWidth: 10,
                barGap: '-100%',
                data: appusage_data,
                barCategoryGap: "35%",
                z: 2,
                itemStyle:{
                    normal:{
                        barBorderRadius: 5
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: "right",
                        formatter: function(params) {
                            console.log(params.data.value);
                            data1.push(params.data.value);
                            return params.data.name;
                        },
                        textStyle: {
                            color: "#8C91A0"
                        }
                    }
                }
            },{
                type: "bar",
                barWidth: 10,
                barGap: '-100%',
                data: full_data,
                barCategoryGap: "35%",
                z: 1,
                itemStyle:{
                    normal:{
                        barBorderRadius: 5
                    },
                    emphasis:{
                        color:'#F1F1F3'
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: "right",
                        formatter: function(params) {
                            return data1[params.dataIndex]+'%';
                        },
                        textStyle: {
                            fontSize: 16,
                            color: "#292929"
                        }
                    }
                }
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart7: function () {
        var myChart = echarts.init(document.getElementById('charts_7'));

        var option = {
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
                show: false,
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                show: false,
                orient: 'vertical',
                x: 'right',
                itemWidth: 14,
                itemHeight: 14,
                align: 'left',
                data:['Basic','Basic Plus','Sports Fan','Movies Fan','Deluxe'],
                textStyle: {
                    color: '#72788a'
                }
            },
            series: [
                {
                    name:'',
                    type:'pie',
                    selectedMode: 'single',
                    selectedOffset: 10,
                    hoverAnimation: false,
                    radius: ['70%', '90%'],
                    center: ['50%','50%'],
                    color: ['#087CFF', '#44D5DF', '#54E0A8', '#FEC53F','#8B72F7'],
                    label: {
                        normal: {
                            show: false,
                            formatter: '{b}\n{d}%'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    itemStyle:{
                        normal:{
                            borderColor: '#fff',
                            borderWidth: 3
                        }
                    },
                    data:[
                        {value:18, name:'>20'},
                        {value:15, name:'5~10'},
                        {value:23, name:'15-20'},
                        {value:9, name:'Movies Fan'},
                        {value:35, name:'Deluxe'}

                    ]
                }
            ]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart8: function () {
        var myChart = echarts.init(document.getElementById('charts_8'));

        var appusage_data = [{
            name: "",
            value: 16
        }, {
            name: "",
            value: 20
        }, {
            name: "",
            value: 24
        }, {
            name: "",
            value: 18
        }, {
            name: "",
            value: 14
        }, {
            name: "",
            value: 8
        }];
        var full_data = [{
            name: "app11",
            value: 100
        }, {
            name: "app11",
            value: 100
        }, {
            name: "app8",
            value: 100
        }, {
            name: "app3",
            value: 100
        }, {
            name: "app16",
            value: 100
        }, {
            name: "app16",
            value: 100
        }];
        var data1 = [];

        var option = {
            color: ['#087CFF', '#F1F1F3'],
            title: {
                text: "",
                textStyle: {
                    color: "#bcbfff",
                    fontWeight: "bold",
                    fontSize: 14
                },
                top: "4%",
                left: "2.2%"
            },
            tooltip: {
                show: false,
                trigger: "axis",
                axisPointer: { // 坐标轴指示器，坐标轴触发有效
                    type: "shadow" // 默认为直线，可选为：line | shadow
                }
            },
            grid: {
                left: "10%",
                top: "20%",
                right: "20%",
                bottom: "10%",
                containLabel: true
            },
            yAxis: [{
                type: "category",
                data: ["Others", "Sports", "TV Series", "Variety Show", "Movie", "Animation"],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false,
                    alignWithLabel: true
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 16,
                        color: "#8C91A0"
                    }
                }
            }],
            xAxis: [{
                type: "value",
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    show: false
                },
                splitLine: {
                    show: false
                }
            }],

            series: [{
                type: "bar",
                barWidth: 10,
                barGap: '-100%',
                data: appusage_data,
                barCategoryGap: "35%",
                z: 2,
                itemStyle:{
                    normal:{
                        barBorderRadius: 5
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: "right",
                        formatter: function(params) {
                            console.log(params.data.value);
                            data1.push(params.data.value);
                            return params.data.name;
                        },
                        textStyle: {
                            color: "#8C91A0"
                        }
                    }
                }
            },{
                type: "bar",
                barWidth: 10,
                barGap: '-100%',
                data: full_data,
                barCategoryGap: "35%",
                z: 1,
                itemStyle:{
                    normal:{
                        barBorderRadius: 5
                    },
                    emphasis:{
                        color:'#F1F1F3'
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: "right",
                        formatter: function(params) {
                            return data1[params.dataIndex]+'%';
                        },
                        textStyle: {
                            fontSize: 16,
                            color: "#292929"
                        }
                    }
                }
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart9: function () {
        var myChart = echarts.init(document.getElementById('charts_9'));

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
                data: ['Net Adds'],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '27%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel:{
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
                data: ['12.17','12.18','12.19','12.20','12.21','12.22','12.23','12.24']
            }],
            yAxis: [{
                type: 'value',
                name: 'Min',
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
                name: 'Net Adds',
                type: 'line',
                symbolSize: 8,
                smooth: false,
                lineStyle:{
                    normal:{
                        width: 2
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
                data: [23,27,31,37,30,18,25,22]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    EchartPie: function (id, data, color_) {
        var myChart = echarts.init(document.getElementById(id));

        var option = {
            series: [{
                type: 'pie',
                radius: ['90%', '100%'],
                data: [{
                    value: data,
                    //name: '占有率',
                    label: {
                        normal: {
                            formatter: '',
                            verticalAlign: 'middle',
                            position: 'center',
                            align: 'center',
                            textStyle: {
                                fontSize: 44,
                                color: '#484A52'
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: color_
                        },
                        emphasis: {
                            color: color_
                        }
                    },
                    hoverAnimation: false
                }, {
                    value: 100 - data,
                    //name: '占位',
                    label: {
                        /*normal: {
                         formatter: '\n完成率',
                         textStyle: {
                         color: '#555',
                         fontSize: 20
                         }
                         }*/
                    },
                    tooltip: {
                        show: false
                    },
                    itemStyle: {
                        normal: {
                            color: 'rgba(0,0,0,0)'
                        },
                        emphasis: {
                            color: 'rgba(0,0,0,0)'
                        }
                    },
                    hoverAnimation: false
                }]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    drawEchartPie2: function () {
        var myChart = echarts.init(document.getElementById('charts_2'));

        var option = {
            title: {
                text: 'End Base Package',
                textStyle:{
                    color:'#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top:'2%',
                left:'1%'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                show: false,
                orient: 'vertical',
                x: 'right',
                itemWidth: 14,
                itemHeight: 14,
                align: 'left',
                data:['Basic','Basic Plus','Sports Fan','Movies Fan','Deluxe'],
                textStyle: {
                    color: '#72788a'
                }
            },
            series: [
                {
                    name:'End Base Package',
                    type:'pie',
                    selectedMode: 'single',
                    selectedOffset: 10,
                    hoverAnimation: false,
                    legendHoverLink:false,
                    radius: ['75%', '76%'],
                    center: ['25%','50%'],
                    color: ['#169AFC', '#2ED3E1', '#45E0A4', '#EE9B4E','#675FF3'],
                    label: {
                        normal: {
                            position: 'inner'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    tooltip: {
                        show:false,
                    },
                    data:[
                        {value:20, name:''},
                        {value:30, name:''},
                        {value:10, name:''},
                        {value:15, name:''},
                        {value:25, name:''}
                    ]
                },
                {
                    name:'End Base Package',
                    type:'pie',
                    selectedMode: 'single',
                    selectedOffset: 10,
                    radius: ['42%', '55%'],
                    center: ['25%','50%'],
                    color: ['#169AFC', '#2ED3E1', '#45E0A4', '#EE9B4E','#675FF3'],
                    label: {
                        normal: {
                            show: false,
                            formatter: '{b}\n{d}%'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    itemStyle:{
                        normal:{
                            borderColor: '#fff',
                            borderWidth: 2
                        }
                    },
                    data:[
                        {value:20, name:'Basic'},
                        {value:30, name:'Basic Plus'},
                        {value:10, name:'Sports Fan'},
                        {value:15, name:'Movies Fan'},
                        {value:25, name:'Deluxe'}

                    ]
                }
            ]
        };

        myChart.on('mouseover',function (item) {
            console.log(item.dataIndex);
            option.series[0].data[item.dataIndex].selected = true;
            option.series[1].data[item.dataIndex].selected = true;
            myChart.setOption(option);
        });
        myChart.on('mouseout',function (item) {
            console.log(item.dataIndex);
            option.series[0].data[item.dataIndex].selected = false;
            option.series[1].data[item.dataIndex].selected = false;
            myChart.setOption(option);
        });

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart10: function () {
        var myChart = echarts.init(document.getElementById('charts_10'));

        var option = {
            color: [ '#0078FF', '#44D5DF'],
            title: {
                text: '',
                textStyle: {
                    color: '#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top: '2%',
                left: '1%'
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
                itemWidth: 15,
                itemHeight: 8,
                data: [{
                    name: 'Un-subscribers',
                    icon: 'rect'
                }, {
                    name: 'Subscribers',
                    icon: 'rect'
                }],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '30%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#69AFFF'
                    }
                },
                data: [
                    '3 days',
                    '7 days',
                    '14 days',
                    '30days',
                    '60days',
                    '90days'
                ]
            }],
            yAxis: [{
                type: 'value',
                name: '',
                max: 100,
                nameTextStyle: {
                    color: '#72788a',
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
                    formatter: '{value}%',
                    margin: 10,
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        color: '#F2F2F2',
                        type: 'dotted'
                    }
                }
            }],
            series: [{
                name: 'Un-subscribers',
                type: 'bar',
                barWidth: '20%',
                stack: 'value',
                label : {
                    normal:{
                        show:false,
                        position: 'outside',
                        formatter: '{c}',
                        textStyle : {
                            color:'#72788a',
                            fontSize:16,
                            fontFamily: 'akkR',
                            fontWeight: 'normal'
                        }
                    }
                },
                data: [
                    83,
                    60,
                    50,
                    30,
                    20,
                    15
                ]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart11: function () {
        var myChart = echarts.init(document.getElementById('charts_11'));

        var option = {
            color: [ '#0078FF', '#44D5DF'],
            title: {
                text: '',
                textStyle: {
                    color: '#282828',
                    fontSize: 20,
                    fontWeight: 'bold'
                },
                top: '2%',
                left: '1%'
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
                itemWidth: 15,
                itemHeight: 8,
                data: [{
                    name: 'Un-subscribers',
                    icon: 'rect'
                }, {
                    name: 'Subscribers',
                    icon: 'rect'
                }],
                top: '15%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '30%',
                left: '3%',
                right: '5%',
                bottom: '5%',
                containLabel: true
            },
            xAxis: [{
                type: 'category',
                boundaryGap: true,
                axisTick: {
                    show: false
                },
                axisLabel: {
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#69AFFF'
                    }
                },
                data: [
                    'JAN',
                    'FEB',
                    'MAR',
                    'APR',
                    'MAY'
                ]
            }],
            yAxis: [{
                type: 'value',
                name: 'GB',
                max: 25,
                nameTextStyle: {
                    color: '#72788a',
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
                    formatter: '{value}',
                    margin: 10,
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                splitLine: {
                    show: false,
                    lineStyle: {
                        color: '#F2F2F2',
                        type: 'dotted'
                    }
                }
            }],
            series: [{
                name: 'Un-subscribers',
                type: 'bar',
                barWidth: '20%',
                stack: 'value',
                label : {
                    normal:{
                        show:false,
                        position: 'outside',
                        formatter: '{c}',
                        textStyle : {
                            color:'#72788a',
                            fontSize:16,
                            fontFamily: 'akkR',
                            fontWeight: 'normal'
                        }
                    }
                },
                data: [
                    16,
                    13,
                    16,
                    21,
                    24
                ]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart12: function () {
        var myChart = echarts.init(document.getElementById('charts_12'));

        var option = {
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
                show: false,
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                show: true,
                orient: 'vertical',
                x: '70%',
                y: '40%',
                itemWidth: 14,
                itemHeight: 14,
                itemGap:25,
                align: 'left',
                data:['3/4G','Wifi'],
                textStyle: {
                    color: '#72788a'
                }
            },
            series: [
                {
                    name:'',
                    type:'pie',
                    selectedMode: 'single',
                    selectedOffset: 10,
                    hoverAnimation: false,
                    radius: ['35%', '45%'],
                    center: ['35%','50%'],
                    clockwise: false,
                    color: ['#0078FF', '#54E0A8'],
                    label: {
                        normal: {
                            show: true,
                            formatter: '{d}%'
                        }
                    },
                    labelLine: {
                        normal: {
                            show: true,
                            length: 0,
                            length2: 0
                        }
                    },
                    itemStyle:{
                        normal:{
                            borderColor: '#fff',
                            borderWidth: 3
                        }
                    },
                    data:[
                        {value:57.3, name:'3/4G'},
                        {value:42.7, name:'Wifi'}
                    ]
                }
            ]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    /*Echart2: function () {
     var myChart = echarts.init(document.getElementById('charts_2'));

     var option = {
     title: {
     text: 'End Base Package',
     textStyle: {
     color: '#282828',
     fontSize: 20,
     fontWeight: 'bold'
     },
     top: '2%',
     left: '1%'
     },
     tooltip: {
     trigger: 'item',
     formatter: "{a} <br/>{b}: {c} ({d}%)"
     },
     legend: {
     show: false,
     orient: 'vertical',
     x: 'right',
     itemWidth: 14,
     itemHeight: 14,
     align: 'left',
     data: ['Basic', 'Basic Plus', 'Sports Fan', 'Movies Fan', 'Deluxe'],
     textStyle: {
     color: '#72788a'
     }
     },
     series: [
     {
     name: 'End Base Package',
     type: 'pie',
     selectedMode: 'single',
     selectedOffset: 10,
     hoverAnimation: false,
     legendHoverLink: false,
     radius: ['75%', '76%'],
     center: ['25%', '50%'],
     color: ['#169AFC', '#2ED3E1', '#45E0A4', '#EE9B4E', '#675FF3'],
     label: {
     normal: {
     position: 'inner'
     }
     },
     labelLine: {
     normal: {
     show: false
     }
     },
     tooltip: {
     show: false,
     },
     data: [
     {value: 20, name: ''},
     {value: 30, name: ''},
     {value: 10, name: ''},
     {value: 15, name: ''},
     {value: 25, name: ''}
     ]
     },
     {
     name: 'End Base Package',
     type: 'pie',
     selectedMode: 'single',
     selectedOffset: 10,
     radius: ['42%', '55%'],
     center: ['25%', '50%'],
     color: ['#169AFC', '#2ED3E1', '#45E0A4', '#EE9B4E', '#675FF3'],
     label: {
     normal: {
     show: false,
     formatter: '{b}\n{d}%'
     }
     },
     labelLine: {
     normal: {
     show: false
     }
     },
     itemStyle: {
     normal: {
     borderColor: '#fff',
     borderWidth: 2
     }
     },
     data: [
     {value: 20, name: 'Basic'},
     {value: 30, name: 'Basic Plus'},
     {value: 10, name: 'Sports Fan'},
     {value: 15, name: 'Movies Fan'},
     {value: 25, name: 'Deluxe'}

     ]
     }
     ]
     };

     myChart.on('mouseover', function (item) {
     console.log(item.dataIndex);
     option.series[0].data[item.dataIndex].selected = true;
     option.series[1].data[item.dataIndex].selected = true;
     myChart.setOption(option);
     });
     myChart.on('mouseout', function (item) {
     console.log(item.dataIndex);
     option.series[0].data[item.dataIndex].selected = false;
     option.series[1].data[item.dataIndex].selected = false;
     myChart.setOption(option);
     });

     myChart.setOption(option);
     $(window).resize(function () {
     myChart.resize();
     });
     },
     Echart3: function () {
     var myChart = echarts.init(document.getElementById('charts_3'));

     var option = {
     color: ['#0078FF', '#2ED3E1'],
     title: {
     text: 'Gross And Net Adds',
     textStyle: {
     color: '#282828',
     fontSize: 20,
     fontWeight: 'bold'
     },
     top: '2%',
     left: '1%'
     },
     tooltip: {
     show: true,
     trigger: 'axis',
     axisPointer: {
     type: 'shadow'
     }
     },
     legend: {
     show: true,
     itemWidth: 16,
     itemHeight: 8,
     data: ['Net Adds', 'Churn'],
     top: '15%',
     right: '4%',
     textStyle: {
     fontSize: 12,
     color: '#8191b8'
     }
     },
     grid: {
     top: '27%',
     left: '3%',
     right: '5%',
     bottom: '5%',
     containLabel: true
     },
     xAxis: [{
     type: 'category',
     boundaryGap: false,
     axisTick: {
     show: false
     },
     axisLabel: {
     textStyle: {
     fontSize: 14,
     color: '#889eb2'
     }
     },
     axisLine: {
     show: true,
     lineStyle: {
     color: '#69AFFF'
     }
     },
     data: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC']
     }],
     yAxis: [{
     type: 'value',
     name: 'Unit',
     nameTextStyle: {
     color: '#72788a',
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
     formatter: '{value}',
     margin: 10,
     textStyle: {
     fontSize: 14,
     color: '#889eb2'
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
     name: 'Net Adds',
     type: 'line',
     symbolSize: 8,
     smooth: false,
     lineStyle: {
     width: 2
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
     data: [2400, 1600, 2700, 3000, 3200, 2800, 2300, 2000, 2300, 4000, 2000, 1700]
     }, {
     name: 'Churn',
     type: 'line',
     symbolSize: 8,
     smooth: false,
     lineStyle: {
     width: 2
     },
     areaStyle: {
     normal: {
     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
     offset: 0,
     color: 'rgba(47,211,225, 0.3)'
     }, {
     offset: 0.9,
     color: 'rgba(47,211,225, 0)'
     }], false),
     shadowColor: 'rgba(0, 0, 0, 0.1)',
     shadowBlur: 10
     }
     },
     data: [2400, 2900, 4500, 4000, 3500, 2100, 2700, 3200, 2700, 2700, 4000, 3000]
     }]
     };

     myChart.setOption(option);
     $(window).resize(function () {
     myChart.resize();
     });
     },
     Echart4: function () {
     var myChart = echarts.init(document.getElementById('charts_4'));

     var option = {
     color: ['#0078FF', '#2ED3E1'],
     title: {
     text: 'Revenue',
     textStyle: {
     color: '#282828',
     fontSize: 20,
     fontWeight: 'bold'
     },
     top: '2%',
     left: '1%'
     },
     tooltip: {
     show: true,
     trigger: 'axis',
     axisPointer: {
     type: 'shadow'
     }
     },
     legend: {
     show: true,
     itemWidth: 16,
     itemHeight: 8,
     data: ['Subscription', 'Transaction'],
     top: '15%',
     right: '4%',
     textStyle: {
     fontSize: 12,
     color: '#8191b8'
     }
     },
     grid: {
     top: '27%',
     left: '3%',
     right: '5%',
     bottom: '5%',
     containLabel: true
     },
     xAxis: [{
     type: 'category',
     boundaryGap: true,
     axisTick: {
     show: false
     },
     axisLabel: {
     textStyle: {
     fontSize: 14,
     color: '#889eb2'
     }
     },
     axisLine: {
     show: true,
     lineStyle: {
     color: '#69AFFF'
     }
     },
     data: ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC']
     }],
     yAxis: [{
     type: 'value',
     name: 'K$',
     nameTextStyle: {
     color: '#72788a',
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
     formatter: '{value}',
     margin: 10,
     textStyle: {
     fontSize: 14,
     color: '#889eb2'
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
     name: 'Subscription',
     type: 'bar',
     barGap: '-50%',
     itemStyle: {
     normal: {
     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
     offset: 0,
     color: 'rgba(11,125,255, 1)'
     }, {
     offset: 1,
     color: 'rgba(11,125,255, 0)'
     }], false),
     lineStyle: {
     normal: {
     width: 2
     }
     }
     }
     },
     data: [510, 530, 550, 620, 700, 750, 700, 600, 650, 800, 580, 600]
     }, {
     name: 'Subscription',
     type: 'line',
     symbolSize: 12,
     symbol: 'circle',
     smooth: false,
     itemStyle: {
     /!*normal: {
     color: 'rgb(41,204,117)',
     borderColor: 'rgba(41,204,117,0.27)',
     borderWidth: 12
     },*!/
     emphasis: {
     color: 'rgb(255,255,255)',
     borderColor: 'rgba(11,125,255,0.9)',
     borderWidth: 5
     }
     },
     emphasis: {
     itemStyle: {
     color: 'red',
     borderColor: 'red',
     borderWidth: 3
     }
     },
     data: [510, 530, 550, 620, 700, 750, 700, 600, 650, 800, 580, 600]
     }, {
     name: 'Transaction',
     type: 'bar',
     barGap: '-50%',
     itemStyle: {
     normal: {
     color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
     offset: 0,
     color: 'rgba(105,97,243, 1)'
     }, {
     offset: 1,
     color: 'rgba(105,97,243, 0)'
     }], false),
     lineStyle: {
     normal: {
     width: 2
     }
     }
     }
     },
     data: [550, 570, 590, 660, 740, 790, 740, 640, 690, 840, 620, 640]
     }]
     };

     myChart.setOption(option);
     $(window).resize(function () {
     myChart.resize();
     });
     }*/
};
