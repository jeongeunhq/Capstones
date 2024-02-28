package capstone.project.handler.advice;

import capstone.project.exception.DuplicateMemberIdException;
import capstone.project.handler.ErrorResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

//필요할 때 사용

//@RestControllerAdvice
//public class GlobalExceptionHandler {
//
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
//    @ExceptionHandler(DuplicateMemberIdException.class)
//    public ErrorResult handleDuplicateMemberIdException(DuplicateMemberIdException e) {
//        return new ErrorResult("이미 존재하는 아이디입니다.", e.getMessage());
//    }
//}