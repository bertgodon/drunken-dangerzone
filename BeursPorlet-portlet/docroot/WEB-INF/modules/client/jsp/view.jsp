<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<script type="text/javascript">
	$(document).ready(function() {
		$('.refresh').click(function(){
		    location.reload();
		});		
	});
</script>

<portlet:defineObjects />

<div class="beursAdmin">
	<div>
		<h1>Overzicht van de prijzen in de beurs</h1>
	</div>
	<div class="listofdrinks">
		<c:forEach items="${drinks}" var="drink" varStatus="counter">
			<div class="drink">
				<div class="picture  ${drink.name}"></div>
				<div class="name">${drink.name}</div>
				<div class="price">${drink.currentPrice}  &#8364;</div>
			</div>
		</c:forEach>
		<div class="drink">
			<div class="picture empty"></div>
		</div>	
		<div class="drink">
			<div class="picture  empty"></div>
		</div>
		<div class="drink">
			<div class="picture  empty"></div>
		</div>
	</div>
	<input type="button" class="refresh mobile" value="Prijzen vernieuwen"/>
</div>