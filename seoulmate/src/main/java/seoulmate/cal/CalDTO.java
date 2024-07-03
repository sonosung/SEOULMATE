package seoulmate.cal;

public class CalDTO {
	private int idx;
	private String fesname;
	private String fesstart;
	private String fesend;
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getFesname() {
		return fesname;
	}
	public void setFesname(String fesname) {
		this.fesname = fesname;
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
}
