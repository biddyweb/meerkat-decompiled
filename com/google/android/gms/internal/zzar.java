package com.google.android.gms.internal;

import java.security.MessageDigest;

public class zzar extends zzao
{
  private MessageDigest zzoH;

  byte[] zza(String[] paramArrayOfString)
  {
    byte[] arrayOfByte = new byte[paramArrayOfString.length];
    for (int i = 0; i < paramArrayOfString.length; i++)
      arrayOfByte[i] = zze(zzaq.zzo(paramArrayOfString[i]));
    return arrayOfByte;
  }

  byte zze(int paramInt)
  {
    return (byte)(paramInt & 0xFF ^ (0xFF00 & paramInt) >> 8 ^ (0xFF0000 & paramInt) >> 16 ^ (0xFF000000 & paramInt) >> 24);
  }

  public byte[] zzl(String paramString)
  {
    byte[] arrayOfByte1 = zza(paramString.split(" "));
    this.zzoH = zzby();
    while (true)
    {
      byte[] arrayOfByte3;
      synchronized (this.zznh)
      {
        if (this.zzoH == null)
        {
          byte[] arrayOfByte2 = new byte[0];
          return arrayOfByte2;
        }
        this.zzoH.reset();
        this.zzoH.update(arrayOfByte1);
        arrayOfByte3 = this.zzoH.digest();
        i = 4;
        if (arrayOfByte3.length > i)
        {
          byte[] arrayOfByte4 = new byte[i];
          System.arraycopy(arrayOfByte3, 0, arrayOfByte4, 0, arrayOfByte4.length);
          return arrayOfByte4;
        }
      }
      int i = arrayOfByte3.length;
    }
  }
}