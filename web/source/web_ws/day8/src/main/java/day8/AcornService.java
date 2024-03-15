package day8;

import java.util.ArrayList;

public class AcornService {
	
	AcornDAO dao = new AcornDAO();
	
public ArrayList<Acorn> getMembers() {
		
		ArrayList<Acorn> list = dao.selectAll();
		
		return list;
	}
}
