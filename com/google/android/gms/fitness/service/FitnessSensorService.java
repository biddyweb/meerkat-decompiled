package com.google.android.gms.fitness.service;

import android.app.AppOpsManager;
import android.app.Service;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Binder;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.fitness.data.DataSource;
import com.google.android.gms.fitness.data.DataType;
import com.google.android.gms.fitness.result.DataSourcesResult;
import com.google.android.gms.internal.zzme;
import com.google.android.gms.internal.zznh;
import com.google.android.gms.internal.zznv;
import com.google.android.gms.internal.zzok;
import com.google.android.gms.internal.zzom;
import com.google.android.gms.internal.zzoo.zza;
import java.util.List;

public abstract class FitnessSensorService extends Service
{
  public static final String SERVICE_INTERFACE = "com.google.android.gms.fitness.service.FitnessSensorService";
  private zza zzabV;

  public final IBinder onBind(Intent paramIntent)
  {
    if ("com.google.android.gms.fitness.service.FitnessSensorService".equals(paramIntent.getAction()))
    {
      if (Log.isLoggable("FitnessSensorService", 3))
        Log.d("FitnessSensorService", "Intent " + paramIntent + " received by " + getClass().getName());
      return this.zzabV.asBinder();
    }
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    this.zzabV = new zza(this, null);
  }

  public abstract List<DataSource> onFindDataSources(List<DataType> paramList);

  public abstract boolean onRegister(FitnessSensorServiceRequest paramFitnessSensorServiceRequest);

  public abstract boolean onUnregister(DataSource paramDataSource);

  protected void zzmv()
    throws SecurityException
  {
    int i = Binder.getCallingUid();
    if (zzme.zzkj())
    {
      ((AppOpsManager)getSystemService("appops")).checkPackage(i, "com.google.android.gms");
      return;
    }
    String[] arrayOfString = getPackageManager().getPackagesForUid(i);
    if (arrayOfString != null)
    {
      int j = arrayOfString.length;
      for (int k = 0; ; k++)
      {
        if (k >= j)
          break label69;
        if (arrayOfString[k].equals("com.google.android.gms"))
          break;
      }
    }
    label69: throw new SecurityException("Unauthorized caller");
  }

  private static class zza extends zzoo.zza
  {
    private final FitnessSensorService zzabW;

    private zza(FitnessSensorService paramFitnessSensorService)
    {
      this.zzabW = paramFitnessSensorService;
    }

    public void zza(FitnessSensorServiceRequest paramFitnessSensorServiceRequest, zznv paramzznv)
      throws RemoteException
    {
      this.zzabW.zzmv();
      if (this.zzabW.onRegister(paramFitnessSensorServiceRequest))
      {
        paramzznv.zzi(Status.zzNo);
        return;
      }
      paramzznv.zzi(new Status(13));
    }

    public void zza(zzok paramzzok, zznh paramzznh)
      throws RemoteException
    {
      this.zzabW.zzmv();
      paramzznh.zza(new DataSourcesResult(this.zzabW.onFindDataSources(paramzzok.getDataTypes()), Status.zzNo));
    }

    public void zza(zzom paramzzom, zznv paramzznv)
      throws RemoteException
    {
      this.zzabW.zzmv();
      if (this.zzabW.onUnregister(paramzzom.getDataSource()))
      {
        paramzznv.zzi(Status.zzNo);
        return;
      }
      paramzznv.zzi(new Status(13));
    }
  }
}