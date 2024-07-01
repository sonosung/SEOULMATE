
var dateMsg1,dateMsg2;

var arrWinHandle = new Array();	// �앹뾽李� �몃뱾 ���� array

/*
 * 肄ㅻ낫議고쉶(selectBox)
 * @param : url
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 * @param : callBack function
 */
function gfnSelectBox(sUrl, obj, firstOpt, callBackFn, sync){

	sync = sync == null ? true : sync;

    var loop = 0;
    var params = {};

    $.ajax({
        url:sUrl,
        type:'post',
        async: sync,
        data: params,
        dataType : "json",
        error:function(){
            //alert('Error');
        },
        success:function(rtnData){

        	$("#"+obj).empty();

        	if(firstOpt && firstOpt != ""){
                $("#"+obj).get(0).options[0] = new Option(firstOpt, "");
                loop = 1;
            }

            $.each(rtnData, function(idx, ref) {
                $("#"+obj).get(0).options[idx+loop] = new Option(ref.cdNm, ref.cd);
            });

            //if (loop == 1) $("#"+obj+" option:eq(0)").prop("selected", true);

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {
                    callBackFn();
                } catch (e){
                    //alert("callback �⑥닔 �먮윭!!");
                }
            }
        }
    });
}

/*
 * 怨듯넻肄붾뱶(selectBox) - 鍮꾨룞湲� 諛⑹떇
 * @param : �붿껌 url
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 */
function gfnAXSelBxUrl(sUrl, obj, firstOpt){

	var isspace = firstOpt != "" ? true : false;

	$("#"+obj).bindSelect({
        reserveKeys: {
            options: "resultList",
            optionValue: "CD",
            optionText: "CDNM"
        },
        ajaxUrl: sUrl,
        ajaxPars: {},
        isspace: isspace,
        isspaceTitle: firstOpt,
        onchange: function(){
        	//console.log(Object.toJSON(this));
        }
    });
}

/*
 * 怨듯넻肄붾뱶(selectBox) - �숆린 諛⑹떇
 * @param : �붿껌 url
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 */
function gfnSyncAXSelBxUrl(sUrl, obj, firstOpt){

	var isspace = firstOpt != "" ? true : false;

	$("#"+obj).bindSelect({
        reserveKeys: {
            options: "resultList",
            optionValue: "CD",
            optionText: "CDNM"
        },
        ajaxUrl: sUrl,
        ajaxPars: {},
        ajaxAsync: false,
        isspace: isspace,
        isspaceTitle: firstOpt,
        onchange: function(){
        	//console.log(Object.toJSON(this));
        }
    });
}


/*
 * 怨듯넻肄붾뱶(selectBox) - 鍮꾨룞湲� 諛⑹떇
 * @param : 洹몃９肄붾뱶
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 */
function gfnAXSelBx(codeId, obj, firstOpt){

	var isspace = firstOpt != "" ? true : false;

	$("#"+obj).bindSelect({
        reserveKeys: {
            options: "resultList",
            optionValue: "CD",
            optionText: "CDNM"
        },
        ajaxUrl: "/common/combo/codeList",
        ajaxPars: {codeId: codeId},
        isspace: isspace,
        isspaceTitle: firstOpt,
        onchange: function(){
        	//console.log(Object.toJSON(this));
        }
    });
}

/*
 * 怨듯넻肄붾뱶(selectBox) - �숆린諛⑹떇
 * @param : 洹몃９肄붾뱶
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 */
function gfnSyncAXSelBx(codeId, obj, firstOpt){

	var isspace = firstOpt != "" ? true : false;

	$("#"+obj).bindSelect({
        reserveKeys: {
            options: "resultList",
            optionValue: "CD",
            optionText: "CDNM"
        },
        ajaxPars: {codeId: codeId},
        ajaxUrl: "/common/combo/codeList",
        ajaxAsync: false,
        isspace: isspace,
        isspaceTitle: firstOpt,
        onchange: function(){
        	//console.log(Object.toJSON(this));
        }
    });
}

/*
 * 怨듯넻肄붾뱶(selectBox) - 鍮꾨룞湲� 諛⑹떇
 * @param : 洹몃９肄붾뱶
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 * @param : callBack function
 */
function gfnAsyncAXSelBx(codeId, obj, firstOpt, callbackFunc){

	var isspace = firstOpt != "" ? true : false;

	$("#"+obj).bindSelect({
        reserveKeys: {
            options: "resultList",
            optionValue: "CD",
            optionText: "CDNM"
        },
        ajaxUrl: "/common/combo/codeList",
        ajaxPars: {codeId: codeId},
        ajaxAsync: true,
        isspace: isspace,
        isspaceTitle: firstOpt,
        onchange: function(){
        	//console.log(Object.toJSON(this));
        },
        onLoad: function(){
        	if(callbackFunc && callbackFunc != null && typeof(callbackFunc) == "function"){
   				callbackFunc();
   			}
        }
    });
}

/*
 * 怨듯넻肄붾뱶(selectBox)
 * @param : 洹몃９肄붾뱶
 * @param : selectBox id
 * @param : firstOpt > "�꾩껜", "�좏깮" �� 泥ル쾲吏� �듭뀡 異붽��� �섍릿��.
 * @param : callBack function
 */
function gfnComCdSelBx(codeId, obj, firstOpt, callBackFn, sync){

	sync = sync == null ? true : sync;

    var loop = 0;

    var params = {};
	params["codeId"] = codeId;

    $.ajax({
        url:'/common/combo/codeList',
        type:'post',
        async: sync,
        data: params,
        dataType : "json",
        error:function(){
            //alert('Error');
        },
        success:function(rtnData){

        	$("#"+obj).empty();

        	debugger;
        	if(firstOpt && firstOpt != ""){
                $("#"+obj).get(0).options[0] = new Option(firstOpt, "");
                loop = 1;
            }

            $.each(rtnData, function(idx, ref) {
                $("#"+obj).get(0).options[idx+loop] = new Option(ref.CDNM, ref.CD);
            });

            //if (loop == 1) $("#"+obj+" option:eq(0)").prop("selected", true);

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {
                    callBackFn();
                } catch (e){
                    //alert("callback �⑥닔 �먮윭!!");
                }
            }
        }
    });
}

// 肄붾뱶�댁슜�� 肄붾뱶媛� �쒖떆 ��
function gfnComCdSelBx2(codeGp, obj, firstOpt, callBackFn, sync){

	sync = sync == null ? true : sync;

    var loop = 0;

    var params = {};
	params["codeGroup"] = codeGp;
	params["order"] = "1";

    $.ajax({
        url:'/common/codeList',
        type:'post',
        async: sync,
        data: params,
        dataType : "json",
        error:function(){
            //alert('Error');
        },
        success:function(rtnData){

        	$("#"+obj).empty();

        	if(firstOpt && firstOpt != ""){
                $("#"+obj).get(0).options[0] = new Option(firstOpt, "");
                loop = 1;
            }

            $.each(rtnData, function(idx, ref) {
                $("#"+obj).get(0).options[idx+loop] = new Option(ref.cd, ref.cdNm);
            });

            //if (loop == 1) $("#"+obj+" option:eq(0)").prop("selected", true);

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {
                    callBackFn();
                } catch (e){
                    //alert("callback �⑥닔 �먮윭!!");
                }
            }
        }
    });
}

//肄붾뱶�댁슜�� 肄붾뱶媛� �쒖떆 �� - url�댁슜
function gfnComCdSelBx2UseUrl(reqUrl, params, obj, firstOpt, callBackFn, sync){

	sync = sync == null ? true : sync;

    var loop = 0;

    $.ajax({
        url:reqUrl,
        type:'post',
        async: sync,
        data: params,
        dataType : "json",
        error:function(){
            //alert('Error');
        },
        success:function(rtnData){

        	$("#"+obj).empty();

        	if(firstOpt && firstOpt != ""){
                $("#"+obj).get(0).options[0] = new Option(firstOpt, "");
                loop = 1;
            }

            $.each(rtnData, function(idx, ref) {
                $("#"+obj).get(0).options[idx+loop] = new Option(ref.cd, ref.cdNm);
            });

            //if (loop == 1) $("#"+obj+" option:eq(0)").prop("selected", true);

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {
                    callBackFn();
                } catch (e){
                    //alert("callback �⑥닔 �먮윭!!");
                }
            }
        }
    });
}

function gfn_comCdData(codeGp, codeId, firstOpt, callBackFn) {

    $.ajax({
    	url:'/common/codeList',
        type:'post',
        data: {codeGroup: codeGp},
        dataType : "json",
        error:function(){
            //alert('Error');
        },
        success:function(rtnData){
        	callBackFn(rtnData);
        }
    });
}

function gfnSyncComboCodeData(codeGp, callBackFn){

	$.ajax({
        url:'/common/combo/codeList',
        type:'post',
        async: false,
        data: {codeId: codeGp},
        dataType : "json",
        error:function(){
        },
        success:function(rtnData){
        	callBackFn(rtnData);
        }
    });
}

function gfnComCdGrid(codeGp, bSelectStr) {

	var resultData = "";

    $.ajax({
        url:'/common/codeList',
        type:'post',
        async: false,
        data: {codeGroup: codeGp},
        dataType : "json",
        error:function(){
            alert('Error');
        },
        success:function(rtnData){
        	resultData =  rtnData;
        }
    });

    var datas = "";
	for(var i in resultData){
		datas += resultData[i].CD +":"+ resultData[i].CD_NM+";";
	}

	if(bSelectStr != null && bSelectStr != "")datas = ":" + bSelectStr + ";" + datas;

	return datas.substring(0, datas.length-1);

}

//肄ㅻ쭏李띻린
function gfn_comma(str) {

	try{
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}catch(e){
		return str;
	}


}

/* �꾩닔媛� 泥댄겕 �좏슚�� 寃���
 * @author :
 * @param  : value
 * @return : true,false
 */
function isRequiredCheck(data){
if(typeof data == "undefined" || data == "" || data == null ){
	return false;
   }
return true;
}

/* 湲몄씠 泥댄겕 �좏슚�� 寃���
 * @author :
 * @param  : value
 * @return : true,false
 */
function isLengthCheck(data,start,end){
	var leng = data.length;
	if(leng < start || leng > end){
		return false;
	}
return true;
}


/* �レ옄 �좏슚�� 寃���
 * @author :
 * @param  : value
 * @return : true,false
 */
function isNumberCheck(data) {
	if(isNaN(data) == true) {
		return false;
	} else {
		return true;
	}
 }

 /* �대찓�� �좏슚�� 寃���
  * @author :
  * @param  : value
  * @return : true,false
  */
 function isEmailCheck(data) {
	 var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	 if(regex.test(data) == false) {
		 return false;
	} else {
		return true;
	}
}

 /* �좎쭨 �좏슚�� 寃���
  * @author :
  * @param  : date value
  * @return : true,false
  * type = 'yyyy-mm-dd'
  */
 function isDateCheck(d) {
	    // �щ㎎�� �덈쭪�쇰㈃ false由ы꽩
	    if(!isDateFormat(d)) {
	        return false;
	    }

	    var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

	    var dateToken = d.split('-');
	    var year = Number(dateToken[0]);
	    var month = Number(dateToken[1]);
	    var day = Number(dateToken[2]);

	    // �좎쭨媛� 0�대㈃ false
	    if(day == 0) {
	        return false;
	    }

	    var isValid = false;

	    // �ㅻ뀈�쇰븣
	    if(isLeaf(year)) {
	        if(month == 2) {
	            if(day <= month_day[month-1] + 1) {
	                isValid = true;
	            }
	        } else {
	            if(day <= month_day[month-1]) {
	                isValid = true;
	            }
	        }
	    } else {
	        if(day <= month_day[month-1]) {
	            isValid = true;
	        }
	    }

	    return isValid;
	}

 /*  �좎쭨�щ㎎�� 留욌뒗吏� 寃���
  * @author :
  * @param  : date value,
  * @return : true,false
  */
 function isDateFormat(d) {
     var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
     return d.match(df);
 }

 /*
  * �좎쭨 �ㅻ뀈�щ� 寃���
  * @author :
  * @param  : year value,
  * @return : true,false
  */
 function isLeaf(year) {
     var leaf = false;

     if(year % 4 == 0) {
         leaf = true;

         if(year % 100 == 0) {
             leaf = false;
         }

         if(year % 400 == 0) {
             leaf = true;
         }
     }

     return leaf;
 }

 /*
  * �レ옄泥댄겕 �⑥닔
  * @author :
  * @param  : Object
  * @return :
  */
 function numChk(obj){
		if(obj.value == null || obj.value == ""){
		return;
	}

	if(isNaN(obj.value)){
		alert(comm_msg.COMM012);
		obj.value = "";
		return;
	}
}

 /*
  * Enter key �대깽��
  * @author :
  * @param  : e, �몄텧 �묒뀡
  * @return :
  */
 function enterEvent(e, fn){
		if(e.keyCode == 13){
			eval(fn);
			return false;
		}
		else{
			return true;
		}
	}


 /*
  * �낅젰 臾몄옄 湲몄씠 諛섑솚 �⑥닔
  * @author :
  * @param  : 媛앹껜, �쒖떆�좉컼泥�, 湲몄씠
  * @return :
  */
 function returnLength(obj, leng) {
 	var strCount = 0;
 	var tempStr;

 	for(var i=0;i<obj.value.length;i++){
 		tempStr = obj.value.charAt(i);
 		if(escape(tempStr).length > 4) {
 			strCount += 2;
 		} else {
 			strCount += 1 ;
 		}
 	}

 	var isNumber = (strCount>leng)?false:true;
 	if(!isNumber) {
 		alert("湲몄씠媛� "+leng+"byte瑜� 珥덇낵�덉뒿�덈떎");
 		obj.value=obj.value.substring(0,obj.value.length-1);
 		strCount = leng;
 	}
 }

 /*
  * replaceAll
  * @author :
  * @param  :
  * @return :
  */
 String.prototype.replaceAll = function( searchStr, replaceStr ){
     return this.split( searchStr ).join( replaceStr );
 }

 /*
  * �뱀닔臾몄옄 蹂�寃�
  * @author :
  * @param  :
  * @return :
  */
 function escapeReplace(vals){
 	return vals.replaceAll("&","&amp").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("'","&#39;").replaceAll("\"","&quot;");
 }

 /*
  * �뺤옣�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function fnGetExt(file_name){
	 if(file_name == "" || file_name == null){
		 return "";
	 }
	 var ext = "";
	 if(file_name != "" && file_name.length>0){
		 var cnt = file_name.length;
		 for(var i=(cnt-1);i>0;i--){
			 var str = file_name.charAt(i);
			 if(str == "."){
				 break;
			 }
			 else{
				 ext = str+ext;
			 }
		 }
	 }
	 return ext;
 }

 /*
  * �ㅻ뒛�좎쭨 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function gfn_getStringDateYMD() {
	    var date = new Date();

	    var month;
	    var days;
	    var hour;
	    var min;
	    var sec;

	    if (Number(date.getMonth() + 1) < 10) {
	        month = "0" + Number(date.getMonth() + 1);
	    } else {
	        month = Number(date.getMonth() + 1);
	    }

	    if (Number(date.getDate()) < 10) {
	        days = "0" + date.getDate();
	    } else {
	        days = date.getDate();
	    }

	    var today = {
	        year : String(date.getFullYear()),
	        mon : String(month),
	        day : String(days)
	    };

	    var fullString = today.year + "-" + today.mon + "-" + today.day;

	    return fullString;
}

 /*
  * �ㅻ뒛�좎쭨 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
function gfn_getStringDateYYYMMDDHH24MISS() {
	    var date = new Date();

	    var month;
	    var days;
	    var hour;
	    var min;
	    var sec;

	    if (Number(date.getMonth() + 1) < 10) {
	        month = "0" + Number(date.getMonth() + 1);
	    } else {
	        month = Number(date.getMonth() + 1);
	    }

	    if (Number(date.getDate()) < 10) {
	        days = "0" + date.getDate();
	    } else {
	        days = date.getDate();
	    }

	    if (Number(date.getHours()) < 10) {
	    	hour = "0" + date.getHours();
	    } else {
	    	hour = date.getHours();
	    }

	    if (Number(date.getMinutes()) < 10) {
	    	min = "0" + date.getMinutes();
	    } else {
	    	min = date.getMinutes();
	    }

	    if (Number(date.getSeconds()) < 10) {
	    	sec = "0" + date.getSeconds();
	    } else {
	    	sec = date.getSeconds();
	    }

	    var today = {
	        year : String(date.getFullYear()),
	        mon : String(month),
	        day : String(days),
	        hour : String(hour),
	        min : String(min),
	        sec : String(sec),
	    };

	    var fullString = today.year + "-" + today.mon + "-" + today.day + " " + today.hour + ":" + today.min + ":" + today.sec;

	    return fullString;
}

 /*
  * �대쾲�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function fnGetStringDateYM() {
	    var date = new Date();

	    var month;

	    if (Number(date.getMonth() + 1) < 10) {
	        month = "0" + Number(date.getMonth() + 1);
	    } else {
	        month = Number(date.getMonth() + 1);
	    }

	    var today = {
	        year : String(date.getFullYear()),
	        mon : String(month)
	    };

	    var fullString = today.year + "-" + today.mon;

	    return fullString;
}


 /*
  * �섎（�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMD1D(date){
	 var selectDate = date.split("-");
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);

	 var year = changeDate.getFullYear();
	 var month = changeDate.getMonth() + 1;
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }

	 var resultDate = year + "-" + month + "-" + days;
	 return resultDate;
 }


 /*
  * �쇱＜�쇱쟾 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMD7M(date){
	 var selectDate = date.split("-");
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-7);

	 var year = changeDate.getFullYear();
	 var month = changeDate.getMonth() + 1;
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }

	 var resultDate = year + "-" + month + "-" + days;
	 return resultDate;
 }

 /*
  * �쒕떖�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMD1Mon(date){
	 var selectDate = date.split("-");
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1]-2);

	 var year = changeDate.getFullYear();
	 var month = changeDate.getMonth() + 1;
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }

	 var resultDate = year + "-" + month + "-" + days;
	 return resultDate;
 }

 /*
  * �쒕떖�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMDAft1Mon(date){
	 var selectDate = date.split("-");
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1]);

	 var year = changeDate.getFullYear();
	 var month = changeDate.getMonth() + 1;
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }

	 var resultDate = year + "-" + month + "-" + days;
	 return resultDate;
 }

 /*
  * 1�꾪썑 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMDAft1Year(date){
	 var selectDate = date.split("-");
 /*
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1] - 1);

	 var year = changeDate.getFullYear() + 1;
	 var month = changeDate.getMonth();
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }
*/
	 var resultDate = (Number(selectDate[0]) + 1) + "-" + selectDate[1] + "-" + selectDate[2];
	 return resultDate;
 }

 /*
  * �먮떖�� 媛��몄삤湲�
  * @author :
  * @param  :
  * @return :
  */
 function getStringDateYMD2Mon(date){
	 var selectDate = date.split("-");
	 var changeDate = new Date();
	 changeDate.setFullYear(selectDate[0], selectDate[1]-3);

	 var year = changeDate.getFullYear();
	 var month = changeDate.getMonth() + 1;
	 var days = changeDate.getDate();
	 if(month < 10) { month = "0" + month; }
	 if(days < 10) { days = "0" + days; }

	 var resultDate = year + "-" + month + "-" + days;
	 return resultDate;
 }


 function fnNvl(str1, str2){
	 if(str1 == "" || str1 == null || str1 == undefined || str1 == "undefined"){
		 return str2;
	 }else{
		 return str1;
	 }
 }

 function gfn_nvl(str1, str2){
	 if(str1 == "" || str1 == null || str1 == undefined || str1 == "undefined"){
		 return str2;
	 }else{
		 return str1;
	 }
 }

 /*
  * �낅젰�꾨뱶 �곷Ц �レ옄留� �덉슜
  * @author :
  * @param  :
  * @return :
  */
 function fnAlphaNum(target){
	var target = "#"+target;
	var pattern = /[^(a-zA-Z0-9)]/; //�곷Ц, �レ옄留� �덉슜
	if(pattern.test($(""+target+"").val())){
		alert("�곷Ц, �レ옄留� �덉슜 媛��ν빀�덈떎.");
		$(""+target+"").val('');
		$(""+target+"").focus();
		return false;
	}

	return true;
}

 /*
  * �낅젰�꾨뱶 �쒓� �곷Ц �レ옄留� �덉슜
  * @author :
  * @param  :
  * @return :
  */
function fnTextAlphaNum(target){
	var target = "#"+target;
	var pattern = /[^(媛�-�즑-zA-Z0-9)]/; //�쒓�,�곷Ц,�レ옄留� �덉슜
	if(pattern.test($(""+target+"").val())){
		alert("�쒓�, �곷Ц, �レ옄留� �덉슜");
		$(""+target+"").val('');
		$(""+target+"").focus();
		return false;
	}
}

/*
 * �낅젰�꾨뱶 �곷Ц �レ옄 @ . 留� �덉슜
 * @author :
 * @param  :
 * @return :
 */
function fnEmailAlphaNum(target){
	var target = "#"+target;
	var pattern = /[^(a-zA-Z0-9@.)]/; //�곷Ц, �レ옄, @ . 留� �덉슜
	if(pattern.test($(""+target+"").val())){
		alert("�곷Ц, �レ옄, @ 留� �덉슜");
		$(""+target+"").val('');
		$(""+target+"").focus();
		return false;
	}
}

/*
 * �쒓��낅젰 諛⑹�
 * @author :
 * @param  :
 * @return :
 */
function fnHangulChk(obj){
	var id_pattern = new RegExp('[^a-zA-Z0-9]');
	if (id_pattern.test(obj.value)) {
		alert(comm_msg.COMM032);
		obj.value = "";
	    return;
	}
}

/*
 * url �뺤떇
 * @author :
 * @param  :
 * @return :
 */
function fnUrlChk(obj){
	var id_pattern = new RegExp('[^a-zA-Z0-9:/-_?&.=]');
	if (id_pattern.test(obj.value)) {
		alert(comm_msg.COMM033);
		obj.value = "";
	    return;
	}
}


/*
 * byte 泥댄겕�� byte 媛� �쒖떆 諛� byte �� 留욊쾶 value 媛� �ㅼ젙
 * @author :
 * @param  :
 * @return :
 */
function fnCheckGetByte(objName, idName, TempValue, maxLength)	{

	var OrgText = '';
	var CharLength = 0;
	var OrgCharLength = 0;
	var OrgTextLength = 0;
	var NowLength = TempValue.length;  // �꾩옱 媛��몄삩 �낅젰�� 湲몄씠
	var lineFeedLength = (TempValue.split("\n").length) - 1;
	var OneCharacter = ""; // �쒓��먯뵫 �ｌ뼱�� �꾩떆 蹂���

	CharLength += lineFeedLength;
	// ���λ맂 湲몄씠�� 媛숈�吏� 鍮꾧탳
	if (NowLength > OrgTextLength) {
		// ���λ맂 湲몄씠 蹂대떎 留롮쓣 寃쎌슦 珥덇낵�� 遺�遺꾨쭔 鍮꾧탳
		for(var i=OrgTextLength ; i< NowLength ; i++) {
			// �쒓��먯텛異�
		OneCharacter = TempValue.charAt(i);

		// �쒓��대㈃ 2瑜� �뷀븳��.
			if (escape(OneCharacter).length > 4){
				CharLength += 2;
			} else{ // 洹몃컱�� 寃쎌슦�� 1�� �뷀븳��.
				CharLength++;
			}

			// �꾩껜湲몄씠瑜� 珥덇낵�섎㈃
			if(CharLength > maxLength) {
				alert( maxLength + " byte瑜� 珥덇낵 �낅젰�좎닔 �놁뒿�덈떎. \n珥덇낵�� �댁슜�� �먮룞�쇰줈 ��젣 �⑸땲��. ");
				objName.value = OrgText;
				if(idName != null && idName != ''){
					document.getElementById(idName).innerHTML = OrgCharLength;
				}
				return;
			} else {
				OrgText += OneCharacter;
				OrgTextLength = TempValue.length;
				OrgCharLength = CharLength;
			}
		}
	} else if (NowLength < OrgTextLength) {
		OrgText = "";
		CharLength = 0;
		// ���λ맂 湲몄씠蹂대떎 �묒� 寃쎌슦 泥섏쓬遺��� 寃���
		for(var i=0 ; i< NowLength ; i++) {
			// �쒓��먯텛異�
			OneCharacter = TempValue.charAt(i);

			// �쒓��대㈃ 2瑜� �뷀븳��.
			if (escape(OneCharacter).length > 4) {
				CharLength += 2;
			} else{ // 洹몃컱�� 寃쎌슦�� 1�� �뷀븳��.
				CharLength++;
			}

			OrgText += OneCharacter;
		}

		OrgTextLength = TempValue.length;
	}
	if(idName != null && idName != ''){
		document.getElementById(idName).innerHTML = CharLength;
	}
	return;
}

/**
 *
 * �ㅻ뒛�쇱옄 湲곗��쇰줈 �뱀젙 �붿씪 援ы븯湲�
 *
 * @author	吏꾩쁺沅�
 * @since	2013-08-13
 * @returns	String
 */
function getStringDateYoIl(source) {

	// 0:�쇱슂��, 1:�붿슂��, 2:�붿슂��, 3:�섏슂��, 4:紐⑹슂��, 5:湲덉슂��, 6:�좎슂��
	var setYoIl = 0;

	if (source != "undefined" || source != "" || source != null) {
		setYoIl = source;
	}

	var myToday = new Date();
	var myDate = new Date();

	myDate.setYear(myToday.getFullYear());
	myDate.setMonth(myToday.getMonth());
	myDate.setDate(myToday.getDate());
	myDate.setHours(0, 0, 0, 0);

	var setRequireDay = setYoIl;
	while (myDate.getDay() != setRequireDay) {
//		alert( "DAY :: " + myDate.getDay());
		myDate.setDate(myDate.getDate() + 1);
	}

	return myDate;
}

/**
 *
 * �좎쭨 �뺥깭 蹂���
 *
 * @author	吏꾩쁺沅�
 * @since	2013-08-13
 * @returns	String
 */
function getStringDateByFlag(source, flag) {

	var returnSource = 0;
	var returnFalg = "-";

	if (source != "undefined" || source != "" || source != null) {
		returnSource = source;
	}

	if (flag != "undefined" || flag != "" || flag != null) {
		returnFalg = flag;
	}

	var flagDate = getStringDateYoIl(returnSource);

	var returnYean = flagDate.getFullYear();
	var returnMonth = (flagDate.getMonth() + 1);
	var returnDate = flagDate.getDate();

	if (returnMonth < 10) {
		returnMonth = "0" + returnMonth;
	}

	return returnYean + returnFalg + returnMonth + returnFalg + returnDate;
}

/**
 *
 * �ㅻ뒛�쇱옄 湲곗�, �뚯븘�ㅻ뒗 �좎슂�� 援ы븯湲�
 *
 * @author	吏꾩쁺沅�
 * @since	2013-08-13
 * @returns	String
 */
function getStringDateSaturday() {
	return getStringDateByFlag(6, "-");
}

/**
 *
 * �ㅻ뒛�쇱옄 湲곗�, �뚯븘�ㅻ뒗�쇱슂�� 援ы븯湲�
 *
 * @author	吏꾩쁺沅�
 * @since	2013-08-13
 * @returns	String
 */
function getStringDateSunday() {
	return getStringDateByFlag(0, "-");
}

/**
 * �몄옄濡� �섏뼱�� '��'�� '0'蹂대떎 �묒쑝硫� '0'�� �뷀븳��
 *
 * @author	吏꾩쁺沅�
 * @since	2013-08-23
 * @returns	String
 */
//癤울뼁function setAddzero(n) {
    //return n < 10 ? "0" + n: n;
//}

/**
 * �ㅻ뒛 �쇱옄 湲곗��쇰줈 吏��� �쇱옄瑜� 援ы븳��.
 *
 * @param n ��
 * @param m ��
 * @returns {String}
 */
function getStringBeforeDate(n,m){

     var date = new Date();
     var resDate = new Date(Date.parse(date)-n* 1000 * 60 * 60 * 24);

     if(n < 10){
    	 resDate.setMonth(resDate.getMonth()-n);
     }
     var yyyy = resDate.getFullYear();
     var mm = resDate.getMonth()+1;
     var dd = resDate.getDate();

	return yyyy+'-'+setAddzero(mm)+'-'+setAddzero(dd);

}

/*
 * ��, ��, �� �좎쭨 �뗮똿 (selectBox)
 *
 * @author jaehun
 * @param : selectBox id(year)
 * @param : selectBox id(month)
 * @param : selectBox id(day)
 * ex) setDefaultSelectDate("birthYear", "birthMonth", "birthDay");
 */
function setDefaultSelectDate(year, month, day) {
    var yLen = 0;
    for(var i=1900;i<=new Date().getFullYear();i++){
        $("#"+year).get(0).options[yLen] = new Option(i,i);
        yLen++;
    }
    var vMonth = "";
    for(var i=1;i<=12;i++){
        if (i < 10) vMonth = "0" + i;
        else vMonth = i;
        $("#"+month).get(0).options[i-1] = new Option(i,vMonth);
    }

    //dafault year
    $("#"+year).val("1980");

    var vDay = "";
    for(var i=1;i<=new Date($("#"+year+" option:selected").val(), $("#"+month+" option:selected").val(), 0).getDate();i++){
        if (i < 10) vDay = "0" + i;
        else vDay = i;
        $("#"+day).get(0).options[i-1] = new Option(i,vDay);
    }

    $("#"+year+", #"+month).change(function(){
        var lastDate = new Date($("#"+year+" option:selected").val(), $("#"+month+" option:selected").val(), 0);
        var lastDay = lastDate.getDate();

        $("#"+day).empty();
        for(var i=1;i<=lastDay;i++){
            if (i < 10) vDay = "0" + i;
            else vDay = i;
            $("#"+day).get(0).options[i-1] = new Option(i,vDay);
        }
    });
}

/*
 * Input �낅젰�� 留됯린 (�꾩옱 �レ옄留� 泥섎━�섏뼱 �덉쓬)
 *
 * @author jaehun
 * @param : objId > �ㅼ쨷�곸슜�� , 濡� 援щ텇
 * @param : inpGb > "number"
 * ime-mode瑜� 諛섎뱶�� disabled濡� �ㅼ젙�댁빞 ��.
 * ��) style="ime-mode:disabled"
 */
function inpWrtBlc(objId, inpGb){
    var arrObj = objId.split(",");
    $(function(){
        $.each(arrObj, function(idx, ref) {
            $("#"+$.trim(ref)).keydown(function(e){
                if (inpGb == "number"){
                    //e.altkey == true
                    if((e.keyCode < 48 || e.keyCode > 57) && (e.keyCode < 96 || e.keyCode > 105) && e.keyCode != 8 && e.keyCode != 9 && e.keyCode != 0) return false;
                }
            });
        });
    });
}

/*
 * Get Cookie
 *
 * @author jaehun
 * @param : name
 */
function getCookie(name) {
    var nameOfCookie = name + "=";
    var x = 0;
    while (x <= document.cookie.length) {
        var y = (x+nameOfCookie.length);
        if (document.cookie.substring(x, y)== nameOfCookie) {
            if ((endOfCookie=document.cookie.indexOf(";", y))== -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x)+ 1;
        if (x == 0)
            break;
    }
    return "";
}

/*
 * Set Cookie
 *
 * @author jaehun
 * @param : name
 * @param : value
 * @param : expiredays �좎�湲곌컙
 */
function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate()+ expiredays);
    document.cookie = name + "=" + escape(value)+ "; path=/; expires=" + todayDate.toGMTString()+ ";";
}

/*
 * Clear Cookie
 *
 * @author jaehun
 * @param : name
 * @param : value
 * @param : expiredays �좎�湲곌컙
 */
function clearCookie(name) {
    var expire_date = new Date();
    //�댁젣 �좎쭨瑜� 荑좏궎 �뚮㈇ �좎쭨濡� �ㅼ젙�쒕떎.
    expire_date.setDate(expire_date.getDate() - 1);
    document.cookie = name + "= " + "; expires=" + expire_date.toGMTString() + "; path=/";
}

//input title 吏���
function gfn_setInputTitle(){
	for(var i=0;i<$("input").length; i++){
		if($("input").eq(i).attr("placeholder") != null){
			$("input").eq(i).attr("title", $("input").eq(i).attr("placeholder"));
		}else if($("input").eq(i).attr("value") != null){
			$("input").eq(i).attr("title", $("input").eq(i).attr("value"));
		}else if($("input").eq(i).text() != null){
			$("input").eq(i).attr("title", $("input").eq(i).text());
		}
	}
}
/* undefined
 * @author :
 * @param  : value
 * @return : value or ''
 */
function isUndefined(data){

	if(typeof data == "undefined" || data == "" || data == null || data == "undefined"){
		data = "";
    }
	return data;
}

/* 臾몄옄�� �ㅽ듃留� �щ㎎ 蹂�寃�
 * @author :
 * @param  : 20140808 ->2014-08-08
 * @return : value or ''
 */
function gfn_isStrFormat(str,format){
	try{
		if(typeof str == "undefined" || str == "" || str == null || str == "undefined"){
			str = "";
	    }else{
	    	if(str.length == 6){
	    		str = String(str.substring(0,4)) + format + String(str.substring(4,6));
	    	}else if(str.length == 8){
	    		str = String(str.substring(0,4)) + format + String(str.substring(4,6)) + format + String(str.substring(6,8));
	    	}
	    }
	}catch(e){
		str = "";
	}
	return str;
}

/* �꾩옱�쇰줈遺��� day留뚰겮 利앷��� �좎쭨瑜� 由ы꽩
 * @author :
 * @param  : 20140808 ->2014-08-08
 * @return : value or ''
 */
function getCalDate(day){

	var caledmonth, caledday, caledYear, returnDay;
	var loadDt = new Date();
	var v = new Date(Date.parse(loadDt) + day*1000*60*60*24);

	caledYear = v.getFullYear();

	if( v.getMonth() < 9 ){
		caledmonth = '0'+(v.getMonth()+1);
	}else{
		caledmonth = v.getMonth()+1;
	}

	if( v.getDate() < 9 ){
		caledday = '0'+v.getDate();
	}else{
		caledday = v.getDate();
	}

	returnDay = caledYear+"-"+caledmonth+"-"+caledday;

	return returnDay;

}

function getCalUserDate(date, day){

	var caledmonth, caledday, caledYear, returnDay;
	var loadDt = new Date(date);
	var v = new Date(Date.parse(loadDt) + day*1000*60*60*24);

	caledYear = v.getFullYear();
/*
	if( v.getMonth() < 9 ){
		caledmonth = '0'+(v.getMonth()+1);
	}else{
		caledmonth = v.getMonth()+1;
	}
*/
	caledmonth = lpad(v.getMonth()+1, 2, "0");
/*
	if( v.getDate() < 9 ){
		caledday = '0'+v.getDate();
	}else{
		caledday = v.getDate();
	}
	*/

	caledday = lpad(v.getDate(), 2, "0");

	returnDay = caledYear+"-"+caledmonth+"-"+caledday;

	return returnDay;

}

function fnCommonAjaxGet(actionUrl, paramObj, callBackFn ) {

	if(actionUrl == ""){
		return;
	}

    $.ajax({
        url:actionUrl,
        type:'get',
        data: paramObj,
        dataType : "json",
        error : function(data) {

        },
        success:function(rtnData){

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {

                    callBackFn(rtnData);

                } catch (e){
                }
            }
        }
    });
}

function fnCommonAjaxPost(actionUrl, paramObj, callBackFn ) {

	if(actionUrl == ""){
		return;
	}

    $.ajax({
        url:actionUrl,
        type:'post',
        data: paramObj,
        dataType : "json",
        error : function(data) {
        },
        success:function(rtnData){

            if (callBackFn) {
                //�ㅽ뻾 �� callback function
                try {

                    callBackFn(rtnData);

                } catch (e){
                }
            }
        }
    });
}

function gfn_callPostJsonData(url, data, callBackFn, syncType, useLoadingBar){

	syncType = syncType == null ? true : syncType;

    $.ajax({
        url:url,
        type:'post',
        data:data,
        dataType : "json",
        async: syncType,
		cache: false,
		beforeSend : function(){
			if(useLoadingBar){
				//$('.loading').addClass('active');
			}
	 	},
        error:function(request,status,error){

    		//alert("�붿껌 泥섎━ 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
    		//unblockUI();
    		//$('.loading').removeClass('active');
        },
        success:function(rtnData){

        	//$('.loading').removeClass('active');
        	if(callBackFn != null)callBackFn(rtnData);
        },
        complete: function(){
        	//$('.loading').removeClass('active');
		}
    });
}

/**
 * @param obj
 * @returns {Boolean}
 */
function gfn_chkNvl(obj){
	 if(obj == null || obj == "" || obj == "undefined" || obj == undefined || (typeof(obj) == "string" && obj.trim() == "")){
		 return true;
	 }else{
		 return false;
	 }
}

function gfn_nvl(obj){
	 if(obj == null || obj == "" || obj == "undefined" || obj == undefined || (typeof(obj) == "string" && obj.trim() == "") || obj == "null"){
		 return "";
	 }else{
		 return obj;
	 }
}

//�レ옄�뺥깭濡� 蹂���
function gfn_toInt(val){
	if(gfn_chkNvl(val))return 0;

	try{
		val = Number(val);
	}catch(e){
		return 0;
	}

	return val;
}

// �좎쭨瑜� �レ옄�뺥깭濡� 蹂���
function gfn_dateToInt(val){
	if(gfn_chkNvl(val))return 0;

	try{
		if(typeof(val) == "string")val = val.replace(/-/gi, "").replace(/\//gi, "");
	}catch(e){
		return 0;
	}


	return Number(val);
}

function gfn_msg(msg){
	$("#alert_msg").text(msg);

	$("#div_alert_msg").modal({
		keyboard: false
	});
}

function gfn_confirm(msg){

	$("#alert_msg").text(msg);
	$("#div_alert_msg").dialog({
		draggable: false,
	    modal: true,
	    buttons: {
	    	OK : function() {
	    		$(this).dialog( "close" );
	    		gfn_confirmReturn(true);
	        },
	        CANCEL : function() {
	        	$(this).dialog( "close" );
	        	gfn_confirmReturn(false);
	        }
	    }
	});
}

function gfn_confirmReturn(flag){
	return flag;
}

function fn_bpopup(url,wsize,hsize,layerId){
	var elId = "#maskLayer";
	if(layerId != null && layerId != undefined && layerId != "undefined" && layerId != ""){
		elId = "#" + layerId;
	}

	$(elId).css("width", wsize);
	$(elId).css("height", hsize);

	$(elId).bPopup({

		modalClose: false,
		speed:200,
		transition:'slideDown',
		transitionClose: 'slideBack',
        content:'iframe', //'ajax', 'iframe' or 'image'
    	loadUrl:url //Uses jQuery.load()
    });

	$('.b-iframe').css("width", wsize);
	$('.b-iframe').css("height", hsize);
}

/**
 * bpopup �ㅽ뵂 �� document �믪씠�� 留욊쾶 resize
 * �먯떇李쎌뿉�� �⑥닔 �몄텧
 */
function fnBpAutoResize(){

	//console.log($(".wrap_pop").height());

	parent.$(".b-iframe").css("height", $(".wrap_pop").height());
	parent.$("#maskLayer").height($(".wrap_pop").height());
}

function fn_bClose(layerId){
	var elId = "#maskLayer";
	if(layerId != null && layerId != undefined && layerId != "undefined" && layerId != ""){
		elId = "#" + layerId;
	}

	var bPopup = $(elId).bPopup();
	bPopup.close();

	$(elId).html('');
}

/**
 * �앹뾽 李� �닿린
 * @param url
 * @param map1
 * @see #popupPostNew
 */
function fn_Popup(/** String */ url, /** Number */ w, /** Number */ h, /** String */ _WinName, /** String */ _FrmName, /** Map */ arg, vo) {
	if (_WinName === undefined || _WinName == null) {
		_WinName = "_blank";
	}
	if (_FrmName === undefined || _FrmName == null) {
		_FrmName = "frmPopup";
	}

	fnComClosePopup(_WinName); // 湲곗〈 媛숈� �대쫫�� �앹뾽李쎌쓣 �ル뒗��.
	opt = getOptNewCenter(w, h); //�쇳꽣 �ㅽ뵂
	arrWinHandle[_WinName] = window.open('', _WinName, opt);
	if (arrWinHandle[_WinName]) {
		arrWinHandle[_WinName].focus();
		fnPopupWindowThruPostNew(url, arg, _FrmName, _WinName,vo);
	}
	return arrWinHandle[_WinName];
}

/**
 * POST 諛⑸쾿�쇰줈 �앹뾽李� �꾩슦湲� New 2014-07-29
 * �댁쟾 諛⑹떇�� �뚯닔 �놁쓬
 * @param url
 * @param map1
 * @see #popupPost
 */
function fnPopupWindowThruPostNew(/** String */ url, /** map */ arg, /** String */ frmName, /** String */ targetName, vo) {
	var $frm = $('form[target='+ targetName + ']');
	if ($frm.length == 1) {
		$frm.remove();
	}

	var frm = document.createElement('form');
	for (var key in arg) {
        value = arg[key];
        var input = '<input type="hidden" name="' + key + '" value="' + value + '">';
        $(frm).append(input);
	}

	frm.setAttribute('name', frmName || vo);
	frm.setAttribute('action', url);
	frm.setAttribute('method', 'post');
	frm.setAttribute('target', targetName);
	document.body.appendChild(frm);

	frm.submit();
}

//** ---------------------------------------------------------------------------
//�� �� 紐� : fnComClosePopup
//��    �� :
//		  1. pWinName : open windown name
//紐�    �� : �꾩옱 �대┛ popup李쎌쓣  �ル뒗��.
//�� 濡� �� :
//寃�    �� :
//��   ��  :
//�� �� �� :
//��    �� :
//** ---------------------------------------------------------------------------
function fnComClosePopup(pWinName) {
	if(typeof(pWinName) == 'undefined') {	// �꾩껜 �リ린
		for(var i in arrWinHandle){	// �꾩옱 �대젮 �덈뒗 �앹뾽李�
			if(arrWinHandle[i] != null && typeof(arrWinHandle[i].name)== "string" ){ // �몃뱾�� 議댁옱�섎뒗 �뺤씤
				arrWinHandle[i].close();
				arrWinHandle[i] = null;
			}
		}

	} else {	// �섏뼱�� object留� �リ린
		if(arrWinHandle[pWinName] != null && typeof(arrWinHandle[pWinName].name)== "string" ){ // �몃뱾�� 議댁옱�섎뒗 �뺤씤
			arrWinHandle[pWinName].close();
			arrWinHandle[pWinName] = null;
		}
	}

}

function getOptNewCenter(/** Number */ w, /** Number */ h) {
	var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
	var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
	var width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
	var height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
	var left = ((width / 2) - (w / 2)) + dualScreenLeft;
	var top = ((height / 2) - (h / 2)) + dualScreenTop;

	var pos = 'height='+ h+ ',width='+ w+ ',left='+ left+ ',top='+ top;
	var opt = 'location=no,directories=no,toolbar=no,status=no,menubar=no,scrollbars=yes,copyhistory=no,resizable=no,'+ pos;
	return opt;
}


// �좎쭨 泥댄겕
function gfn_chkDate(date){

	var dateVal = $(date).val();

	if(gfn_chkNvl(dateVal)){
		//$(date).val(glbInputOrigVal);
		return false;
	}

	dateVal = gfn_dateToInt(dateVal) + "";

	if(!isNumberCheck(dateVal) || dateVal.length < 8){
		gfn_msg(dateMsg1);
		$(date).val(glbInputOrigVal);
		return false;
	}

	dateVal = dateVal.substring(0,4) + "-" + dateVal.substring(4,6) + "-" + dateVal.substring(6,8);

	if(!isDateCheck(dateVal)){
		gfn_msg(dateMsg2);
		$(date).val(glbInputOrigVal);
		return false;
	}

	$(date).val(dateVal);

	return true;
}

function blockUINoTimeOut(/** String */ mesg, /** object of the css */ cssMap, /** Number */ timeout){

	var modFlag = false;

	if(window.parent && window.parent != this && $.trim(window.parent.$("#maskLayer").html()) != ""){
		modFlag = true;
	}

	if(window.parent && window.parent != this && modFlag == false){
		window.parent.blockUINoTimeOut();
		return;
	}

	try{

		cssMap = cssMap || { backgroundColor: '#000', width:'0px', height:'0px', padding:'0px', border: "0px", position:'absolute', left:'48%', top:'40%' };

		$.blockUI({
			message: '<div id="loader-wrap" class="loading">Loading...</div>',
			fadeIn:0,
			css: cssMap,
			overlayCSS: { backgroundColor: '#000', opacity: 0.8, cursor: 'wait' },
			blockMsgClass: 'blockMsg',
			timeout : 0
		});

	}catch(e){}

}

function unblockUINoTimeOut(){

	if(window.parent && window.parent != this && $.trim(window.parent.$("#maskLayer").html()) != ""){
		$.unblockUI();
		return;
	}

	if(window.parent && window.parent != this){

		window.parent.unblockUI();
		return;
	}

}

function blockUI(/** String */ mesg, /** object of the css */ cssMap, /** Number */ timeout) {

	// �곷떒 �덉씠�� �앹뾽�� 寃쎌슦 �ъ슜 �덊븿
	if(window.parent && window.parent != this && $.trim(window.parent.$("#maskLayer").html()) != "")return;

	// �ъ씠�� �덉씠�� �앹뾽�� 硫붿씤 �붾㈃ 媛앹껜 �몄텧
	if(window.parent && window.parent != this){

		window.parent.blockUI();
		return;
	}

	try{

		cssMap = cssMap || { backgroundColor: '#000', width:'0px', height:'0px', padding:'0px', border: "0px", position:'absolute', left:'48%', top:'40%' };
		timeout = timeout || (60 * 1000);

		$.blockUI({
			message: '<div id="loader-wrap" class="loading">Loading...</div>',
			fadeIn:0,
			css: cssMap,
			overlayCSS: { backgroundColor: '#000', opacity: 0.8, cursor: 'wait' },
			blockMsgClass: 'blockMsg'
		});

		setTimeout(unblockUI, timeout);

	}catch(e){}
}

function blockUIThis(/** String */ mesg, /** object of the css */ cssMap, /** Number */ timeout) {

	try{

		unblockUI();
		cssMap = cssMap || { backgroundColor: '#000', width:'0px', height:'0px', padding:'0px', border: "0px", position:'absolute', left:'48%', top:'40%' };
		timeout = timeout || (60 * 1000);

		$.blockUI({
			message: '<div id="loader-wrap" class="loading">Loading...</div>',
			fadeIn:0,
			css: cssMap,
			overlayCSS: { backgroundColor: '#000', opacity: 0.8, cursor: 'wait' },
			blockMsgClass: 'blockMsg'
		});

		setTimeout(unblockUI, timeout);

	}catch(e){}
}

function unblockUI(){

	// �곷떒 �덉씠�� �앹뾽�� 寃쎌슦 �ъ슜 �덊븿
	if(window.parent && window.parent != this && $.trim(window.parent.$("#element_to_pop_up").html()) != "")return;

	// �ъ씠�� �덉씠�� �앹뾽�� 硫붿씤 �붾㈃ 媛앹껜 �몄텧
	if(window.parent && window.parent != this){

		window.parent.unblockUI();
		return;
	}

	$.unblockUI();

	//$(document).unbind('ajaxStart');
	//$(document).ajaxStart(blockUI);
}

//$(document).ajaxStart(blockUI);
//$(document).ajaxStop(unblockUI);

// �� �좎쭨 �ъ씠�� �쇱옄 援ы븯湲�
function gfnGetTermDay(fromDay, toDay){

	var f = fromDay.split("-");
	var fDate = new Date(f[0], Number(f[1])-1, f[2]);

	var t = toDay.split("-");
	var tDate = new Date(t[0], Number(t[1])-1, t[2]);

	return (tDate.getTime() - fDate.getTime())/1000/60/60/24;

}

///�먮낯洹몃━�쒖뿉�� �좏깮�� �곗씠�곕� ��寃� 洹몃━�쒕줈 ��만�� (以묐났�� �쒖쇅)
function fnAddGridData(ori, target) {
	var selRows = $("#" + ori).getGridParam('selarrrow');
	var selRows2 = $('#' + target).jqGrid('getDataIDs');

	for (var i = 0; i < selRows.length; i++) {
		var iCnt = 0;
		for (var j = 0; j < selRows2.length; j++) {
			if(selRows[i] == selRows2[j]) {
				iCnt++;
				break;
			}
		}

		if(iCnt == 0) {
			jQuery("#" + target).addRowData(selRows[i], jQuery("#" + ori).getRowData(selRows[i]));
		}
	}
}


/// 洹몃━�쒖뿉�� �좏깮�� �� ��젣
function fnDeleteGridRow(id) {
	var selRows = $("#" + id).getGridParam('selarrrow');
	var copyIds = $.extend(true, [], selRows);

	for (var i = 0; i < copyIds.length; i++) {
		$("#" + id).jqGrid('delRowData', copyIds[i]);
	}
}

function lpad(s, padLength, padString){
	s += "";
    while(s.length < padLength)
        s = padString + s;
    return s;
}

function rpad(s, padLength, padString){
	s += "";
    while(s.length < padLength)
        s += padString;
    return s;
}

/*
 * �좎쭨 �뺤떇�몄� 泥댄겕
 */
function isValidDateFormat(dt) {
	var dtStr = gfn_dateToInt(dt) + "";
	if(dtStr.length != 8){
		return false;
	}

	var year = dtStr.substr(0,4);
	var mon = dtStr.substr(4,2);
	var day = dtStr.substr(6,2);

	dtStr = year + "-" + mon + "-" + day;

    // �щ㎎�� �덈쭪�쇰㈃ false由ы꽩
    if(!isDateFormat(dtStr)) {
        return false;
    }

    var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    var dateToken = dtStr.split('-');
    var year = Number(dateToken[0]);
    var month = Number(dateToken[1]);
    var day = Number(dateToken[2]);

    // �좎쭨媛� 0�대㈃ false
    if(day == 0) {
        return false;
    }

    var isValid = false;

    // �ㅻ뀈�쇰븣
    if(isLeaf(year)) {
        if(month == 2) {
            if(day <= month_day[month-1] + 1) {
                isValid = true;
            }
        } else {
            if(day <= month_day[month-1]) {
                isValid = true;
            }
        }
    } else {
        if(day <= month_day[month-1]) {
            isValid = true;
        }
    }

    return isValid;
}

function fnGetAjaxData(pUrl, pData, pCallBackFn){

	try {
		var sData = null;

		if(typeof(pData) == "object" ) {
			sData = pData;
		}
		else {
			sData = $('#'+pData).serialize();
		}
		$.ajax({
			dataType:"json",
			type: "POST",
			url: pUrl,
			data:sData,
			async: true,
			cache: false,
			beforeSend : function(){

		 	},
			success : function(data, status, request) {
				pCallBackFn(data);
			},
			complete: function(){

			},
		    error: function(data, status, error) {
			}
		});
	} catch(e) {
	}
}

function fnGetSyncAjaxData(pUrl, pData, pCallBackFn ){

	try {
		var sData = null;
		if(typeof(pData) == "object" ) {
			sData = pData;
		}
		else {
			sData = $('#'+pData).serialize();
		}
		$.ajax({
			dataType:"json",
			type: "POST",
			url: pUrl,
			data:sData,
			async: false,
			cache: false,
			beforeSend : function(){

		 	},
			success : function(data, status, request) {
				pCallBackFn(data);
			},
			complete: function(){

			},
		    error: function(data, status, error) {

				alert("�붿껌 泥섎━ 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
			}
		});
	} catch(e) {
		alert("�붿껌 泥섎━ 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
	}
}

function fnFileAjaxData(pUrl, fName, pCallBackFn){

	try {
		$("#"+fName).ajaxForm({
			dataType:"json",
			type: "POST",
			url: pUrl,
			async: true,
			cache: false,
			beforeSend : function(){

		 	},
			success : function(data, status, request){
				pCallBackFn(data);
			},
			complete: function(){

			},
		    error: function(data, status, error) {

				alert("�붿껌 泥섎━ 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
			}
		}).submit();
	} catch(e) {
		alert("�붿껌 泥섎━ 以� �ㅻ쪟媛� 諛쒖깮�섏��듬땲��.");
	}
}

// �대�吏� 誘몃━ 蹂닿린 諛� �띿꽦 諛섑솚
function fnPreviewImg(input, imgArea){

	var info = {};

	try{

		if(input.files && input.files[0]){

			var reader = new FileReader();

			reader.onload = function(e){

				$("#"+imgArea).attr("src", e.target.result);
				$("#"+imgArea).show();
			};

			reader.readAsDataURL(input.files[0]);

			info["name"] = input.files[0].name;
			info["type"] = input.files[0].type;
			info["size"] = input.files[0].size;
		}
	}catch(e){}

	return info;

}

// �숈쁺�� �띿꽦 諛섑솚
function fnChkVideo(input, playTimeObj){

	var info = {};

	try{

		if(input.files && input.files[0]){

			gvarPlayTimeObj = playTimeObj;

			var file = input.files[0];
		    var type = file.type;
		    var videoObj = $("#layer_chk_video")[0];
		    var canPlay = videoObj.canPlayType(type);
		    if(canPlay === ""){
		    	info["canPlay"] = "N";
		    }else{
		    	info["canPlay"] = "Y";
		    }

		    info["name"] = file.name;
		    info["type"] = type;
		    info["size"] = file.size;

		    var fileURL = window.URL.createObjectURL(file);
		    gvarFileURL = fileURL;
		    $("#layer_chk_video").attr("src", fileURL);

		}
	}catch(e){}

	return info;

}

var gvarFileURL;
function fnGetFileURL(){
	return gvarFileURL;
}

function cutStr(str, limit){

	var strLength = 0;
	var strTitle = "";
	var strPiece = "";

	for (var i = 0; i < str.length; i++){
		var code = str.charCodeAt(i);
		var ch = str.substr(i,1).toUpperCase();
		//泥댄겕 �섎뒗 臾몄옄瑜� ����
		strPiece = str.substr(i,1);

		code = parseInt(code);

		if ((ch < "0" || ch > "9") && (ch < "A" || ch > "Z") && ((code > 255) || (code < 0))){
			strLength = strLength + 3; //UTF-8 3byte 濡� 怨꾩궛
		}else{
			strLength = strLength + 1;
		}

		if(strLength>limit){ //�쒗븳 湲몄씠 �뺤씤
			break;
		}else{
			strTitle = strTitle+strPiece; //�쒗븳湲몄씠 蹂대떎 �묒쑝硫� �먮Ⅸ 臾몄옄瑜� 遺숈뿬以���.
		}

	}
	return strTitle;
}

// 臾몄옄�� 湲몄씠(byte)
function fnGetStringByte(str){
	return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
}

//肄ㅻ쭏李띻린
function comma(str) {
  str = String(str);
  return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//肄ㅻ쭏��湲�
function uncomma(str) {
  str = String(str);
  return str.replace(/[^\d]+/g, '');
}


function fnGoPage(url){

	location.href = url;

}

function fnCallParentFunc(funcNm){
	try{
		// �쒖꽦 frame 李얘린
		var activeFrame = parent.$("#contents > div[aria-hidden=false] > iframe").attr("id");
		eval("parent.$('#"+activeFrame+"').get(0).contentWindow."+funcNm);

	}catch(e){
	}
}

function onlyIP(obj){
	obj.value = obj.value.replace(/[^0-9\.]/gi,"");
}

function onlyNum(obj){
	obj.value = obj.value.replace(/[^0-9]/gi,"");
}

function phoneNum(obj){
	obj.value = obj.value.replace(/[^0-9\-]/gi,"");
}

function emailType(obj){
	obj.value = obj.value.replace(/[^(a-zA-Z0-9@.)]/gi,"");
}

// �낅젰媛� 珥덇린��
function gfnResetValue(){

	// input 珥덇린��
	$(".body input").not("[type=submit]").val("");

	// textarea 珥덇린��
	$(".body textarea").val("");

	// select 珥덇린��
	$(".body select").bindSelectSetValue("");

}

// ie 釉뚮씪�곗� �뺤씤
function gfnChkIeBrowser(){

	var agent = navigator.userAgent.toLowerCase(),
    name = navigator.appName;

	// MS 怨꾩뿴 釉뚮씪�곗�瑜� 援щ텇�섍린 �꾪븿.
	if(name === 'Microsoft Internet Explorer' || agent.indexOf('trident') > -1 || agent.indexOf('edge/') > -1) {
		return true;
	}else{
		return false;
	}


}

function phoneFormat(obj){
	try{
		var reObj = obj.replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-");

		if(reObj == ""){
			reObj = obj;
		}
		return reObj;
	}catch(e){
		return obj;
	}
}

function fnOnlyNum(e){

	var e = e || window.event;
	var keyCode	= (e.which) ? e.which : e.keyCode;

	if(keyCode == 8 || keyCode == 46 || keyCode == 37 || keyCode == 39){
		return;
	}else{
		e.target.value = e.target.value.replace(/[^0-9]/g, '');
	}
}

function fnParseNum(val){

	try{
		return Number(val);
	}catch(e){
		return 0;
	}
}

function fn_totalSearch(){

	var searchTypeLabel = $('.searchTypeLabel').eq(0).text();

	if(searchTypeLabel == '異뺤젣'){
		document.totalSearchForm.submit();
	}else {
		var totalSearchText = $('#totalSearchText').val();
		if(searchTypeLabel == '�꾩껜'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�ы뻾�뺣낫'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=1&keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�ы뻾湲곗궗'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=2&keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�대깽��'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=5&keyword=' + totalSearchText;
		}
	}
}

function fn_totalSearch2(formName, totalSearchTextId){

	var searchTypeLabel = $('.searchTypeLabel').eq(0).text();

	if(searchTypeLabel == '異뺤젣'){
		if(formName == 'totalSearchForm'){
			document.totalSearchForm.submit();
		}else {
			document.totalSearchFormInner.submit();
		}
	}else {
		var totalSearchText = $('#' + totalSearchTextId).val();
		if(searchTypeLabel == '�꾩껜'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�ы뻾�뺣낫'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=1&keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�ы뻾湲곗궗'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=2&keyword=' + totalSearchText;
		}else if(searchTypeLabel == '�대깽��'){
			location.href = 'https://korean.visitkorea.or.kr/search/search_list.do?tab=5&keyword=' + totalSearchText;
		}
	}
}

