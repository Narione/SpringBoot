package kr.or.nextit.springboot.board;

import kr.or.nextit.springboot.comment.CommentVO;
import kr.or.nextit.springboot.file.FileVO;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;


@Data
public class BoardVO {
    private long no;
    private String writer;
    private String title;
    private String content;
    private LocalDate createDate;
    private LocalDate modifyDate;
    private long hits;
    private List<CommentVO> commentList;
    private List<FileVO> fileList;
}
