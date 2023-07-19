package board.spring.mybatis;

import java.util.HashMap;
import java.util.List;

public interface BoardService {
	public int insertBoard(BoardDTO dto);
	public int getTotalBoard();
	public List<BoardDTO> boardList(int[] limit);
	public BoardDTO updateViewCountAndGetDetail(int seq);
	public int deleteBoard(int seq);
	public int updateBoard(BoardDTO dto);
	public List<BoardDTO> boardsearchList(HashMap<String, String> map);
	public int getSearchBoard(HashMap map);
	public BoardMemberDTO boardWriterInform(int seq);
}
