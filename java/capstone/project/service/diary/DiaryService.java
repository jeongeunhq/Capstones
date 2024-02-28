package capstone.project.service.diary;

import capstone.project.domain.Diary;
import capstone.project.domain.Member;
import capstone.project.repository.diary.DiaryRepository;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.repository.diary.DiaryUpdateDto;
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
public class DiaryService {

    private final DiaryRepository diaryRepository;

    public Diary save(Diary diary) {
        return diaryRepository.save(diary);
    }

    public void update(Integer diaryId, DiaryUpdateDto updateParam) {
        diaryRepository.update(diaryId, updateParam);
    }

    public void delete(Integer diaryId) {
        diaryRepository.delete(diaryId);
    }

    public Optional<Diary> findById(Integer diaryId) {
        return diaryRepository.findById(diaryId);
    }

    public List<Diary> findDiaries(Diary diary) {
        return diaryRepository.findAll(diary);
    }

    public List<Diary> findByMemberId(String memberId) {
        return diaryRepository.findByMemberId(memberId);
    }

    //Api용
    public void update(Integer diaryId, DiaryUpdateApiDto updateParam) {
        diaryRepository.update(diaryId, updateParam);
    }
}

