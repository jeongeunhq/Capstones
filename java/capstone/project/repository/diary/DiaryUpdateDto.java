package capstone.project.repository.diary;

import lombok.Data;

@Data
public class DiaryUpdateDto {
    private String content; //일기 내용

    public DiaryUpdateDto() {
    }

    public DiaryUpdateDto(String content) {
        this.content = content;
    }
}
