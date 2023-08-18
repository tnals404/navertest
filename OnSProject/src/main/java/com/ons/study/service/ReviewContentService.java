package com.ons.study.service;

import java.util.HashMap;
import java.util.List;

import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.ReviewContentDTO;

public interface ReviewContentService {
	public List<ReviewContentDTO> getTotalBoard();
	public int writeBoard(ReviewContentDTO dto);
	public ReviewContentDTO getOneBoard(int id);
	public List<ReviewContentDTO> pagingBoard(int[] limit);
	public int totalBoardCnt();
	public List<ReviewContentDTO> searchBoard(HashMap<String, Object> map);
	public int plusViewCount(int id) ;
	public int deleteBoard(int id) ;
	public int searchBoardCnt(HashMap<String, Object> map);
	public int updateBoard(ReviewContentDTO dto);
	public int getUserIdByContentId(int id);

}
