package capstone.project.repository.mybatis;

import capstone.project.domain.Member;
import capstone.project.repository.member.MemberRepository;
import capstone.project.repository.member.MemberUpdateApiDto;
import capstone.project.repository.member.MemberUpdateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class MyBatisMemberRepository implements MemberRepository {

    private final MemberMapper memberMapper;

    @Override
    public Member save(Member member) {
        memberMapper.save(member);
        return memberMapper.findNewMember();
    }

    @Override
    public void update(Integer id, MemberUpdateDto updateParam) {
        memberMapper.update(id, updateParam);
    }

    @Override
    public Optional<Member> findById(Integer id) {
        return memberMapper.findById(id);
    }

    @Override
    public List<Member> findAll(Member member) {
        return memberMapper.findAll(member);
    }

    @Override
    public Optional<Member> findByMemberId(String memberId) {
        return memberMapper.findByMemberId(memberId);
    }

    //Api용
    @Override
    public void update(Integer id, MemberUpdateApiDto updateParam) {
        memberMapper.update(id, updateParam);
    }
}
