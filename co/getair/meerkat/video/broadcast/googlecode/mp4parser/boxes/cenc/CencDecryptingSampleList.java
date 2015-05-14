package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.cenc;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.SampleImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.RangeStartMap;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat.Pair;
import java.io.PrintStream;
import java.nio.ByteBuffer;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.AbstractList;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

public class CencDecryptingSampleList extends AbstractList<Sample>
{
  String encryptionAlgo;
  RangeStartMap<Integer, SecretKey> keys = new RangeStartMap();
  List<Sample> parent;
  List<CencSampleAuxiliaryDataFormat> sencInfo;

  public CencDecryptingSampleList(RangeStartMap<Integer, SecretKey> paramRangeStartMap, List<Sample> paramList, List<CencSampleAuxiliaryDataFormat> paramList1, String paramString)
  {
    this.sencInfo = paramList1;
    this.keys = paramRangeStartMap;
    this.parent = paramList;
    this.encryptionAlgo = paramString;
  }

  public CencDecryptingSampleList(SecretKey paramSecretKey, List<Sample> paramList, List<CencSampleAuxiliaryDataFormat> paramList1)
  {
    this(new RangeStartMap(Integer.valueOf(0), paramSecretKey), paramList, paramList1, "cenc");
  }

  public Sample get(int paramInt)
  {
    Sample localSample;
    ByteBuffer localByteBuffer1;
    ByteBuffer localByteBuffer2;
    CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat;
    Cipher localCipher;
    if (this.keys.get(Integer.valueOf(paramInt)) != null)
    {
      localSample = (Sample)this.parent.get(paramInt);
      localByteBuffer1 = localSample.asByteBuffer();
      localByteBuffer1.rewind();
      localByteBuffer2 = ByteBuffer.allocate(localByteBuffer1.limit());
      localCencSampleAuxiliaryDataFormat = (CencSampleAuxiliaryDataFormat)this.sencInfo.get(paramInt);
      localCipher = getCipher((SecretKey)this.keys.get(Integer.valueOf(paramInt)), localCencSampleAuxiliaryDataFormat.iv);
    }
    while (true)
    {
      int k;
      try
      {
        if ((localCencSampleAuxiliaryDataFormat.pairs != null) && (localCencSampleAuxiliaryDataFormat.pairs.length > 0))
        {
          CencSampleAuxiliaryDataFormat.Pair[] arrayOfPair = localCencSampleAuxiliaryDataFormat.pairs;
          int j = arrayOfPair.length;
          k = 0;
          if (k < j)
          {
            CencSampleAuxiliaryDataFormat.Pair localPair = arrayOfPair[k];
            int m = localPair.clear();
            int n = CastUtils.l2i(localPair.encrypted());
            byte[] arrayOfByte2 = new byte[m];
            localByteBuffer1.get(arrayOfByte2);
            localByteBuffer2.put(arrayOfByte2);
            if (n <= 0)
              break label431;
            byte[] arrayOfByte3 = new byte[n];
            localByteBuffer1.get(arrayOfByte3);
            localByteBuffer2.put(localCipher.update(arrayOfByte3));
            break label431;
          }
          if (localByteBuffer1.remaining() > 0)
            System.err.println("Decrypted sample but still data remaining: " + localSample.getSize());
          localByteBuffer2.put(localCipher.doFinal());
          localByteBuffer1.rewind();
          localByteBuffer2.rewind();
          SampleImpl localSampleImpl = new SampleImpl(localByteBuffer2);
          return localSampleImpl;
        }
        arrayOfByte1 = new byte[localByteBuffer1.limit()];
        localByteBuffer1.get(arrayOfByte1);
        if ("cbc1".equals(this.encryptionAlgo))
        {
          int i = 16 * (arrayOfByte1.length / 16);
          localByteBuffer2.put(localCipher.doFinal(arrayOfByte1, 0, i));
          localByteBuffer2.put(arrayOfByte1, i, arrayOfByte1.length - i);
          continue;
        }
      }
      catch (IllegalBlockSizeException localIllegalBlockSizeException)
      {
        byte[] arrayOfByte1;
        RuntimeException localRuntimeException2 = new RuntimeException(localIllegalBlockSizeException);
        throw localRuntimeException2;
        if (!"cenc".equals(this.encryptionAlgo))
          continue;
        localByteBuffer2.put(localCipher.doFinal(arrayOfByte1));
        continue;
      }
      catch (BadPaddingException localBadPaddingException)
      {
        RuntimeException localRuntimeException1 = new RuntimeException(localBadPaddingException);
        throw localRuntimeException1;
      }
      return (Sample)this.parent.get(paramInt);
      label431: k++;
    }
  }

  Cipher getCipher(SecretKey paramSecretKey, byte[] paramArrayOfByte)
  {
    byte[] arrayOfByte = new byte[16];
    System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, paramArrayOfByte.length);
    try
    {
      if ("cenc".equals(this.encryptionAlgo))
      {
        Cipher localCipher2 = Cipher.getInstance("AES/CTR/NoPadding");
        localCipher2.init(2, paramSecretKey, new IvParameterSpec(arrayOfByte));
        return localCipher2;
      }
      if ("cbc1".equals(this.encryptionAlgo))
      {
        Cipher localCipher1 = Cipher.getInstance("AES/CBC/NoPadding");
        localCipher1.init(2, paramSecretKey, new IvParameterSpec(arrayOfByte));
        return localCipher1;
      }
      throw new RuntimeException("Only cenc & cbc1 is supported as encryptionAlgo");
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
    catch (NoSuchPaddingException localNoSuchPaddingException)
    {
      throw new RuntimeException(localNoSuchPaddingException);
    }
    catch (InvalidAlgorithmParameterException localInvalidAlgorithmParameterException)
    {
      throw new RuntimeException(localInvalidAlgorithmParameterException);
    }
    catch (InvalidKeyException localInvalidKeyException)
    {
      throw new RuntimeException(localInvalidKeyException);
    }
  }

  public int size()
  {
    return this.parent.size();
  }
}