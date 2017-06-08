// JavaScript Code
/**
 * 파라미터 취득
 * @param name 파라미터 키값
 * @return 해당파라미터 값을 리턴한다.
 */
$.urlParam = function(name){
    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
    return results[1] || 0;
}

function printLog(data) {
	console.log(JSON.stringify(data));
}

/** JSon 형태의 key:value 형태를 key=value 형태롤 변환 **/ 
function json2PostParams(data) {
	var requestStr;
    if (data) {
        for (var key in data) {
            if (requestStr) {
                requestStr += "&" + key + "=" + encodeURIComponent(data[key]);
            } else {
                requestStr = key + "=" + encodeURIComponent(data[key]);
            }
        }
    }
    return requestStr;
}

