package net.schastny.contactmanager.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.servlet.http.HttpServletRequest;

import net.malyutin.contactmanager.json.ArticleFullJSON;
import net.malyutin.contactmanager.json.ArticlesFromListJSON;
import net.schastny.contactmanager.domain.Article;
import net.schastny.contactmanager.domain.Author;
import net.schastny.contactmanager.domain.Category;
import net.schastny.contactmanager.domain.DevelopmentStage;
import net.schastny.contactmanager.domain.SoftwareType;
import net.schastny.contactmanager.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArticleController {

	
	@Autowired
	private ArticleService articleService;
	
	
	//функция перехода на страницу создания новой рекомендации
	@RequestMapping(value={"/newarticle","/newarticle/"}, method = {RequestMethod.POST, RequestMethod.GET })
	public String goToArticleCreation(@ModelAttribute("article") Article article, BindingResult result, Map<String, Object> map){
				
		//вернуть данные о существующих категориях
        map.put("categoriesList",  articleService.listOfCategories());
        map.put("typesList", articleService.listOfTypes());
        map.put("stagesList", articleService.listOfStages());
        
        //маппим данные о пользователе, который сейчас в системе
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
        
		return "newarticle";
	}
	
	
	/*
	Функция которая вызывается на странице newarticle.jsp, при добавлении новой рекомендации
	
	В функции производится добавление новой рекомендации в базу данных и передается ID только что созданной 
	рекомендации на страницу отображения shownewarticle.jsp
	*/
	@RequestMapping(value = {"/addarticle", "newarticle/addarticle"}, method = RequestMethod.POST)
	public String addArticle(@ModelAttribute("article") Article article,
			@ModelAttribute("category") Category category,
			@ModelAttribute("stage") DevelopmentStage stage,
			@ModelAttribute("type") SoftwareType type,
			BindingResult result){
		
		//добавляем рекмендацию в БД
		//переназначаем ID категории. Теоретически делать не надо, одна будет проблема с сохранением
		category.setId_category(article.getCategoryOfArticleNEW().getId_category());	
		stage.setId_stage(article.getStageOfArticleNEW().getId_stage());
		type.setId_type(article.getTypeOfArticleNEW().getId_type());
		
		
		article.setCategoryOfArticleNEW(category);
		article.setStageOfArticleNEW(stage);
		article.setTypeOfArticleNEW(type);
		
		int articleID = articleService.addArticle(article);
		articleID++;

		//переходим на страницу отображения вновь созданной рекомендации
		//передавая в качестве параметра  ID вновь созданной рекомендации
		return "redirect:/shownewarticle/"+articleID;
		
	} 
	
	/*
	 * Функция перехода со страницы создания рекомендации 
	 * на страницу отображения всей информации
	 * о только что созданной рекомендации
	 */
	
	@RequestMapping(value = {"/shownewarticle/{articleId}"})
	@ManyToOne(fetch = FetchType.EAGER)
    public String showCreatedArticle(@PathVariable("articleId") Integer articleId, Map<String, Object> map) {

        System.out.println("Index:" + articleId);
        System.out.println("Content to retirieve:" + this.formatArticleText(articleService.getArticle(articleId).getContentOfArticle()));

        //вернуть данные о статье с указанным ИД
        map.put("article",  articleService.getArticle(articleId));
        map.put("articleformattedtext", this.formatArticleText(articleService.getArticle(articleId).getContentOfArticle()));
        
        //маппим данные о пользователе, который сейчас в системе
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
        
        
        return "shownewarticle";
    }
	
	   
    
	/*
	 * Функция перехода от страницы создания рекомендации на страницу главного меню
	 */
	
	@RequestMapping(value = "/shownewarticle/returntomain", method = RequestMethod.POST)
	public String returnToMain(@ModelAttribute("article") Article article, BindingResult result){

		return "redirect:/index";
		
	} 
	
	
	
	@RequestMapping(value = {"/confirm", "/confirm/"})
    public String goToConfirm(Map<String, Object> map) {
		
		map.put("listOfArticles", articleService.listOfArticles());
		
		//маппим данные о пользователе, который сейчас в системе
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
		
        return "confirm";
    }
	
	
	@RequestMapping(value = {"/search", "/search/"})
    public String goToSearch(Map<String, Object> map) {
		
		map.put("listOfArticles", articleService.listOfArticles());
        return "search";
    }
	
	
	
	@RequestMapping(value = {"/index", "/index/"})
    public String goToLogOn(Map<String, Object> map, @ModelAttribute("sarticle") Article article) {
		
		//вернуть данные о существующих категориях
        map.put("categoriesList",  articleService.listOfCategories());
        map.put("typesList", articleService.listOfTypes());
        map.put("stagesList", articleService.listOfStages());		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("listOfArticles", articleService.listOfArticles());
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
	    
        return "index";
    }
    
    @RequestMapping(value = {"/", "/home", "/home/", "/main", "/main/"})
    public String home() {
        return "redirect:/index";
    }
	
    @RequestMapping(value = {"/login", "/login/"})
    public String login() {
        return "redirect:/login.jsp";
    }
	
    
    
    @RequestMapping(value = {"/singup", "/singup/", "/signup", "/signup/"})
    public String goToSingUp(@ModelAttribute("author") Author author,
			BindingResult result) {
		
        return "signup";
    }
    
    
    
    @RequestMapping(value = {"/addnewuser", "/addnewuser/"}, method = RequestMethod.POST)
	public String addNewUser(@ModelAttribute("author") Author author,
			BindingResult result){

    	author.setAuthorEnabled(1);
    	author.setAuthorStatus("ROLE_STUDENT");
    	author.setAuthorSex("Male");
		articleService.addNewAuthor(author);
		return "redirect:/index";
		
	}
    
    @RequestMapping(value = {"/deletearticle/{articleId}"})
	@ManyToOne(fetch = FetchType.EAGER)
    public String deleteArticle(@PathVariable("articleId") Integer articleId, Map<String, Object> map) {

        articleService.removeArticle(articleId);
        return "redirect:/confirm";
    }
    
    
    
    
    
    @RequestMapping(value = {"/shownewarticle/{articleId}/remakearticle"})
	@ManyToOne(fetch = FetchType.EAGER)
    public String remakeCreatedArticle(@PathVariable("articleId") Integer articleId, Map<String, Object> map) {

    	
    	 //вернуть данные о статье с указанным ИД
        map.put("article",  articleService.getArticle(articleId));

        map.put("articleformattedtext", this.formatArticleText(articleService.getArticle(articleId).getContentOfArticle()));
        map.put("categoriesList",  articleService.listOfCategories());
        map.put("typesList", articleService.listOfTypes());
        map.put("stagesList", articleService.listOfStages());
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
        
        
        return "remakearticle";
    }
    
    //функция сохранения изменений о рекомендации в базе данных
    @RequestMapping(value = {"/shownewarticle/{articleId}/remakecurrentarticle", "/shownewarticle/{articleId}/remakecurrentarticle/"}, method = RequestMethod.POST)
	public String saveChangesInArticle(@ModelAttribute("article") Article article,
			@ModelAttribute("category") Category category,
			@ModelAttribute("stage") DevelopmentStage stage,
			@ModelAttribute("type") SoftwareType type,
			@PathVariable("articleId") Integer articleId,
			BindingResult result){
		
    	//устанавливаем ИД и Дату рекомендации, поскольку эти параметры не брались с предыдущей страницы
    	article.setId(articleId);
    	article.setCreatedtimeOfArticle(articleService.getArticle(articleId).getCreatedtimeOfArticle());
    	
    	
    	
		//сохраняем изменения о рекомендации в Базе Данных
		//переназначаем ID категории. Теоретически делать не надо, одна будет проблема с сохранением
		category.setId_category(article.getCategoryOfArticleNEW().getId_category());
		
		
		stage.setId_stage(article.getStageOfArticleNEW().getId_stage());
		type.setId_type(article.getTypeOfArticleNEW().getId_type());
		
		
		article.setCategoryOfArticleNEW(category);
		article.setStageOfArticleNEW(stage);
		article.setTypeOfArticleNEW(type);
		
		articleService.updateArticle(article);
		 
		//переходим на страницу отображения отредактированной рекомендации
		//передавая в качестве параметра  ID отредактированной рекомендации
		return "redirect:/shownewarticle/"+articleId;
		
	} 
    
    
    
    @RequestMapping(value = {"/searcharticle", "searcharticle/"}, method = RequestMethod.POST)
	public String searchArticle(@ModelAttribute("sarticle") Article article,
			@ModelAttribute("category") Category category,
			@ModelAttribute("stage") DevelopmentStage stage,
			@ModelAttribute("type") SoftwareType type,
			BindingResult result,
			Map<String, Object> map){
    	
    	
    	//вернуть данные о существующих категориях
        map.put("categoriesList",  articleService.listOfCategories());
        map.put("typesList", articleService.listOfTypes());
        map.put("stagesList", articleService.listOfStages());		
		
        map.put("sarticle", article);
        System.out.println("Article se:" + article.getCategoryOfArticleNEW().getId_category());
        
        
		
	    map.put("listOfArticles", 
	    		articleService.listOfArticlesByParam(
	    				article.getTitleOfArticle(),
	    				article.getCategoryOfArticleNEW().getId_category(), 
	    				article.getTypeOfArticleNEW().getId_type(),
	    				article.getStageOfArticleNEW().getId_stage()
	    		)
	    );
	    
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());

    	return "index";
    }
    
    
    
    
    
    
    @RequestMapping(value = {"/confirmAuthors", "confirmAuthors/"})
   	public String goToConfirmAuthors(@ModelAttribute("author") Author author, Map<String, Object> map){
       	
    	map.put("listOfUnconfirmedAuthors", articleService.getListOfAuthors());
    	
    	map.put("rolesList", articleService.getRoles());
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    map.put("currentRole", auth.getAuthorities().toString().replace("[", "").replace("]", ""));
	    map.put("currentUserName", auth.getName());
    	
       	return "confirmAuthors";
       }
    
    
    
    @RequestMapping(value = {"changeLevel/{author.getAuthorId()}", "/confirmAuthors/changeLevel/{author.getAuthorId()}", "/confirmAuthors/changeLevel/{author.getAuthorId()}", "/changeLevel" })
   	public String goConfirmOneAuthor(HttpServletRequest request, @PathVariable("author.getAuthorId()") Integer authorId){
    	String role = request.getParameter("authorStatus");
    	int id_author = authorId;    	
    	articleService.changeRole(id_author, role);
    	return "redirect:/confirmAuthors";
       }
      
    
    
    //функции JSON-ответов от сервера
    //функция возврата списка доступных статей
    
	@RequestMapping(value={"api/confirm", "api/confirm/"}, method = RequestMethod.GET)
	@ManyToOne(fetch = FetchType.EAGER)
	public @ResponseBody ArrayList <ArticlesFromListJSON> getListOfArticlesInJSON() {

		List <Article> buffer= articleService.listOfArticles();
		ArrayList <ArticlesFromListJSON> list = new ArrayList<ArticlesFromListJSON>();
		
		for(Article art : buffer){
			ArticlesFromListJSON instance = new ArticlesFromListJSON(art);
			list.add(instance);
		}
		
		return list;
	}
    
	
	//функция возврата информации по конкретной статье
	
	@RequestMapping(value = {"api/shownewarticle/{articleId}", "api/shownewarticle/{articleId}/" })
	@ManyToOne(fetch = FetchType.EAGER)
	public @ResponseBody ArticleFullJSON showArticleInJSON(@PathVariable("articleId") Integer articleId) {

		return new ArticleFullJSON(articleService.getArticle(articleId));

	}
	    
    

	//функции, которые не относятся к маппингу и являются вспомогательными
	private String formatArticleText(String text){
		String buffer = text.replaceAll("\n", "<br>");
		return buffer;
	}
}
