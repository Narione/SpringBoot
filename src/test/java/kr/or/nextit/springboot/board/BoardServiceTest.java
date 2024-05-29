package kr.or.nextit.springboot.board;

import kr.or.nextit.springboot.file.FileMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.BDDMockito;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
@Slf4j
@ExtendWith(MockitoExtension.class)
class BoardServiceTest {
    @Mock
    private BoardMapper mapper;

    @InjectMocks
    private BoardService boardService;

    @Test
    void selectBoard() {
    //BDD(Behavior Driven Development
        //given / when / then
        //Builder 패턴: 디자인패턴 중 하나
        // 객체에 값을 저장할 때 사용하는 패턴 중의 하나
        //1. Telescoping Constructor pattern
        //2. Java Beans pattern
        //3. Builder pattern: 메소드 체인 방식으로 메소드에 값을 추가하는 방식으로 사용

        BDDMockito.given(boardService.selectBoard(105))
                .willReturn(BoardVO.builder()
                        .no(105)
                        .writer("mimi")
                        .title("으악")
                        .content("으악")
                        .createDate(LocalDate.of(2024,5,20))
                        .hits(19)
                        .build());

        //when
        BoardVO board = boardService.selectBoard(105);
        log.info("board: {}",board.toString());
        //then
        assertNotNull(board);
        assertEquals(19,board.getHits());
    }

    @Test
    void registerBoard() {
    }
}