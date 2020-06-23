import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;

/**
 * @author TanXY
 * @create 2020/6/1 - 18:20
 * @description
 */
public class MD5test {
    @Test
    public void contextLoads() {

        String password  = "123456";

        String salt = "7ajvy6";

        SimpleHash simpleHash = new SimpleHash("md5",password, ByteSource.Util.bytes(salt),1);

        System.out.println(simpleHash.toHex());

    }
}
