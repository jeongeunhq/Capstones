package capstone.project.service.emotion;

import capstone.project.domain.Diary;
import capstone.project.domain.Emotion;
import capstone.project.repository.diary.DiaryRepository;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.repository.diary.DiaryUpdateDto;
import capstone.project.repository.emotion.EmotionRepository;
import capstone.project.repository.emotion.EmotionUpdateApiDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EmotionService {

    private final EmotionRepository emotionRepository;

    public Emotion save(Emotion emotion) {
        return emotionRepository.save(emotion);
    }

    public void update(Integer diaryId, EmotionUpdateApiDto updateParam) {
        emotionRepository.update(diaryId, updateParam);
    }

    public void delete(Integer diaryId) {
        emotionRepository.delete(diaryId);
    }

    public Optional<Emotion> findByDiaryId(Integer diaryId) {
        return emotionRepository.findByDiaryId(diaryId);
    }

    public LinkedHashMap<String, Object> getMonthlyEmotionStatistics(String memberId, String month) {
        return emotionRepository.getMonthlyEmotionStatistics(memberId, month);
    }

    public List<LinkedHashMap<String, Object>> getTopEmotionsByMonth(String memberId, String month) {
        return emotionRepository.getTopEmotionsByMonth(memberId, month);
    }

    public List<LinkedHashMap<String, Object>> getHourlyEmotionByMonth(String memberId, String month) {
        return emotionRepository.getHourlyEmotionByMonth(memberId, month);
    }

}

