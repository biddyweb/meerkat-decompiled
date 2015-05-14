package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.location.places.AddPlaceRequest;
import com.google.android.gms.location.places.AutocompleteFilter;
import com.google.android.gms.location.places.PlaceFilter;
import com.google.android.gms.location.places.PlaceReport;
import com.google.android.gms.location.places.PlaceReportCreator;
import com.google.android.gms.location.places.zzb;
import com.google.android.gms.location.places.zzc;
import com.google.android.gms.location.places.zzd;
import com.google.android.gms.location.places.zze;
import com.google.android.gms.location.places.zzf;
import com.google.android.gms.location.places.zzj;
import com.google.android.gms.location.places.zzk;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.zzi;
import java.util.ArrayList;
import java.util.List;

public abstract interface zzpu extends IInterface
{
  public abstract void zza(zzqh paramzzqh, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(zzqo paramzzqo, String paramString1, String paramString2, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(AddPlaceRequest paramAddPlaceRequest, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(PlaceReport paramPlaceReport, zzqh paramzzqh)
    throws RemoteException;

  public abstract void zza(zzc paramzzc, zzqh paramzzqh, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(zzf paramzzf, zzqh paramzzqh, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zza(zzj paramzzj, LatLngBounds paramLatLngBounds, List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(LatLng paramLatLng, PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(LatLngBounds paramLatLngBounds, int paramInt, String paramString, PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(String paramString, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(String paramString, LatLngBounds paramLatLngBounds, AutocompleteFilter paramAutocompleteFilter, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zza(List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zzb(zzqh paramzzqh, PendingIntent paramPendingIntent)
    throws RemoteException;

  public abstract void zzb(PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zzb(String paramString, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public abstract void zzb(List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
    throws RemoteException;

  public static abstract class zza extends Binder
    implements zzpu
  {
    public static zzpu zzbo(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
      if ((localIInterface != null) && ((localIInterface instanceof zzpu)))
        return (zzpu)localIInterface;
      return new zza(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.location.places.internal.IGooglePlacesService");
        return true;
      case 2:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        LatLngBounds localLatLngBounds3;
        int i4;
        String str6;
        if (paramParcel1.readInt() != 0)
        {
          localLatLngBounds3 = LatLngBounds.CREATOR.zzdV(paramParcel1);
          i4 = paramParcel1.readInt();
          str6 = paramParcel1.readString();
          if (paramParcel1.readInt() == 0)
            break label268;
        }
        for (PlaceFilter localPlaceFilter3 = PlaceFilter.CREATOR.zzdB(paramParcel1); ; localPlaceFilter3 = null)
        {
          int i5 = paramParcel1.readInt();
          zzqh localzzqh16 = null;
          if (i5 != 0)
            localzzqh16 = zzqh.CREATOR.zzdI(paramParcel1);
          zza(localLatLngBounds3, i4, str6, localPlaceFilter3, localzzqh16, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
          localLatLngBounds3 = null;
          break;
        }
      case 3:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        String str5 = paramParcel1.readString();
        int i3 = paramParcel1.readInt();
        zzqh localzzqh15 = null;
        if (i3 != 0)
          localzzqh15 = zzqh.CREATOR.zzdI(paramParcel1);
        zza(str5, localzzqh15, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        return true;
      case 4:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        LatLng localLatLng;
        if (paramParcel1.readInt() != 0)
        {
          localLatLng = LatLng.CREATOR.zzdW(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label412;
        }
        for (PlaceFilter localPlaceFilter2 = PlaceFilter.CREATOR.zzdB(paramParcel1); ; localPlaceFilter2 = null)
        {
          int i2 = paramParcel1.readInt();
          zzqh localzzqh14 = null;
          if (i2 != 0)
            localzzqh14 = zzqh.CREATOR.zzdI(paramParcel1);
          zza(localLatLng, localPlaceFilter2, localzzqh14, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
          localLatLng = null;
          break;
        }
      case 5:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        if (paramParcel1.readInt() != 0);
        for (PlaceFilter localPlaceFilter1 = PlaceFilter.CREATOR.zzdB(paramParcel1); ; localPlaceFilter1 = null)
        {
          int i1 = paramParcel1.readInt();
          zzqh localzzqh13 = null;
          if (i1 != 0)
            localzzqh13 = zzqh.CREATOR.zzdI(paramParcel1);
          zzb(localPlaceFilter1, localzzqh13, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
        }
      case 6:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        String str4 = paramParcel1.readString();
        int n = paramParcel1.readInt();
        zzqh localzzqh12 = null;
        if (n != 0)
          localzzqh12 = zzqh.CREATOR.zzdI(paramParcel1);
        zzb(str4, localzzqh12, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        return true;
      case 7:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        ArrayList localArrayList3 = paramParcel1.createStringArrayList();
        int m = paramParcel1.readInt();
        zzqh localzzqh11 = null;
        if (m != 0)
          localzzqh11 = zzqh.CREATOR.zzdI(paramParcel1);
        zza(localArrayList3, localzzqh11, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        return true;
      case 17:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        ArrayList localArrayList2 = paramParcel1.createStringArrayList();
        int k = paramParcel1.readInt();
        zzqh localzzqh10 = null;
        if (k != 0)
          localzzqh10 = zzqh.CREATOR.zzdI(paramParcel1);
        zzb(localArrayList2, localzzqh10, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        return true;
      case 8:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        zzj localzzj;
        LatLngBounds localLatLngBounds2;
        ArrayList localArrayList1;
        if (paramParcel1.readInt() != 0)
        {
          localzzj = zzj.CREATOR.zzdD(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label729;
          localLatLngBounds2 = LatLngBounds.CREATOR.zzdV(paramParcel1);
          localArrayList1 = paramParcel1.createStringArrayList();
          if (paramParcel1.readInt() == 0)
            break label735;
        }
        for (zzqh localzzqh9 = zzqh.CREATOR.zzdI(paramParcel1); ; localzzqh9 = null)
        {
          zza(localzzj, localLatLngBounds2, localArrayList1, localzzqh9, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
          localzzj = null;
          break;
          localLatLngBounds2 = null;
          break label680;
        }
      case 9:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        zzf localzzf;
        zzqh localzzqh8;
        if (paramParcel1.readInt() != 0)
        {
          localzzf = zzf.CREATOR.zzdC(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label818;
          localzzqh8 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label824;
        }
        for (PendingIntent localPendingIntent4 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent4 = null)
        {
          zza(localzzf, localzzqh8, localPendingIntent4);
          return true;
          localzzf = null;
          break;
          localzzqh8 = null;
          break label779;
        }
      case 10:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        zzqh localzzqh7;
        if (paramParcel1.readInt() != 0)
        {
          localzzqh7 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label889;
        }
        for (PendingIntent localPendingIntent3 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent3 = null)
        {
          zza(localzzqh7, localPendingIntent3);
          return true;
          localzzqh7 = null;
          break;
        }
      case 11:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        zzc localzzc;
        zzqh localzzqh6;
        if (paramParcel1.readInt() != 0)
        {
          localzzc = zzc.CREATOR.zzdA(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label972;
          localzzqh6 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label978;
        }
        for (PendingIntent localPendingIntent2 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent2 = null)
        {
          zza(localzzc, localzzqh6, localPendingIntent2);
          return true;
          localzzc = null;
          break;
          localzzqh6 = null;
          break label933;
        }
      case 12:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        zzqh localzzqh5;
        if (paramParcel1.readInt() != 0)
        {
          localzzqh5 = zzqh.CREATOR.zzdI(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label1043;
        }
        for (PendingIntent localPendingIntent1 = (PendingIntent)PendingIntent.CREATOR.createFromParcel(paramParcel1); ; localPendingIntent1 = null)
        {
          zzb(localzzqh5, localPendingIntent1);
          return true;
          localzzqh5 = null;
          break;
        }
      case 13:
        paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        String str3 = paramParcel1.readString();
        LatLngBounds localLatLngBounds1;
        AutocompleteFilter localAutocompleteFilter;
        if (paramParcel1.readInt() != 0)
        {
          localLatLngBounds1 = LatLngBounds.CREATOR.zzdV(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label1136;
          localAutocompleteFilter = AutocompleteFilter.CREATOR.zzdz(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label1142;
        }
        for (zzqh localzzqh4 = zzqh.CREATOR.zzdI(paramParcel1); ; localzzqh4 = null)
        {
          zza(str3, localLatLngBounds1, localAutocompleteFilter, localzzqh4, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
          localLatLngBounds1 = null;
          break;
          localAutocompleteFilter = null;
          break label1093;
        }
      case 14:
        label1043: paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        if (paramParcel1.readInt() != 0);
        for (AddPlaceRequest localAddPlaceRequest = (AddPlaceRequest)AddPlaceRequest.CREATOR.createFromParcel(paramParcel1); ; localAddPlaceRequest = null)
        {
          int j = paramParcel1.readInt();
          zzqh localzzqh3 = null;
          if (j != 0)
            localzzqh3 = zzqh.CREATOR.zzdI(paramParcel1);
          zza(localAddPlaceRequest, localzzqh3, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
          return true;
        }
      case 15:
        label268: label412: label680: label729: label735: label889: paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
        label779: label818: label824: label972: label978: label1136: label1142: if (paramParcel1.readInt() != 0);
        label933: label1093: for (PlaceReport localPlaceReport = PlaceReport.CREATOR.createFromParcel(paramParcel1); ; localPlaceReport = null)
        {
          int i = paramParcel1.readInt();
          zzqh localzzqh2 = null;
          if (i != 0)
            localzzqh2 = zzqh.CREATOR.zzdI(paramParcel1);
          zza(localPlaceReport, localzzqh2);
          return true;
        }
      case 16:
      }
      paramParcel1.enforceInterface("com.google.android.gms.location.places.internal.IGooglePlacesService");
      zzqo localzzqo;
      String str1;
      String str2;
      if (paramParcel1.readInt() != 0)
      {
        localzzqo = zzqo.CREATOR.zzdM(paramParcel1);
        str1 = paramParcel1.readString();
        str2 = paramParcel1.readString();
        if (paramParcel1.readInt() == 0)
          break label1359;
      }
      label1359: for (zzqh localzzqh1 = zzqh.CREATOR.zzdI(paramParcel1); ; localzzqh1 = null)
      {
        zza(localzzqo, str1, str2, localzzqh1, zzpv.zza.zzbp(paramParcel1.readStrongBinder()));
        return true;
        localzzqo = null;
        break;
      }
    }

    private static class zza
      implements zzpu
    {
      private IBinder zzle;

      zza(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void zza(zzqh paramzzqh, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzqh != null)
            {
              localParcel.writeInt(1);
              paramzzqh.writeToParcel(localParcel, 0);
              if (paramPendingIntent != null)
              {
                localParcel.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel, 0);
                this.zzle.transact(10, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(zzqo paramzzqo, String paramString1, String paramString2, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzqo != null)
            {
              localParcel.writeInt(1);
              paramzzqo.writeToParcel(localParcel, 0);
              localParcel.writeString(paramString1);
              localParcel.writeString(paramString2);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(16, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(AddPlaceRequest paramAddPlaceRequest, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramAddPlaceRequest != null)
            {
              localParcel.writeInt(1);
              paramAddPlaceRequest.writeToParcel(localParcel, 0);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(14, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(PlaceReport paramPlaceReport, zzqh paramzzqh)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramPlaceReport != null)
            {
              localParcel.writeInt(1);
              paramPlaceReport.writeToParcel(localParcel, 0);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                this.zzle.transact(15, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zza(zzc paramzzc, zzqh paramzzqh, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzc != null)
            {
              localParcel.writeInt(1);
              paramzzc.writeToParcel(localParcel, 0);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                if (paramPendingIntent == null)
                  break label113;
                localParcel.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel, 0);
                this.zzle.transact(11, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label113: localParcel.writeInt(0);
        }
      }

      public void zza(zzf paramzzf, zzqh paramzzqh, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzf != null)
            {
              localParcel.writeInt(1);
              paramzzf.writeToParcel(localParcel, 0);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                if (paramPendingIntent == null)
                  break label113;
                localParcel.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel, 0);
                this.zzle.transact(9, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label113: localParcel.writeInt(0);
        }
      }

      public void zza(zzj paramzzj, LatLngBounds paramLatLngBounds, List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzj != null)
            {
              localParcel.writeInt(1);
              paramzzj.writeToParcel(localParcel, 0);
              if (paramLatLngBounds != null)
              {
                localParcel.writeInt(1);
                paramLatLngBounds.writeToParcel(localParcel, 0);
                localParcel.writeStringList(paramList);
                if (paramzzqh == null)
                  break label145;
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(8, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label145: localParcel.writeInt(0);
        }
      }

      public void zza(LatLng paramLatLng, PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramLatLng != null)
            {
              localParcel.writeInt(1);
              paramLatLng.writeToParcel(localParcel, 0);
              if (paramPlaceFilter != null)
              {
                localParcel.writeInt(1);
                paramPlaceFilter.writeToParcel(localParcel, 0);
                if (paramzzqh == null)
                  break label136;
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(4, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label136: localParcel.writeInt(0);
        }
      }

      public void zza(LatLngBounds paramLatLngBounds, int paramInt, String paramString, PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramLatLngBounds != null)
            {
              localParcel.writeInt(1);
              paramLatLngBounds.writeToParcel(localParcel, 0);
              localParcel.writeInt(paramInt);
              localParcel.writeString(paramString);
              if (paramPlaceFilter != null)
              {
                localParcel.writeInt(1);
                paramPlaceFilter.writeToParcel(localParcel, 0);
                if (paramzzqh == null)
                  break label152;
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(2, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label152: localParcel.writeInt(0);
        }
      }

      public void zza(String paramString, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
          localParcel.writeString(paramString);
          if (paramzzqh != null)
          {
            localParcel.writeInt(1);
            paramzzqh.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzpv != null)
              localIBinder = paramzzpv.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(3, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zza(String paramString, LatLngBounds paramLatLngBounds, AutocompleteFilter paramAutocompleteFilter, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            localParcel.writeString(paramString);
            if (paramLatLngBounds != null)
            {
              localParcel.writeInt(1);
              paramLatLngBounds.writeToParcel(localParcel, 0);
              if (paramAutocompleteFilter != null)
              {
                localParcel.writeInt(1);
                paramAutocompleteFilter.writeToParcel(localParcel, 0);
                if (paramzzqh == null)
                  break label145;
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(13, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
          continue;
          label145: localParcel.writeInt(0);
        }
      }

      public void zza(List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
          localParcel.writeStringList(paramList);
          if (paramzzqh != null)
          {
            localParcel.writeInt(1);
            paramzzqh.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzpv != null)
              localIBinder = paramzzpv.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(7, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzb(zzqh paramzzqh, PendingIntent paramPendingIntent)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramzzqh != null)
            {
              localParcel.writeInt(1);
              paramzzqh.writeToParcel(localParcel, 0);
              if (paramPendingIntent != null)
              {
                localParcel.writeInt(1);
                paramPendingIntent.writeToParcel(localParcel, 0);
                this.zzle.transact(12, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zzb(PlaceFilter paramPlaceFilter, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
            if (paramPlaceFilter != null)
            {
              localParcel.writeInt(1);
              paramPlaceFilter.writeToParcel(localParcel, 0);
              if (paramzzqh != null)
              {
                localParcel.writeInt(1);
                paramzzqh.writeToParcel(localParcel, 0);
                IBinder localIBinder = null;
                if (paramzzpv != null)
                  localIBinder = paramzzpv.asBinder();
                localParcel.writeStrongBinder(localIBinder);
                this.zzle.transact(5, localParcel, null, 1);
              }
            }
            else
            {
              localParcel.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel.recycle();
          }
          localParcel.writeInt(0);
        }
      }

      public void zzb(String paramString, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
          localParcel.writeString(paramString);
          if (paramzzqh != null)
          {
            localParcel.writeInt(1);
            paramzzqh.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzpv != null)
              localIBinder = paramzzpv.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(6, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }

      public void zzb(List<String> paramList, zzqh paramzzqh, zzpv paramzzpv)
        throws RemoteException
      {
        Parcel localParcel = Parcel.obtain();
        try
        {
          localParcel.writeInterfaceToken("com.google.android.gms.location.places.internal.IGooglePlacesService");
          localParcel.writeStringList(paramList);
          if (paramzzqh != null)
          {
            localParcel.writeInt(1);
            paramzzqh.writeToParcel(localParcel, 0);
          }
          while (true)
          {
            IBinder localIBinder = null;
            if (paramzzpv != null)
              localIBinder = paramzzpv.asBinder();
            localParcel.writeStrongBinder(localIBinder);
            this.zzle.transact(17, localParcel, null, 1);
            return;
            localParcel.writeInt(0);
          }
        }
        finally
        {
          localParcel.recycle();
        }
      }
    }
  }
}