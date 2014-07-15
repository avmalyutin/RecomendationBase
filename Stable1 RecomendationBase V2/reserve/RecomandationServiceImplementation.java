package net.schastny.contactmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.contactmanager.dao.ArticleDAO;
import net.schastny.contactmanager.dao.RecomendationDAO;
import net.schastny.contactmanager.domain.Article;
import net.schastny.contactmanager.domain.Recomendation;


@Service
public class RecomandationServiceImplementation implements RecomendationService{

	@Autowired
	private RecomendationDAO recomandationDAO;

	@Transactional
	@Override
	public Integer addRecomendation(Recomendation recomendation) {
		// TODO Auto-generated method stub
		return recomandationDAO.addRecomendation(recomendation);
	}

	
	@Transactional
	@Override
	public List<Recomendation> listOfRecomendations() {
		// TODO Auto-generated method stub
		return recomandationDAO.listOfRecomendations();
	}

	
	@Transactional
	@Override
	public Recomendation getRecomandation(Integer idRecomendation) {
		// TODO Auto-generated method stub
		return recomandationDAO.getRecomandation(idRecomendation);
	}
	
	
}