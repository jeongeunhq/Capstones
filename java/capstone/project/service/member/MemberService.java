package capstone.project.service.member;

import capstone.project.domain.Member;
import capstone.project.repository.member.MemberRepository;
import capstone.project.repository.member.MemberUpdateApiDto;
import capstone.project.repository.member.MemberUpdateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    @Transactional
    public Member save(Member member) {
        // 아이디 중복 확인
        Optional<Member> existingMemberId = memberRepository.findByMemberId(member.getMemberId());
        if (existingMemberId.isPresent()) {
            // 중복된 아이디가 이미 존재하는 경우 처리
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }

        // 중복된 아이디가 없는 경우 멤버 저장
        return memberRepository.save(member);
    }

    public void update(Integer id, MemberUpdateDto updateParam) {
        memberRepository.update(id, updateParam);
    }

    public Optional<Member> findById(Integer id) {
        return memberRepository.findById(id);
    }

    public List<Member> findMembers(Member member) {
        return memberRepository.findAll(member);
    }

    public Optional<Member> findByMemberId(String memberId) {
        return memberRepository.findByMemberId(memberId);
    }


    //Api용
    public void update(Integer id, MemberUpdateApiDto updateParam) {
        memberRepository.update(id, updateParam);
    }

    // 아이디 중복 확인 메서드 추가
    public boolean isMemberIdExists(String memberId) {
        return memberRepository.findByMemberId(memberId).isPresent();
    }
}

