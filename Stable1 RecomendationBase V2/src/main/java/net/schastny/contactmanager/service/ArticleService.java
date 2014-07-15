package net.schastny.contactmanager.service;

import java.util.List;

import net.schastny.contactmanager.domain.Article;
import net.schastny.contactmanager.domain.Author;
import net.schastny.contactmanager.domain.Category;
import net.schastny.contactmanager.domain.DevelopmentStage;
import net.schastny.contactmanager.domain.SoftwareType;

public interface ArticleService {

	public Integer addArticle(Article article);
	
	public List<Article> listOfArticles();
	
	public List<Article> listOfArticlesByParam(String name, int idCategory, int idType, int idStage);
	
	public void removeArticle(Integer idArticle);
	
	public Article getArticle(Integer idArticle);
	
    public Category getCategory(Integer idCategory);
	
	public List<Category> listOfCategories();
	
	public DevelopmentStage getDevelopmentStage(Integer idStage);
	
	public List<DevelopmentStage> listOfStages();
	
	public  SoftwareType getSoftwareStage(Integer idType);
	
	public List<SoftwareType> listOfTypes();
	
	public void updateArticle(Article article);
	
	public void addNewAuthor(Author author);
	
	public List<Author> getListOfAuthors();
	
	public List<String> getRoles();
	
	public void changeRole(int authorId, String role);
	
}
