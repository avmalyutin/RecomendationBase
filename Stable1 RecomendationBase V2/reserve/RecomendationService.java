package net.schastny.contactmanager.service;

import java.util.List;

import net.schastny.contactmanager.domain.Recomendation;

public interface RecomendationService {

	
public Integer addRecomendation(Recomendation recomendation);
	
	public List<Recomendation> listOfRecomendations();
	
	public Recomendation getRecomandation(Integer idRecomendation);
	
	
	
	
}
