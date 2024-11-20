package study.j1021;

public class test1 {
	public static void main(String[] args) {
		String sContent = "[interior7, interior3]";
		String[] scon = sContent.split(",");
		
		
		for(int i = 0; i < scon.length; i++) {
			scon[i] = scon[i].replace("interior", "").replace("[", "").replace("]", "").trim();
			System.out.println(scon[i]);
		}
		
		
//		for(String t : scon) {
//			System.out.println(t);
//		}
		
		
//		System.out.println("1." + tel1 + "-" + tel2 + "-" + tel3);
	}
}
