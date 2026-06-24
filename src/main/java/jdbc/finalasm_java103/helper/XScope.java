package jdbc.finalasm_java103.helper;

public class XScope {
	public enum Scope{REQUEST, SESSION, APPLICATION}
	/**
	 * Get/Set/Remove attribute from request/session/application scope
	 */
	@SuppressWarnings("unchecked")
	public static <T> T get(String name, Scope scope) {
		switch (scope) {
			case REQUEST: 
				return (T) XHttp.getRequest().getAttribute(name);
			case SESSION: 
				return (T) XHttp.getSession().getAttribute(name);
			default: 
				return (T) XHttp.getApplication().getAttribute(name);
		}
	}
	public static void set(String name, Object value, Scope scope) {
		switch (scope) {
			case REQUEST: 
				XHttp.getRequest().setAttribute(name, value); 
				break;
			case SESSION: 
				XHttp.getSession().setAttribute(name, value); 
				break;
			default: 
				XHttp.getApplication().setAttribute(name, value); 
				break;
		}
	}
	public static void remove(String name, Scope scope) {
		switch (scope) {
		case REQUEST: 
			XHttp.getRequest().removeAttribute(name); 
			break;
		case SESSION: 
			XHttp.getSession().removeAttribute(name);
			break;
		default: 
			XHttp.getApplication().removeAttribute(name); 
			break;
	}
	}
	
	/**
	 * Get/Set/Remove attribute from request scope
	 */
	public static <T> T getRequest(String name) {
		return XScope.get(name, Scope.REQUEST);
	}
	public static void setRequest(String name, Object value) {
		XScope.set(name, value, Scope.REQUEST);
	}
	public static void removeRequest(String name) {
		XScope.remove(name, Scope.REQUEST);
	}
	
	/**
	 * Get/Set/Remove attribute from session scope
	 */
	public static <T> T getSession(String name) {
		return XScope.get(name, Scope.SESSION);
	}
	public static void setSession(String name, Object value) {
		XScope.set(name, value, Scope.SESSION);
	}
	public static void removeSession(String name) {
		XScope.remove(name, Scope.SESSION);
	}
	
	/**
	 * Get/Set/Remove attribute from application scope
	 */
	public static <T> T getApplication(String name) {
		return XScope.get(name, Scope.APPLICATION);
	}
	public static void setApplication(String name, Object value) {
		XScope.set(name, value, Scope.APPLICATION);
	}
	public static void removeApplication(String name) {
		XScope.remove(name, Scope.APPLICATION);
	}
}