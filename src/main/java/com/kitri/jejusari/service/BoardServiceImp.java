package com.kitri.jejusari.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.BoardDao;
import com.kitri.jejusari.dto.ReportDto;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void newsList(ModelAndView mav) {
		String clientId = "nRMcm30QpjGM_zMZaO_f"; //애플리케이션 클라이언트 아이디값"
        String clientSecret = "4rZaN1wN27"; //애플리케이션 클라이언트 시크릿값"

        String text = null;
        try {
            text = URLEncoder.encode("제주도", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }

        String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text + "&display=" + 20 + "&sort=sim" ;    // json 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

//        System.out.println(responseBody);
        
        JSONParser jsonParser=new JSONParser();
        
        ContainerFactory orderedKeyFactory = new ContainerFactory() {
			
			@Override
			public Map createObjectContainer() {
				return new HashMap();
			}
			
			@Override
			public List creatArrayContainer() {
				return new ArrayList();
			}
		};
		
		Object obj=null;
        
        try {
        	obj=jsonParser.parse(responseBody, orderedKeyFactory);
		} catch (ParseException e) {
			e.printStackTrace();
		}
        
        HashMap map=(HashMap) obj;
        List<Map<String, Object>> newsList=(List<Map<String, Object>>) map.get("items");
        
        for(int i=0; i<newsList.size(); i++) {
        	String pubDate=(String) newsList.get(i).get("pubDate");			// 기사 1개의 pubDate
        	
        	if(pubDate!=null) {
        		String[] dateArr=pubDate.split(" ");
        		String year=dateArr[3];
        		String monthEng=dateArr[2];
        		String month=null;
        		switch (monthEng) {
				case "Jan":
					month="01";
					break;
				case "Feb":
					month="02";
					break;
				case "Mar":
					month="03";
					break;
				case "Apr":
					month="04";
					break;
				case "May":
					month="05";
					break;
				case "Jun":
					month="06";
					break;
				case "Jul":
					month="07";
					break;
				case "Aug":
					month="08";
					break;
				case "Sep":
					month="09";
					break;
				case "Oct":
					month="10";
					break;
				case "Nov":
					month="11";
					break;
				case "Dec":
					month="12";
					break;
				default:
					month=monthEng;
					break;
				}
        		
        		String day=dateArr[1];
        		
        		String date=year + "-" + month + "-" + day;
        		
//        		newsList.get(i).remove("pubDate");
        		newsList.get(i).put("date", date);
        	}
        }
        
        System.out.println("newsList : " + newsList);
        
        mav.addObject("newsList", newsList);
        mav.setViewName("news/news_list.tiles");
        
//        System.out.println(mav);
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
	
	private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }

    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
        	StringBuilder responseBody = new StringBuilder();
        	
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
	
	public void reportWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=mav.getModelMap();
		/*
		 * HttpServletRequest request=(HttpServletRequest)map.get("request");
		 * HttpSession session=request.getSession();
		 * 
		 * session.getAttribute(name);
		 */
		ReportDto reportDto=(ReportDto) map.get("reportDto");
		
		int check=boardDao.reportInsert(reportDto);
		System.out.println("check : " + check);
		
		
		mav.addObject("check", check);
		mav.setViewName("report/report_writeOk");
	}
}
