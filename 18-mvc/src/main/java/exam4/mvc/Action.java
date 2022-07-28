package exam4.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	public String precess(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
