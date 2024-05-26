package jsp_book;

import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener // 톰캣 서버에게 Listener 클래스임을 알려줌
public class InitialMember implements ServletContextListener {

    // 시작 (로드)
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        ArrayList<Member> datas = new ArrayList<Member>();

        // JSTL에 의해 0에서 7까지의 샘플 데이터 생성
        for (int i = 0; i < 8; i++) {
            Member data = new Member("김자바" + i, "test" + i + "@soldesk.net");
            datas.add(data);
        } // for

        // email이 없는 누락된 회원 2명 생성
        datas.add(new Member("이유리", null));
        datas.add(new Member("김철수", null));
        
        // default 생성자로 회원 1명 생성
        datas.add(new Member());

        // 영역별 실습을 위해 생성
        // -> context는 서버를 의미함(현재는 톰캣을 의미함)
        // 서버는 application, 브라우저가 session, 페이지는 request
        context.setAttribute("members", datas);
        // 뭐지 이건 context.setAttribute("member", new Member());
    } // method

    // 끝 (소멸)
    public void contextDestroyed(ServletContextEvent sce) {
        // 자원 해제 등 필요한 작업을 여기에 추가할 수 있습니다.
    } // method
} // class
