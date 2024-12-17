package helper;

import java.util.*;

public class GenerateNewCode {
    public static String generateNewCode(ArrayList<String> existingCodes) {
        Set<String> codeSet = new HashSet<>(existingCodes);

        String newCode;
        Random random = new Random();
        do {
            int randomNumber = random.nextInt(1000); 
            newCode = String.format("HD%03d", randomNumber);
        } while (codeSet.contains(newCode));

        return newCode; 
    }
}

