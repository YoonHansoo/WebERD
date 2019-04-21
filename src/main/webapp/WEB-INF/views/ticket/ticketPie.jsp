<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>


<script type="text/javascript">
window.onload = function() {
	
var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	exportEnabled: true,
	animationEnabled: true,
	theme: "dark2", // "light1", "dark1", "dark2"
	title: {
		text: "Visitor Demographics of a Website"
	},
	subtitles: [{
		text: "Age Groups of Visitors"
	}],
	data: [{
		type: "pie",
		yValueFormatString: "#,##0\"%\"",
		indexLabel: "{label} - {y}",
		dataPoints: dps[0]
	}]
});
 
var yValue;
var label;
 
<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">
	<c:forEach items="${dataPoints}" var="dataPoint">
		yValue = parseFloat("${dataPoint.y}");
		label = "${dataPoint.label}";
		dps[parseInt("${loop.index}")].push({
			label : label,
			y : yValue,
		});
	</c:forEach>
</c:forEach>
 
chart.render();
 
}
</script>