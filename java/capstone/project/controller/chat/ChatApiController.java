//package capstone.project.web.chat;
//
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.client.RestTemplate;
//
//@RestController
//@RequestMapping("/api/chat")
//public class ChatApiController {
//
//    @PostMapping("/requestMessageFromFlutter")
//    public ResponseEntity<String> flutterMessage(@RequestBody String flutterMessage) {
//        // 여기에서 메시지를 처리하고 응답을 반환
//        String responseMessage = "스프링에서는 flutter 요청 메세지를 잘 받았음: " + flutterMessage;
//        System.out.println(flutterMessage); //확인용! 지워야 함
//
//        return ResponseEntity.ok().body(responseMessage);
//    }
//
//    @PostMapping("/responseMessageFromFlask")
//    public ResponseEntity<String> flaskMessage(@RequestBody String flaskMessage) {
//        // 여기에서 메시지를 처리하고 응답을 반환
//        String responseMessage = "스프링에서는 flask 응답 메세지를 잘 받았음: " + flaskMessage;
//        System.out.println(flaskMessage); //확인용! 지워야 함
//
//        return ResponseEntity.ok().body(responseMessage);
//    }
//}
