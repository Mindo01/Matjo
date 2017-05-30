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


