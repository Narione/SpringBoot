package kr.or.nextit.springboot.comment;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CommentVO {
    private long id;
    private long boardNo;
    private String writer;
    private String content;
    private LocalDate createDate;
    private LocalDate modifyDate;
}
