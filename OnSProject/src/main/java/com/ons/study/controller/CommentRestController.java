package com.ons.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ons.study.dto.CommentDTO;
import com.ons.study.dto.UserDTO;
import com.ons.study.service.CommentService;

import jakarta.servlet.http.HttpSession;

@RestController
public class CommentRestController {
	
	@Autowired
	CommentService commentService;
	
	@PostMapping("/save-comment")
	public ResponseEntity<CommentDTO> saveComment(@RequestBody CommentDTO comment, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		int insertCount = commentService.insertComment(comment);
		if (user != null && user.getId() == comment.getUserId() && insertCount == 1) {
			CommentDTO commentDto = new CommentDTO();
			commentDto.setId(commentService.getLastCommentIdByUser(comment.getUserId(), comment.getContentId()));
			return ResponseEntity.ok(commentDto);
		} else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@DeleteMapping("/delete-comment")
    public ResponseEntity<Boolean> deleteComment(@RequestBody CommentDTO comment, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		int deleteCount = commentService.deleteComment(comment);
		if (user != null && user.getId() == comment.getUserId() && deleteCount == 1) {
			return ResponseEntity.ok(true);			
		} else {
			return ResponseEntity.notFound().build();
		}
    }
	
	@PutMapping("/modify-comment")
	public ResponseEntity<Boolean> modifyComment(@RequestBody CommentDTO comment, HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("user");
		int deleteCount = commentService.modifyComment(comment);
		if (user != null && user.getId() == comment.getUserId() && deleteCount == 1) {
			return ResponseEntity.ok(true);			
		} else {
			return ResponseEntity.notFound().build();
		}
    }
}
