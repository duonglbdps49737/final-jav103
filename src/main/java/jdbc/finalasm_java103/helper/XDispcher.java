package jdbc.finalasm_java103.helper;

import jakarta.servlet.ServletException;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Map;


public class XDispcher {
	/**
	 * Chuyển tiếp servlet/jsp khác
	 * @param attrs là các request attributes cần truyền
	 */
	public static void forward(String view, Map<String, Object> attrs) throws ServletException, IOException {
		var req = XHttp.getRequest();
		var resp = XHttp.getResponse();
		
		attrs.forEach(req::setAttribute);
		req.getRequestDispatcher(view).forward(req, resp);
	}
	public static void forward(String view) throws ServletException, IOException {
		XDispcher.forward(view, Map.of());
	}
	
	/**
	 * Bao hàm servlet/jsp khác
	 * @param attrs là các request attributes cần truyền
	 */
	public static void include(String view, Map<String, Object> attrs) throws ServletException, IOException {
        forward(view, attrs);
	}
	public static void include(String view) throws ServletException, IOException {
		XDispcher.include(view, Map.of());
	}
	
	/**
	 * Chuyển hướng sang địa chỉ url khác
	 * @param params các tham số đính kèm
	 */
	public static void redirect(String servletPath, Map<String, String> params) throws IOException {
		StringBuilder uri = new StringBuilder(XHttp.getRequest().getContextPath() + servletPath + "?");
		for(var name : params.keySet()) {
			var value = URLEncoder.encode(params.get(name), StandardCharsets.UTF_8);
			uri.append(String.format("%s=%s", name, value));
		}
		XHttp.getResponse().sendRedirect(uri.toString());
	}
	public static void redirect(String url) throws IOException {
		XDispcher.redirect(url, Map.of());
	}
}