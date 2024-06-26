package kr.or.nextit.springboot.comment;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CommentService {
    private final CommentMapper mapper;

    CommentVO registerComment(CommentVO comment) {
        mapper.registerComment(comment);
        return mapper.selectComment(comment.getId());
    }

    void modifyComment(CommentVO comment) {
        mapper.modifyComment(comment);
    }

    void removeComment(long id) {
        mapper.removeComment(id);
    }
}
