package kr.or.nextit.springboot.board;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@MybatisTest
// 실제 데이터베이스에 연결할 경우
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class BoardMapperTest {
    // TDD(Test Driven Development)
    private static final Logger log = LoggerFactory.getLogger(BoardMapperTest.class);
    @Autowired
    private BoardMapper mapper;



    @Test
    void selectBoards() {
        List<BoardVO> boards = mapper.selectBoards();
        log.debug("boards: {}", boards);
        assertNotNull(boards);
        assertEquals(22, boards.size());
    }
    @Test
    void registerBoard(){
        BoardVO board = new BoardVO();
        board.setWriter("miso");
        board.setTitle("테스트제목");
        board.setContent("테스트 내용");
        mapper.registerBoard(board);
        List<BoardVO> boards = mapper.selectBoards();
        assertEquals(23, boards.size());
    }
    @Test
    void modifyBoard(){
        BoardVO board = new BoardVO();
        board.setNo(125);
        board.setTitle("업뎃 테스트 제목");
        board.setContent("업뎃 테스트 내용");
        mapper.modifyBoard(board);
        BoardVO board2 = mapper.selectBoard(125);
        assertEquals(board.getTitle(), board2.getTitle());
        assertEquals(board.getContent(), board2.getContent());
    }

    @Test
    void removeBoard(){
        mapper.removeBoard(3);
        assertEquals(21, mapper.selectBoards().size());
    }
}