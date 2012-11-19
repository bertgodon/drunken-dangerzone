package be.scouts.beurs.repo;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import be.scouts.beurs.IDrankService;
import be.scouts.beurs.data.DrankData;

public class JdbcDrankRepo implements IDrankService {

	private JdbcTemplate jdbcTemplate;
	public JdbcDrankRepo(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<DrankData> getAllDrinks() {
		Datahandler dhl = new Datahandler();
		return (List<DrankData>) jdbcTemplate.query("select * from DrankTable", dhl);
	}

	@Override
	public void upDataDrinks(List<DrankData> drinks) {
		for(DrankData drankje : drinks){
			updateRow(drankje.getName(), drankje.getCurrentPrice());	
		}
	}
	
	private void updateRow(String name, String newPrice){
		StringBuilder sql = new StringBuilder();
		sql.append("update DrankTable set currentPrice = '");
		sql.append(newPrice);
		sql.append("' where name = '");
		sql.append(name);
		sql.append("'");
		jdbcTemplate.execute(sql.toString());
	}
	
	@Override
	public DrankData getDrinkbyName(String name) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from DrankTable where name ='");
		sql.append(name);
		sql.append("'");
		return (DrankData) jdbcTemplate.queryForObject(sql.toString(), DrankData.class);
	}

}
