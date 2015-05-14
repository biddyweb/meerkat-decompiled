package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.Parcel;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

public class zziv
{
  public static class zza
    implements SafeParcelable
  {
    public static final zziw CREATOR = new zziw();
    final int zzFG;
    public final Account zzFY;
    public final boolean zzFZ;
    public final boolean zzGa;
    public final boolean zzGb;

    public zza()
    {
      this(null, false, false, false);
    }

    zza(int paramInt, Account paramAccount, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      this.zzFG = paramInt;
      this.zzFY = paramAccount;
      this.zzFZ = paramBoolean1;
      this.zzGa = paramBoolean2;
      this.zzGb = paramBoolean3;
    }

    public zza(Account paramAccount, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3)
    {
      this(1, paramAccount, paramBoolean1, paramBoolean2, paramBoolean3);
    }

    public int describeContents()
    {
      return 0;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zziw.zza(this, paramParcel, paramInt);
    }
  }

  public static class zzb
    implements Result, SafeParcelable
  {
    public static final zzix CREATOR = new zzix();
    final int zzFG;
    public Status zzGc;
    public List<zzjb> zzGd;
    public String[] zzGe;

    public zzb()
    {
      this.zzFG = 1;
    }

    zzb(int paramInt, Status paramStatus, List<zzjb> paramList, String[] paramArrayOfString)
    {
      this.zzFG = paramInt;
      this.zzGc = paramStatus;
      this.zzGd = paramList;
      this.zzGe = paramArrayOfString;
    }

    public int describeContents()
    {
      return 0;
    }

    public Status getStatus()
    {
      return this.zzGc;
    }

    public void writeToParcel(Parcel paramParcel, int paramInt)
    {
      zzix.zza(this, paramParcel, paramInt);
    }
  }
}