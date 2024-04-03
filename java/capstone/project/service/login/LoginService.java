package capstone.project.service.login;


import capstone.project.domain.Member;
import capstone.project.repository.member.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final MemberRepository memberRepository;

    public Member login(String loginId, String password) {
        Optional<Member> findMemberOptional = memberRepository.findByMemberId(loginId);
        if (findMemberOptional.isPresent()) { // Optional이 비어있지 않은 경우
            Member member = findMemberOptional.get();
            if (member.getPassword().equals(password)) {
                return member;
            }
        }
        return null; // 로그인 실패
    }
}