package be.scouts.beurs;

import java.util.List;

import be.scouts.beurs.data.DrankData;

public interface IDrankService {

	List<DrankData> getAllDrinks();
	
	void upDataDrinks(List<DrankData> drinks);
	
	DrankData getDrinkbyName(String name);
}
