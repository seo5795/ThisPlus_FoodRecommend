package controller.common;

import java.util.HashMap;


import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsApi {
   public void sms(int randomNum, String phone) {
      System.out.println("sms메서드!");
      //5자리 난수 생성(10000~99999)
      //int randomNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
      //random()은 타입이 double인 값을 반환하므로 int타입으로 형변환
      
      String api_key = "NCSQDE8WXL8ACGHT";
                    //▲ 본인의 API 키 작성 (※타인에게 노출 되지 않게 주의※)
      String api_secret = "YUBOEDZGIEK3ZKIBHHJ6JRU1NCDU88EA";
                       //▲ 본인의 API Secret코드 작성 (※타인에게 노출 되지 않게 주의※)
      Message coolsms = new Message(api_key, api_secret);

      // 4 params(to, from, type, text) are mandatory. must be filled
      HashMap<String, String> params = new HashMap<String, String>();
           // <key, value>
      
      params.put("to", phone);
                  // ▲ 수신자번호 작성(※본인번호)      
      params.put("from", "01089231256");   
                  // ▲ 발신자번호 작성
      params.put("type", "SMS");   
      params.put("text", "[오늘의메뉴]본인확인 인증번호는\n" + randomNum + "입니다.정확히 입력해주세요.");
                          //▲ 보낼 문자 내용 작성 
      params.put("app_version", "test app 1.2"); 
            // application name,  version

      try {
         JSONObject obj = (JSONObject) coolsms.send(params);
                                    // send()는 "메세지 발송" 메서드.
         System.out.println(obj.toString());
      } catch (CoolsmsException e) {
         System.out.println(e.getMessage());
         System.out.println(e.getCode());
      }
                  
   }
}