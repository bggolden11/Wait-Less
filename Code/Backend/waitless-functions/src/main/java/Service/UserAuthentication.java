package Service;


import DBO.Queries.AuthenticatingUserDBOQuery;
import Exceptions.UserNotFoundException;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;

public class UserAuthentication {
    final String secretKey = "[B@37a71e93";

    public boolean authenticate(String employeeID, String password) throws UserNotFoundException, SQLException {
        String encryptedPassword = AES.encrypt(password, secretKey);
        return (new AuthenticatingUserDBOQuery()).userAuthenticate(employeeID).passwordtoken.equals(encryptedPassword);
    }

    public static class AES {

        private static SecretKey secretKey;
        private static byte[] key;

        public static void setKey(String myKey) {
            MessageDigest sha = null;
            try {
                key = myKey.getBytes("UTF-8");
                sha = MessageDigest.getInstance("SHA-1");
                key = sha.digest(key);
                key = Arrays.copyOf(key, 16);
                secretKey = new SecretKeySpec(key, "AES");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
//        public static void main(String[] argc){
//            System.out.println(decrypt("jAl4N4o8EGTKM0DLJiblQQ==","[B@37a71e93"));
//
//        }

        public static String encrypt(String strToEncrypt, String secret) {
            try {
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
            } catch (Exception e) {
                System.out.println("Error while encrypting: " + e.toString());
            }
            return null;
        }

        public static String decrypt(String strToDecrypt, String secret) {
            try{
                setKey(secret);
                Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                cipher.init(Cipher.DECRYPT_MODE, secretKey);
                return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
            }
            catch (Exception e) {
                System.out.println("Error while decrypting: " + e.toString());
            }
            return null;
        }
    }

}
