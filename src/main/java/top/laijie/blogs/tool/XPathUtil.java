package top.laijie.blogs.tool;
import java.io.File;
import java.io.FileInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
/**
 * 
 * @author laijie
 *
 */
public class XPathUtil {
	private static  Log log = LogFactory.getLog(XPathUtil.class);
    public static String getAttrEles(String filePath,String xpathElement){
    	Document doc;
        XPath xpath;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setValidating(false);
        DocumentBuilder db;
		try {
			db = dbf.newDocumentBuilder();
	        doc = db.parse(new FileInputStream(filePath));
	        // 创建XPath对象
	        XPathFactory factory = XPathFactory.newInstance();
	        xpath = factory.newXPath();
	        NodeList nodeList = (NodeList) xpath.evaluate(xpathElement, doc,
	        XPathConstants.NODESET);
	        return nodeList.item(0).getTextContent();
		} catch (Exception e) {
			log.error(e, e);
		};
		return "";
    }
    public static boolean setAttrEles(String filePath,String xpathElement,String content){
    	Document doc;
        XPath xpath;
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setValidating(false);
        DocumentBuilder db;
    	Transformer tran;
		try{
			db = dbf.newDocumentBuilder();
	        doc = db.parse(new FileInputStream(filePath));
	        // 创建XPath对象
	        XPathFactory factory = XPathFactory.newInstance();
	        xpath = factory.newXPath();
			tran = TransformerFactory.newInstance().newTransformer();
			tran.setOutputProperty(OutputKeys.ENCODING,"GB2312");
			tran.setOutputProperty(OutputKeys.INDENT, "yes");
			NodeList nodeList = (NodeList)xpath.evaluate(xpathElement, doc, XPathConstants.NODESET);
	        nodeList.item(0).setTextContent(content);
			Result result = new StreamResult(new File(filePath).toURI().getPath());
			tran.transform(new DOMSource(doc), result);
			return true;
		} catch (Exception e) {
			log.error(e,e);
		}
		return false;
	}
    
   /* public static void main(String[] args) {
    	System.out.println(getAttrEles("C:/Users/laijie/Desktop/mp-config.xml", "//autostart/composeContinueArticles"));
    	System.out.println(setAttrEles("C:/Users/laijie/Desktop/mp-config.xml", "//autostart/composeContinueArticles","laijie"));
	}*/
}
