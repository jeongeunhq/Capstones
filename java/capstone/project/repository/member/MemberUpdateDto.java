package capstone.project.repository.member;

import lombok.Data;

@Data
public class MemberUpdateDto {
    private String password; //비밀번호
    private String nickname; //닉네임
    private String gender; //성별
    private String birthdate; //생년월일

    public MemberUpdateDto() {
    }

    public MemberUpdateDto(String password, String nickname, String gender, String birthdate) {
        this.password = password;
        this.nickname = nickname;
        this.gender = gender;
        this.birthdate = birthdate;
    }
}
