package seoulmate.membership;

public class MemberDTO {

	private int USER_NUM;
	private String USERNAME;
	private String EMAIL;
	private String USER_ID;
	private String PHONENUM;
	private String USER_PASSWORD;
	private String USER_POST;
	private String USER_COMMENT;
	private String USER_PHOTO;
	private String base64uSER_PHOTO;
	private String USER_STREET;
	private String USER_ZIP;
	private String USER_EMAIL_ERROR;
	private String USER_ID_ERROR;
	private String CANCEL;

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

	public String getUSER_PHOTO() {
		return USER_PHOTO;
	}

	public void setUSER_PHOTO(String uSER_PHOTO) {
		USER_PHOTO = uSER_PHOTO;
	}

	public String getBase64uSER_PHOTO() {
		return base64uSER_PHOTO;
	}

	public void setBase64uSER_PHOTO(String base64uSER_PHOTO) {
	this.base64uSER_PHOTO = base64uSER_PHOTO; }
	
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