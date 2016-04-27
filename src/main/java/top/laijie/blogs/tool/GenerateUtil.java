package top.laijie.blogs.tool;


import java.util.Random;

public class GenerateUtil {

	private static Random randGen = new Random();
	private static char[] numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz"
			+ "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	
	private static Random randNumber = new Random();
	private static char[] numbers = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	/**
	 * 生成通信密钥 24位字符串长度
	 * 
	 * @Title: generateSecretKey
	 * @Description:
	 * @return
	 * @return String
	 * @throws
	 */
	public static final String generateSecretKey() {
		return getRandomStr(24);
	}

	public static final String getRandomStr(int length) {

		if (length < 1) {
			return null;
		}

		char[] randBuffer = new char[length];

		for (int i = 0; i < randBuffer.length; i++) {
			randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
		}

		return new String(randBuffer);
	}

	public static final String getRandomNumber(int length) {

		if (length < 1) {
			return null;
		}

		char[] randBuffer = new char[length];

		for (int i = 0; i < randBuffer.length; i++) {
			randBuffer[i] = numbers[randNumber.nextInt(9)];
		}

		return new String(randBuffer);
	}

	public static void main(String[] agrs){
		System.out.println(GenerateUtil.getRandomStr(24));
	}

}
