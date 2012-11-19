package be.scouts.beurs.admin;

import java.util.List;

import be.scouts.beurs.IDrankService;
import be.scouts.beurs.data.DrankData;


public class BeursAdminController {

	private IDrankService drankService;
	
	public BeursAdminController() {
	}
	
	public void setDrankService(IDrankService drankService){
		this.drankService = drankService;
	}
	
	
	public AdminData init(){
		AdminData data = new AdminData();
		data.setDrinks(drankService.getAllDrinks());
		return data;
	}

	
	public String updateDb(AdminData data){
		List<DrankData> drinks = data.getDrinks();
		System.out.println("TODO update prices");
		System.out.println(drinks.get(0).getName());
		System.out.println(drinks.get(0).getAmount());
		System.out.println(drinks.get(0).getSubtotal());
		updatePrice(data);
		drankService.upDataDrinks(drinks);
		return "done";
	}
	
	private void updatePrice(AdminData data){
		for(DrankData drank : data.getDrinks()){
			float price = BeursUtils.FromStringToFloat(drank.getCurrentPrice());
			price += 0.50;
			drank.setCurrentPrice(BeursUtils.FromFloatToString(price));
		}
	}
	
	
}
