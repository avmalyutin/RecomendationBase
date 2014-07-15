package net.schastny.contactmanager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.schastny.contactmanager.dao.ArticleDAO;
import net.schastny.contactmanager.domain.Article;
import net.schastny.contactmanager.domain.Author;
import net.schastny.contactmanager.domain.Category;
import net.schastny.contactmanager.domain.DevelopmentStage;
import net.schastny.contactmanager.domain.SoftwareType;


@Service
public class ArticleServiceImplementation implements ArticleService{

	@Autowired
	private ArticleDAO articleDAO;
	
	@Transactional
	@Override
	public Integer addArticle(Article article) {
		// TODO Auto-generated method stub
		return articleDAO.addArticle(article);
	}

	@Transactional
	@Override
	public List<Article> listOfArticles() {
		// TODO Auto-generated method stub
		return articleDAO.listOfArticles();
	}

	@Transactional
	@Override
	public void removeArticle(Integer idArticle) {
		// TODO Auto-generated method stub
		articleDAO.removeArticle(idArticle);
	}

	@Transactional
	@Override
	public Article getArticle(Integer idArticle) {
		// TODO Auto-generated method stub
		return articleDAO.getArticle(idArticle);
	}

	@Transactional
	@Override
	public Category getCategory(Integer idCategory) {
		// TODO Auto-generated method stub
		return articleDAO.getCategory(idCategory);
	}

	@Transactional
	@Override
	public List<Category> listOfCategories() {
		// TODO Auto-generated method stub
		return articleDAO.listOfCategories();
	}

	@Transactional
	@Override
	public void updateArticle(Article article) {
		// TODO Auto-generated method stub
		articleDAO.updateArticle(article);
	}

	@Transactional
	@Override
	public DevelopmentStage getDevelopmentStage(Integer idStage) {
		// TODO Auto-generated method stub
		return articleDAO.getDevelopmentStage(idStage);
	}

	@Transactional
	@Override
	public List<DevelopmentStage> listOfStages() {
		// TODO Auto-generated method stub
		return articleDAO.listOfStages();
	}

	@Transactional
	@Override
	public SoftwareType getSoftwareStage(Integer idType) {
		// TODO Auto-generated method stub
		return articleDAO.getSoftwareStage(idType);
	}

	@Transactional
	@Override
	public List<SoftwareType> listOfTypes() {
		// TODO Auto-generated method stub
		return articleDAO.listOfTypes();
	}

	@Transactional
	@Override
	public void addNewAuthor(Author author) {
		// TODO Auto-generated method stub
		articleDAO.addNewAuthor(author);
	}

	@Transactional
	@Override
	public List<Article> listOfArticlesByParam(String name, int idCategory,
			int idType, int idStage) {
		// TODO Auto-generated method stub
		return articleDAO.listOfArticlesByParam(name, idCategory, idType, idStage);
	}

	@Transactional
	@Override
	public List<Author> getListOfAuthors() {
		// TODO Auto-generated method stub
		return articleDAO.getListOfAuthors();
	}

	@Transactional
	@Override
	public List<String> getRoles() {
		// TODO Auto-generated method stub
		return articleDAO.getRoles();
	}

	@Transactional
	@Override
	public void changeRole(int authorId, String role) {
		// TODO Auto-generated method stub
		articleDAO.changeRole(authorId, role);
	}
	
}
