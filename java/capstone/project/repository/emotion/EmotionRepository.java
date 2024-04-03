package capstone.project.repository.emotion;

import capstone.project.domain.Diary;
import capstone.project.domain.Emotion;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.repository.diary.DiaryUpdateDto;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface EmotionRepository {

    Emotion save(Emotion emotion);

    void update(Integer diaryId, EmotionUpdateApiDto updateParam);

    void delete(Integer diaryId);

    Optional<Emotion> findByDiaryId(Integer diaryId);

    LinkedHashMap<String, Object> getMonthlyEmotionStatistics(String memberId, String month);

    List<LinkedHashMap<String, Object>> getTopEmotionsByMonth(String memberId, String month);

    List<LinkedHashMap<String, Object>> getHourlyEmotionByMonth(String memberId, String month);
}
