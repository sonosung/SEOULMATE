package seoulmate.board;

import java.util.Base64;

public class UserBoardDTO {
    private String idx;
    private String fescate;
    private String name;
    private String title;
    private String content;
    private String fesname;
    private java.sql.Date postdate;
    private int likecount;
    private int visitcount;
    private String feslocation;
    private String fesstart;
    private String fesend;
    private byte[] mainimage;
    private byte[] secimage;
    private byte[] thiimage;
    private String base64MainImage;
    private String base64SecImage;
    private String base64ThiImage;

    // Getters and Setters

    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getFescate() {
        return fescate;
    }

    public void setFescate(String fescate) {
        this.fescate = fescate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFesname() {
        return fesname;
    }

    public void setFesname(String fesname) {
        this.fesname = fesname;
    }

    public java.sql.Date getPostdate() {
        return postdate;
    }

    public void setPostdate(java.sql.Date postdate) {
        this.postdate = postdate;
    }

    public int getLikecount() {
        return likecount;
    }

    public void setLikecount(int likecount) {
        this.likecount = likecount;
    }

    public int getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }

    public String getFeslocation() {
        return feslocation;
    }

    public void setFeslocation(String feslocation) {
        this.feslocation = feslocation;
    }

    public String getFesstart() {
        return fesstart;
    }

    public void setFesstart(String fesstart) {
        this.fesstart = fesstart;
    }

    public String getFesend() {
        return fesend;
    }

    public void setFesend(String fesend) {
        this.fesend = fesend;
    }

    public byte[] getMainimage() {
        return mainimage;
    }

    public void setMainimage(byte[] mainimage) {
        if (mainimage == null) {
            this.mainimage = new byte[0];
            this.base64MainImage = "";
        } else {
            this.mainimage = mainimage;
            this.base64MainImage = Base64.getEncoder().encodeToString(mainimage);
        }
    }

    public byte[] getSecimage() {
        return secimage;
    }

    public void setSecimage(byte[] secimage) {
        if (secimage == null) {
            this.secimage = new byte[0];
            this.base64SecImage = "";
        } else {
            this.secimage = secimage;
            this.base64SecImage = Base64.getEncoder().encodeToString(secimage);
        }
    }

    public byte[] getThiimage() {
        return thiimage;
    }

    public void setThiimage(byte[] thiimage) {
        if (thiimage == null) {
            this.thiimage = new byte[0];
            this.base64ThiImage = "";
        } else {
            this.thiimage = thiimage;
            this.base64ThiImage = Base64.getEncoder().encodeToString(thiimage);
        }
    }

    public String getBase64MainImage() {
        return base64MainImage;
    }

    public String getBase64SecImage() {
        return base64SecImage;
    }

    public String getBase64ThiImage() {
        return base64ThiImage;
    }
}
