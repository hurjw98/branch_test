package jsp_book;

public class Member {
    private String name;
    private String email;

    public Member() {
        name = "신짱구";
        email = "crayon@soldesk.net";
    } // constructor

    public Member(String name, String email) {
        this.name = name;
        this.email = email;
    } // constructor

    // Getter 및 Setter 메서드 추가
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
