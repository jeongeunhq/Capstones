package capstone.project.repository.mybatis;

import capstone.project.domain.Diary;
import capstone.project.domain.Member;
import capstone.project.repository.diary.DiaryRepository;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.repository.diary.DiaryUpdateDto;
import capstone.project.repository.member.MemberRepository;
import capstone.project.repository.member.MemberUpdateApiDto;
import capstone.project.repository.member.MemberUpdateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@RequiredArgsConstructor
public class MyBatisDiaryRepository implements DiaryRepository {

    private final DiaryMapper diaryMapper;

    @Override
    public Diary save(Diary diary) {
        diaryMapper.save(diary);
        return diaryMapper.findNewDiary();
    }

    @Override
    public void update(Integer diaryId, DiaryUpdateDto updateParam) {
        diaryMapper.update(diaryId, updateParam);
    }

    @Override
    public void delete(Integer diaryId) {
        diaryMapper.delete(diaryId);
    }

    @Override
    public Optional<Diary> findById(Integer diaryId) {
        return diaryMapper.findById(diaryId);
    }

    @Override
    public List<Diary> findAll(Diary diary) {
        return diaryMapper.findAll(diary);
    }

    @Override
    public List<Diary> findByMemberId(String memberId) {
        return diaryMapper.findByMemberId(memberId);
    }

    //Api용
    @Override
    public void update(Integer diaryId, DiaryUpdateApiDto updateParam) {
        diaryMapper.update(diaryId, updateParam);
    }
}
