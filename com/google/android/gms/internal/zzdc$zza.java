package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;

public final class zzdc$zza
  implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
{
  private final Object zznh = new Object();
  private final zzdc.zzb zzrO;
  private final zzdd zzrP;

  public zzdc$zza(Context paramContext, zzdc.zzb paramzzb)
  {
    this(paramContext, paramzzb, false);
  }

  zzdc$zza(Context paramContext, zzdc.zzb paramzzb, boolean paramBoolean)
  {
    this.zzrO = paramzzb;
    this.zzrP = new zzdd(paramContext, this, this, 7095000);
    if (!paramBoolean)
      this.zzrP.connect();
  }

  // ERROR //
  public void onConnected(Bundle paramBundle)
  {
    // Byte code:
    //   0: new 45\011android/os/Bundle
    //   3: dup
    //   4: invokespecial 46\011android/os/Bundle:<init>\011()V
    //   7: astore_2
    //   8: aload_0
    //   9: getfield 24\011com/google/android/gms/internal/zzdc$zza:zznh\011Ljava/lang/Object;
    //   12: astore_3
    //   13: aload_3
    //   14: monitorenter
    //   15: aload_0
    //   16: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   19: invokevirtual 50\011com/google/android/gms/internal/zzdd:zzcH\011()Lcom/google/android/gms/internal/zzde;
    //   22: astore 9
    //   24: aload 9
    //   26: ifnull +186 -> 212
    //   29: aload 9
    //   31: invokeinterface 56 1 0
    //   36: astore 10
    //   38: aload 10
    //   40: astore 7
    //   42: aload_0
    //   43: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   46: invokevirtual 60\011com/google/android/gms/internal/zzdd:isConnected\011()Z
    //   49: ifne +13 -> 62
    //   52: aload_0
    //   53: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   56: invokevirtual 63\011com/google/android/gms/internal/zzdd:isConnecting\011()Z
    //   59: ifeq +10 -> 69
    //   62: aload_0
    //   63: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   66: invokevirtual 66\011com/google/android/gms/internal/zzdd:disconnect\011()V
    //   69: aload_3
    //   70: monitorexit
    //   71: aload_0
    //   72: getfield 26\011com/google/android/gms/internal/zzdc$zza:zzrO\011Lcom/google/android/gms/internal/zzdc$zzb;
    //   75: aload 7
    //   77: invokeinterface 71 2 0
    //   82: return
    //   83: astore 8
    //   85: ldc 73
    //   87: aload 8
    //   89: invokestatic 79\011com/google/android/gms/internal/zzhx:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   92: aload_0
    //   93: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   96: invokevirtual 60\011com/google/android/gms/internal/zzdd:isConnected\011()Z
    //   99: ifne +13 -> 112
    //   102: aload_0
    //   103: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   106: invokevirtual 63\011com/google/android/gms/internal/zzdd:isConnecting\011()Z
    //   109: ifeq +97 -> 206
    //   112: aload_0
    //   113: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   116: invokevirtual 66\011com/google/android/gms/internal/zzdd:disconnect\011()V
    //   119: aload_2
    //   120: astore 7
    //   122: goto -53 -> 69
    //   125: astore 6
    //   127: ldc 73
    //   129: aload 6
    //   131: invokestatic 79\011com/google/android/gms/internal/zzhx:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   134: aload_0
    //   135: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   138: invokevirtual 60\011com/google/android/gms/internal/zzdd:isConnected\011()Z
    //   141: ifne +13 -> 154
    //   144: aload_0
    //   145: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   148: invokevirtual 63\011com/google/android/gms/internal/zzdd:isConnecting\011()Z
    //   151: ifeq +55 -> 206
    //   154: aload_0
    //   155: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   158: invokevirtual 66\011com/google/android/gms/internal/zzdd:disconnect\011()V
    //   161: aload_2
    //   162: astore 7
    //   164: goto -95 -> 69
    //   167: astore 4
    //   169: aload_0
    //   170: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   173: invokevirtual 60\011com/google/android/gms/internal/zzdd:isConnected\011()Z
    //   176: ifne +13 -> 189
    //   179: aload_0
    //   180: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   183: invokevirtual 63\011com/google/android/gms/internal/zzdd:isConnecting\011()Z
    //   186: ifeq +10 -> 196
    //   189: aload_0
    //   190: getfield 34\011com/google/android/gms/internal/zzdc$zza:zzrP\011Lcom/google/android/gms/internal/zzdd;
    //   193: invokevirtual 66\011com/google/android/gms/internal/zzdd:disconnect\011()V
    //   196: aload 4
    //   198: athrow
    //   199: astore 5
    //   201: aload_3
    //   202: monitorexit
    //   203: aload 5
    //   205: athrow
    //   206: aload_2
    //   207: astore 7
    //   209: goto -140 -> 69
    //   212: aload_2
    //   213: astore 7
    //   215: goto -173 -> 42
    //
    // Exception table:
    //   from\011to\011target\011type
    //   15\01124\01183\011java/lang/IllegalStateException
    //   29\01138\01183\011java/lang/IllegalStateException
    //   15\01124\011125\011android/os/RemoteException
    //   29\01138\011125\011android/os/RemoteException
    //   15\01124\011167\011finally
    //   29\01138\011167\011finally
    //   85\01192\011167\011finally
    //   127\011134\011167\011finally
    //   42\01162\011199\011finally
    //   62\01169\011199\011finally
    //   69\01171\011199\011finally
    //   92\011112\011199\011finally
    //   112\011119\011199\011finally
    //   134\011154\011199\011finally
    //   154\011161\011199\011finally
    //   169\011189\011199\011finally
    //   189\011196\011199\011finally
    //   196\011199\011199\011finally
    //   201\011203\011199\011finally
  }

  public void onConnectionFailed(ConnectionResult paramConnectionResult)
  {
    this.zzrO.zze(new Bundle());
  }

  public void onConnectionSuspended(int paramInt)
  {
    zzhx.zzY("Disconnected from remote ad request service.");
  }
}