package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;
	@RequestMapping("/")
	public String start() {
		return "board/start";
	}
	
	@GetMapping("/boardwrite")
	public String writeform() {
		return "board/writingform";
	}
	
	@PostMapping("/boardwrite")
	public ModelAndView writeprocess(BoardDTO dto) {
		int insertcount = service.insertBoard(dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("insertcount",insertcount);
//		mv.setViewName("board/writeresult");
//		mv.setViewName("board/list");
		mv.setViewName("board/start");
		return mv;
//		redirect:/boardlist;
	}
	
	@RequestMapping("/boardlist")
	public ModelAndView boardlist(@RequestParam(value="page", required=false, defaultValue="1") int page) {
	int totalBoard = service.getTotalBoard();
	int limitcount = 4;
	int limitindex = (page-1)*limitcount;
	int limit [] = new int[2];
	limit[0] = limitindex;
	limit[1] = limitcount;
	List<BoardDTO> list = service.boardList(limit);
	
	ModelAndView mv = new ModelAndView();
	mv.addObject("totalBoard",totalBoard);
	mv.addObject("boardList",list);
	mv.setViewName("board/list");
	return mv;
	}
	
	@RequestMapping("/boarddetail")
	public ModelAndView boarddetail(int seq) {
		BoardDTO dto = service.updateViewCountAndGetDetail(seq);
		ModelAndView mv = new ModelAndView();
		mv.addObject("detaildto",dto);
		mv.setViewName("board/detail");
		return mv;
	}
	
	@RequestMapping("/boarddelete")
	public String boarddelete(int seq) {
		service.deleteBoard(seq);
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boardupdate")
	public String boardupdate(BoardDTO dto) {
		service.updateBoard(dto);
		return "redirect:/boardlist";
	}
	
	@RequestMapping("/boardsearchList")
	public ModelAndView boardsearchList(@RequestParam(value="item", required=false,defaultValue="all")String item,@RequestParam(value="word", required=false,defaultValue="") String word) {
		System.out.println(item+":"+word);
		HashMap<String, String> map = new HashMap<String, String>();
//		if(item.equals("all")) {item = null;}
		map.put("colname", item);
		map.put("colvalue", "%"+word+"%");
		List<BoardDTO> boardsearchList = service.boardsearchList(map);
		int searchcount = service.getSearchBoard(map);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardList",boardsearchList);
		mv.addObject("totalBoard",searchcount);
		mv.setViewName("board/searchlist");
		return mv;
	}
	
	@RequestMapping("/boardwriterinform")
	public ModelAndView boardwriterinform(int seq) {
		BoardMemberDTO writerdto = service.boardWriterInform(seq);
		ModelAndView mv = new ModelAndView();
		mv.addObject("writerdto", writerdto);
		mv.setViewName("board/writerinform");
		return mv;
	}
}
