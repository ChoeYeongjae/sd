package com.example.ins.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@Controller		
public class Main {
	
	/*
	 * 메인 컨틀로러
	 *            
	 * */
	
	@RequestMapping(value="/")	
	public String main() throws Exception{
		return "index";
	}  
	
	/*
	 * 런칭 싸이트 크롤링
	 * 
	 * */
	@RequestMapping(value="/launchingCrawling")
	public @ResponseBody List<HashMap<String,Object>> launchingCrawling() throws Exception{
		
		String url = "https://coinvote.cc/coins/1&order_by=soon";
		Document doc = null;        
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Element element = doc.select("body > div.container > div.row > div.coins-bg > div > div.regular-table").get(0);
		
		Elements ie1 = element.select("div:nth-child("+ 2 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie2 = element.select("div:nth-child("+ 3 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie3 = element.select("div:nth-child("+ 4 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie4 = element.select("div:nth-child("+ 5 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie5 = element.select("div:nth-child("+ 6 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie6 = element.select("div:nth-child("+ 7 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie7 = element.select("div:nth-child("+ 8 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie8 = element.select("div:nth-child("+ 9 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie9 = element.select("div:nth-child("+ 10 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		Elements ie10 = element.select("div:nth-child("+ 11 + ") > div.coin-row.coin-row-s > div:nth-child(" + 2 + ") > p > a");
		
		String[] name = new String[10];
		
		for(Element e : ie1 ) {
			name[0] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie2 ) {
			name[1] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie3 ) {
			name[2] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie4 ) {
			name[3] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie5 ) {
			name[4] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie6 ) {
			name[5] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie7 ) {
			name[6] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie8 ) {
			name[7] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie9 ) {
			name[8] = e.getElementsByAttribute("href").attr("href");
		 }
		
		for(Element e : ie10 ) {
			name[9] = e.getElementsByAttribute("href").attr("href");
		 }
		
		ArrayList<HashMap<String,Object>> list = new ArrayList<HashMap<String,Object>>(); 
		
		for( int j = 0; j <= 9 ; j++ ) {
			
			HashMap<String,Object> dataList = new HashMap<>();
			
			String urls = "https://coinvote.cc/"+ name[j];
			
			Document docs = null;
			
			try { 
				docs = Jsoup.connect(urls).get();
			} catch (IOException e) { 
				e.printStackTrace();
			}
			
			Elements elements = docs.select("div.coin-top-row");
			
			String names = elements.select("div.coin-top-row > div.coin-left-card > div.coin-row > h2").text();
			String contract = elements.select("#bsc-a").text();
			String discpt = elements.select("div.coin-top-row > div.coin-left-card > div.coin-description > p").text();
			String data = elements.select("div.coin-top-row > div.coin-right-card > div > div > div > div:nth-child(3) > p").text();
			
			dataList.put("names", names);
			dataList.put("contract", contract);
			dataList.put("discpt", discpt);
			dataList.put("data", data);

			list.add(dataList);
			
		}
		
		return list;
	}
	
	/*
	 * 웹 싸이트 검증 
	 * 
	 * */
	@RequestMapping(value="/websiteVerification")
	public @ResponseBody String websiteVerification(@RequestParam(value = "urls", required = false) String urls) throws Exception{
		
		// 웹 사이트 메타 태그 검증
		String url = urls;
		String res = ""; 
		
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements tag = doc.getElementsByTag("meta");
        for( Element tagList : tag ) {
            
        	String str = String.valueOf(tagList);
        	
        	if(str.contains("WordPress") || str.contains("wordPress")) {
        		res = "wordPress";
        	} else if( str.contains("wix") || str.contains("Wix") || str.contains("X-Wix")) {
        		res = "wix";
        	} else if( str.contains("immweb") ) {
        		res = "immweb";
        	}
        
        }
    
        return res;
	}
	
	/*
	 * BSC 검증 
	 * 
	 * */
	@RequestMapping(value="/bscVerification")
	public @ResponseBody HashMap<String , String> bscVerification(@RequestParam(value = "contract", required = false) String contract) throws Exception{

		// BSC 검증
		// 1.Contract Source Code Verified (Exact Match) 부터 확인
		// 2.mint = 코인 무한생성 
		// 3.self destruct = 판매안됨
		// 4.Delegatecall = 컨트렉트 상태변경 가능 
		// 5.Migrator = 무제한 출금
		// 6.푸코인 러그풀 확인
		// 7.홀더수 확인
		
		String url = "https://bscscan.com/address/" + contract + "#code";
		
		Document doc = null;        //Document에는 페이지의 전체 소스가 저장된다
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements elements = doc.select("#dividcode");
		
		String str = elements.select("#editor").text();
		
		HashMap<String , String> detail = new HashMap<String , String>(); 
		
        if( str.contains("Mint") || str.contains("mint") ) {
        	detail.put("mint", "mint");
        } 
 
        if ( str.contains("delegatecall") || str.contains("Delegatecall") ) {
        	detail.put("delegatecall", "delegatecall");
        }
        
        if ( str.contains("migrator") || str.contains("Migrator") ) {
        	detail.put("migrator", "migrator");
        }
        
        String urls = "https://bscscan.com/token/" + contract +"#balances";
		
		Document docs = null;        //Document에는 페이지의 전체 소스가 저장된다
		
		try {
			docs = Jsoup.connect(urls).get();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Elements elementss = docs.select("#ContentPlaceHolder1_divSummary > div.row.mb-4 > div.col-md-6.mb-3.mb-md-0 > div > div.card-body");
		
		String str1 = elementss.select("#ContentPlaceHolder1_tr_tokenHolders > div > div.col-md-8 > div > div").text();
		detail.put("holders", str1);
		
        return detail;
	}
	
}