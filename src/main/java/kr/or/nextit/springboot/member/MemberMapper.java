package kr.or.nextit.springboot.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    MemberVO findMemberById(String id);
}
