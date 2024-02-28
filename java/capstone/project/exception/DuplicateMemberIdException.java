package capstone.project.exception;

public class DuplicateMemberIdException extends RuntimeException {
    public DuplicateMemberIdException() {
        super();
    }

    public DuplicateMemberIdException(String message) {
        super(message);
    }

    public DuplicateMemberIdException(String message, Throwable cause) {
        super(message, cause);
    }

    public DuplicateMemberIdException(Throwable cause) {
        super(cause);
    }

    protected DuplicateMemberIdException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}