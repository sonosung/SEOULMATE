package seoulmate.boardcomment;

import java.sql.Timestamp;

public class CommentDTO {
    private int commentId; // 댓글 고유 번호
    private int idx; // 게시글 번호 (외부 키)
    private String writer; // 작성자
    private String content; // 댓글 내용
    private Timestamp createdAt; // 댓글 작성 일시

    // 기본 생성자
    public CommentDTO() {
    }

    // 생성자 (모든 필드 포함)
    public CommentDTO(int commentId, int idx, String writer, String content, Timestamp createdAt) {
        this.commentId = commentId;
        this.idx = idx;
        this.writer = writer;
        this.content = content;
        this.createdAt = createdAt;
    }

    // Getter 및 Setter 메소드
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // toString 메소드 오버라이드 (디버깅 및 로깅 용도)
    @Override
    public String toString() {
        return "CommentDTO{" +
                "commentId=" + commentId +
                ", idx=" + idx +
                ", writer='" + writer + '\'' +
                ", content='" + content + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
