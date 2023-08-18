package com.ons.study.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ons.study.dto.CommentDTO;

@Mapper
@Repository
public interface CommentDAO {
	public List<CommentDTO> getCommentsById(long contentId);
	public List<CommentDTO> getChildCommentsById(long contentId, long parentId);
	public String getUserNicknameById(long userId);
	public long getLastCommentIdByUser(long userId, long contentId);
	public int insertComment(CommentDTO comment);
	public int deleteComment(CommentDTO comment);
	public int modifyComment(CommentDTO comment);
}
