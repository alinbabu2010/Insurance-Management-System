package Insurance;

import java.util.Random;
public class rnumber {
 
    public static void main(String args[])
    {
        String alphabet= "0123456789";
        String s = "A";
        Random random = new Random();
        int randomLen = 5;
        for (int i = 1; i < randomLen; i++) {
            char  c = alphabet.charAt(random.nextInt(10));
            s+=c;
        }
         
        System.out.println(s);
    }
}