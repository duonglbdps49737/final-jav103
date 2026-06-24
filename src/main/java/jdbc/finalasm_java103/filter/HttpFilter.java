package jdbc.finalasm_java103.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdbc.finalasm_java103.helper.XHttp;

import java.io.IOException;

public interface HttpFilter {
    default void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
            throws IOException, ServletException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        try {
            XHttp.add(req, resp);
            chain.doFilter(req, resp);
        } finally {
            XHttp.remove();
        }
    }
}
