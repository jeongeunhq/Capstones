package capstone.project.repository.diary;

import capstone.project.domain.Diary;

import java.util.List;
import java.util.Optional;

public interface DiaryRepository {

    Diary save(Diary diary);

    void update(Integer diaryId, DiaryUpdateDto updateParam);

    void delete(Integer diaryId);

    Optional<Diary> findById(Integer diaryId);

    List<Diary> findAll(Diary diary);

    List<Diary> findByMemberId(String memberId);

    Optional<Diary> findByMemberIdAndWriteDate(String memberId, String writeDate);

    //Api용
    void update(Integer diaryId, DiaryUpdateApiDto updateParam);
}
