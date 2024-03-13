package day7;

import java.util.ArrayList;

public class AcornService {

	
	AcornDAO dao = new AcornDAO();
//	학생 정보 가져오기 ( 매개변수, 반환 )
	
	public ArrayList<Acorn> getMeberListTmp() {
		
		ArrayList<Acorn> list = new ArrayList<>();
		
		list.add(new Acorn("pbj", "1234", "박범준"));
		list.add(new Acorn("chs", "2345", "최환석"));
		list.add(new Acorn("lgh", "3456", "이건희"));
		
		
		return list;
	}
	
	public ArrayList<Acorn> getMemberListReal() {
		ArrayList<Acorn> list = dao.selectAll();
		return list;
	}
	
	public void registerMember(Acorn acorn) {
		dao.insertMember(acorn);
	}
	
	public static void main(String[] args) {
		AcornService service = new AcornService();
		ArrayList<Acorn> list = service.getMemberListReal();
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

	public Acorn getMember(String id) {		 
		
		return dao.selectOne(id);
	}
	
	public void modifyMember(String id, String newpw) {
		dao.update(id, newpw);
	}
}
