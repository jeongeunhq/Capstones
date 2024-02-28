package capstone.project.config;

import capstone.project.repository.diary.DiaryRepository;
import capstone.project.repository.member.MemberRepository;
import capstone.project.repository.mybatis.DiaryMapper;
import capstone.project.repository.mybatis.MemberMapper;
import capstone.project.repository.mybatis.MyBatisDiaryRepository;
import capstone.project.repository.mybatis.MyBatisMemberRepository;
import capstone.project.service.diary.DiaryService;
import capstone.project.service.login.LoginService;
import capstone.project.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@RequiredArgsConstructor
public class MyBatisConfig {

    private final MemberMapper memberMapper;
    private final DiaryMapper diaryMapper;

    @Bean
    public MemberService memberService() {
        return new MemberService(memberRepository());
    }

    @Bean
    public LoginService loginService() {
        return new LoginService(memberRepository());
    }

    @Bean
    public MemberRepository memberRepository() {
        return new MyBatisMemberRepository(memberMapper);
    }

    @Bean
    public DiaryService diaryService() {
        return new DiaryService(diaryRepository());
    }

    @Bean
    public DiaryRepository diaryRepository() {
        return new MyBatisDiaryRepository(diaryMapper);
    }
}

