package com.ons.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ons.study.dao.CommentDAO;
import com.ons.study.dao.QnAContentDAO;
import com.ons.study.dao.TagDAO;
import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.QnAContentDTO;
import com.ons.study.dto.TagDTO;

@Service
public class QnAContentService {
	public static final int PAGE_LIMIT = 8;
	@Autowired
	QnAContentDAO contentsDao;
	@Autowired
	TagDAO tagDao;
	@Autowired
	CommentDAO commentsDao;

	public List<QnAContentDTO> getQnaContentByPage(int page) {
		List<QnAContentDTO> dtoList = contentsDao.getQnaContentByPage((page - 1) * PAGE_LIMIT, PAGE_LIMIT);
		for (var dto : dtoList) {
			dto.setTags(contentsDao.getTagsByContentId(dto.getId()));
		}
		return dtoList;
	}

	public List<QnAContentDTO> getQnaContentByTag(int page, String tagName) {
		List<QnAContentDTO> dtoList = contentsDao.getQnaContentByTag((page - 1) * PAGE_LIMIT, PAGE_LIMIT, tagName);
		for (var dto : dtoList) {
			dto.setTags(contentsDao.getTagsByContentId(dto.getId()));
		}
		return dtoList;
	}

	public List<QnAContentDTO> getQnaContentByKeyword(int page, String keyword) {
		List<QnAContentDTO> dtoList = contentsDao.getQnaContentByKeyword((page - 1) * PAGE_LIMIT, PAGE_LIMIT, keyword);
		for (var dto : dtoList) {
			dto.setTags(contentsDao.getTagsByContentId(dto.getId()));
		}
		return dtoList;
	}

	public QnAContentDTO getQnaContentById(long contentId) {
		QnAContentDTO dto = contentsDao.getQnaContentById(contentId);
		dto.setTags(contentsDao.getTagsByContentId(dto.getId()));
		return dto;
	}

	public long getQnaContentTotalCount() {
		return contentsDao.getQnaContentTotalCount();
	}

	public long getQnaContentCountByTag(String tagName) {
		return contentsDao.getQnaContentCountByTag(tagName);
	}

	public long getQnaContentCountByKeyword(String keyword) {
		return contentsDao.getQnaContentCountByKeyword(keyword);
	}

	public String[] getTagsByContentId(long contentId) {
		return contentsDao.getTagsByContentId(contentId);
	}

	public List<CommentDTO> getCommentsById(long contentId) {
		List<CommentDTO> dtoList = commentsDao.getCommentsById(contentId);
		for (var dto : dtoList) {
			dto.setChildComments(commentsDao.getChildCommentsById(contentId, dto.getId()));
		}
		return dtoList;
	}

	public int insertQnaContent(QnAContentDTO qnaContentDto) {
		return contentsDao.insertQnaContent(qnaContentDto);
	}

	public int updateQnaContent(QnAContentDTO qnaContentDto) {
		return contentsDao.updateQnaContent(qnaContentDto);
	}

	public int deleteQnaContentById(long contentId) {
		return contentsDao.deleteQnaContentById(contentId);
	}

	public long getLastContentIdByUser(long userId) {
		return contentsDao.getLastContentIdByUser(userId);
	}

	public int insertTag(String tag, long contentId) {
		TagDTO tagDto = new TagDTO();
		tagDto.setContentId(contentId);
		tagDto.setName(tag);
		return tagDao.insertTag(tagDto);
	}

	public int deleteTagByContentId(long contentId) {
		return tagDao.deleteTagByContentId(contentId);
	}

	// 지난 일주일 간 추가된 게시물에 있는 태그 갯수 순으로 받아오기
	public String[] getPopularTags(int limit) {
		return tagDao.getPopularTags(limit);
	}

	public int updateQnaContentViewCount(long contentId) {
		return contentsDao.updateQnaContentViewCount(contentId);
	}
	
	public int updateQnaContentSolved(long contentId) {
		return contentsDao.updateQnaContentSolved(contentId);
	}
}
