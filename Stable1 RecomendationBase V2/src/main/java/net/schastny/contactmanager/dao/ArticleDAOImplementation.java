package net.schastny.contactmanager.dao;

import java.util.ArrayList;
import java.util.List;

import net.schastny.contactmanager.domain.Article;
import net.schastny.contactmanager.domain.Author;
import net.schastny.contactmanager.domain.Category;
import net.schastny.contactmanager.domain.DevelopmentStage;
import net.schastny.contactmanager.domain.SoftwareType;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDAOImplementation implements ArticleDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public Integer addArticle(Article article) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(article);
		return article.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> listOfArticles() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Article").list();
	}

	
	@Override
	public void removeArticle(Integer idArticle) {
		// TODO Auto-generated method stub
		Article article = (Article) sessionFactory.getCurrentSession().load(Article.class, idArticle);
		if(article != null)
			sessionFactory.getCurrentSession().delete(article);
	}

	@Override
	public Article getArticle(Integer idArticle) {
		// TODO Auto-generated method stub
		return (Article) sessionFactory.getCurrentSession().get(Article.class, idArticle);
	}

	@Override
	public Category getCategory(Integer idCategory) {
		// TODO Auto-generated method stub
		return (Category) sessionFactory.getCurrentSession().get(Category.class, idCategory);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listOfCategories() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Category").list();
	}

	@Override
	public void updateArticle(Article article) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(article);
	}

	@Override
	public DevelopmentStage getDevelopmentStage(Integer idStage) {
		// TODO Auto-generated method stub
		return (DevelopmentStage) sessionFactory.getCurrentSession().get(DevelopmentStage.class, idStage);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DevelopmentStage> listOfStages() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from DevelopmentStage").list();
	}

	@Override
	public SoftwareType getSoftwareStage(Integer idType) {
		// TODO Auto-generated method stub
		return (SoftwareType) sessionFactory.getCurrentSession().get(SoftwareType.class, idType);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SoftwareType> listOfTypes() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from SoftwareType").list();
	}

	
	@Override
	public void addNewAuthor(Author author) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(author);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> listOfArticlesByParam(String name, int idCategory,
			int idType, int idStage) {
		// TODO Auto-generated method stub
		if(name.trim().length() != 0){
			return sessionFactory.getCurrentSession().createQuery("from Article where RECOM_TITLE = '" + name + "' AND CATEG_ID = " + idCategory + " AND SOFT_TYPE_ID = " + idType + "AND DEV_STAGE_ID =" +idStage).list();
		}
		else{
			return sessionFactory.getCurrentSession().createQuery("from Article where CATEG_ID = " + idCategory + " AND SOFT_TYPE_ID = " + idType + "AND DEV_STAGE_ID =" +idStage).list();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> getListOfAuthors() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Author").list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getRoles() {
		// TODO Auto-generated method stub
		List<String> buffer = new ArrayList<String>();
		buffer.add("ROLE_ADMIN");
		buffer.add("ROLE_STUDENT");
		buffer.add("ROLE_TEACHER");
		return buffer;//sessionFactory.getCurrentSession().createQuery("from Author").list();
	}

	@Override
	public void changeRole(int authorId, String role) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("update Author set AUTH_STATUS = '"+role+"'" + 
		" where auth_id = '"+authorId+"'");
		query.executeUpdate();
	}

	
	
}
