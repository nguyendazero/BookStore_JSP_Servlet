package util;

import java.security.MessageDigest;
import java.util.Base64;

import com.mysql.cj.protocol.Message;
import com.mysql.cj.util.Base64Decoder;

public class MaHoa {
	//md-5
	//sha-1 =>> thường được sử dụng
	public static String toSHA1(String str) {
		String salt = "abc;;dhgfhgfhgfhefgh;";
		String result = null;
		
		str = str + salt;
		try {
			byte[] dataBytes = str.getBytes("UTF-8");
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			result = org.apache.tomcat.util.codec.binary.Base64.encodeBase64String(md.digest(dataBytes));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(toSHA1("123456"));
	}
}
