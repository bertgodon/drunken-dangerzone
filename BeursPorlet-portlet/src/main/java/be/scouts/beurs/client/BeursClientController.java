package be.scouts.beurs.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import be.scouts.beurs.IDrankService;
import be.scouts.beurs.data.DrankData;

public class BeursClientController {
	private IDrankService drankService;
	
	public BeursClientController() {
	}
	
	public void setDrankService(IDrankService drankService){
		this.drankService = drankService;
	}
	
	@RenderMapping
	public ModelAndView handleRenderRequest(RenderRequest request, RenderResponse response) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<DrankData> drinks = drankService.getAllDrinks();
		model.put("drinks", drinks);
		return new ModelAndView("view", model);
	}
}
