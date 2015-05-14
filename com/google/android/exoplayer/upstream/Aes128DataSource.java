package com.google.android.exoplayer.upstream;

import com.google.android.exoplayer.util.Assertions;
import java.io.IOException;
import javax.crypto.CipherInputStream;

public class Aes128DataSource
  implements DataSource
{
  private CipherInputStream cipherInputStream;
  private final byte[] iv;
  private final byte[] secretKey;
  private final DataSource upstream;

  public Aes128DataSource(byte[] paramArrayOfByte1, byte[] paramArrayOfByte2, DataSource paramDataSource)
  {
    this.upstream = paramDataSource;
    this.secretKey = paramArrayOfByte1;
    this.iv = paramArrayOfByte2;
  }

  public void close()
    throws IOException
  {
    this.cipherInputStream = null;
    this.upstream.close();
  }

  // ERROR //
  public long open(DataSpec paramDataSpec)
    throws IOException
  {
    // Byte code:
    //   0: ldc 43
    //   2: invokestatic 49\011javax/crypto/Cipher:getInstance\011(Ljava/lang/String;)Ljavax/crypto/Cipher;
    //   5: astore 4
    //   7: new 51\011javax/crypto/spec/SecretKeySpec
    //   10: dup
    //   11: aload_0
    //   12: getfield 22\011com/google/android/exoplayer/upstream/Aes128DataSource:secretKey\011[B
    //   15: ldc 53
    //   17: invokespecial 56\011javax/crypto/spec/SecretKeySpec:<init>\011([BLjava/lang/String;)V
    //   20: astore 5
    //   22: new 58\011javax/crypto/spec/IvParameterSpec
    //   25: dup
    //   26: aload_0
    //   27: getfield 24\011com/google/android/exoplayer/upstream/Aes128DataSource:iv\011[B
    //   30: invokespecial 61\011javax/crypto/spec/IvParameterSpec:<init>\011([B)V
    //   33: astore 6
    //   35: aload 4
    //   37: iconst_2
    //   38: aload 5
    //   40: aload 6
    //   42: invokevirtual 65\011javax/crypto/Cipher:init\011(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    //   45: aload_0
    //   46: new 67\011javax/crypto/CipherInputStream
    //   49: dup
    //   50: new 69\011com/google/android/exoplayer/upstream/DataSourceInputStream
    //   53: dup
    //   54: aload_0
    //   55: getfield 20\011com/google/android/exoplayer/upstream/Aes128DataSource:upstream\011Lcom/google/android/exoplayer/upstream/DataSource;
    //   58: aload_1
    //   59: invokespecial 72\011com/google/android/exoplayer/upstream/DataSourceInputStream:<init>\011(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    //   62: aload 4
    //   64: invokespecial 75\011javax/crypto/CipherInputStream:<init>\011(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V
    //   67: putfield 29\011com/google/android/exoplayer/upstream/Aes128DataSource:cipherInputStream\011Ljavax/crypto/CipherInputStream;
    //   70: ldc2_w 76
    //   73: lreturn
    //   74: astore_3
    //   75: new 79\011java/lang/RuntimeException
    //   78: dup
    //   79: aload_3
    //   80: invokespecial 82\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   83: athrow
    //   84: astore_2
    //   85: new 79\011java/lang/RuntimeException
    //   88: dup
    //   89: aload_2
    //   90: invokespecial 82\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   93: athrow
    //   94: astore 8
    //   96: new 79\011java/lang/RuntimeException
    //   99: dup
    //   100: aload 8
    //   102: invokespecial 82\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   105: athrow
    //   106: astore 7
    //   108: new 79\011java/lang/RuntimeException
    //   111: dup
    //   112: aload 7
    //   114: invokespecial 82\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   117: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\0117\01174\011java/security/NoSuchAlgorithmException
    //   0\0117\01184\011javax/crypto/NoSuchPaddingException
    //   35\01145\01194\011java/security/InvalidKeyException
    //   35\01145\011106\011java/security/InvalidAlgorithmParameterException
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.cipherInputStream != null);
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkState(bool);
      int i = this.cipherInputStream.read(paramArrayOfByte, paramInt1, paramInt2);
      if (i < 0)
        i = -1;
      return i;
    }
  }
}