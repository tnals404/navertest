package com.ons.study.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ons.study.dto.QnAContentDTO;


@Mapper
@Repository
public interface QnAContentDAO {
	
	public List<QnAContentDTO> getQnaContentByPage(int startRow, int pageSize);
	public List<QnAContentDTO> getQnaContentByTag(int startRow, int pageSize, String tagName);
	public List<QnAContentDTO> getQnaContentByKeyword(int startRow, int pageSize, String keyword);
	public String[] getTagsByContentId(long contentId);
	public long getQnaContentTotalCount();
	public long getQnaContentCountByTag(String tagName);
	public long getQnaContentCountByKeyword(String keyword);
	public QnAContentDTO getQnaContentById(long contentId);
	public int insertQnaContent(QnAContentDTO qnaContentDto);
	public int updateQnaContent(QnAContentDTO qnaContentDto);
	public int deleteQnaContentById(long contentId);
	public long getLastContentIdByUser(long userId);
	public int updateQnaContentViewCount(long contentId);
	public int updateQnaContentSolved(long contentId);
	
}
