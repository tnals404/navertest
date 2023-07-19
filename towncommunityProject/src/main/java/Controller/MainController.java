package Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import Dto.BoardDTO;
import Dto.MemberDTO;
import Dto.TownDTO;
import Service.MainService;
import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	@Qualifier("mainServiceImpl")
	MainService service;
	
	@RequestMapping("/main")
	public ModelAndView main(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("member_id") == null) {
			mv.setViewName("/Signin");
			return mv;
		}
		String member_id = (String)session.getAttribute("member_id");
		MemberDTO dto =  service.memberInfo(member_id);
		int town_id = dto.getTown_id();
		TownDTO town = service.townView(town_id); 
		List<BoardDTO> popular = service.popularArticles(town_id);
		List<BoardDTO> news = service.villageNews(town_id);
		List<BoardDTO> placeOfMeeting = service.placeOfMeeting(town_id);
		BoardDTO photo = service.todayPhoto(town_id);
		int board_id = 0;
		if(photo != null) {
			board_id = photo.getBoard_id();
		}
		List<BoardDTO> photoComment = service.photoComment(board_id);
		BoardDTO youKnow = service.youKnow(town_id);
		for(BoardDTO data : popular) {
			if(data.getBoard_imgurl() == null) {
				int i = (int)((Math.random()*3)+1);
				data.setBoard_imgurl("img/basic_image"+i+".jpg");
			}
		}
        try {
            String url = "https://search.naver.com/search.naver?query="+town.getTown_name()+"날씨";
            Document doc = Jsoup.connect(url).get();
            Element icon = doc.selectFirst("div.status_wrap i");
            String iconVal = icon.className();
            Element nowTemp = doc.selectFirst("div.temperature_text strong");
            String nowTempVal = nowTemp.text().substring(5);
            Element compTemp = doc.selectFirst("p.summary span.temperature");
            String compTempVal =compTemp.text();
            String[] words = compTempVal.split("\\s");
            String compDe = words[0];
            String comp = words[1];
            Element weather = doc.selectFirst("p.summary span.weather");
            String weatherVal =weather.text();
            Element bodyTemp = doc.selectFirst("div.sort:nth-child(1) dd.desc");
            String bodyTempVal =bodyTemp.text();
            Element humidity = doc.selectFirst("div.sort:nth-child(2) dd.desc");
            String humidityVal =humidity.text();            
            Element winddirec = doc.selectFirst("div.sort:last-child dt.term");
            String winddirecVal =winddirec.text();
            Element wind = doc.selectFirst("div.sort:last-child dd.desc");
            String windVal =wind.text();
    		mv.addObject("iconVal",iconVal);
    		mv.addObject("nowTempVal",nowTempVal);
    		mv.addObject("compTempVal",compTempVal);
    		mv.addObject("compDe",compDe);
    		mv.addObject("comp",comp);
    		mv.addObject("weatherVal",weatherVal);
    		mv.addObject("bodyTempVal",bodyTempVal);
    		mv.addObject("humidityVal",humidityVal);
    		mv.addObject("winddirecVal",winddirecVal);
    		mv.addObject("windVal",windVal);
    		mv.addObject("town",town);
    		mv.addObject("popular",popular);
    		mv.addObject("news",news);
    		mv.addObject("placeOfMeeting",placeOfMeeting);
    		mv.addObject("photo",photo);
    		mv.addObject("photoComment",photoComment);
    		mv.addObject("youKnow",youKnow);
    		mv.addObject("town_id",town_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("Main");	
		return mv;
	}
	
	@RequestMapping("/changeVillageResult")
	public ModelAndView changeVillageResult(HttpSession session, @RequestParam(value="town_id",required=false ,defaultValue="0")int town_id) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("member_id") == null) {
			mv.setViewName("/Signin");
			return mv;
		}
		String member_id = (String)session.getAttribute("member_id");
		TownDTO town = service.townView(town_id); 
		List<BoardDTO> popular = service.popularArticles(town_id);
		List<BoardDTO> news = service.villageNews(town_id);
		List<BoardDTO> placeOfMeeting = service.placeOfMeeting(town_id);
		BoardDTO photo = service.todayPhoto(town_id);
		int board_id = 0;
		if(photo != null) {
			board_id = photo.getBoard_id();
		}
		List<BoardDTO> photoComment = service.photoComment(board_id);
		BoardDTO youKnow = service.youKnow(town_id);
		for(BoardDTO data : popular) {
			if(data.getBoard_imgurl() == null) {
				int i = (int)((Math.random()*3)+1);
				data.setBoard_imgurl("img/basic_image"+i+".jpg");
			}
		}
        try {
            String url = "https://search.naver.com/search.naver?query="+town.getTown_name()+"날씨";
            Document doc = Jsoup.connect(url).get();
            Element icon = doc.selectFirst("div.status_wrap i");
            String iconVal = icon.className();
            Element nowTemp = doc.selectFirst("div.temperature_text strong");
            String nowTempVal = nowTemp.text().substring(5);
            Element compTemp = doc.selectFirst("p.summary span.temperature");
            String compTempVal =compTemp.text();
            String[] words = compTempVal.split("\\s");
            String compDe = words[0];
            String comp = words[1];
            Element weather = doc.selectFirst("p.summary span.weather");
            String weatherVal =weather.text();
            Element bodyTemp = doc.selectFirst("div.sort:nth-child(1) dd.desc");
            String bodyTempVal =bodyTemp.text();
            Element humidity = doc.selectFirst("div.sort:nth-child(2) dd.desc");
            String humidityVal =humidity.text();            
            Element winddirec = doc.selectFirst("div.sort:last-child dt.term");
            String winddirecVal =winddirec.text();
            Element wind = doc.selectFirst("div.sort:last-child dd.desc");
            String windVal =wind.text();
    		mv.addObject("iconVal",iconVal);
    		mv.addObject("nowTempVal",nowTempVal);
    		mv.addObject("compTempVal",compTempVal);
    		mv.addObject("compDe",compDe);
    		mv.addObject("comp",comp);
    		mv.addObject("weatherVal",weatherVal);
    		mv.addObject("bodyTempVal",bodyTempVal);
    		mv.addObject("humidityVal",humidityVal);
    		mv.addObject("winddirecVal",winddirecVal);
    		mv.addObject("windVal",windVal);
    		mv.addObject("member_id",member_id);
    		mv.addObject("town",town);
    		mv.addObject("popular",popular);
    		mv.addObject("news",news);
    		mv.addObject("placeOfMeeting",placeOfMeeting);
    		mv.addObject("photo",photo);
    		mv.addObject("photoComment",photoComment);
    		mv.addObject("youKnow",youKnow);
    		mv.addObject("town_id",town_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.setViewName("Main");	
		return mv;
	}
	
	@RequestMapping("/searchAll")
	public ModelAndView search(@RequestParam(value="town_id",required=false ,defaultValue="0")int town_id,@RequestParam(value="keyword",required=false)String keyword, HttpSession session) {
		ModelAndView mv  = new ModelAndView();
		if (session.getAttribute("member_id") == null) {
			mv.setViewName("/Signin");
			return mv;
		}
		Map<String,Object>map = new HashMap<String,Object>();
		if(town_id == 0)
			map.put("town_id", "");
		else
		map.put("town_id", town_id);
		if(keyword == null)
			map.put("keyword", "");
		else
			map.put("keyword", keyword);
		String member_id = (String)session.getAttribute("member_id");
		MemberDTO dto =  service.memberInfo(member_id);
		int member_town_id = dto.getTown_id();
		long resultCount =  service.getContentCountByKeyword(map);
		List<BoardDTO> result =  service.getContentByKeyword(map);
		mv.addObject("keyword",keyword);
		mv.addObject("resultCount",resultCount);
		mv.addObject("result",result);
		mv.addObject("town_id",town_id);
		mv.addObject("member_town_id",member_town_id);
		mv.setViewName("SearchResult");
		return mv;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return ("/Signin");
	}
	
	@RequestMapping("/changeVillage")
	public ModelAndView changeVillage(HttpSession session, @RequestParam(value="town_id",required=false ,defaultValue="0")int town_id) {
		ModelAndView mv  = new ModelAndView();
		if (session.getAttribute("member_id") == null) {
			mv.setViewName("/Signin");
			return mv;
		}
		String member_id = (String)session.getAttribute("member_id");
		MemberDTO dto =  service.memberInfo(member_id);
		int member_town_id = dto.getTown_id();
		mv.addObject("town_id",town_id);
		mv.addObject("member_town_id",member_town_id);
		mv.setViewName("ChangeVillage");
		return mv;
	}
	
	@RequestMapping("/ajaxResult")
	@ResponseBody
	public Object loginform(String town_name) {
		ArrayList<TownDTO> town = service.changeVillage(town_name); 
		return town;
	}
}
