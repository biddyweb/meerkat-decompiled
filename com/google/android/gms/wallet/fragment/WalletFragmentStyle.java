package com.google.android.gms.wallet.fragment;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import com.google.android.gms.R.style;
import com.google.android.gms.R.styleable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class WalletFragmentStyle
  implements SafeParcelable
{
  public static final Parcelable.Creator<WalletFragmentStyle> CREATOR = new zzc();
  final int zzFG;
  Bundle zzaER;
  int zzaES;

  public WalletFragmentStyle()
  {
    this.zzFG = 1;
    this.zzaER = new Bundle();
  }

  WalletFragmentStyle(int paramInt1, Bundle paramBundle, int paramInt2)
  {
    this.zzFG = paramInt1;
    this.zzaER = paramBundle;
    this.zzaES = paramInt2;
  }

  private void zza(TypedArray paramTypedArray, int paramInt, String paramString)
  {
    if (this.zzaER.containsKey(paramString));
    TypedValue localTypedValue;
    do
    {
      return;
      localTypedValue = paramTypedArray.peekValue(paramInt);
    }
    while (localTypedValue == null);
    this.zzaER.putLong(paramString, Dimension.zza(localTypedValue));
  }

  private void zza(TypedArray paramTypedArray, int paramInt, String paramString1, String paramString2)
  {
    if ((this.zzaER.containsKey(paramString1)) || (this.zzaER.containsKey(paramString2)));
    TypedValue localTypedValue;
    do
    {
      return;
      localTypedValue = paramTypedArray.peekValue(paramInt);
    }
    while (localTypedValue == null);
    if ((localTypedValue.type >= 28) && (localTypedValue.type <= 31))
    {
      this.zzaER.putInt(paramString1, localTypedValue.data);
      return;
    }
    this.zzaER.putInt(paramString2, localTypedValue.resourceId);
  }

  private void zzb(TypedArray paramTypedArray, int paramInt, String paramString)
  {
    if (this.zzaER.containsKey(paramString));
    TypedValue localTypedValue;
    do
    {
      return;
      localTypedValue = paramTypedArray.peekValue(paramInt);
    }
    while (localTypedValue == null);
    this.zzaER.putInt(paramString, localTypedValue.data);
  }

  public int describeContents()
  {
    return 0;
  }

  public WalletFragmentStyle setBuyButtonAppearance(int paramInt)
  {
    this.zzaER.putInt("buyButtonAppearance", paramInt);
    return this;
  }

  public WalletFragmentStyle setBuyButtonHeight(int paramInt)
  {
    this.zzaER.putLong("buyButtonHeight", Dimension.zzhC(paramInt));
    return this;
  }

  public WalletFragmentStyle setBuyButtonHeight(int paramInt, float paramFloat)
  {
    this.zzaER.putLong("buyButtonHeight", Dimension.zza(paramInt, paramFloat));
    return this;
  }

  public WalletFragmentStyle setBuyButtonText(int paramInt)
  {
    this.zzaER.putInt("buyButtonText", paramInt);
    return this;
  }

  public WalletFragmentStyle setBuyButtonWidth(int paramInt)
  {
    this.zzaER.putLong("buyButtonWidth", Dimension.zzhC(paramInt));
    return this;
  }

  public WalletFragmentStyle setBuyButtonWidth(int paramInt, float paramFloat)
  {
    this.zzaER.putLong("buyButtonWidth", Dimension.zza(paramInt, paramFloat));
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsBackgroundColor(int paramInt)
  {
    this.zzaER.remove("maskedWalletDetailsBackgroundResource");
    this.zzaER.putInt("maskedWalletDetailsBackgroundColor", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsBackgroundResource(int paramInt)
  {
    this.zzaER.remove("maskedWalletDetailsBackgroundColor");
    this.zzaER.putInt("maskedWalletDetailsBackgroundResource", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsButtonBackgroundColor(int paramInt)
  {
    this.zzaER.remove("maskedWalletDetailsButtonBackgroundResource");
    this.zzaER.putInt("maskedWalletDetailsButtonBackgroundColor", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsButtonBackgroundResource(int paramInt)
  {
    this.zzaER.remove("maskedWalletDetailsButtonBackgroundColor");
    this.zzaER.putInt("maskedWalletDetailsButtonBackgroundResource", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsButtonTextAppearance(int paramInt)
  {
    this.zzaER.putInt("maskedWalletDetailsButtonTextAppearance", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsHeaderTextAppearance(int paramInt)
  {
    this.zzaER.putInt("maskedWalletDetailsHeaderTextAppearance", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsLogoImageType(int paramInt)
  {
    this.zzaER.putInt("maskedWalletDetailsLogoImageType", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsLogoTextColor(int paramInt)
  {
    this.zzaER.putInt("maskedWalletDetailsLogoTextColor", paramInt);
    return this;
  }

  public WalletFragmentStyle setMaskedWalletDetailsTextAppearance(int paramInt)
  {
    this.zzaER.putInt("maskedWalletDetailsTextAppearance", paramInt);
    return this;
  }

  public WalletFragmentStyle setStyleResourceId(int paramInt)
  {
    this.zzaES = paramInt;
    return this;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzc.zza(this, paramParcel, paramInt);
  }

  public int zza(String paramString, DisplayMetrics paramDisplayMetrics, int paramInt)
  {
    if (this.zzaER.containsKey(paramString))
      paramInt = Dimension.zza(this.zzaER.getLong(paramString), paramDisplayMetrics);
    return paramInt;
  }

  public void zzao(Context paramContext)
  {
    if (this.zzaES <= 0);
    for (int i = R.style.WalletFragmentDefaultStyle; ; i = this.zzaES)
    {
      TypedArray localTypedArray = paramContext.obtainStyledAttributes(i, R.styleable.WalletFragmentStyle);
      zza(localTypedArray, R.styleable.WalletFragmentStyle_buyButtonWidth, "buyButtonWidth");
      zza(localTypedArray, R.styleable.WalletFragmentStyle_buyButtonHeight, "buyButtonHeight");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_buyButtonText, "buyButtonText");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_buyButtonAppearance, "buyButtonAppearance");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsTextAppearance, "maskedWalletDetailsTextAppearance");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsHeaderTextAppearance, "maskedWalletDetailsHeaderTextAppearance");
      zza(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsBackground, "maskedWalletDetailsBackgroundColor", "maskedWalletDetailsBackgroundResource");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsButtonTextAppearance, "maskedWalletDetailsButtonTextAppearance");
      zza(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsButtonBackground, "maskedWalletDetailsButtonBackgroundColor", "maskedWalletDetailsButtonBackgroundResource");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsLogoTextColor, "maskedWalletDetailsLogoTextColor");
      zzb(localTypedArray, R.styleable.WalletFragmentStyle_maskedWalletDetailsLogoImageType, "maskedWalletDetailsLogoImageType");
      localTypedArray.recycle();
      return;
    }
  }
}