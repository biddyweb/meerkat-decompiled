package com.google.android.gms.cast;

import android.content.Context;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.HasOptions;
import com.google.android.gms.common.api.Api.zzb;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzf;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzjr;
import com.google.android.gms.internal.zzju;
import com.google.android.gms.internal.zzjy;
import com.google.android.gms.internal.zzkb;
import java.io.IOException;

public final class Cast
{
  public static final Api<CastOptions> API = new Api(zzGS, zzkb.zzGR, new Scope[0]);
  public static final CastApi CastApi = new Cast.CastApi.zza();
  public static final String EXTRA_APP_NO_LONGER_RUNNING = "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING";
  public static final int MAX_MESSAGE_LENGTH = 65536;
  public static final int MAX_NAMESPACE_LENGTH = 128;
  private static final Api.zzb<zzju, CastOptions> zzGS = new Api.zzb()
  {
    public int getPriority()
    {
      return 2147483647;
    }

    public zzju zza(Context paramAnonymousContext, Looper paramAnonymousLooper, zzf paramAnonymouszzf, Cast.CastOptions paramAnonymousCastOptions, GoogleApiClient.ConnectionCallbacks paramAnonymousConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener paramAnonymousOnConnectionFailedListener)
    {
      zzx.zzb(paramAnonymousCastOptions, "Setting the API options is required.");
      return new zzju(paramAnonymousContext, paramAnonymousLooper, paramAnonymousCastOptions.zzIx, Cast.CastOptions.zza(paramAnonymousCastOptions), paramAnonymousCastOptions.zzIy, paramAnonymousConnectionCallbacks, paramAnonymousOnConnectionFailedListener);
    }
  };

  public static abstract interface ApplicationConnectionResult extends Result
  {
    public abstract ApplicationMetadata getApplicationMetadata();

    public abstract String getApplicationStatus();

    public abstract String getSessionId();

    public abstract boolean getWasLaunched();
  }

  public static abstract interface CastApi
  {
    public abstract ApplicationMetadata getApplicationMetadata(GoogleApiClient paramGoogleApiClient)
      throws IllegalStateException;

    public abstract String getApplicationStatus(GoogleApiClient paramGoogleApiClient)
      throws IllegalStateException;

    public abstract double getVolume(GoogleApiClient paramGoogleApiClient)
      throws IllegalStateException;

    public abstract boolean isMute(GoogleApiClient paramGoogleApiClient)
      throws IllegalStateException;

    public abstract PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient);

    public abstract PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient, String paramString);

    public abstract PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient, String paramString1, String paramString2);

    public abstract PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, String paramString);

    public abstract PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, String paramString, LaunchOptions paramLaunchOptions);

    @Deprecated
    public abstract PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, String paramString, boolean paramBoolean);

    public abstract PendingResult<Status> leaveApplication(GoogleApiClient paramGoogleApiClient);

    public abstract void removeMessageReceivedCallbacks(GoogleApiClient paramGoogleApiClient, String paramString)
      throws IOException, IllegalArgumentException;

    public abstract void requestStatus(GoogleApiClient paramGoogleApiClient)
      throws IOException, IllegalStateException;

    public abstract PendingResult<Status> sendMessage(GoogleApiClient paramGoogleApiClient, String paramString1, String paramString2);

    public abstract void setMessageReceivedCallbacks(GoogleApiClient paramGoogleApiClient, String paramString, Cast.MessageReceivedCallback paramMessageReceivedCallback)
      throws IOException, IllegalStateException;

    public abstract void setMute(GoogleApiClient paramGoogleApiClient, boolean paramBoolean)
      throws IOException, IllegalStateException;

    public abstract void setVolume(GoogleApiClient paramGoogleApiClient, double paramDouble)
      throws IOException, IllegalArgumentException, IllegalStateException;

    public abstract PendingResult<Status> stopApplication(GoogleApiClient paramGoogleApiClient);

    public abstract PendingResult<Status> stopApplication(GoogleApiClient paramGoogleApiClient, String paramString);

    public static final class zza
      implements Cast.CastApi
    {
      public ApplicationMetadata getApplicationMetadata(GoogleApiClient paramGoogleApiClient)
        throws IllegalStateException
      {
        return ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).getApplicationMetadata();
      }

      public String getApplicationStatus(GoogleApiClient paramGoogleApiClient)
        throws IllegalStateException
      {
        return ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).getApplicationStatus();
      }

      public double getVolume(GoogleApiClient paramGoogleApiClient)
        throws IllegalStateException
      {
        return ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zzhs();
      }

      public boolean isMute(GoogleApiClient paramGoogleApiClient)
        throws IllegalStateException
      {
        return ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).isMute();
      }

      public PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient)
      {
        return paramGoogleApiClient.zzb(new Cast.zza(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zzb(null, null, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient, final String paramString)
      {
        return paramGoogleApiClient.zzb(new Cast.zza(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zzb(paramString, null, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public PendingResult<Cast.ApplicationConnectionResult> joinApplication(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2)
      {
        return paramGoogleApiClient.zzb(new Cast.zza(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zzb(paramString1, paramString2, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, final String paramString)
      {
        return paramGoogleApiClient.zzb(new Cast.zza(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zza(paramString, false, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, final String paramString, final LaunchOptions paramLaunchOptions)
      {
        return paramGoogleApiClient.zzb(new Cast.zza(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zza(paramString, paramLaunchOptions, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      @Deprecated
      public PendingResult<Cast.ApplicationConnectionResult> launchApplication(GoogleApiClient paramGoogleApiClient, String paramString, boolean paramBoolean)
      {
        return launchApplication(paramGoogleApiClient, paramString, new LaunchOptions.Builder().setRelaunchIfRunning(paramBoolean).build());
      }

      public PendingResult<Status> leaveApplication(GoogleApiClient paramGoogleApiClient)
      {
        return paramGoogleApiClient.zzb(new zzjy(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zzd(this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public void removeMessageReceivedCallbacks(GoogleApiClient paramGoogleApiClient, String paramString)
        throws IOException, IllegalArgumentException
      {
        try
        {
          ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zzaJ(paramString);
          return;
        }
        catch (RemoteException localRemoteException)
        {
        }
        throw new IOException("service error");
      }

      public void requestStatus(GoogleApiClient paramGoogleApiClient)
        throws IOException, IllegalStateException
      {
        try
        {
          ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zzhr();
          return;
        }
        catch (RemoteException localRemoteException)
        {
        }
        throw new IOException("service error");
      }

      public PendingResult<Status> sendMessage(GoogleApiClient paramGoogleApiClient, final String paramString1, final String paramString2)
      {
        return paramGoogleApiClient.zzb(new zzjy(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zza(paramString1, paramString2, this);
              return;
            }
            catch (IllegalArgumentException localIllegalArgumentException)
            {
              zzah(2001);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public void setMessageReceivedCallbacks(GoogleApiClient paramGoogleApiClient, String paramString, Cast.MessageReceivedCallback paramMessageReceivedCallback)
        throws IOException, IllegalStateException
      {
        try
        {
          ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zza(paramString, paramMessageReceivedCallback);
          return;
        }
        catch (RemoteException localRemoteException)
        {
        }
        throw new IOException("service error");
      }

      public void setMute(GoogleApiClient paramGoogleApiClient, boolean paramBoolean)
        throws IOException, IllegalStateException
      {
        try
        {
          ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zzL(paramBoolean);
          return;
        }
        catch (RemoteException localRemoteException)
        {
        }
        throw new IOException("service error");
      }

      public void setVolume(GoogleApiClient paramGoogleApiClient, double paramDouble)
        throws IOException, IllegalArgumentException, IllegalStateException
      {
        try
        {
          ((zzju)paramGoogleApiClient.zza(zzkb.zzGR)).zza(paramDouble);
          return;
        }
        catch (RemoteException localRemoteException)
        {
        }
        throw new IOException("service error");
      }

      public PendingResult<Status> stopApplication(GoogleApiClient paramGoogleApiClient)
      {
        return paramGoogleApiClient.zzb(new zzjy(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            try
            {
              paramAnonymouszzju.zza("", this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }

      public PendingResult<Status> stopApplication(GoogleApiClient paramGoogleApiClient, final String paramString)
      {
        return paramGoogleApiClient.zzb(new zzjy(paramGoogleApiClient)
        {
          protected void zza(zzju paramAnonymouszzju)
            throws RemoteException
          {
            if (TextUtils.isEmpty(paramString))
            {
              zzd(2001, "IllegalArgument: sessionId cannot be null or empty");
              return;
            }
            try
            {
              paramAnonymouszzju.zza(paramString, this);
              return;
            }
            catch (IllegalStateException localIllegalStateException)
            {
              zzah(2001);
            }
          }
        });
      }
    }
  }

  public static final class CastOptions
    implements Api.ApiOptions.HasOptions
  {
    final CastDevice zzIx;
    final Cast.Listener zzIy;
    private final int zzIz;

    private CastOptions(Builder paramBuilder)
    {
      this.zzIx = paramBuilder.zzIA;
      this.zzIy = paramBuilder.zzIB;
      this.zzIz = Builder.zza(paramBuilder);
    }

    public static Builder builder(CastDevice paramCastDevice, Cast.Listener paramListener)
    {
      return new Builder(paramCastDevice, paramListener, null);
    }

    public static final class Builder
    {
      CastDevice zzIA;
      Cast.Listener zzIB;
      private int zzIC;

      private Builder(CastDevice paramCastDevice, Cast.Listener paramListener)
      {
        zzx.zzb(paramCastDevice, "CastDevice parameter cannot be null");
        zzx.zzb(paramListener, "CastListener parameter cannot be null");
        this.zzIA = paramCastDevice;
        this.zzIB = paramListener;
        this.zzIC = 0;
      }

      public Cast.CastOptions build()
      {
        return new Cast.CastOptions(this, null);
      }

      public Builder setVerboseLoggingEnabled(boolean paramBoolean)
      {
        if (paramBoolean)
        {
          this.zzIC = (0x1 | this.zzIC);
          return this;
        }
        this.zzIC = (0xFFFFFFFE & this.zzIC);
        return this;
      }
    }
  }

  public static class Listener
  {
    public void onApplicationDisconnected(int paramInt)
    {
    }

    public void onApplicationMetadataChanged(ApplicationMetadata paramApplicationMetadata)
    {
    }

    public void onApplicationStatusChanged()
    {
    }

    public void onVolumeChanged()
    {
    }

    public void zzab(int paramInt)
    {
    }

    public void zzac(int paramInt)
    {
    }
  }

  public static abstract interface MessageReceivedCallback
  {
    public abstract void onMessageReceived(CastDevice paramCastDevice, String paramString1, String paramString2);
  }

  private static abstract class zza extends zzjr<Cast.ApplicationConnectionResult>
  {
    public zza(GoogleApiClient paramGoogleApiClient)
    {
      super();
    }

    public Cast.ApplicationConnectionResult zzh(final Status paramStatus)
    {
      return new Cast.ApplicationConnectionResult()
      {
        public ApplicationMetadata getApplicationMetadata()
        {
          return null;
        }

        public String getApplicationStatus()
        {
          return null;
        }

        public String getSessionId()
        {
          return null;
        }

        public Status getStatus()
        {
          return paramStatus;
        }

        public boolean getWasLaunched()
        {
          return false;
        }
      };
    }
  }
}