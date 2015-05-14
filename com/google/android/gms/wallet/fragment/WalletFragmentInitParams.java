package com.google.android.gms.wallet.fragment;

import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.wallet.MaskedWallet;
import com.google.android.gms.wallet.MaskedWalletRequest;

public final class WalletFragmentInitParams
  implements SafeParcelable
{
  public static final Parcelable.Creator<WalletFragmentInitParams> CREATOR = new zza();
  final int zzFG;
  private String zzHg;
  private MaskedWallet zzaEA;
  private int zzaEN;
  private MaskedWalletRequest zzaEz;

  private WalletFragmentInitParams()
  {
    this.zzFG = 1;
    this.zzaEN = -1;
  }

  WalletFragmentInitParams(int paramInt1, String paramString, MaskedWalletRequest paramMaskedWalletRequest, int paramInt2, MaskedWallet paramMaskedWallet)
  {
    this.zzFG = paramInt1;
    this.zzHg = paramString;
    this.zzaEz = paramMaskedWalletRequest;
    this.zzaEN = paramInt2;
    this.zzaEA = paramMaskedWallet;
  }

  public static Builder newBuilder()
  {
    WalletFragmentInitParams localWalletFragmentInitParams = new WalletFragmentInitParams();
    localWalletFragmentInitParams.getClass();
    return new Builder(null);
  }

  public int describeContents()
  {
    return 0;
  }

  public String getAccountName()
  {
    return this.zzHg;
  }

  public MaskedWallet getMaskedWallet()
  {
    return this.zzaEA;
  }

  public MaskedWalletRequest getMaskedWalletRequest()
  {
    return this.zzaEz;
  }

  public int getMaskedWalletRequestCode()
  {
    return this.zzaEN;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zza.zza(this, paramParcel, paramInt);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public WalletFragmentInitParams build()
    {
      boolean bool1 = true;
      boolean bool2;
      if (((WalletFragmentInitParams.zza(WalletFragmentInitParams.this) != null) && (WalletFragmentInitParams.zzb(WalletFragmentInitParams.this) == null)) || ((WalletFragmentInitParams.zza(WalletFragmentInitParams.this) == null) && (WalletFragmentInitParams.zzb(WalletFragmentInitParams.this) != null)))
      {
        bool2 = bool1;
        zzx.zza(bool2, "Exactly one of MaskedWallet or MaskedWalletRequest is required");
        if (WalletFragmentInitParams.zzc(WalletFragmentInitParams.this) < 0)
          break label76;
      }
      while (true)
      {
        zzx.zza(bool1, "masked wallet request code is required and must be non-negative");
        return WalletFragmentInitParams.this;
        bool2 = false;
        break;
        label76: bool1 = false;
      }
    }

    public Builder setAccountName(String paramString)
    {
      WalletFragmentInitParams.zza(WalletFragmentInitParams.this, paramString);
      return this;
    }

    public Builder setMaskedWallet(MaskedWallet paramMaskedWallet)
    {
      WalletFragmentInitParams.zza(WalletFragmentInitParams.this, paramMaskedWallet);
      return this;
    }

    public Builder setMaskedWalletRequest(MaskedWalletRequest paramMaskedWalletRequest)
    {
      WalletFragmentInitParams.zza(WalletFragmentInitParams.this, paramMaskedWalletRequest);
      return this;
    }

    public Builder setMaskedWalletRequestCode(int paramInt)
    {
      WalletFragmentInitParams.zza(WalletFragmentInitParams.this, paramInt);
      return this;
    }
  }
}