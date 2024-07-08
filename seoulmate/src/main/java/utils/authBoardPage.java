package utils;

public class authBoardPage {
	public static String uListPagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqUrl) {
		String uListPagingStr = "";
		int totalPages = (int) (Math.ceil(((double) totalCount / pageSize)));

		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			uListPagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>";
			uListPagingStr += "&nbsp;";
			uListPagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1) + "'>[이전 블록]</a>";
		}

		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				uListPagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				uListPagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		if (pageTemp <= totalPages) {
			uListPagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp + "'>[다음 블록]</a>";
			uListPagingStr += "&nbsp;";
			uListPagingStr += "<a href='" + reqUrl + "?pageNum=" + totalPages + "'>[마지막 페이지]</a>";
		}

		return uListPagingStr;
	}
}
