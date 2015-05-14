package com.google.android.gms.internal;

import android.accounts.Account;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;

public class zzin
  implements SafeParcelable
{
  public static final zzio CREATOR = new zzio();
  public final Account account;
  final int zzFG;
  final zzir[] zzFH;
  public final String zzFI;
  public final boolean zzFJ;

  zzin(int paramInt, zzir[] paramArrayOfzzir, String paramString, boolean paramBoolean, Account paramAccount)
  {
    this.zzFG = paramInt;
    this.zzFH = paramArrayOfzzir;
    this.zzFI = paramString;
    this.zzFJ = paramBoolean;
    this.account = paramAccount;
  }

  zzin(String paramString, boolean paramBoolean, Account paramAccount, zzir[] paramArrayOfzzir)
  {
    this(1, paramArrayOfzzir, paramString, paramBoolean, paramAccount);
    BitSet localBitSet = new BitSet(zziy.zzgW());
    for (int i = 0; i < paramArrayOfzzir.length; i++)
    {
      int j = paramArrayOfzzir[i].zzFV;
      if (j != -1)
      {
        if (localBitSet.get(j))
          throw new IllegalArgumentException("Duplicate global search section type " + zziy.zzV(j));
        localBitSet.set(j);
      }
    }
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzio.zza(this, paramParcel, paramInt);
  }

  public static class zza
  {
    private List<zzir> zzFK;
    private String zzFL;
    private boolean zzFM;
    private Account zzFN;

    public zza zzH(boolean paramBoolean)
    {
      this.zzFM = paramBoolean;
      return this;
    }

    public zza zza(Account paramAccount)
    {
      this.zzFN = paramAccount;
      return this;
    }

    public zza zza(zzir paramzzir)
    {
      if (this.zzFK == null)
        this.zzFK = new ArrayList();
      this.zzFK.add(paramzzir);
      return this;
    }

    public zza zzax(String paramString)
    {
      this.zzFL = paramString;
      return this;
    }

    public zzin zzgU()
    {
      String str = this.zzFL;
      boolean bool = this.zzFM;
      Account localAccount = this.zzFN;
      if (this.zzFK != null);
      for (zzir[] arrayOfzzir = (zzir[])this.zzFK.toArray(new zzir[this.zzFK.size()]); ; arrayOfzzir = null)
        return new zzin(str, bool, localAccount, arrayOfzzir);
    }
  }
}