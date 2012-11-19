<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="view-js.jsp" %>
<portlet:defineObjects />

<form method="POST" action="${flowExecutionUrl}" >
	<input type="hidden" name="_eventId" value="submit" />
	<div class="beursAdmin">
		<div>
			<h1>Welkom admin, Selecteer hier u dranken</h1>
		</div>
		<div class="drinksContent">
			<div class="row">
				<div class="name title">
					Naam
				</div>
				<div class="price title">
					Prijs
				</div>
				<div class="buttons title"></div>
				<div class="aantal title">
					Aantal
				</div>
				<div class="subtotaal title">
					Subtotaal
				</div>
			</div>
			<c:forEach items="${applData.drinks}" var="drink" varStatus="counter">
				${counter.count - 1}
				<div class="row">
					<div class="price">${drink.currentPrice}</div>
					<div class="name">${drink.name}</div>
					<div class="buttons">
						<input class="buttonOne" type="button" value="+1" />
						<input class="buttonFive" type="button" value="+5" />
						<input class="buttonTen" type="button" value="+10" />
					</div>
					<div class="aantal"><input class="subtotalAmount number" type="text" value="0" name="drinks[${counter.count - 1}].amount"/></div>
					<div class="subtotaal"><input class="subtotalPrice money" type="text" value="0"  name="drinks[${counter.count - 1}].subtotal"/></div>
				</div>
			</c:forEach>
			<div class="row">
				<div class="totaal">
					<p>Totaal: </p><input type="text" value="0.00" class="absoluutTotal money" name="totalAmount" />
					<input type="submit" name="verzenden" value="verzenden" />
					<input type="button" class="button reset" value="clear All" />
				</div>
			</div>
		</div>
	</div>
</form>