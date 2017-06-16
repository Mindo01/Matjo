package com.matjo.web.common;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.resta.bean.DaumLocalBean;

/**
 * SK T-Map POI API 관련 기능을 종합한 Util 클래스
 * @author Daehee
 *
 */
public class DaumUtils {
	
	/**
	 * 요청 URL 과 API Key 정의
	 */
	public static final String DAUM_LOCAL_REQ_URL = "https://apis.daum.net/local/v1/search/keyword.json";
	public static final String DAUM_API_KEY_1 = "492681c0a9510ba0b05faa8fa5d8a6bb";
	
	/**
	 * 조회에 필요한 정보를 PagingBean 으로 넘겨받아 Daum Local API 로 전달/요청하여 결과를 반환 받는 함수
	 * @param pagingBean 게시판의 pagingBean 과 동일하게 이용, searchType, searchText, count 등을 설정하여 POI 요청시 이러한 조건들을 반영한다.
	 * @return 검색결과를 POIBean 의 리스ㅌ 형태로 가공하여 리턴
	 */
	public static List<DaumLocalBean> searchDataForKeyword(PagingBean pagingBean) {
		List<DaumLocalBean> list = new ArrayList();

		System.out.println("Daum Local API 요청을 시작한다... " + new Date() + "\n");
		
		HttpsURLConnection conn = null;
		
		String URL_APPENDED = DAUM_LOCAL_REQ_URL;
		try {
			URL_APPENDED += "?"
					+ "apikey=" + DAUM_API_KEY_1  
					+ "&image=only"
					+ "&sort=1"
					+ "&count" + 15 // 한 페이지가 갖는 아이템 갯수
					+ "&page=" + (pagingBean.getPageNo())
					+ ( (pagingBean.getLocation() != null && pagingBean.getLocation() != "," && pagingBean.getLocation() != "null") ? "&location=" + pagingBean.getLocation() : "") // 위치값
					+ ( (pagingBean.getRadius() > 0) ? "&radius=" + (pagingBean.getRadius()*1000) : "" ) // 반경값
					+ "&query=" + URLEncoder.encode(pagingBean.getSearchText(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} /* 페이징 빈으로 부터 받은 조건 사항들을 append 한다. */
		System.out.println("[완성된 URL]: " + URL_APPENDED);
		
		try {
			URL url = new URL(URL_APPENDED);
			
			// 연결을 준비한다.
			conn = (HttpsURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			
			System.out.println("------ 헤더 입력 확인 ------");
			for (int i = 0; i < conn.getContentLength(); i++) {
				if (conn.getHeaderFieldKey(i) != null) {
					System.out.println("[header_key]: " + conn.getHeaderFieldKey(i) + ",\t [value]: " + conn.getHeaderField(i));
				}
			}
			System.out.println("------ 헤더 확인 종료 ------");
			

			// Json String 을 받아낸다.
			BufferedReader br = null;
			if (conn.getResponseCode() >= 400) {
	            br = new BufferedReader(new InputStreamReader((conn.getErrorStream())));
			} else {
				br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
			}
			
			StringBuffer respStr = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				respStr.append(line);
	        }
			
			/* 결과 스트링 출력 */
			System.out.println("[결과값(json string)]:\n" + respStr + "\n");
			
			/* 요청의 결과 스트링으로 부터 루트노드를 얻는다. */
			Gson gson = new Gson();
			JsonParser parser = new JsonParser();
			JsonObject rootNode = (JsonObject) parser.parse(respStr.toString()); // 루트노드 획득
			System.out.println("루트노드 : " + rootNode.toString());
			
			/* 하위로 선택 작업을 통해 원하는 노드(업소목록)를 획득한다. */
			JsonObject channel = rootNode.get("channel").getAsJsonObject(); // 루트노드 획득
			System.out.println("channel(전체정보) : " + channel.toString());
			JsonArray item = channel.get("item").getAsJsonArray();
			System.out.println("item 배열" + item.toString());
			
			/* JsonArray의 item들을 획득하여 각각 POIBean 으로 변환 후 list 에 담는다. */
			for (int i = 0; i < item.size(); i++) {
				JsonObject obj = item.get(i).getAsJsonObject();
//				DaumLocalBean dlBean = gson.fromJson(obj.toString(), DaumLocalBean.class); // Gson 을 쓰려면 변수명을 맞춰줘야 해서 적절치 못한 것 같다.
				DaumLocalBean dlBean = new DaumLocalBean(
						obj.get("id").getAsString(), 
						obj.get("title").getAsString(), 
						obj.get("category").getAsString(),
						obj.get("address").getAsString(),
						obj.get("imageUrl").getAsString(),
						obj.get("latitude").getAsString(),
						obj.get("longitude").getAsString(),
						obj.get("phone").getAsString(),
						obj.get("placeUrl").getAsString()
						);
				list.add(dlBean);
			}
			
			/* 연결 해제 */
			if(conn != null) {
				conn.disconnect();	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(conn != null) {
				conn.disconnect();	
			}
		} // end of try~catch~finally
		
		return list;
	} // end of searchData
	
} // end of class
