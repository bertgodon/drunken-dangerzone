<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.refresh').click(function(){
			getNewData();
		});	
		var timerId = setInterval(function() {
			getNewData();
		}, 1000); // 1000 makes this code execute every 1 second
	});
	function getNewData(){
		var url = '<portlet:resourceURL id="drinks" />';
		$.getJSON(url, function(data){
			updatePrice(data);
		});
	}
	function updatePrice(data){
		for(index in data){
			$('.drink').each(function(){
				if($(this).children('.name').html() == data[index].name){
					$(this).children('.price').html(data[index].currentPrice);
				}
			});
		}
	}
</script>

<portlet:defineObjects />

<div class="beursAdmin">
	<div>
		<h1>Overzicht van de prijzen in de beurs</h1>
	</div>
	<div class="listofdrinks">
		<c:forEach items="${drinks}" var="drink">
			<div class="drink">
				<div class="picture  ${drink.name}"></div>
				<div class="name">${drink.name}</div>
				<div class="price">${drink.currentPrice}  &#8364;</div>
			</div>
		</c:forEach>
	</div>
		<input type="button" class="refresh" value="Prijzen vernieuwen"/>
	
</div>