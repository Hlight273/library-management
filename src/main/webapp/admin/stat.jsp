<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<input type="hidden" value="${countStat}" id="countStat">
<input type="hidden" value="${awardStat}" id="awardStat">
<script src="<c:url value="/js/echarts.js"/>"></script>
<div id="sheet1" style="width: 600px;height:400px;"></div>
<div id="sheet2" style="width: 600px;height:400px;"></div>
<script type="text/javascript">
    //对象数组
    let countStat = getObj($('#countStat').val())
    let awardStat = getObj($('#awardStat').val())

    console.log(awardStat)

    var countChart = echarts.init(document.getElementById('sheet1'));
    var countOption = {
        title: {
            text: '竞赛参与总数统计'
        },
        tooltip: {},
        legend: {
            data: ['参与次数']
        },
        xAxis: {
            data: countStat.map(x => {return x.userName})
        },
        yAxis: [
            {
                type: 'value',
                name: '参与次数',
                min: 0,
                position: 'left',
                axisLabel: {
                    formatter: '{value} 个'
                }
            }
        ],
        series: [
            {
                name: '参与数',
                type: 'bar',
                barWidth: "40%",
                data: countStat.map(x => {return x.applyCount})
            }
        ]
    };
    countChart.setOption(countOption);

    var awardChart = echarts.init(document.getElementById('sheet2'));
    var awardOption = {
        title: {
            text: '获奖总数统计(不含参与奖)'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: { type: 'cross' }
        },
        legend: {
            data: ['获奖总数']
        },
        xAxis: [{
            type: 'category',
            axisTick: {alignWithLabel: true},
            data: awardStat.map(x => {return x.userName})
        }],
        yAxis: [
            {
                type: 'value',
                name: '获奖数',
                min: 0,
                position: 'left',
                axisLabel: {formatter: '{value} 次' }
            }
        ],
        series: [
            {
                name: '获奖数',
                type: 'bar',
                barWidth: "40%",
                data: awardStat.map(x => {return x.awardCount})
            }
        ]
    };
    awardChart.setOption(awardOption);

    //封装一个函数，将从el表达式拿到的字符串，转换成一个对象，因为方便获取属性
    function getObj(str) {
        let arr1=[], arr2=[], arr3=[];
        let str1=str.replace("'","").replace("'","");
        arr1=str1.split("},");
        for(let i=0;i<arr1.length;i++){
            arr2=arr1[i].split("{")[1].split(", ");
            let obj={};
            for(let j=0;j<arr2.length;j++){
                let key=arr2[j].split("=")[0];
                obj[key]=arr2[j].split("=")[1];
            }
            arr3[i]=obj;
        }
        return arr3;
    }

</script>
<%@ include file="/footer.jsp"%>
