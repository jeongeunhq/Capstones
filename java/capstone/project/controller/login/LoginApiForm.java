package capstone.project.controller.login;

import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class LoginApiForm {

    @NotNull
    private String loginId;

    @NotNull
    private String password;
}
