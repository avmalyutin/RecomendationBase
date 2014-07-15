package net.schastny.contactmanager.dao;

import java.util.List;

import net.schastny.contactmanager.domain.Recomendation;

public interface RecomendationDAO {

	
	public Integer addRecomendation(Recomendation recomendation);
	
	public List<Recomendation> listOfRecomendations();
	
	public Recomendation getRecomandation(Integer idRecomendation);
	

}
