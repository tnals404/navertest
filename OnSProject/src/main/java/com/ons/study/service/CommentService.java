package com.ons.study.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ons.study.dao.CommentDAO;
import com.ons.study.dto.CommentDTO;

@Service
public class CommentService {
	
	@Autowired
	CommentDAO commentDao;
	
	public int insertComment(CommentDTO comment) {
		return commentDao.insertComment(comment);
	}
	
	public int deleteComment(CommentDTO comment) {
		return commentDao.deleteComment(comment);
	}
	
	public int modifyComment(CommentDTO comment) {
		return commentDao.modifyComment(comment);
	}
	
	public long getLastCommentIdByUser(long userId, long contentId) {
		return commentDao.getLastCommentIdByUser(userId, contentId);
	}
}
