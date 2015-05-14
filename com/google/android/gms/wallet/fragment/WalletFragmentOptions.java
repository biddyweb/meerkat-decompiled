package com.google.android.gms.wallet.fragment;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.AttributeSet;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class WalletFragmentOptions
  implements SafeParcelable
{
  public static final Parcelable.Creator<WalletFragmentOptions> CREATOR = new zzb();
  private int mTheme;
  final int zzFG;
  private int zzRW;
  private WalletFragmentStyle zzaEP;
  private int zzaEo;

  private WalletFragmentOptions()
  {
    this.zzFG = 1;
  }

  WalletFragmentOptions(int paramInt1, int paramInt2, int paramInt3, WalletFragmentStyle paramWalletFragmentStyle, int paramInt4)
  {
    this.zzFG = paramInt1;
    this.zzaEo = paramInt2;
    this.mTheme = paramInt3;
    this.zzaEP = paramWalletFragmentStyle;
    this.zzRW = paramInt4;
  }

  public static Builder newBuilder()
  {
    WalletFragmentOptions localWalletFragmentOptions = new WalletFragmentOptions();
    localWalletFragmentOptions.getClass();
    return new Builder(null);
  }

  public static WalletFragmentOptions zza(Context paramContext, AttributeSet paramAttributeSet)
  {
    TypedArray localTypedArray = paramContext.obtainStyledAttributes(paramAttributeSet, R.styleable.WalletFragmentOptions);
    int i = localTypedArray.getInt(R.styleable.WalletFragmentOptions_appTheme, 0);
    int j = localTypedArray.getInt(R.styleable.WalletFragmentOptions_environment, 1);
    int k = localTypedArray.getResourceId(R.styleable.WalletFragmentOptions_fragmentStyle, 0);
    int m = localTypedArray.getInt(R.styleable.WalletFragmentOptions_fragmentMode, 1);
    localTypedArray.recycle();
    WalletFragmentOptions localWalletFragmentOptions = new WalletFragmentOptions();
    localWalletFragmentOptions.mTheme = i;
    localWalletFragmentOptions.zzaEo = j;
    localWalletFragmentOptions.zzaEP = new WalletFragmentStyle().setStyleResourceId(k);
    localWalletFragmentOptions.zzaEP.zzao(paramContext);
    localWalletFragmentOptions.zzRW = m;
    return localWalletFragmentOptions;
  }

  public int describeContents()
  {
    return 0;
  }

  public int getEnvironment()
  {
    return this.zzaEo;
  }

  public WalletFragmentStyle getFragmentStyle()
  {
    return this.zzaEP;
  }

  public int getMode()
  {
    return this.zzRW;
  }

  public int getTheme()
  {
    return this.mTheme;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzb.zza(this, paramParcel, paramInt);
  }

  public void zzao(Context paramContext)
  {
    if (this.zzaEP != null)
      this.zzaEP.zzao(paramContext);
  }

  public final class Builder
  {
    private Builder()
    {
    }

    public WalletFragmentOptions build()
    {
      return WalletFragmentOptions.this;
    }

    public Builder setEnvironment(int paramInt)
    {
      WalletFragmentOptions.zza(WalletFragmentOptions.this, paramInt);
      return this;
    }

    public Builder setFragmentStyle(int paramInt)
    {
      WalletFragmentOptions.zza(WalletFragmentOptions.this, new WalletFragmentStyle().setStyleResourceId(paramInt));
      return this;
    }

    public Builder setFragmentStyle(WalletFragmentStyle paramWalletFragmentStyle)
    {
      WalletFragmentOptions.zza(WalletFragmentOptions.this, paramWalletFragmentStyle);
      return this;
    }

    public Builder setMode(int paramInt)
    {
      WalletFragmentOptions.zzc(WalletFragmentOptions.this, paramInt);
      return this;
    }

    public Builder setTheme(int paramInt)
    {
      WalletFragmentOptions.zzb(WalletFragmentOptions.this, paramInt);
      return this;
    }
  }
}