package capstone.project.controller.chat;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/chat")
public class ChatTApiController {

    @PostMapping("/requestMessageFromFlutter")
    public ResponseEntity<String> flutterMessage(@RequestBody String flutterMessage) {
        // 여기에서 메시지를 처리하고 응답을 반환
        String responseMessage = "스프링에서는 flutter 요청 메세지를 잘 받았음: " + flutterMessage;
        System.out.println(flutterMessage); //확인용! 지워야 함

        ResponseEntity.ok().body(responseMessage);

        // HTTP 요청을 위한 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // HTTP 요청 본문과 헤더를 포함한 요청 엔티티 생성
        HttpEntity<String> requestEntity = new HttpEntity<>(flutterMessage, headers);

        String flaskEndpoint = "http://localhost:5000/chatbot/bert"; //챗봇

        // RestTemplate을 사용하여 Flask 서버에 데이터 요청
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(flaskEndpoint, requestEntity, String.class);

        // Flask 서버에서 받은 응답 출력
        String responseFlaskData = responseEntity.getBody();
        System.out.println(responseFlaskData);

        // 받아온 데이터를 처리하거나 사용
        // 여기서는 그대로 반환
        return ResponseEntity.ok().body(responseFlaskData);
    }
}