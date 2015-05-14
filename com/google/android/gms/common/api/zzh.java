package com.google.android.gms.common.api;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.Intent;
import android.content.IntentSender.SendIntentException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.app.LoaderManager;
import android.support.v4.app.LoaderManager.LoaderCallbacks;
import android.support.v4.content.Loader;
import android.util.Log;
import android.util.SparseArray;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.List;

public class zzh extends Fragment
  implements DialogInterface.OnCancelListener, LoaderManager.LoaderCallbacks<ConnectionResult>
{
  private boolean zzNu;
  private int zzNv = -1;
  private ConnectionResult zzNw;
  private final Handler zzNx = new Handler(Looper.getMainLooper());
  private final SparseArray<zzb> zzNy = new SparseArray();

  public static zzh zza(FragmentActivity paramFragmentActivity)
  {
    zzx.zzbd("Must be called from main thread of process");
    FragmentManager localFragmentManager = paramFragmentActivity.getSupportFragmentManager();
    try
    {
      zzh localzzh = (zzh)localFragmentManager.findFragmentByTag("GmsSupportLifecycleFragment");
      if ((localzzh == null) || (localzzh.isRemoving()))
      {
        localzzh = new zzh();
        localFragmentManager.beginTransaction().add(localzzh, "GmsSupportLifecycleFragment").commit();
        localFragmentManager.executePendingTransactions();
      }
      return localzzh;
    }
    catch (ClassCastException localClassCastException)
    {
      throw new IllegalStateException("Fragment with tag GmsSupportLifecycleFragment is not a SupportLifecycleFragment", localClassCastException);
    }
  }

  private void zza(int paramInt, ConnectionResult paramConnectionResult)
  {
    if (!this.zzNu)
    {
      this.zzNu = true;
      this.zzNv = paramInt;
      this.zzNw = paramConnectionResult;
      this.zzNx.post(new zzc(paramInt, paramConnectionResult));
    }
  }

  private void zzb(int paramInt, ConnectionResult paramConnectionResult)
  {
    Log.w("GmsSupportLifecycleFragment", "Unresolved error while connecting client. Stopping auto-manage.");
    zzb localzzb = (zzb)this.zzNy.get(paramInt);
    if (localzzb != null)
    {
      zzas(paramInt);
      GoogleApiClient.OnConnectionFailedListener localOnConnectionFailedListener = localzzb.zzNC;
      if (localOnConnectionFailedListener != null)
        localOnConnectionFailedListener.onConnectionFailed(paramConnectionResult);
    }
    zziq();
  }

  private void zziq()
  {
    int i = 0;
    this.zzNu = false;
    this.zzNv = -1;
    this.zzNw = null;
    LoaderManager localLoaderManager = getLoaderManager();
    while (i < this.zzNy.size())
    {
      int j = this.zzNy.keyAt(i);
      zza localzza = zzat(j);
      if ((localzza != null) && (localzza.zzir()))
      {
        localLoaderManager.destroyLoader(j);
        localLoaderManager.initLoader(j, null, this);
      }
      i++;
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    int i = 1;
    switch (paramInt1)
    {
    default:
      i = 0;
    case 2:
    case 1:
    }
    while (true)
    {
      if (i == 0)
        break label62;
      zziq();
      return;
      if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(getActivity()) != 0)
        break;
      continue;
      if (paramInt2 != -1)
        break;
    }
    label62: zzb(this.zzNv, this.zzNw);
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    int i = 0;
    if (i < this.zzNy.size())
    {
      int j = this.zzNy.keyAt(i);
      zza localzza = zzat(j);
      if ((localzza != null) && (((zzb)this.zzNy.valueAt(i)).zzNz != localzza.zzNz))
        getLoaderManager().restartLoader(j, null, this);
      while (true)
      {
        i++;
        break;
        getLoaderManager().initLoader(j, null, this);
      }
    }
  }

  public void onCancel(DialogInterface paramDialogInterface)
  {
    zzb(this.zzNv, this.zzNw);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    if (paramBundle != null)
    {
      this.zzNu = paramBundle.getBoolean("resolving_error", false);
      this.zzNv = paramBundle.getInt("failed_client_id", -1);
      if (this.zzNv >= 0)
        this.zzNw = new ConnectionResult(paramBundle.getInt("failed_status"), (PendingIntent)paramBundle.getParcelable("failed_resolution"));
    }
  }

  public Loader<ConnectionResult> onCreateLoader(int paramInt, Bundle paramBundle)
  {
    return new zza(getActivity(), ((zzb)this.zzNy.get(paramInt)).zzNz);
  }

  public void onLoaderReset(Loader<ConnectionResult> paramLoader)
  {
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putBoolean("resolving_error", this.zzNu);
    if (this.zzNv >= 0)
    {
      paramBundle.putInt("failed_client_id", this.zzNv);
      paramBundle.putInt("failed_status", this.zzNw.getErrorCode());
      paramBundle.putParcelable("failed_resolution", this.zzNw.getResolution());
    }
  }

  public void onStart()
  {
    super.onStart();
    if (!this.zzNu)
      for (int i = 0; i < this.zzNy.size(); i++)
        getLoaderManager().initLoader(this.zzNy.keyAt(i), null, this);
  }

  public void zza(int paramInt, GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
  {
    zzx.zzb(paramGoogleApiClient, "GoogleApiClient instance cannot be null");
    if (this.zzNy.indexOfKey(paramInt) < 0);
    for (boolean bool = true; ; bool = false)
    {
      zzx.zza(bool, "Already managing a GoogleApiClient with id " + paramInt);
      zzb localzzb = new zzb(paramGoogleApiClient, paramOnConnectionFailedListener, null);
      this.zzNy.put(paramInt, localzzb);
      if (getActivity() != null)
      {
        LoaderManager.enableDebugLogging(false);
        getLoaderManager().initLoader(paramInt, null, this);
      }
      return;
    }
  }

  public void zza(Loader<ConnectionResult> paramLoader, ConnectionResult paramConnectionResult)
  {
    if (!paramConnectionResult.isSuccess())
      zza(paramLoader.getId(), paramConnectionResult);
  }

  public GoogleApiClient zzar(int paramInt)
  {
    if (getActivity() != null)
    {
      zza localzza = zzat(paramInt);
      if (localzza != null)
        return localzza.zzNz;
    }
    return null;
  }

  public void zzas(int paramInt)
  {
    this.zzNy.remove(paramInt);
    getLoaderManager().destroyLoader(paramInt);
  }

  zza zzat(int paramInt)
  {
    try
    {
      zza localzza = (zza)getLoaderManager().getLoader(paramInt);
      return localzza;
    }
    catch (ClassCastException localClassCastException)
    {
      throw new IllegalStateException("Unknown loader in SupportLifecycleFragment", localClassCastException);
    }
  }

  static class zza extends Loader<ConnectionResult>
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    private boolean zzNA;
    private ConnectionResult zzNB;
    public final GoogleApiClient zzNz;

    public zza(Context paramContext, GoogleApiClient paramGoogleApiClient)
    {
      super();
      this.zzNz = paramGoogleApiClient;
    }

    private void zze(ConnectionResult paramConnectionResult)
    {
      this.zzNB = paramConnectionResult;
      if ((isStarted()) && (!isAbandoned()))
        deliverResult(paramConnectionResult);
    }

    public void dump(String paramString, FileDescriptor paramFileDescriptor, PrintWriter paramPrintWriter, String[] paramArrayOfString)
    {
      super.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
      this.zzNz.dump(paramString, paramFileDescriptor, paramPrintWriter, paramArrayOfString);
    }

    public void onConnected(Bundle paramBundle)
    {
      this.zzNA = false;
      zze(ConnectionResult.zzLr);
    }

    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      this.zzNA = true;
      zze(paramConnectionResult);
    }

    public void onConnectionSuspended(int paramInt)
    {
    }

    protected void onReset()
    {
      this.zzNB = null;
      this.zzNA = false;
      this.zzNz.unregisterConnectionCallbacks(this);
      this.zzNz.unregisterConnectionFailedListener(this);
      this.zzNz.disconnect();
    }

    protected void onStartLoading()
    {
      super.onStartLoading();
      this.zzNz.registerConnectionCallbacks(this);
      this.zzNz.registerConnectionFailedListener(this);
      if (this.zzNB != null)
        deliverResult(this.zzNB);
      if ((!this.zzNz.isConnected()) && (!this.zzNz.isConnecting()) && (!this.zzNA))
        this.zzNz.connect();
    }

    protected void onStopLoading()
    {
      this.zzNz.disconnect();
    }

    public boolean zzir()
    {
      return this.zzNA;
    }
  }

  private static class zzb
  {
    public final GoogleApiClient.OnConnectionFailedListener zzNC;
    public final GoogleApiClient zzNz;

    private zzb(GoogleApiClient paramGoogleApiClient, GoogleApiClient.OnConnectionFailedListener paramOnConnectionFailedListener)
    {
      this.zzNz = paramGoogleApiClient;
      this.zzNC = paramOnConnectionFailedListener;
    }
  }

  private class zzc
    implements Runnable
  {
    private final int zzND;
    private final ConnectionResult zzNE;

    public zzc(int paramConnectionResult, ConnectionResult arg3)
    {
      this.zzND = paramConnectionResult;
      Object localObject;
      this.zzNE = localObject;
    }

    public void run()
    {
      if (this.zzNE.hasResolution())
        try
        {
          int i = 1 + (1 + zzh.this.getActivity().getSupportFragmentManager().getFragments().indexOf(zzh.this) << 16);
          this.zzNE.startResolutionForResult(zzh.this.getActivity(), i);
          return;
        }
        catch (IntentSender.SendIntentException localSendIntentException)
        {
          zzh.zza(zzh.this);
          return;
        }
      if (GooglePlayServicesUtil.isUserRecoverableError(this.zzNE.getErrorCode()))
      {
        GooglePlayServicesUtil.showErrorDialogFragment(this.zzNE.getErrorCode(), zzh.this.getActivity(), zzh.this, 2, zzh.this);
        return;
      }
      zzh.zza(zzh.this, this.zzND, this.zzNE);
    }
  }
}