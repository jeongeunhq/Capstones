package capstone.project.repository.member;

import capstone.project.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    Member save(Member member);

    void update(Integer id, MemberUpdateDto updateParam);

    Optional<Member> findById(Integer id);

    List<Member> findAll(Member member);

    Optional<Member> findByMemberId(String memberId);

    //Api용
    void update(Integer id, MemberUpdateApiDto updateParam);
}
