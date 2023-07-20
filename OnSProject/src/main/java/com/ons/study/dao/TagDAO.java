package com.ons.study.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.ons.study.dto.TagDTO;

@Mapper
@Repository
public interface TagDAO {
	public List<TagDTO> getTagsByContentId(long contentId);
	public int insertTag(TagDTO tagdto);
	public int deleteTagByContentId(long contentId);
	public String[] getPopularTags(int limit);
}
