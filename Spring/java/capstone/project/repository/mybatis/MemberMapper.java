package capstone.project.repository.mybatis;

import capstone.project.domain.Member;
import capstone.project.repository.member.MemberUpdateApiDto;
import capstone.project.repository.member.MemberUpdateDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Optional;

@Mapper
public interface MemberMapper {

    void save(Member member);

    Member findNewMember();

    void update(@Param("id") Integer id, @Param("updateParam") MemberUpdateDto updateParam);

    Optional<Member> findById(Integer id);

    List<Member> findAll(Member member);

    Optional<Member> findByMemberId(String memberId);

    //Api용
    void update(@Param("id") Integer id, @Param("updateParam") MemberUpdateApiDto updateParam);
}
