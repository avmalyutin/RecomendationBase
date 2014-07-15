package net.schastny.contactmanager.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import net.schastny.contactmanager.domain.Recomendation;

public class RecomendationDAOImplementation implements RecomendationDAO{

	
	//@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public Integer addRecomendation(Recomendation recomendation) {
		sessionFactory.getCurrentSession().save(recomendation);
		return recomendation.getRecom_id();
	}

	@Override
	public List<Recomendation> listOfRecomendations() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Recomendation").list();
	}

	@Override
	public Recomendation getRecomandation(Integer idRecomendation) {
		// TODO Auto-generated method stub
		return (Recomendation) sessionFactory.getCurrentSession().get(Recomendation.class, idRecomendation);
	}

}
