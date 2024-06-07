package capstone.project.repository.mybatis;

import capstone.project.domain.Chat;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {

    int findLargestChatId();

    void memberChatSave(Chat memberChat);

    void aiChatSave(Chat aiChat);

    List<Chat> findById(Integer chatId);

    List<Chat> findByMemberId(String memberId);
}
