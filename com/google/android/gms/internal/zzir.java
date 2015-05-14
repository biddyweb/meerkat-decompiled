package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;

public class zzir
  implements SafeParcelable
{
  public static final zzis CREATOR = new zzis();
  public static final int zzFR = Integer.parseInt("-1");
  private static final zziz zzFS = new zziz.zza("SsbContext").zzI(true).zzaz("blob").zzgX();
  final int zzFG;
  public final String zzFT;
  final zziz zzFU;
  public final int zzFV;
  public final byte[] zzFW;

  zzir(int paramInt1, String paramString, zziz paramzziz, int paramInt2, byte[] paramArrayOfByte)
  {
    if ((paramInt2 == zzFR) || (zziy.zzV(paramInt2) != null));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzb(bool, "Invalid section type " + paramInt2);
      this.zzFG = paramInt1;
      this.zzFT = paramString;
      this.zzFU = paramzziz;
      this.zzFV = paramInt2;
      this.zzFW = paramArrayOfByte;
      String str = zzgV();
      if (str == null)
        break;
      throw new IllegalArgumentException(str);
    }
  }

  public zzir(String paramString, zziz paramzziz)
  {
    this(1, paramString, paramzziz, zzFR, null);
  }

  public zzir(String paramString1, zziz paramzziz, String paramString2)
  {
    this(1, paramString1, paramzziz, zziy.zzay(paramString2), null);
  }

  public zzir(byte[] paramArrayOfByte, zziz paramzziz)
  {
    this(1, null, paramzziz, zzFR, paramArrayOfByte);
  }

  public static zzir zzd(byte[] paramArrayOfByte)
  {
    return new zzir(paramArrayOfByte, zzFS);
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzis.zza(this, paramParcel, paramInt);
  }

  public String zzgV()
  {
    if ((this.zzFV != zzFR) && (zziy.zzV(this.zzFV) == null))
      return "Invalid section type " + this.zzFV;
    if ((this.zzFT != null) && (this.zzFW != null))
      return "Both content and blobContent set";
    return null;
  }
}