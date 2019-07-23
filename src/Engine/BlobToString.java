package Engine;

public class BlobToString {
    public String convert(byte[] blob) {
        String str = "";
        //read bytes from ByteArrayInputStream using read method
        if (blob != null && blob.length > 0) {
            for (byte b : blob) {
                str = str + (char) b;
            }
        }
        return str;
    }
}