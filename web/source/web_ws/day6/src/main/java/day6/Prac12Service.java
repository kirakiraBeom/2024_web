package day6;

import java.util.ArrayList;

public class Prac12Service {
	
	public ArrayList<Book> getBookList() {
		
		ArrayList<Book> list = new ArrayList<>();
		list.add(new Book("뇌", "베르나르", 9000));
		list.add(new Book("별의 길", "베르나르", 13000));
		list.add(new Book("자바의 정석", "베르나르", 2000));
		return list;
	
		
	}
}