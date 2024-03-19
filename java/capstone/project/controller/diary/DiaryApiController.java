package capstone.project.controller.diary;

import capstone.project.domain.Diary;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.service.diary.DiaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/diaries")
public class DiaryApiController {

    private final DiaryService diaryService;

    @GetMapping("/{diaryId}")
    public ResponseEntity<Diary> getDiaryById(@PathVariable("diaryId") Integer diaryId) {
        return diaryService.findById(diaryId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/add")
    public ResponseEntity<?> saveDiary(@RequestBody Diary diary) {
        Diary savedDiary = diaryService.save(diary);

        Map<String, Object> responseData = new HashMap<>();
        responseData.put("message", "일기가 저장되었습니다");
        responseData.put("savedDiary", savedDiary);

        return ResponseEntity.status(HttpStatus.CREATED).body(responseData);
    }

    @PutMapping("/{diaryId}/edit")
    public ResponseEntity<String> editDiary(@PathVariable("diaryId") Integer diaryId, @RequestBody DiaryUpdateApiDto updateParam) {
        diaryService.update(diaryId, updateParam);
        return ResponseEntity.ok("일기가 수정되었습니다");
    }

    @PutMapping("/{diaryId}/delete")
    public ResponseEntity<String> deleteDiary(@PathVariable("diaryId") Integer diaryId) {
        diaryService.delete(diaryId);
        return ResponseEntity.ok("일기가 삭제되었습니다");
    }

    @GetMapping("/member/{memberId}")
    public ResponseEntity<List<Diary>> getDiariesByMemberId(@PathVariable("memberId") String memberId) {
        List<Diary> diaries = diaryService.findByMemberId(memberId);
        return ResponseEntity.ok(diaries);
    }

}
