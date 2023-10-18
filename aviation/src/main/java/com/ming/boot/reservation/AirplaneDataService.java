package com.ming.boot.reservation;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AirplaneDataService {
	
	public List<AirplaneDTO> getAccessData() {
		String reqUrl = "https://api.odcloud.kr/api/15003087/v1/uddi:9bf2212e-7928-4437-bd95-ee7e714a0987?serviceKey=7r25pmXeL3y%2FQCcglBm0BVHMdzI3K6L36XJzWEUqemA%2BV8mKeRycrdn4z0q8YxSGJVNqj%2FnF6dS8xWJQd9pCgQ%3D%3D";
		try {
			URL url = new URL(reqUrl); // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
			conn.setRequestMethod("GET"); // POST 요청을 위해 기본값 false에서 setDoOutput을 true로 변경
			conn.setRequestProperty("Content-type", "application/json");
			//conn.setDoOutput(true);  POST 메소드를 이용해서 데이터를 전달하기 위한 설정
			// 기본 outputStream을 통해 문자열로 처리할 수 있는
			// OutPutStreamWriter 변환 후 처리속도를 빠르게 하기위한
			// BufferedWriter로 변환해서 사용한다.
			/*BufferedWriter bw = new BufferedWriter(
					new OutputStreamWriter(conn.getOutputStream())
					);
			bw.write(reqParam);
			bw.flush();*/
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			ObjectMapper om = new ObjectMapper();
			JsonNode json = om.readTree(isr);
			String rawdata = json.get("data").toString();
			String data = rawdata.substring(1, rawdata.length()-1);
			System.out.println(data);
			List<AirplaneDTO> list = om.readValue(data, new TypeReference<List<AirplaneDTO>>() {});
			
			return list;
			
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		return null;
	}
}