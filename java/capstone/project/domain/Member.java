package capstone.project.domain;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class Member {

    private int id;

    @NotEmpty
    private String memberId; //member ID, 이메일 형식

    @NotEmpty
    private String password; //비밀번호

    @NotEmpty
    private String nickname; //닉네임

    @NotEmpty
    private String gender; //성별

    @NotEmpty
    private String birthdate; //생년월일
}
