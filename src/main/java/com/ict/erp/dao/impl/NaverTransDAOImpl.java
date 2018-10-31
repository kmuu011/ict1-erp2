package com.ict.erp.dao.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ict.erp.dao.NaverTransDAO;
import com.ict.erp.vo.NaverMsg;

public class NaverTransDAOImpl implements NaverTransDAO{
	private String clientId;
	private String clientSecret;
	private String clientIdAdd;
	private String clientSecretAdd;
	private String apiURL;
	private String source;
	private String target;
	
	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	public String getClientSecret() {
		return clientSecret;
	}

	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}

	public String getClientIdAdd() {
		return clientIdAdd;
	}

	public void setClientIdAdd(String clientIdAdd) {
		this.clientIdAdd = clientIdAdd;
	}

	public String getClientSecretAdd() {
		return clientSecretAdd;
	}

	public void setClientSecretAdd(String clientSecretAdd) {
		this.clientSecretAdd = clientSecretAdd;
	}

	public String getApiURL() {
		return apiURL;
	}

	public void setApiURL(String apiURL) {
		this.apiURL = apiURL;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}


	@Override
	public String getText(String text) throws IOException {
		HttpURLConnection huc = null;
		BufferedReader br = null;
		
		try {
		
			if(text.length() > 50) {
				text = text.substring(0, 50);
			}
			text = URLEncoder.encode(text, "UTF-8");
			
			URL url = new URL(apiURL);	
			
			huc = (HttpURLConnection) url.openConnection();
			huc.setRequestMethod("POST");
			huc.setRequestProperty(clientIdAdd, clientId);
			huc.setRequestProperty(clientSecretAdd, clientSecret);
			
			String param = "source=" + source + "&target=" + target + "&text=" + text;
			
			huc.setDoOutput(true);
			DataOutputStream dos = new DataOutputStream(huc.getOutputStream());
			
			dos.writeBytes(param);
			dos.flush();
			dos.close();
			
			int status = huc.getResponseCode();
			
			if(status == 200) {
				br = new BufferedReader(new InputStreamReader(huc.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(huc.getInputStream()));
			}
			
			String result;
			StringBuffer sb = new StringBuffer();
			
			while((result=br.readLine()) != null) {
				sb.append(result);
			}
			br.close();
			
			ObjectMapper om = new ObjectMapper();
			String json = sb.toString();
			NaverMsg nm = om.readValue(json, NaverMsg.class);
			
			
			return nm.getMessage().getResult().getTranslatedText();
			
		} catch(Exception e) {
			throw e;
		} finally {
			if(br != null) {
				br.close();
			}
			
			if(huc != null) {
				huc.disconnect();
			}
		}
	}

}
