package jdbc.finalasm_java103.helper;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.io.File;
import java.util.Date;

public class XParam {
	/**
	 * Đọc giá trị tham số
	 */
	public static String get(String name) {
		return XHttp.getRequest().getParameter(name);
	}
	public static String getParam(String name, String defval) {
		var value = XParam.get(name);
		return value == null ? defval : value;
	}
	/**
	 * Lưu trữ file upload
	 * @param folder thư mục lưu file
	 */
	public static String getFile(String name, String folder) {
		try {
			var part = XHttp.getRequest().getPart(name);
			if (part != null && part.getSize() > 0) {
				var dir = XHttp.getApplication().getRealPath(folder);
				new File(dir).mkdirs();
				var submitted = part.getSubmittedFileName();
				var ext = submitted.substring(submitted.lastIndexOf('.'));
				var filename = System.currentTimeMillis() + ext;
				part.write(dir + File.separator + filename);
				return folder + "/" + filename;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * Đọc tham số vào thuộc tính bean
	 */
	public static <T> T getBean(Class<T> beanClass) {
		try {
			DateConverter dateConverter = new DateConverter();
			dateConverter.setPattern("dd-MM-yyyy");
			ConvertUtils.register(dateConverter, Date.class);
	        
			var bean = beanClass.getDeclaredConstructor().newInstance();
			var params = XHttp.getRequest().getParameterMap();
			BeanUtils.populate(bean, params);
			
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}