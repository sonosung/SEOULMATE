package seoulmate.membership;

import java.util.Base64;

public class MemberDTO {

	private int USER_NUM;
	private String USERNAME;
	private String EMAIL;
	private String USER_ID;
	private String PHONENUM;
	private String USER_PASSWORD;
	private String USER_POST;
	private String USER_COMMENT;
	private String base64USER_PHOTO;
	private String USER_STREET;
	private String USER_ZIP;
	private String USER_EMAIL_ERROR;
	private String USER_ID_ERROR;
	private String CANCEL;
	private String UD;
	private byte[] USER_PHOTO; 
	private String base64UserPhoto;  // Base64 문자열로 인코딩된 사진 데이터를 저장할 필드 추가
	private String UD_NICK;

    public String getUD_NICK() {
		return UD_NICK;
	}

	public void setUD_NICK(String uD_NICK) {
		UD_NICK = uD_NICK;
	}

	public byte[] getUSER_PHOTO() {
        return USER_PHOTO;
    }

    public void setUSER_PHOTO(byte[] userPhoto) {
    	USER_PHOTO = userPhoto;
        if (userPhoto != null) {
            this.base64UserPhoto = Base64.getEncoder().encodeToString(userPhoto);
        } else {
            this.base64UserPhoto = null;
        }
    }

    public String getBase64UserPhoto() {
        return base64UserPhoto;
    }

    public void setBase64UserPhoto(String base64UserPhoto) {
        this.base64UserPhoto = base64UserPhoto;
    }


	public String getUD() {
		return UD;
	}

	public void setUD(String uD) {
		UD = uD;
	}

	public String getCANCEL() {
		return CANCEL;
	}

	public void setCANCEL(String uCANCEL) {
		CANCEL = uCANCEL;
	}

	public int getUSER_NUM() {
		return USER_NUM;
	}

	public void setUSER_NUM(int uSER_NUM) {
		USER_NUM = uSER_NUM;
	}

	public String getUSERNAME() {
		return USERNAME;
	}

	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getPHONENUM() {
		return PHONENUM;
	}

	public void setPHONENUM(String pHONENUM) {
		PHONENUM = pHONENUM;
	}

	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}

	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}

	public String getUSER_POST() {
		return USER_POST;
	}

	public void setUSER_POST(String uSER_POST) {
		USER_POST = uSER_POST;
	}

	public String getUSER_COMMENT() {
		return USER_COMMENT;
	}

	public void setUSER_COMMENT(String uSER_COMMENT) {
		USER_COMMENT = uSER_COMMENT;
	}

	public String getBase64USER_PHOTO() {
		return base64USER_PHOTO;
	}

	public void setBase64USER_PHOTO(String base64USER_PHOTO) {
	this.base64USER_PHOTO = base64USER_PHOTO; }
	
	public String getUSER_STREET() {
		return USER_STREET;
	}

	public void setUSER_STREET(String uSER_STREET) {
		USER_STREET = uSER_STREET;
	}

	public String getUSER_ZIP() {
		return USER_ZIP;
	}

	public void setUSER_ZIP(String uSER_ZIP) {
		USER_ZIP = uSER_ZIP;
	}

	public String getUSER_EMAIL_ERROR() {
		return USER_EMAIL_ERROR;
	}

	public void setUSER_EMAIL_ERROR(String uSER_EMAIL_ERROR) {
		USER_EMAIL_ERROR = uSER_EMAIL_ERROR;
	}

	public String getUSER_ID_ERROR() {
		return USER_ID_ERROR;
	}

	public void setUSER_ID_ERROR(String uSER_ID_ERROR) {
		USER_ID_ERROR = uSER_ID_ERROR;
	}
}