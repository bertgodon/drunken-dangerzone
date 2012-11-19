package be.scouts.beurs.admin;

public class BeursUtils {

	public static float FromStringToFloat(String in){
		String formatted = in.replace(",", ".");
		return Float.parseFloat(formatted);
	}
	public static String FromFloatToString(float num){
		String fl = String.valueOf(num);
		return fl.replace(".",",");
	}
}
