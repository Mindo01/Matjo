package com.matjo.web.promotion.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.matjo.web.common.Constants;
import com.matjo.web.common.Util;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.inquiry.bean.InquiryBean;
import com.matjo.web.promotion.bean.PromotionBean;
import com.matjo.web.promotion.service.PromotionService;


@Controller
public class PromotionController {
	
	//파일 업로드 저장경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	@Value("#{config['upload.promotion.img.path']}")
	private String FILE_IMG_PATH;
	
	@Autowired
	private PromotionService promotionService;

	//프로모션 등록
	@RequestMapping(value="/promotion/promotionInsertProcAjax",method=RequestMethod.POST)
	public String noticeWriteAjax(PromotionBean bBean,Model model,
			@RequestParam("imgFile") MultipartFile[] imgFile,
			@RequestParam("promoStart") String promoStart,
			@RequestParam("promoEnd") String promoEnd,
			@RequestParam("promoCate") String promoCate
			) {
				// 이미지 프로필 파일 저장하기
				if (imgFile != null) {
					// TODO cafe24서버에 프로젝트 업로드 시, 이미지 저장하는 경로 (config.properties) 변경하기
					String imgPath = "";
					try {
						imgPath = Util.uploadFileMng(imgFile[0], FILE_UPLOAD_PATH);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (imgPath != null && !imgPath.equals("")) {
						bBean.setPromoImg(imgPath);
						
					}
				}
				//프로모션 코드받기
				long promoTime = System.nanoTime();
				bBean.setPromoCode(promoTime+"");
				
				
				//프로모션 기간
				 try {
					// "2007-07-22" 이란 문자열로 2007년 7월 22일의 정보를 갖는 Date객체를 만들어보자
					   String textDate1 = promoStart;
					   String textDate2 = promoEnd;
					// 입력할 날짜의 문자열이 yyyy-MM-dd 형식이므로 해당 형식으로 포매터를 생성한다.
					   java.text.SimpleDateFormat format1 = new java.text.SimpleDateFormat("yyyy-MM-dd");
					   java.text.SimpleDateFormat format2 = new java.text.SimpleDateFormat("yyyy-MM-dd");
					//SimpleDateFormat.parse()메소드를 통해 Date객체를 생성한다.
					   
					//SimpleDateFormat.parse()메소드는 입력한 문자열 형식의 날짜가
					   
					//포맷과 다를경우 java.text.ParseException을 발생한다.
					   java.util.Date date1 = format1.parse(textDate1);
					   java.util.Date date2 = format2.parse(textDate2);
					//위에서 만든 date객체가 정말 7월22일인지 확인 해보자.
					   java.text.SimpleDateFormat format11 = new java.text.SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초");
					   java.text.SimpleDateFormat format22 = new java.text.SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초");
					   String dateString1 = format1.format(date1);
					   String dateString2 = format1.format(date2);
					//Date객체의 날자를 확인한다..  결과 : 2007년07월22일 00시00분00초
					   bBean.setPromoStart(dateString1);
					   bBean.setPromoEnd(dateString2);
					  } catch (java.text.ParseException ex) {
					   ex.printStackTrace();
					  }
				 bBean.setPromoCate(promoCate);
				int res = promotionService.insertPromotion(bBean);
				if (res > 0) {
					model.addAttribute("PromotionBean", bBean);
					return "redirect:/promotion/selectPromo.do";
				}
				return "redirect:/promotion/selectPromo.do";
			}
			
	//게시글 리스트
			@RequestMapping("/promotion/selectPromo")
			public String selectPromo(Model model, PagingBean pagingBean) {
			//전체 레코드 갯수 취득
			int totRecord = promotionService.selectPromotion(pagingBean);
			//페이징 계산
			pagingBean.calcPage(totRecord);
			
			List<PromotionBean> list = promotionService.selectPromo(pagingBean);
			model.addAttribute("promotionList", list);
			model.addAttribute("pBean", pagingBean);
			return "/promotion/selectPromo";
		}
	
}
