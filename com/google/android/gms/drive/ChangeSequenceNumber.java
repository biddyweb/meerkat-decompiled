package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.Base64;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.internal.zzam;
import com.google.android.gms.internal.zzwy;

public class ChangeSequenceNumber
  implements SafeParcelable
{
  public static final Parcelable.Creator<ChangeSequenceNumber> CREATOR = new zza();
  final int zzFG;
  final long zzRR;
  final long zzRS;
  final long zzRT;
  private volatile String zzRU = null;

  ChangeSequenceNumber(int paramInt, long paramLong1, long paramLong2, long paramLong3)
  {
    boolean bool2;
    boolean bool3;
    if (paramLong1 != -1L)
    {
      bool2 = bool1;
      zzx.zzO(bool2);
      if (paramLong2 == -1L)
        break label90;
      bool3 = bool1;
      label42: zzx.zzO(bool3);
      if (paramLong3 == -1L)
        break label96;
    }
    while (true)
    {
      zzx.zzO(bool1);
      this.zzFG = paramInt;
      this.zzRR = paramLong1;
      this.zzRS = paramLong2;
      this.zzRT = paramLong3;
      return;
      bool2 = false;
      break;
      label90: bool3 = false;
      break label42;
      label96: bool1 = false;
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public final String encodeToString()
  {
    if (this.zzRU == null)
    {
      String str = Base64.encodeToString(zzkn(), 10);
      this.zzRU = ("ChangeSequenceNumber:" + str);
    }
    return this.zzRU;
  }

  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof ChangeSequenceNumber));
    ChangeSequenceNumber localChangeSequenceNumber;
    do
    {
      return false;
      localChangeSequenceNumber = (ChangeSequenceNumber)paramObject;
    }
    while ((localChangeSequenceNumber.zzRS != this.zzRS) || (localChangeSequenceNumber.zzRT != this.zzRT) || (localChangeSequenceNumber.zzRR != this.zzRR));
    return true;
  }

  public int hashCode()
  {
    return (String.valueOf(this.zzRR) + String.valueOf(this.zzRS) + String.valueOf(this.zzRT)).hashCode();
  }

  public String toString()
  {
    return encodeToString();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  final byte[] zzkn()
  {
    zzam localzzam = new zzam();
    localzzam.versionCode = this.zzFG;
    localzzam.zzUF = this.zzRR;
    localzzam.zzUG = this.zzRS;
    localzzam.zzUH = this.zzRT;
    return zzwy.zzf(localzzam);
  }
}