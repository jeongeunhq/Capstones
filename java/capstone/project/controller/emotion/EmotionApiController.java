package capstone.project.controller.emotion;

import capstone.project.service.emotion.EmotionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/emotion")
public class EmotionApiController {

    private final EmotionService emotionService;

    @GetMapping("/statistics/{memberId}")
    public ResponseEntity<LinkedHashMap<String, Object>> getMonthlyEmotionStatistics(
            @PathVariable("memberId") String memberId,
            @RequestParam("month") String month) {

        LinkedHashMap<String, Object> statistics = emotionService.getMonthlyEmotionStatistics(memberId, month);
        return ResponseEntity.ok(statistics);
    }

    @GetMapping("/top3/{memberId}")
    public ResponseEntity<List<LinkedHashMap<String, Object>>> getTopEmotionsByMonth(
            @PathVariable("memberId") String memberId,
            @RequestParam("month") String month) {

        List<LinkedHashMap<String, Object>> statistics = emotionService.getTopEmotionsByMonth(memberId, month);
        return ResponseEntity.ok(statistics);
    }

    @GetMapping("/hourly/{memberId}")
    public ResponseEntity<List<LinkedHashMap<String, Object>>> getHourlyEmotionByMonth(
            @PathVariable("memberId") String memberId,
            @RequestParam("month") String month) {

        List<LinkedHashMap<String, Object>> statistics = emotionService.getHourlyEmotionByMonth(memberId, month);
        return ResponseEntity.ok(statistics);
    }
}
