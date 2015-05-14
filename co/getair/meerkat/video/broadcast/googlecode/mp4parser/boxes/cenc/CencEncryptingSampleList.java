package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.cenc;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.RangeStartMap;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat.Pair;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
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
import javax.crypto.ShortBufferException;
import javax.crypto.spec.IvParameterSpec;

public class CencEncryptingSampleList extends AbstractList<Sample>
{
  List<CencSampleAuxiliaryDataFormat> auxiliaryDataFormats;
  RangeStartMap<Integer, SecretKey> ceks = new RangeStartMap();
  Cipher cipher;
  private final String encryptionAlgo;
  List<Sample> parent;

  public CencEncryptingSampleList(RangeStartMap<Integer, SecretKey> paramRangeStartMap, List<Sample> paramList, List<CencSampleAuxiliaryDataFormat> paramList1, String paramString)
  {
    this.auxiliaryDataFormats = paramList1;
    this.ceks = paramRangeStartMap;
    this.encryptionAlgo = paramString;
    this.parent = paramList;
    try
    {
      if ("cenc".equals(paramString))
      {
        this.cipher = Cipher.getInstance("AES/CTR/NoPadding");
        return;
      }
      if ("cbc1".equals(paramString))
      {
        this.cipher = Cipher.getInstance("AES/CBC/NoPadding");
        return;
      }
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
      throw new RuntimeException("Only cenc & cbc1 is supported as encryptionAlgo");
    }
    catch (NoSuchPaddingException localNoSuchPaddingException)
    {
      throw new RuntimeException(localNoSuchPaddingException);
    }
  }

  public CencEncryptingSampleList(SecretKey paramSecretKey, List<Sample> paramList, List<CencSampleAuxiliaryDataFormat> paramList1)
  {
    this(new RangeStartMap(Integer.valueOf(0), paramSecretKey), paramList, paramList1, "cenc");
  }

  public Sample get(int paramInt)
  {
    Sample localSample = (Sample)this.parent.get(paramInt);
    if (this.ceks.get(Integer.valueOf(paramInt)) != null)
      return new EncryptedSampleImpl(localSample, (CencSampleAuxiliaryDataFormat)this.auxiliaryDataFormats.get(paramInt), this.cipher, (SecretKey)this.ceks.get(Integer.valueOf(paramInt)), null);
    return localSample;
  }

  protected void initCipher(byte[] paramArrayOfByte, SecretKey paramSecretKey)
  {
    try
    {
      byte[] arrayOfByte = new byte[16];
      System.arraycopy(paramArrayOfByte, 0, arrayOfByte, 0, paramArrayOfByte.length);
      this.cipher.init(1, paramSecretKey, new IvParameterSpec(arrayOfByte));
      return;
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

  private class EncryptedSampleImpl
    implements Sample
  {
    private final SecretKey cek;
    private final CencSampleAuxiliaryDataFormat cencSampleAuxiliaryDataFormat;
    private final Cipher cipher;
    private final Sample clearSample;

    static
    {
      if (!CencEncryptingSampleList.class.desiredAssertionStatus());
      for (boolean bool = true; ; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }

    private EncryptedSampleImpl(Sample paramCencSampleAuxiliaryDataFormat, CencSampleAuxiliaryDataFormat paramCipher, Cipher paramSecretKey, SecretKey arg5)
    {
      this.clearSample = paramCencSampleAuxiliaryDataFormat;
      this.cencSampleAuxiliaryDataFormat = paramCipher;
      this.cipher = paramSecretKey;
      Object localObject;
      this.cek = localObject;
    }

    public ByteBuffer asByteBuffer()
    {
      ByteBuffer localByteBuffer1 = (ByteBuffer)this.clearSample.asByteBuffer().rewind();
      ByteBuffer localByteBuffer2 = ByteBuffer.allocate(localByteBuffer1.limit());
      CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat = this.cencSampleAuxiliaryDataFormat;
      CencEncryptingSampleList.this.initCipher(this.cencSampleAuxiliaryDataFormat.iv, this.cek);
      while (true)
      {
        int k;
        byte[] arrayOfByte4;
        try
        {
          if (localCencSampleAuxiliaryDataFormat.pairs == null)
            break label231;
          CencSampleAuxiliaryDataFormat.Pair[] arrayOfPair = localCencSampleAuxiliaryDataFormat.pairs;
          int j = arrayOfPair.length;
          k = 0;
          if (k >= j)
            break label304;
          CencSampleAuxiliaryDataFormat.Pair localPair = arrayOfPair[k];
          byte[] arrayOfByte2 = new byte[localPair.clear()];
          localByteBuffer1.get(arrayOfByte2);
          localByteBuffer2.put(arrayOfByte2);
          if (localPair.encrypted() <= 0L)
            break label348;
          arrayOfByte3 = new byte[CastUtils.l2i(localPair.encrypted())];
          localByteBuffer1.get(arrayOfByte3);
          if ((!$assertionsDisabled) && (arrayOfByte3.length % 16 != 0))
            throw new AssertionError();
        }
        catch (IllegalBlockSizeException localIllegalBlockSizeException)
        {
          byte[] arrayOfByte3;
          throw new RuntimeException(localIllegalBlockSizeException);
          arrayOfByte4 = this.cipher.update(arrayOfByte3);
          if ((!$assertionsDisabled) && (arrayOfByte4.length != arrayOfByte3.length))
            throw new AssertionError();
        }
        catch (BadPaddingException localBadPaddingException)
        {
          throw new RuntimeException(localBadPaddingException);
        }
        localByteBuffer2.put(arrayOfByte4);
        break label348;
        label231: byte[] arrayOfByte1 = new byte[localByteBuffer1.limit()];
        localByteBuffer1.get(arrayOfByte1);
        if ("cbc1".equals(CencEncryptingSampleList.this.encryptionAlgo))
        {
          int i = 16 * (arrayOfByte1.length / 16);
          localByteBuffer2.put(this.cipher.doFinal(arrayOfByte1, 0, i));
          localByteBuffer2.put(arrayOfByte1, i, arrayOfByte1.length - i);
        }
        while (true)
        {
          label304: localByteBuffer1.rewind();
          localByteBuffer2.rewind();
          return localByteBuffer2;
          if ("cenc".equals(CencEncryptingSampleList.this.encryptionAlgo))
            localByteBuffer2.put(this.cipher.doFinal(arrayOfByte1));
        }
        label348: k++;
      }
    }

    public long getSize()
    {
      return this.clearSample.getSize();
    }

    public void writeTo(WritableByteChannel paramWritableByteChannel)
      throws IOException
    {
      ByteBuffer localByteBuffer = (ByteBuffer)this.clearSample.asByteBuffer().rewind();
      CencEncryptingSampleList.this.initCipher(this.cencSampleAuxiliaryDataFormat.iv, this.cek);
      while (true)
      {
        int m;
        try
        {
          if ((this.cencSampleAuxiliaryDataFormat.pairs != null) && (this.cencSampleAuxiliaryDataFormat.pairs.length > 0))
          {
            byte[] arrayOfByte2 = new byte[localByteBuffer.limit()];
            localByteBuffer.get(arrayOfByte2);
            int j = 0;
            CencSampleAuxiliaryDataFormat.Pair[] arrayOfPair = this.cencSampleAuxiliaryDataFormat.pairs;
            int k = arrayOfPair.length;
            m = 0;
            if (m < k)
            {
              CencSampleAuxiliaryDataFormat.Pair localPair = arrayOfPair[m];
              j += localPair.clear();
              if (localPair.encrypted() > 0L)
              {
                this.cipher.update(arrayOfByte2, j, CastUtils.l2i(localPair.encrypted()), arrayOfByte2, j);
                j = (int)(j + localPair.encrypted());
              }
            }
            else
            {
              paramWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte2));
              localByteBuffer.rewind();
            }
          }
          else
          {
            arrayOfByte1 = new byte[localByteBuffer.limit()];
            localByteBuffer.get(arrayOfByte1);
            if ("cbc1".equals(CencEncryptingSampleList.this.encryptionAlgo))
            {
              int i = 16 * (arrayOfByte1.length / 16);
              paramWritableByteChannel.write(ByteBuffer.wrap(this.cipher.doFinal(arrayOfByte1, 0, i)));
              paramWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte1, i, arrayOfByte1.length - i));
              continue;
            }
          }
        }
        catch (IllegalBlockSizeException localIllegalBlockSizeException)
        {
          byte[] arrayOfByte1;
          throw new RuntimeException(localIllegalBlockSizeException);
          if (!"cenc".equals(CencEncryptingSampleList.this.encryptionAlgo))
            continue;
          paramWritableByteChannel.write(ByteBuffer.wrap(this.cipher.doFinal(arrayOfByte1)));
          continue;
        }
        catch (BadPaddingException localBadPaddingException)
        {
          throw new RuntimeException(localBadPaddingException);
        }
        catch (ShortBufferException localShortBufferException)
        {
          throw new RuntimeException(localShortBufferException);
        }
        m++;
      }
    }
  }
}