$(()=> {
    var inesat = new port();
    setTimeout(function () {
        inesat.echart1('charts_1');
        inesat.echart2('charts_2');
        inesat.echart3('charts_3');
        inesat.echart4('charts_4_1','21','#429AFD');
        inesat.echart4('charts_4_2','21','#20C968');
        inesat.echart4('charts_4_3','21','#429AFD');
        inesat.echart4('charts_4_4','21','#20C968');
        inesat.echart5('charts_5_1','70','#429AFD');
        inesat.echart5('charts_5_2','60','#FFC62C');
        inesat.echart5('charts_5_3','60','#20C968');
    },100);
});


var port = function () {

};
port.prototype= {
    echart1: (id)=> {
        var myChart = echarts.init(document.getElementById(id));
        var option = {
            color:['#349CE5'],
            title: {
                text: '出行人数年份',
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
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                show:false,
                icon: 'circle',
                itemWidth: 6,
                itemHeight: 6,
                itemGap: 13,
                data: ['$12+$8'],
                top: '8%',
                right: '4%',
                textStyle: {
                    fontSize: 12,
                    color: '#8191b8'
                }
            },
            grid: {
                top: '20%',
                left: '3%',
                right: '3%',
                bottom: '3%',
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
                        color:'#889eb2'
                    }
                },
                axisLine: {
                    show:false,
                    lineStyle: {
                        color: '#889eb2'
                    }
                },
                data: ['2019.06','2019.07','2019.08','2019.09','2019.10','2019.11','2019.12','2020.01','2020.02','2020.03','2020.04']
            }],
            yAxis: [{
                type: 'value',
                name: '总人数 (K)',
                nameTextStyle:{
                    color:'#889eb2',
                    fontSize: 14
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
                type: 'line',
                symbolSize: 8,
                lineStyle:{
                    normal:{
                        width: 4,
                        shadowOffsetY: 15,
                        shadowBlur: 5,
                        shadowColor: '#E3ECFA'
                    }
                },
                itemStyle:{
                    normal:{
                        borderColor: '#349CE5',
                        borderWidth: 3
                    }
                },
                data: [25,60,70,85,95,120,125,160,170,180,240]
            },{
                type: 'bar',
                barWidth: '80%',
                itemStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0.2,
                            color: 'rgba(53,156,229, 0)'
                        }, {
                            offset: 0.8,
                            color: 'rgba(53,156,229, 0.3)'
                        }], false)
                    }
                },
                data: [25,60,70,85,95,120,125,160,170,180,240]
            }]
        };
        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
},
    echart2: (id)=> {
        var myChart = echarts.init(document.getElementById(id));

        var option = {
            color:['#429AFD','#43B3E0','#20C968','#FFC62C','#F9A71B'],
            title: {
                text: "每单消费(￥)",
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
                data: [">2000", "1500-2000", "1000-1500", "500-1000", "<500"],
                width: '100%',
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
                    name: ">2000",

                }, {
                    value: 25.4,
                    name: "1500-2000",

                }, {
                    value: 9.8,
                    name: "<500",
                }, {
                    value: 8.6,
                    name: "1000-1500",

                }, {
                    value: 7.6,
                    name: "500-1000",

                }]
            }]
        };
        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    echart3: (id)=> {
        var myChart = echarts.init(document.getElementById(id));
        console.log(11)
        var option = {
            color: ['#429AFD'],
            title: {
                // text: "Terminal Type Distribution",
                textStyle:{
                    color:'#3f414c',
                    fontSize: 20,
                    fontWeight: 'normal'
                },
                top:'2%',
                left:'1%'
            },
            /* grid:{
               top: '20%',
               bottom: '10%',
               left: '10%',
               right: '10%'
             },*/
            tooltip: {},
            backgroundColor: '#fff',
            radar: {
                // shape: 'circle',
                indicator: [
                    { name: 'Tablet,25%', max: 50},
                    { name: 'STB,31%', max: 50},
                    { name: 'Smartphone,35%', max: 50},
                    { name: 'Website,9%', max: 50}
                ],
                splitNumber: 5,
                center: ['50%','55%'],
                radius: 80,
                name: {
                    formatter:'{value}',
                    textStyle: {
                        fontSize:14,
                        color:'#8490A0'
                    }
                },
                splitArea: {
                    areaStyle: {
                        color: ['rgba(200,228,248, 1)',
                            'rgba(200,228,248, 1)', 'rgba(200,228,248, 0)',
                            'rgba(0, 0, 0, 0)', 'rgba(0, 0, 0, 0)'],
                        shadowColor: 'rgba(255, 255, 255, 1)',
                        shadowBlur: 40
                    }
                },
                axisLine: {
                    lineStyle: {
                        color: '#43A3E7'
                    }
                },
                splitLine: {
                    lineStyle: {
                        color: '#43A3E7',
                    }
                }
            },
            series: [{
                type: 'radar',
                symbolSize: 0,
                areaStyle: {
                    normal: {
                        color: '#429AFD',
                        opacity: 1
                    }
                },
                data : [
                    {
                        name: 'Terminal Type Distribution',
                        value : [25, 31, 35, 9]
                    }
                ]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    echart4: (id, sum, color)=> {
        var myChart = echarts.init(document.getElementById(id));
        var option = {
            series: [{
                type: 'pie',
                radius: ['90%', '100%'],
                data: [{
                    value: sum,
                    //name: '占有率',
                    label: {
                        normal: {
                            formatter: '{d}%',
                            verticalAlign: 'middle',
                            position: 'center',
                            align: 'center',
                            textStyle: {
                                fontSize: 20,
                                color:'#59646F'
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: color
                        },
                        emphasis: {
                            color: color
                        }
                    },
                    hoverAnimation: true
                }, {
                    value: 100 - sum,
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
                    hoverAnimation: true
                }]
            }]
        };

        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    echart5: (id, sumber, colors)=> {
        var myChart = echarts.init(document.getElementById(id));
        console.log(13);
        var option = {
            series: [{
                type: 'pie',
                radius: ['90%', '100%'],
                data: [{
                    value: sumber,
                    //name: '占有率',
                    label: {
                        normal: {
                            formatter: '{d}%',
                            verticalAlign: 'middle',
                            position: 'center',
                            align: 'center',
                            textStyle: {
                                fontSize: 20,
                                color: colors
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: colors
                        },
                        emphasis: {
                            color: colors
                        }
                    },
                    hoverAnimation: false
                }, {
                    value: 100 - sumber,
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
    }
};
