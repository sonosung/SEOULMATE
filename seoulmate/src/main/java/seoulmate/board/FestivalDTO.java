package seoulmate.board;

public class FestivalDTO {
	private int festivalnum;
	private String festivalname;
	private String festivalcategory;
	private java.sql.Date start;
	private java.sql.Date end;
	private String festivallocation;

	public int getFestivalnum() {
		return festivalnum;
	}

	public void setFestivalnum(int festivalnum) {
		this.festivalnum = festivalnum;
	}

	public String getFestivalname() {
		return festivalname;
	}

	public void setFestivalname(String festivalname) {
		this.festivalname = festivalname;
	}

	public String getFestivalcategory() {
		return festivalcategory;
	}

	public void setFestivalcategory(String festivalcategory) {
		this.festivalcategory = festivalcategory;
	}

	public java.sql.Date getStart() {
		return start;
	}

	public void setStart(java.sql.Date start) {
		this.start = start;
	}

	public java.sql.Date getEnd() {
		return end;
	}

	public void setEnd(java.sql.Date end) {
		this.end = end;
	}

	public String getFestivallocation() {
		return festivallocation;
	}

	public void setFestivallocation(String festivallocation) {
		this.festivallocation = festivallocation;
	}

}
