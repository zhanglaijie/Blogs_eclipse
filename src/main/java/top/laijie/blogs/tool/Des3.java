package top.laijie.blogs.tool;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.Key;  
  
import javax.crypto.Cipher;  
import javax.crypto.SecretKeyFactory;  
import javax.crypto.spec.DESedeKeySpec;  
import javax.crypto.spec.IvParameterSpec;  

import org.apache.log4j.Logger;

import top.laijie.blogs.controller.IndexPageController;
  
/** 
 * 3DES加密工具类 
 *  
 * @author laijie  
 * @date 2016-3-13 
 * @see http://blog.csdn.net/lyq8479/article/details/8062867
 */  
public class Des3 {  
	private static Logger logger = Logger.getLogger(IndexPageController.class.getName());
    // 密钥  
    private final static String secretKey = "zhanglaijie@lx100$#365#$";  
    // 向量  
    private final static String iv = "01234567";  
    // 加解密统一使用的编码方式  
    private final static String encoding = "utf-8";  
  
    /** 
     * 3DES加密 
     *  
     * @param plainText 普通文本 
     * @return 
     * @throws Exception  
     */  
    public static String encode(String plainText){  
        Key deskey = null;  
        byte[] encryptData=null;
        DESedeKeySpec spec;
		try {
			spec = new DESedeKeySpec(secretKey.getBytes());
			 SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
		        deskey = keyfactory.generateSecret(spec);  
		  
		        Cipher cipher = Cipher.getInstance("desede/CBC/PKCS5Padding");  
		        IvParameterSpec ips = new IvParameterSpec(iv.getBytes());  
		        cipher.init(Cipher.ENCRYPT_MODE, deskey, ips);  
		        encryptData = cipher.doFinal(plainText.getBytes(encoding));  
		} catch (Exception e) {
			logger.debug(e);
		}
        return Base64.encode(encryptData);  
    }  
  
    /** 
     * 3DES解密 
     *  
     * @param encryptText 加密文本 
     * @return 
     * @throws Exception 
     * 
     */  
    public static String decode(String encryptText){  
        Key deskey = null; 
        byte[] decryptData = null;
        DESedeKeySpec spec;
		try {
			spec = new DESedeKeySpec(secretKey.getBytes());
			SecretKeyFactory keyfactory = SecretKeyFactory.getInstance("desede");  
	        deskey = keyfactory.generateSecret(spec);  
	        Cipher cipher = Cipher.getInstance("desede/CBC/PKCS5Padding");  
	        IvParameterSpec ips = new IvParameterSpec(iv.getBytes());  
	        cipher.init(Cipher.DECRYPT_MODE, deskey, ips);  
	        decryptData = cipher.doFinal(Base64.decode(encryptText)); 
	        return new String(decryptData, encoding);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.debug(e);
			return null;
		}  
    }  
    public static void main(String[] args) {
		try {
			System.out.println(Des3.encode("zhanglaijie"));
			System.out.println(Des3.decode("4e7uLz5CIFSv/VzgusArPw=="));
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}  