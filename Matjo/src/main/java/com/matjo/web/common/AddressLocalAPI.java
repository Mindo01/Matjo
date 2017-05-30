package com.matjo.web.common;

import java.util.ArrayList;
import java.util.List;

import com.matjo.web.common.bean.AddressBean;

public class AddressLocalAPI {
	public static List<AddressBean> addrList;
	
	static final String[] city = {"", "서울특별시", "부산광역시", "인천광역시", "광주광역시", "대구광역시", "대전광역시", "울산광역시"
								, "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"}; 
	
	public AddressLocalAPI (){
		init();
	}
	
	private void init() {
		addrList = new ArrayList<AddressBean>();
		// 1, 서울특별시
		addrList.add(new AddressBean("1", "강남구"));
		addrList.add(new AddressBean("1", "강동구"));
		addrList.add(new AddressBean("1", "강북구"));
		addrList.add(new AddressBean("1", "강서구"));
		addrList.add(new AddressBean("1", "관악구"));
		addrList.add(new AddressBean("1", "광진구"));
		addrList.add(new AddressBean("1", "구로구"));
		addrList.add(new AddressBean("1", "금천구"));
		addrList.add(new AddressBean("1", "노원구"));
		addrList.add(new AddressBean("1", "도봉구"));
		addrList.add(new AddressBean("1", "동대문구"));
		addrList.add(new AddressBean("1", "동작구"));
		addrList.add(new AddressBean("1", "마포구"));
		addrList.add(new AddressBean("1", "서대문구"));
		addrList.add(new AddressBean("1", "서초구"));
		addrList.add(new AddressBean("1", "성동구"));
		addrList.add(new AddressBean("1", "성북구"));
		addrList.add(new AddressBean("1", "송파구"));
		addrList.add(new AddressBean("1", "양천구"));
		addrList.add(new AddressBean("1", "영등포구"));
		addrList.add(new AddressBean("1", "용산구"));
		addrList.add(new AddressBean("1", "은평구"));
		addrList.add(new AddressBean("1", "종로구"));
		addrList.add(new AddressBean("1", "중구"));
		addrList.add(new AddressBean("1", "중랑구"));
		// 2, 부산광역시
		addrList.add(new AddressBean("2", "강서구"));
		addrList.add(new AddressBean("2", "금정구"));
		addrList.add(new AddressBean("2", "기장군"));
		addrList.add(new AddressBean("2", "남구"));
		addrList.add(new AddressBean("2", "동구"));
		addrList.add(new AddressBean("2", "동래구"));
		addrList.add(new AddressBean("2", "부산진구"));
		addrList.add(new AddressBean("2", "북구"));
		addrList.add(new AddressBean("2", "사상구"));
		addrList.add(new AddressBean("2", "사하구"));
		addrList.add(new AddressBean("2", "서구"));
		addrList.add(new AddressBean("2", "수영구"));
		addrList.add(new AddressBean("2", "연제구"));
		addrList.add(new AddressBean("2", "영도구"));
		addrList.add(new AddressBean("2", "중도구"));
		addrList.add(new AddressBean("2", "해운대구"));
		// 3, 인천광역시
		addrList.add(new AddressBean("3", "강화군"));
		addrList.add(new AddressBean("3", "계양구"));
		addrList.add(new AddressBean("3", "남구"));
		addrList.add(new AddressBean("3", "남동구"));
		addrList.add(new AddressBean("3", "동구"));
		addrList.add(new AddressBean("3", "부평구"));
		addrList.add(new AddressBean("3", "서구"));
		addrList.add(new AddressBean("3", "연수구"));
		addrList.add(new AddressBean("3", "옹진군"));
		addrList.add(new AddressBean("3", "중구"));
		// 4, 광주광역시
		addrList.add(new AddressBean("4", "광산구"));
		addrList.add(new AddressBean("4", "남구"));
		addrList.add(new AddressBean("4", "동구"));
		addrList.add(new AddressBean("4", "북구"));
		addrList.add(new AddressBean("4", "서구"));
		// 5, 대구광역시
		addrList.add(new AddressBean("5", "남구"));
		addrList.add(new AddressBean("5", "달서구"));
		addrList.add(new AddressBean("5", "달성군"));
		addrList.add(new AddressBean("5", "동구"));
		addrList.add(new AddressBean("5", "북구"));
		addrList.add(new AddressBean("5", "서구"));
		addrList.add(new AddressBean("5", "수성구"));
		addrList.add(new AddressBean("5", "중구"));
		// 6, 대전광역시
		addrList.add(new AddressBean("6", "대덕구"));
		addrList.add(new AddressBean("6", "동구"));
		addrList.add(new AddressBean("6", "서구"));
		addrList.add(new AddressBean("6", "유성구"));
		addrList.add(new AddressBean("6", "중구"));
		// 7, 울산광역시
		addrList.add(new AddressBean("7", "남구"));
		addrList.add(new AddressBean("7", "동구"));
		addrList.add(new AddressBean("7", "북구"));
		addrList.add(new AddressBean("7", "울주군"));
		addrList.add(new AddressBean("7", "중구"));
		// 8, 경기도
		addrList.add(new AddressBean("8", "가평군"));
		addrList.add(new AddressBean("8", "고양시"));
		addrList.add(new AddressBean("8", "과천시"));
		addrList.add(new AddressBean("8", "광명시"));
		addrList.add(new AddressBean("8", "광주시"));
		addrList.add(new AddressBean("8", "구리시"));
		addrList.add(new AddressBean("8", "군포시"));
		addrList.add(new AddressBean("8", "김포시"));
		addrList.add(new AddressBean("8", "남양주시"));
		addrList.add(new AddressBean("8", "동두천시"));
		addrList.add(new AddressBean("8", "부천시"));
		addrList.add(new AddressBean("8", "성남시"));
		addrList.add(new AddressBean("8", "수원시"));
		addrList.add(new AddressBean("8", "시흥시"));
		addrList.add(new AddressBean("8", "안산시"));
		addrList.add(new AddressBean("8", "안성시"));
		addrList.add(new AddressBean("8", "안양시"));
		addrList.add(new AddressBean("8", "양주시"));
		addrList.add(new AddressBean("8", "양평군"));
		addrList.add(new AddressBean("8", "여주군"));
		addrList.add(new AddressBean("8", "연천군"));
		addrList.add(new AddressBean("8", "오산시"));
		addrList.add(new AddressBean("8", "용인시"));
		addrList.add(new AddressBean("8", "의왕시"));
		addrList.add(new AddressBean("8", "의정부시"));
		addrList.add(new AddressBean("8", "이천시"));
		addrList.add(new AddressBean("8", "파주시"));
		addrList.add(new AddressBean("8", "평택시"));
		addrList.add(new AddressBean("8", "포천시"));
		addrList.add(new AddressBean("8", "하남시"));
		addrList.add(new AddressBean("8", "화성시"));
		// 9, 강원도
		addrList.add(new AddressBean("9", "강릉시"));
		addrList.add(new AddressBean("9", "고성군"));
		addrList.add(new AddressBean("9", "동해시"));
		addrList.add(new AddressBean("9", "삼척시"));
		addrList.add(new AddressBean("9", "속초시"));
		addrList.add(new AddressBean("9", "양구군"));
		addrList.add(new AddressBean("9", "양양군"));
		addrList.add(new AddressBean("9", "영월군"));
		addrList.add(new AddressBean("9", "원주시"));
		addrList.add(new AddressBean("9", "인제군"));
		addrList.add(new AddressBean("9", "정선군"));
		addrList.add(new AddressBean("9", "철원군"));
		addrList.add(new AddressBean("9", "춘천시"));
		addrList.add(new AddressBean("9", "태백시"));
		addrList.add(new AddressBean("9", "평창군"));
		addrList.add(new AddressBean("9", "홍천군"));
		addrList.add(new AddressBean("9", "화천군"));
		addrList.add(new AddressBean("9", "횡성군"));
		// 10, 충청북도
		addrList.add(new AddressBean("10", "괴산군"));
		addrList.add(new AddressBean("10", "단양군"));
		addrList.add(new AddressBean("10", "보은군"));
		addrList.add(new AddressBean("10", "영동군"));
		addrList.add(new AddressBean("10", "옥천군"));
		addrList.add(new AddressBean("10", "음성군"));
		addrList.add(new AddressBean("10", "제천시"));
		addrList.add(new AddressBean("10", "증평군"));
		addrList.add(new AddressBean("10", "진천군"));
		addrList.add(new AddressBean("10", "청주시"));
		addrList.add(new AddressBean("10", "충주시"));
		// 11, 충청남도
		addrList.add(new AddressBean("11", "계룡시"));
		addrList.add(new AddressBean("11", "공주시"));
		addrList.add(new AddressBean("11", "금산군"));
		addrList.add(new AddressBean("11", "논산시"));
		addrList.add(new AddressBean("11", "당진군"));
		addrList.add(new AddressBean("11", "보령시"));
		addrList.add(new AddressBean("11", "부여군"));
		addrList.add(new AddressBean("11", "서산시"));
		addrList.add(new AddressBean("11", "서천군"));
		addrList.add(new AddressBean("11", "아산시"));
		addrList.add(new AddressBean("11", "연기군"));
		addrList.add(new AddressBean("11", "예산군"));
		addrList.add(new AddressBean("11", "천안시"));
		addrList.add(new AddressBean("11", "청양군"));
		addrList.add(new AddressBean("11", "태안군"));
		addrList.add(new AddressBean("11", "홍성군"));
		// 12, 전라북도
		addrList.add(new AddressBean("12", "고창군"));
		addrList.add(new AddressBean("12", "군산시"));
		addrList.add(new AddressBean("12", "김제시"));
		addrList.add(new AddressBean("12", "남원시"));
		addrList.add(new AddressBean("12", "무주군"));
		addrList.add(new AddressBean("12", "부안군"));
		addrList.add(new AddressBean("12", "순창군"));
		addrList.add(new AddressBean("12", "완주군"));
		addrList.add(new AddressBean("12", "익산시"));
		addrList.add(new AddressBean("12", "임실군"));
		addrList.add(new AddressBean("12", "장수군"));
		addrList.add(new AddressBean("12", "전주시"));
		addrList.add(new AddressBean("12", "정읍시"));
		addrList.add(new AddressBean("12", "진안군"));
		// 13, 전라남도
		addrList.add(new AddressBean("13", "강진군"));
		addrList.add(new AddressBean("13", "고흥군"));
		addrList.add(new AddressBean("13", "곡성군"));
		addrList.add(new AddressBean("13", "광양시"));
		addrList.add(new AddressBean("13", "구례군"));
		addrList.add(new AddressBean("13", "나주시"));
		addrList.add(new AddressBean("13", "담양군"));
		addrList.add(new AddressBean("13", "목포시"));
		addrList.add(new AddressBean("13", "무안군"));
		addrList.add(new AddressBean("13", "보성군"));
		addrList.add(new AddressBean("13", "순천시"));
		addrList.add(new AddressBean("13", "신안군"));
		addrList.add(new AddressBean("13", "여수시"));
		addrList.add(new AddressBean("13", "영광군"));
		addrList.add(new AddressBean("13", "영암군"));
		addrList.add(new AddressBean("13", "완도군"));
		addrList.add(new AddressBean("13", "장성군"));
		addrList.add(new AddressBean("13", "장흥군"));
		addrList.add(new AddressBean("13", "진도군"));
		addrList.add(new AddressBean("13", "함평군"));
		addrList.add(new AddressBean("13", "해남군"));
		addrList.add(new AddressBean("13", "화순군"));
		// 14, 경상북도
		addrList.add(new AddressBean("14", "경산시"));
		addrList.add(new AddressBean("14", "경주시"));
		addrList.add(new AddressBean("14", "고령군"));
		addrList.add(new AddressBean("14", "구미시"));
		addrList.add(new AddressBean("14", "군위군"));
		addrList.add(new AddressBean("14", "김천시"));
		addrList.add(new AddressBean("14", "문경시"));
		addrList.add(new AddressBean("14", "봉화군"));
		addrList.add(new AddressBean("14", "상주시"));
		addrList.add(new AddressBean("14", "성주군"));
		addrList.add(new AddressBean("14", "안동시"));
		addrList.add(new AddressBean("14", "영덕군"));
		addrList.add(new AddressBean("14", "영양군"));
		addrList.add(new AddressBean("14", "영주시"));
		addrList.add(new AddressBean("14", "영천시"));
		addrList.add(new AddressBean("14", "예천군"));
		addrList.add(new AddressBean("14", "울릉군"));
		addrList.add(new AddressBean("14", "울진군"));
		addrList.add(new AddressBean("14", "의성군"));
		addrList.add(new AddressBean("14", "청도군"));
		addrList.add(new AddressBean("14", "청송군"));
		addrList.add(new AddressBean("14", "칠곡군"));
		addrList.add(new AddressBean("14", "포항시"));
		// 15, 경상남도
		addrList.add(new AddressBean("15", "거제시"));
		addrList.add(new AddressBean("15", "거창군"));
		addrList.add(new AddressBean("15", "고성군"));
		addrList.add(new AddressBean("15", "김해시"));
		addrList.add(new AddressBean("15", "남해군"));
		addrList.add(new AddressBean("15", "밀양시"));
		addrList.add(new AddressBean("15", "사천시"));
		addrList.add(new AddressBean("15", "산청군"));
		addrList.add(new AddressBean("15", "양산시"));
		addrList.add(new AddressBean("15", "의령군"));
		addrList.add(new AddressBean("15", "진주시"));
		addrList.add(new AddressBean("15", "창녕군"));
		addrList.add(new AddressBean("15", "창원시"));
		addrList.add(new AddressBean("15", "통영시"));
		addrList.add(new AddressBean("15", "하동군"));
		addrList.add(new AddressBean("15", "함안군"));
		addrList.add(new AddressBean("15", "함양군"));
		addrList.add(new AddressBean("15", "합천군"));
		// 16, 제주도
		addrList.add(new AddressBean("16", "제주시"));
		addrList.add(new AddressBean("16", "서귀포시"));
	}
	
	
	
	
	public List<AddressBean> getList(String name){
		
		int index = 0;
		
		for (int i = 0; i < city.length; i++) {
			if(city[i].equals(name)) index = i;
		}
		if(index == 0) return null;
		
		List<AddressBean> list = new ArrayList<AddressBean>();
		String sIndex = index + "";
		for (int i = 0; i < addrList.size(); i++) {
			if(sIndex.equals(addrList.get(i).getCode())){
				list.add(addrList.get(i));
			}
		}
		
		return list;
	}
}
