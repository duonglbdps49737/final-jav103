package jdbc.finalasm_java103.helper;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.Map;

public class XHttp {
	private static Map<Long, ServletRequest> requests = new HashMap<>();
	private static Map<Long, ServletResponse> responses = new HashMap<>();
	/**
	 * Bổ sung request/response
	 */
	public static void add(ServletRequest request, ServletResponse response){
		var key = Thread.currentThread().getId();
		requests.put(key, request);
		responses.put(key, response);
	}
	/**
	 * Xóa request/response hiện tại
	 */
	public static void remove() {
		var key = Thread.currentThread().getId();
		requests.remove(key);
		responses.remove(key);
	}
	/**
	 * Lấy request hiện tại
	 */
	public static HttpServletRequest getRequest() {
		var key = Thread.currentThread().getId();
		return (HttpServletRequest) requests.get(key);
	}
	/**
	 * Lấy response hiện tại
	 */
	public static HttpServletResponse getResponse() {
		var key = Thread.currentThread().getId();
		return (HttpServletResponse) responses.get(key);
	}
	/**
	 * Lấy session hiện tại
	 */
	public static HttpSession getSession() {
		return XHttp.getRequest().getSession();
	}
	/**
	 * Lấy application hiện tại
	 */
	public static ServletContext getApplication() {
		return XHttp.getRequest().getServletContext();
	}
	/**
	 * Lấy đối tượng File của đường dẫn ảo
	 */
	public static String getRealPath(String...paths) {
		var virtualPath = String.join("/", paths);
		return XHttp.getApplication().getRealPath(virtualPath);
	}
	/**
	 * Lấy giá trị của path info
	 */
	public static String getStar() {
		var info = XHttp.getRequest().getPathInfo();
		return info == null ? null : info.substring(1);
	}
}