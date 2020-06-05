$(()=>{
    var insert = new Inserts();
    var dataline2 = [15,20,31,32,50];
    var dataline8 = [15,20,31,32,48];
    var dataline9 = [15,20,32,30,41];
    setTimeout(()=>{
        insert.Echart1();
        insert.Echart2('line2',dataline2,'60');
        insert.Echart2('line8',dataline8,'50');
        insert.Echart2('line9',dataline9,'50');
        insert.Echart3('line3','35','#087cff');
        insert.Echart3('line4','30','#54e0a8');
        insert.Echart3('line5','21','#44d5df');
        insert.Echart3('line6','9','#fec53f');
        insert.Echart3('line7','5','#675ff3');
    },200);
});
var Inserts = function () {};

Inserts.prototype={
  constructor:Inserts,
  init:function () {
  },
    Echart1:()=>{
      var myChart = echarts.init(document.getElementById('line1'));
      console.log(myChart);
      var  option = {
          tooltip: {
              trigger: 'axis',
              axisPointer: {
                  type: 'shadow',
                  textStyle: {
                      color: '#fff'
                  }
              },
          },
          grid: {
              borderWidth: 0,
              left:'3%',
              top: '15%',
              bottom: '8%',
              right:'5%',

          },
          legend: {
              right: '5%',
              top: '8%',
              data: ['HBO','FOX','CCTV', 'BBC World']
          },
          xAxis: [
              {
                  type: "category",
                  axisLine: {
                      lineStyle: {
                          color: '#1080ff'
                      }
                  },
                  splitLine: {
                      show: false
                  },
                  axisTick: {
                      show: false
                  },
                  splitArea: {
                      show: false
                  },
                  axisLabel: {
                      color:'#767c8d',
                      interval: 0,
                      textStyle: {
                          fontSize: 14,
                          color: '#72788a'
                      }
                  },

                  data: ['02:00','04:00','06:00','08:00','10:00','12:00','14:00','16:00','18:00','20:00','22:00','24:00']
              }
          ],
          yAxis: [{
              type: 'value',
              min:0,
              max:1.0,
              interval: 0.2,
              splitLine: {
                  show: false
              },
              axisLine: {
                  show:false
              },
              axisTick: {
                  show: false
              },
              axisLabel: {
                  color:'#767c8d',
                  interval: 0,
                  textStyle: {
                      fontSize: 14,
                      color: '#72788a'
                  }
              },
              splitArea: {
                  show: false
              },

          }],

          series: [
              {
                  name:'HBO',
                  type: "line",
                  zlevel:3,
                  symbolSize:10,
                  symbol:'emptyCircle',
                  itemStyle: {
                      normal: {
                          color: "#44D5DF",
                      }
                  },
                  areaStyle: {
                      normal: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                              offset: 0,
                              color: 'rgba(220, 247, 249, 1)'
                          }, {
                              offset: 0.8,
                              color: 'rgba(220, 247, 249, 0)'
                          }], false),
                          shadowColor: 'rgba(0, 0, 0, 0.1)',
                          shadowBlur: 10
                      }
                  },
                  data:[0.54,0.48,0.6,0.83,0.56,0.58,0.43,0.83,0.35,0.45,0.65,0.42]
              },
              {
                  name:'FPX',
                  type: "line",
                  zlevel:3,
                  symbolSize:10,
                  symbol:'emptyCircle',
                  itemStyle: {
                      normal: {
                          color: "#54E0A8",
                      }
                  },
                  areaStyle: {
                      normal: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                              offset: 0,
                              color: 'rgba(223, 249, 239, 1)'
                          }, {
                              offset: 0.8,
                              color: 'rgba(223, 249, 239, 0)'
                          }], false),
                          shadowColor: 'rgba(0, 0, 0, 0.1)',
                          shadowBlur: 10
                      }
                  },
                  data:[0.75,0.4,0.75,0.42,0.7,0.4,0.8,0.65,0.67,0.72,0.58,0.67]
              },
              {
                  name: "CCTV",
                  type: "line",
                  zlevel:3,
                  symbolSize:10,
                  symbol:'emptyCircle',
                  itemStyle: {
                      normal: {
                          color: "#077bff",
                      }
                  },
                  areaStyle: {
                      normal: {
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                              offset: 0,
                              color: 'rgba(206, 229, 255, 1)'
                          }, {
                              offset: 0.8,
                              color: 'rgba(206, 229, 255, 0)'
                          }], false),
                          shadowColor: 'rgba(0, 0, 0, 0.1)',
                          shadowBlur: 10
                      }
                  },
                  data:[0.6,0.78,0.42,0.58,0.82,0.35,0.58,0.43,0.85,0.58,0.43,0.8]
              },
              {
                  name: "BBC World",
                  type: "bar",
                  zlevel:4,
                  barMaxWidth: 20,
                  barGap: "10%",
                  itemStyle: {
                      normal: {
                          color: "#087cff",
                      }
                  },
                  data:[0.15,0.18,0.21,0.3,0.18,0.21,0.38,0.17,0.21,0.38,0.2,0.16]
              }

          ]
      };
        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart2:(id,line_,data)=>{
        var myChart = echarts.init(document.getElementById(id));
        console.log(myChart);
        var  option = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    textStyle: {
                        color: '#fff'
                    }
                },
            },
            grid: {

                borderWidth: 1,
                left:'4%',
                top: '20%',
                bottom: '15%',
                right:'3%',
            },
            legend: {
                right: '8%',
                top: '1%',
                bottom:'8%',
                data: ['VOD', 'Live Channel']
            },
            xAxis: [
                {
                    type: "category",
                    axisLine: {
                        lineStyle: {
                            color: '#1080ff'
                        }
                    },
                    splitLine: {
                        show: false
                    },
                    axisTick: {
                        show: false
                    },
                    splitArea: {
                        show: false
                    },
                    axisLabel: {
                        color:'#767c8d',
                        interval: 0,
                        textStyle: {
                            fontSize: 14,
                            color: '#72788a'
                        }
                    },

                    data: ['JAN','FEB','MAR','APR','MAY']
                }
            ],
            yAxis: [{
                type: 'value',
                min:0,
                max:data,
                interval: 10,
                splitLine: {
                    show: false
                },
                axisLine: {
                    show:false
                },
                axisTick: {
                    show: false
                },
                axisLabel: {
                    color:'#767c8d',
                    interval: 0,
                    textStyle: {
                        fontSize: 14,
                        color: '#72788a'
                    }
                },
                splitArea: {
                    show: false
                },

            }],
            series: [
                {
                    name: "VOD",
                    type: "line",
                    zlevel:3,
                    symbolSize:10,
                    symbol:'emptyCircle',
                    itemStyle: {
                        normal: {
                            color: "#44D5DF",
                        }
                    },
                    areaStyle: {
                        normal: {
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                offset: 0,
                                color: 'rgba(206, 229, 255, 1)'
                            }, {
                                offset: 0.8,
                                color: 'rgba(206, 229, 255, 0)'
                            }], false),
                            shadowColor: 'rgba(0, 0, 0, 0.1)',
                            shadowBlur: 10
                        }
                    },
                    data:line_
                },
                {
                    name: "Live Channel",
                    type: "bar",
                    zlevel:4,
                    barMaxWidth: 20,
                    barGap: "10%",
                    itemStyle: {
                        normal: {
                            color: "#087cff",
                        }
                    },
                    data:[10,5,10,11,30]
                }

            ]
        };
        myChart.setOption(option);
        $(window).resize(function () {
            myChart.resize();
        });
    },
    Echart3:(id,sum,color_)=>{
        var myChart = echarts.init(document.getElementById(id));
        console.log(myChart);
        var option = {
            series: [{
                type: 'pie',
                radius: ['67%', '75%',],
                data: [{
                    value: sum,
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
                    value: 100 - sum,
                    // name: '占位',
                    label: {
                       /* normal: {
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
