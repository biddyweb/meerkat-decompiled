package com.google.android.gms.wallet;

import android.app.Activity;
import android.content.Context;
import android.os.Looper;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.HasOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.Api.zzc;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.zza.zza;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzvw;
import com.google.android.gms.internal.zzwh;
import com.google.android.gms.internal.zzwi;
import com.google.android.gms.internal.zzwk;
import com.google.android.gms.internal.zzwl;
import com.google.android.gms.wallet.wobs.zzr;
import java.util.Locale;

public final class Wallet
{
  public static final Api<WalletOptions> API = new Api(zzGS, zzGR, new Scope[0]);
  public static final Payments Payments = new zzwh();
  private static final Api.zzc<zzwi> zzGR = new Api.zzc();
  private static final Api.zzb<zzwi, WalletOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzwi zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Wallet.WalletOptions paramAnonymousWalletOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      zzx.zzb(paramAnonymousContext instanceof Activity, "An Activity must be used for Wallet APIs");
      Activity localActivity = (Activity)paramAnonymousContext;
      if (paramAnonymousWalletOptions != null);
      while (true)
      {
        return new zzwi(localActivity, paramAnonymousLooper, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener, paramAnonymousWalletOptions.environment, paramAnonymouszzf.getAccountName(), paramAnonymousWalletOptions.theme);
        paramAnonymousWalletOptions = new Wallet.WalletOptions(null);
      }
    }
  };
  public static final zzr zzaEm = new zzwl();
  public static final zzvw zzaEn = new zzwk();

  @Deprecated
  public static void changeMaskedWallet(GoogleApiClient paramGoogleApiClient, String paramString1, String paramString2, int paramInt)
  {
    Payments.changeMaskedWallet(paramGoogleApiClient, paramString1, paramString2, paramInt);
  }

  @Deprecated
  public static void checkForPreAuthorization(GoogleApiClient paramGoogleApiClient, int paramInt)
  {
    Payments.checkForPreAuthorization(paramGoogleApiClient, paramInt);
  }

  @Deprecated
  public static void loadFullWallet(GoogleApiClient paramGoogleApiClient, FullWalletRequest paramFullWalletRequest, int paramInt)
  {
    Payments.loadFullWallet(paramGoogleApiClient, paramFullWalletRequest, paramInt);
  }

  @Deprecated
  public static void loadMaskedWallet(GoogleApiClient paramGoogleApiClient, MaskedWalletRequest paramMaskedWalletRequest, int paramInt)
  {
    Payments.loadMaskedWallet(paramGoogleApiClient, paramMaskedWalletRequest, paramInt);
  }

  @Deprecated
  public static void notifyTransactionStatus(GoogleApiClient paramGoogleApiClient, NotifyTransactionStatusRequest paramNotifyTransactionStatusRequest)
  {
    Payments.notifyTransactionStatus(paramGoogleApiClient, paramNotifyTransactionStatusRequest);
  }

  public static final class WalletOptions
    implements Api.ApiOptions.HasOptions
  {
    public final int environment;
    public final int theme;

    private WalletOptions()
    {
      this(new Builder());
    }

    private WalletOptions(Builder paramBuilder)
    {
      this.environment = Builder.zza(paramBuilder);
      this.theme = Builder.zzb(paramBuilder);
    }

    public static final class Builder
    {
      private int mTheme = 0;
      private int zzaEo = 0;

      public Wallet.WalletOptions build()
      {
        return new Wallet.WalletOptions(this, null);
      }

      public Builder setEnvironment(int paramInt)
      {
        if ((paramInt == 0) || (paramInt == 2) || (paramInt == 1))
        {
          this.zzaEo = paramInt;
          return this;
        }
        Locale localLocale = Locale.US;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(paramInt);
        throw new IllegalArgumentException(String.format(localLocale, "Invalid environment value %d", arrayOfObject));
      }

      public Builder setTheme(int paramInt)
      {
        if ((paramInt == 0) || (paramInt == 1))
        {
          this.mTheme = paramInt;
          return this;
        }
        Locale localLocale = Locale.US;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(paramInt);
        throw new IllegalArgumentException(String.format(localLocale, "Invalid theme value %d", arrayOfObject));
      }
    }
  }

  public static abstract class zza<R extends Result> extends zza.zza<R, zzwi>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super(paramGoogleApiClient);
    }
  }

  public static abstract class zzb extends Wallet.zza<Status>
  {
    public zzb(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    protected Status zzb(Status paramStatus)
    {
      return paramStatus;
    }
  }
}