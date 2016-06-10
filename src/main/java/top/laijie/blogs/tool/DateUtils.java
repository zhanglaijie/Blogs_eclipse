package top.laijie.blogs.tool;

import java.util.Date;

public class DateUtils {
	public static String timeDifference(Date now,Date before){
		try
		{
			
		  long diff = now.getTime() - before.getTime();//这样得到的差值是微秒级别
		  long days = diff / (1000 * 60 * 60 * 24);
		 
		  long hours = (diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60);
		  long minutes = (diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60);
		  //System.out.println(""+days+"天"+hours+"小时"+minutes+"分");
		 return ""+days+"天"+hours+"小时";/*+minutes+"分"*/
		}
		catch (Exception e)
		{
		}
		return "0天";
	}
}
