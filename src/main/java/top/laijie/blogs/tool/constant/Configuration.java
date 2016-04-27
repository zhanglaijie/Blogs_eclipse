package top.laijie.blogs.tool.constant;

import java.nio.charset.Charset;
import java.util.ResourceBundle;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;

import top.laijie.blogs.tool.PropUtils;

/**
 * 
 * @author zhaokuner
 *
 */
public class Configuration {
	

	private static Object lock              = new Object();
	private static Configuration config     = null;
	private static ResourceBundle rb        = null;
	private static final String CONFIG_FILE = "conf/config";
	
	private Configuration() {
		rb = ResourceBundle.getBundle(CONFIG_FILE);
	}
	
	/**
	 * 服务ID
	 */
	public static String SERVICE_ID = "";
	/**
	 * 服务版本号
	 */
	public static String SERVICE_VERSION = "";
	/**
	 * 服务类型
	 */
	public static String SERVICE_TYPE = "";
	/**
	 * 仅能有一个登录设备登录的serviceId
	 */
	public static String LOGIN_UNIQUE_SERVICEID = "";
	/**
	 * 默认登录在线时间
	 */
	public static Integer DEFALUT_LOGIN_SCOPETIME = 60*60*24*30;
	/**
	 * 百度视频云access key
	 */
	public static String BAIDU_LIVE_ACCESS_KEY = "";
	/**
	 * 七牛视频云access key
	 */
	public static String QINIU_VOD_ACCESS_KEY = "";
	/**
	 * 一天的秒
	 */
	public static Integer ONE_DAY_SECOND = 60*60*24;
	/**
	 * 一月的秒
	 */
	public static Integer ONE_MONTH_SECOND = 60*60*24*30;
	/**
	 * 多会话数量限制
	 */
	public static Integer LOGIN_MULTIPOINT_NUM = 5;
	/**
	 * 时间段内最多登录次数
	 */
	public static Integer LOGIN_COUNT_LIMIT = 50;
	/**
	 * 处理登录时在线信息线程池数量
	 */
	public static Integer POOL_ONLINE_TREAD = 10;
	/**
	 * 处理用户足迹线程池数量
	 */
	public static Integer POOL_USER_MARK_TREAD = 20;
	/**
	 * 处理用户评论线程数
	 */
	public static Integer POOL_USER_COMMENT_TREAD = 5;
	/**
	 * 处理用户答疑线程数
	 */
	public static Integer POOL_USER_QUESTIONANSWER_TREAD = 5;
    /**
     * 安全验证连续两次间隔时间(秒)
     */
    public static Integer SECURITY_VERIFICATION_INTERVAL_TIME=60;
    /**
     * 安全验证验证码有效时间(秒)
     */
    public static Integer SECURITY_VERIFICATION_SCOPE_TIME=600;
    /**
     * 激活码有效时间(秒)
     */
    public static Integer SECURITY_ACTIVATION_SCOPE_TIME=1200;
    /**
     * 项目运行端口
     */
    public static Integer PROJECT_RUNTIME_PORT = Integer.MAX_VALUE;
	/**
	 * 项目运行IP
	 */
    public static String PROJECT_RUNTIME_IP = "";
    /**
     * 用户中心绑定/修改手机号短信模板
     */
    public static String BINDING_MOBILE = "";
    /**
     * 用户中心设置支付密码短信模板
     */
    public static String SET_PAY_PASSWORD = "";
    /**
     * 用户中心成功充值短信模板
     */
    public static String RECHARGE_SUCCESS = "";
    /**
     * 用户中心动态登录密码短信模板
     */
    public static String DYNAMIC_PASSWORD = "";
    /**
     * 登录页面的referer，登录后跳转
     */
    public static String LOGIN_REFERER = "loginReferer";
    /**
	 * 根域
	 */
	public static String SSO_DOMAIN = "";
	/**
	 * cookie会话数据key
	 */
	public static String _HAOHAN_ = "";
	/**
	 * cookie会话ID
	 */
	public static String _JSESSIONID_ = "";
	/**
	 * cookie验证码
	 */
	public static String _VCODE_ = "";
	/**
	 * 项目简称
	 */
	public static String PROJECT_SHORT_NAME = ""; 
	/**
	 * 服务域名
	 */
	public static String SERVICE_DOMAIN = "";
	 /**
	 * 静态资源文件目录
	 */
	public static String STATIC_RESOURSE_DISK_PATH=PropUtils.readPropertiesFile("upload.properties","uploadUrl");
	/**
	 * CDN静态资源文件http访问路径
	 * */
	public static String STATIC_RESOURSE_HTTP_URL ="";
    
	public static final String STATIC_TEMP_FILE = "temp";
	public static final String STATIC_UPLOAD_FILE = "upload";
	public static final String STATIC_ALBUM = "album";
	/**微信appid*/
	public static String OPEN_WEIXIN_APPID = "";
	/**微信公众号登录url authorize*/
	public static String OPEN_WEIXIN_MP_USER_URL_AUTHORIZE = "";
	/**微信公众号登录url access_token*/
	public static String OPEN_WEIXIN_MP_USER_URL_ACCESSTOKEN = "";
	/**微信公众号登录url userinfo*/
	public static String OPEN_WEIXIN_MP_USER_URL_USERINFO = "";
	
	public static Charset CHARSET = Charset.forName("UTF-8");

	/**
	 * 默认字符名称
	 */
	public static String DEFAULT_NAME = "喵喵";
	/**
	 * 默认头像
	 */
	public static String DEFAULT_ALBUM = "";
	/**
	 * 直播默认背景图
	 */
	public static String LIVE_DEFAULT_BG_IMG = "";
	/**
	 * 点播默认背景图
	 */
	public static String VOD_DEFAULT_BG_IMG = "";
	/**
	 * 免费视频组id
	 */
	public static Long COURSE_GROUP_FREE_ID = -1L;
	
	/**
	 *百度开放云简单消息服务SMS  ACCESS_KEY_ID 
	 */
	public static String SMS_ACCESS_KEY_ID = "";
	/**
	 * 百度开放云简单消息服务 签名 SECRET_ACCESS_KEY
	 */
	public static String SMS_SECRET_ACCESS_KEY= "";
	
	/**
	 * 发送短信的模板ID
	 */
	public static String SMS_TEMPLATE_ID="";
	
	static{
		init();
	}
	private static void init() {
		Configuration conf=getInstance();
		SERVICE_ID = conf.getValue("service.id");
		SERVICE_VERSION = conf.getValue("service.version");
		SERVICE_TYPE = conf.getValue("service.type");
		BAIDU_LIVE_ACCESS_KEY=conf.getValue("baidu.live.access.key");
		QINIU_VOD_ACCESS_KEY=conf.getValue("qiniu.vod.access.key");
		LOGIN_UNIQUE_SERVICEID = StringUtils.defaultString(conf.getValue("login.unique.serviceId")).trim();
		if(LOGIN_UNIQUE_SERVICEID.equals(",")){
			LOGIN_UNIQUE_SERVICEID = "";
		}else if(!LOGIN_UNIQUE_SERVICEID.endsWith(",")){
			LOGIN_UNIQUE_SERVICEID += ",";
		}
		DEFALUT_LOGIN_SCOPETIME = NumberUtils.toInt(conf.getValue("defalut.login.scopetime"), DEFALUT_LOGIN_SCOPETIME);
		LOGIN_MULTIPOINT_NUM = NumberUtils.toInt(conf.getValue("login.multipoint.num"), LOGIN_MULTIPOINT_NUM);
		LOGIN_COUNT_LIMIT = NumberUtils.toInt(conf.getValue("login.count.limit"), LOGIN_COUNT_LIMIT);
		POOL_ONLINE_TREAD = NumberUtils.toInt(conf.getValue("pool.online.tread"), POOL_ONLINE_TREAD);
		POOL_USER_MARK_TREAD = NumberUtils.toInt(conf.getValue("pool.user.mark.tread"), POOL_USER_MARK_TREAD);
		POOL_USER_COMMENT_TREAD = NumberUtils.toInt(conf.getValue("pool.user.comment.tread"), POOL_USER_COMMENT_TREAD);
		POOL_USER_QUESTIONANSWER_TREAD = NumberUtils.toInt(conf.getValue("pool.user.questionanswer.tread"),POOL_USER_QUESTIONANSWER_TREAD);
		SECURITY_VERIFICATION_INTERVAL_TIME = NumberUtils.toInt(conf.getValue("security.verification.interval.time"), SECURITY_VERIFICATION_INTERVAL_TIME);
		SECURITY_VERIFICATION_SCOPE_TIME = NumberUtils.toInt(conf.getValue("security.verification.scope.time"), SECURITY_VERIFICATION_SCOPE_TIME);
		_HAOHAN_ = conf.getValue("_haohan_");
		BINDING_MOBILE = conf.getValue("sms.binding.mobile");
		SET_PAY_PASSWORD = conf.getValue("sms.set.pay.password");
		RECHARGE_SUCCESS = conf.getValue("sms.recharge.success");
		DYNAMIC_PASSWORD = conf.getValue("sms.dynamic.password");

		SERVICE_DOMAIN = conf.getValue("service.domain");
		SSO_DOMAIN = conf.getValue("sso.domain");
		_JSESSIONID_ = conf.getValue("_jsessionid_");
		_VCODE_ = conf.getValue("_vcode_");
		PROJECT_SHORT_NAME = conf.getValue("project.short.name");
		STATIC_RESOURSE_DISK_PATH=conf.getValue("static.resourse.disk.path");
		STATIC_RESOURSE_HTTP_URL=conf.getValue("static.resourse.http.url");
		OPEN_WEIXIN_APPID=conf.getValue("open.weixin.appid");
		OPEN_WEIXIN_MP_USER_URL_AUTHORIZE=conf.getValue("open.weixin.mp.user.url.authorize");
		OPEN_WEIXIN_MP_USER_URL_ACCESSTOKEN=conf.getValue("open.weixin.mp.user.url.accesstoken");
		OPEN_WEIXIN_MP_USER_URL_USERINFO=conf.getValue("open.weixin.mp.user.url.userinfo");
		DEFAULT_ALBUM = STATIC_RESOURSE_HTTP_URL+"/res/img/icon/person_head_icon.png";
		LIVE_DEFAULT_BG_IMG = conf.getValue("live.default.bg.img");
		VOD_DEFAULT_BG_IMG = conf.getValue("vod.default.bg.img");
		COURSE_GROUP_FREE_ID = NumberUtils.toLong(conf.getValue("course.group.free.id"),COURSE_GROUP_FREE_ID);
		
		SMS_ACCESS_KEY_ID = conf.getValue("baidu.sms.access.key.id");
		SMS_SECRET_ACCESS_KEY = conf.getValue("baidu.sms.secret.access.key");
		SMS_TEMPLATE_ID = conf.getValue("baidu.sms.template.id");
	}
	
	/**
	 * 初始化本地文件
	 */
	public static void initLocalConf() {
		ResourceBundle.clearCache();
		rb = ResourceBundle.getBundle(CONFIG_FILE);
		config = null;
		init();
	}
	
	public static Configuration getInstance() {
		synchronized(lock) {
			if(null == config) {
				config = new Configuration();
			}
		}
		return (config);
	}
	
	public String getValue(String key) {
		return (rb.getString(key));
	}
	
}
