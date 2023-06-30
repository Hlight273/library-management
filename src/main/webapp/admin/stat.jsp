<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/header.jsp"%>
<input type="hidden" value="${countStat}" id="countStat">
<input type="hidden" value="${awardStat}" id="awardStat">
<script src="<c:url value="/js/echarts.js"/>"></script>
<div class="content">

    <!-- Page Left Sidebar
        ================================================== -->
    <div class="span3 sidebar page-left-sidebar"><!-- Begin sidebar column -->
        <!--Latest News-->
        <h5 class="title-bg">Latest News</h5>
        <ul class="popular-posts">
            <li>
                <a href="#"><img src="${ctx}/image/1.jpg" alt="Popular Post" /></a>
                <h6><a href="#">Lorem ipsum dolor sit amet consectetur adipiscing elit</a></h6>
                <em>Posted on 09/01/15</em>
            </li>
        </ul>

        <!--Testimonials-->
        <h5 class="title-bg">Testimonials</h5>

        <p class="quote-text side">"设计提升的不仅仅是思维，也有对艺术欣赏的美感，而这种美感在世俗之中常常是被忽略的"<cite> -------Yang.Mr </cite></p>

        <p class="quote-text side">"我们可能不是一个好的创新者，但绝对是一个好的聆听者和执行者。"<cite> -------Cai.Mr </cite></p>

        <!--Progress Bars-->
        <h5 class="title-bg">Progress Bars</h5>
        <div class="progress progress-info progress-striped">
            <div class="bar" style="width: 20%"></div>
        </div>
        <div class="progress progress-success progress-striped">
            <div class="bar" style="width: 40%"></div>
        </div>
        <div class="progress progress-warning progress-striped">
            <div class="bar" style="width: 60%"></div>
        </div>
        <div class="progress progress-danger progress-striped">
            <div class="bar" style="width: 80%"></div>
        </div>
    </div><!-- End sidebar column -->

    <!-- Page Content
    ================================================== -->
    <div class="span6"><!--Begin page content column-->
        <div id="sheet1" class="sheet" style="width: 800px;height: 290px"></div>
        <div id="sheet2" class="sheet" style="width: 800px;height: 290px"></div>

    </div> <!--End page content column-->

</div>
<style>
    .content {
        min-width: 1200px;
    }
    .sheet{
        min-width: 1000px;
        height: 290px;
    }
    .content .sheet{
        border: 1px solid darkgrey;
        margin:100px auto;
        padding: 20px;
        justify-content:center;
        flex-flow:wrap;
    }
    .span6{
        margin-top: 100px;
        margin-left: 100px;
    }
</style>
<script type="text/javascript">
    //对象数组
    let countStat = [], cs = $('#countStat').val()
    if(cs !== '[]') countStat = getObj(cs)
    let awardStat = [], as = $('#awardStat').val()
    if(as !== '[]') awardStat = getObj(as)
    console.log(awardStat)
    //公用配置
    let widthScale = '30%'
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
                barWidth: widthScale,
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
                barWidth: widthScale,
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
<%--<%@ include file="/footer.jsp"%>--%>
