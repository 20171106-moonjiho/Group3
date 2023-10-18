package com.ming.boot.reservation;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class AirplaneDataService {
	private List<AirplaneDTO> schedule;
	@Autowired private ScheduleMapper mapper;
	
	public void getAccessData() {
		/*String reqUrl = "https://api.odcloud.kr/api/15003087/v1/uddi:9bf2212e-7928-4437-bd95-ee7e714a0987"
				+ "?serviceKey=7r25pmXeL3y%2FQCcglBm0BVHMdzI3K6L36XJzWEUqemA%2BV8mKeRycrdn4z0q8YxSGJVNqj%2FnF6dS8xWJQd9pCgQ%3D%3D"
				+ "&perPage=10000";*/
		String reqUrl = "https://api.odcloud.kr/api/15043890/v1/uddi:2d3c9f86-3fa3-4d21-a20d-fac431d2bf6e"
				+ "?serviceKey=7r25pmXeL3y%2FQCcglBm0BVHMdzI3K6L36XJzWEUqemA%2BV8mKeRycrdn4z0q8YxSGJVNqj%2FnF6dS8xWJQd9pCgQ%3D%3D"
				+ "&perPage=10000";
		try {
			URL url = new URL(reqUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			ObjectMapper om = new ObjectMapper();
			JsonNode json = om.readTree(isr);
			String data = json.get("data").toString();
			List<AirplaneDTO> list = om.readValue(data, new TypeReference<List<AirplaneDTO>>() {});
			schedule = list;
			
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
	}
	
	public void makeSchedule() {
		LocalDate date = LocalDate.now();
		List<AirplaneDTO> list = new ArrayList<>();
		for(AirplaneDTO airplane : schedule) {
			LocalDate end_day = LocalDate.parse(airplane.getEnd_day());
			if(date.isBefore(end_day)) {
				list.add(airplane);
			}
		}
		schedule = list;
	}
	
	public List<AirplaneDTO> getSchedule() {
		return schedule;
	}

	public void setSchedule(List<AirplaneDTO> schedule) {
		this.schedule = schedule;
	}
	
	public void makeDB() {
		LocalDate date = LocalDate.now();
		for(AirplaneDTO airplane : schedule) {
			for(int i=1; i <= 14; i++) {
				LocalDate airplane_date = date.plusDays(i);
				if(airplane_date.isBefore(LocalDate.parse(airplane.getStart_day()))) {
					continue;
				}else if(!airplane.getEnd_day().equals("2023-10-28")&&
						airplane_date.isAfter(LocalDate.parse(airplane.getEnd_day()))) {
					break;
				}
				if(airplane.getAirplane_day().equals("매일")) {	
					ScheduleDTO dto = new ScheduleDTO();
					dto.setAirplane_date(airplane_date.toString());
					dto.setAirplane_name(airplane.getAirplane_name());
					dto.setDepart_port(airplane.getDepart_port());
					dto.setArrive_port(airplane.getArrive_port());
					dto.setDepart_time(airplane.getDepart_time());
					dto.setArrive_time(airplane.getArrive_time());
					dto.setCompany(airplane.getCompany());
					mapper.insert(dto);					
				}
				else {
					int day = airplane_date.getDayOfWeek().getValue();
					String airplane_day = null;
					switch(day) {
					case 1:
						airplane_day = "월";
						break;
					case 2:
						airplane_day = "화";
						break;
					case 3:
						airplane_day = "수";
						break;
					case 4:
						airplane_day = "목";
						break;
					case 5:
						airplane_day = "금";
						break;
					case 6:
						airplane_day = "토";
						break;
					case 7:
						airplane_day = "일";
						break;
					}
					if(airplane.getAirplane_day().contains(airplane_day)) {
						ScheduleDTO dto = new ScheduleDTO();
						dto.setAirplane_date(airplane_date.toString());
						dto.setAirplane_name(airplane.getAirplane_name());
						dto.setDepart_port(airplane.getDepart_port());
						dto.setArrive_port(airplane.getArrive_port());
						dto.setDepart_time(airplane.getDepart_time());
						dto.setArrive_time(airplane.getArrive_time());
						dto.setCompany(airplane.getCompany());
						mapper.insert(dto);	
					}	
				}
			}
		}
	}
	public void getAirport() {
		List<String> airport = new ArrayList<>();
		for(AirplaneDTO airplane : schedule) {
			if(!airport.contains(airplane.getDepart_port())) {
				airport.add(airplane.getDepart_port());
			}
		}
	}
	
	public List<ScheduleDTO> getList(){
		return mapper.list();
	}
}
