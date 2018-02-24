public class jniequihash {
  public native void runEquihash(String str);
  public static void main (String args[]) {
    jniequihash h = new jniequihash();
    h.runEquihash("Running equihash...");
  }
  static {
    System.loadLibrary("jniequihash");
  }
}
