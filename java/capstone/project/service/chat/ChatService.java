package capstone.project.service.chat;

import capstone.project.domain.Chat;
import capstone.project.domain.Diary;
import capstone.project.repository.chat.ChatRepository;
import capstone.project.repository.diary.DiaryRepository;
import capstone.project.repository.diary.DiaryUpdateApiDto;
import capstone.project.repository.diary.DiaryUpdateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ChatService {

    private final ChatRepository chatRepository;

    public int newChatId() {
        return chatRepository.findLargestChatId();
    }

    public void memberChatSave(Chat memberChat) {
        chatRepository.memberChatSave(memberChat);
    }

    public void aiChatSave(Chat aiChat) {
        chatRepository.aiChatSave(aiChat);
    }

    public List<Chat> findById(Integer chatId) {
        return chatRepository.findById(chatId);
    }

    public List<Chat> findByMemberId(String memberId) {
        return chatRepository.findByMemberId(memberId);
    }
}

