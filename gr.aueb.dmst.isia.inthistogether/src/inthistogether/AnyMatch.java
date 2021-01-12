package inthistogether;
import java.util.*;

public class AnyMatch {
	
	public boolean anyMatch(String[] e) {
		return Arrays.stream(e).anyMatch(x -> x.equals(""));	
		}
	
	
}
