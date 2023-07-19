package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO dao;
	@Override
	public int insertBoard(BoardDTO dto) {
		return dao.insertBoard(dto);
		
	}
	@Override
	public int getTotalBoard() {
		
		return dao.getTotalBoard();
	}
	@Override
	public List<BoardDTO> boardList(int[] limit) {
		return dao.boardList(limit);
	}
	@Override
	public BoardDTO updateViewCountAndGetDetail(int seq) {
		int updaterows = dao.updateViewCount(seq);
		return dao.getDetail(seq);
	}
	@Override
	public int deleteBoard(int seq) {
		return dao.deleteBoard(seq);
	}
	@Override
	public int updateBoard(BoardDTO dto) {
		return dao.updateBoard(dto);
	}
	@Override
	public List<BoardDTO> boardsearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.boardsearchList(map);
	}
	@Override
	public int getSearchBoard(HashMap map) {
		// TODO Auto-generated method stub
		return dao.getSearchBoard(map);
	}
	@Override
	public BoardMemberDTO boardWriterInform(int seq) {
		// TODO Auto-generated method stub
		return dao.boardWriterInform(seq);
	}
	
	
	
	
	
	

}
