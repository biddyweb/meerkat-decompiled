package com.google.android.gms.games.internal;

import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMessage;

public abstract interface IGamesCallbacks extends IInterface
{
  public abstract void onInvitationRemoved(String paramString)
    throws RemoteException;

  public abstract void onLeftRoom(int paramInt, String paramString)
    throws RemoteException;

  public abstract void onP2PConnected(String paramString)
    throws RemoteException;

  public abstract void onP2PDisconnected(String paramString)
    throws RemoteException;

  public abstract void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
    throws RemoteException;

  public abstract void onRequestRemoved(String paramString)
    throws RemoteException;

  public abstract void onTurnBasedMatchRemoved(String paramString)
    throws RemoteException;

  public abstract void zzA(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzB(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzC(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzD(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzE(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzF(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzG(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzH(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzI(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzJ(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzK(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzL(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzM(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzN(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzO(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzP(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzQ(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zza(int paramInt, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder1, DataHolder paramDataHolder2)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, Contents paramContents)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, String paramString, Contents paramContents1, Contents paramContents2, Contents paramContents3)
    throws RemoteException;

  public abstract void zza(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(DataHolder[] paramArrayOfDataHolder)
    throws RemoteException;

  public abstract void zzb(int paramInt1, int paramInt2, String paramString)
    throws RemoteException;

  public abstract void zzb(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzc(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzc(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzd(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzd(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzd(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zze(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public abstract void zze(int paramInt, String paramString)
    throws RemoteException;

  public abstract void zze(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zze(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzex(int paramInt)
    throws RemoteException;

  public abstract void zzey(int paramInt)
    throws RemoteException;

  public abstract void zzez(int paramInt)
    throws RemoteException;

  public abstract void zzf(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzf(int paramInt, String paramString)
    throws RemoteException;

  public abstract void zzf(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzf(DataHolder paramDataHolder, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzg(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzg(int paramInt, String paramString)
    throws RemoteException;

  public abstract void zzg(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzh(int paramInt, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzh(int paramInt, String paramString)
    throws RemoteException;

  public abstract void zzh(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzhb()
    throws RemoteException;

  public abstract void zzi(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzj(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzk(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzl(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzm(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzn(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzo(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzp(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzq(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzr(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzs(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzt(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzu(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzv(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzw(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzx(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzy(DataHolder paramDataHolder)
    throws RemoteException;

  public abstract void zzz(DataHolder paramDataHolder)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IGamesCallbacks
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesCallbacks");
    }

    public static IGamesCallbacks zzaX(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesCallbacks");
      if ((localIInterface != null) && ((localIInterface instanceof IGamesCallbacks)))
        return (IGamesCallbacks)localIInterface;
      return new Proxy(paramIBinder);
    }

    public IBinder asBinder()
    {
      return this;
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesCallbacks");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zze(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        if (paramParcel1.readInt() != 0);
        for (DataHolder localDataHolder51 = DataHolder.CREATOR.zzA(paramParcel1); ; localDataHolder51 = null)
        {
          zzc(localDataHolder51);
          paramParcel2.writeNoException();
          return true;
        }
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzf(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i49 = paramParcel1.readInt();
        DataHolder localDataHolder50 = null;
        if (i49 != 0)
          localDataHolder50 = DataHolder.CREATOR.zzA(paramParcel1);
        zze(localDataHolder50);
        paramParcel2.writeNoException();
        return true;
      case 5005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        if (paramParcel1.readInt() != 0);
        for (DataHolder localDataHolder48 = DataHolder.CREATOR.zzA(paramParcel1); ; localDataHolder48 = null)
        {
          int i48 = paramParcel1.readInt();
          DataHolder localDataHolder49 = null;
          if (i48 != 0)
            localDataHolder49 = DataHolder.CREATOR.zzA(paramParcel1);
          zza(localDataHolder48, localDataHolder49);
          paramParcel2.writeNoException();
          return true;
        }
      case 5006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i47 = paramParcel1.readInt();
        DataHolder localDataHolder47 = null;
        if (i47 != 0)
          localDataHolder47 = DataHolder.CREATOR.zzA(paramParcel1);
        zzf(localDataHolder47);
        paramParcel2.writeNoException();
        return true;
      case 5007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i46 = paramParcel1.readInt();
        DataHolder localDataHolder46 = null;
        if (i46 != 0)
          localDataHolder46 = DataHolder.CREATOR.zzA(paramParcel1);
        zzg(localDataHolder46);
        paramParcel2.writeNoException();
        return true;
      case 5008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i45 = paramParcel1.readInt();
        DataHolder localDataHolder45 = null;
        if (i45 != 0)
          localDataHolder45 = DataHolder.CREATOR.zzA(paramParcel1);
        zzh(localDataHolder45);
        paramParcel2.writeNoException();
        return true;
      case 5009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i44 = paramParcel1.readInt();
        DataHolder localDataHolder44 = null;
        if (i44 != 0)
          localDataHolder44 = DataHolder.CREATOR.zzA(paramParcel1);
        zzi(localDataHolder44);
        paramParcel2.writeNoException();
        return true;
      case 5010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i43 = paramParcel1.readInt();
        DataHolder localDataHolder43 = null;
        if (i43 != 0)
          localDataHolder43 = DataHolder.CREATOR.zzA(paramParcel1);
        zzj(localDataHolder43);
        paramParcel2.writeNoException();
        return true;
      case 5011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i42 = paramParcel1.readInt();
        DataHolder localDataHolder42 = null;
        if (i42 != 0)
          localDataHolder42 = DataHolder.CREATOR.zzA(paramParcel1);
        zzk(localDataHolder42);
        paramParcel2.writeNoException();
        return true;
      case 5016:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzhb();
        paramParcel2.writeNoException();
        return true;
      case 5017:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i41 = paramParcel1.readInt();
        DataHolder localDataHolder41 = null;
        if (i41 != 0)
          localDataHolder41 = DataHolder.CREATOR.zzA(paramParcel1);
        zzm(localDataHolder41);
        paramParcel2.writeNoException();
        return true;
      case 5037:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i40 = paramParcel1.readInt();
        DataHolder localDataHolder40 = null;
        if (i40 != 0)
          localDataHolder40 = DataHolder.CREATOR.zzA(paramParcel1);
        zzn(localDataHolder40);
        paramParcel2.writeNoException();
        return true;
      case 5018:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i39 = paramParcel1.readInt();
        DataHolder localDataHolder39 = null;
        if (i39 != 0)
          localDataHolder39 = DataHolder.CREATOR.zzA(paramParcel1);
        zzu(localDataHolder39);
        paramParcel2.writeNoException();
        return true;
      case 5019:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i38 = paramParcel1.readInt();
        DataHolder localDataHolder38 = null;
        if (i38 != 0)
          localDataHolder38 = DataHolder.CREATOR.zzA(paramParcel1);
        zzv(localDataHolder38);
        paramParcel2.writeNoException();
        return true;
      case 5020:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onLeftRoom(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5021:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i37 = paramParcel1.readInt();
        DataHolder localDataHolder37 = null;
        if (i37 != 0)
          localDataHolder37 = DataHolder.CREATOR.zzA(paramParcel1);
        zzw(localDataHolder37);
        paramParcel2.writeNoException();
        return true;
      case 5022:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i36 = paramParcel1.readInt();
        DataHolder localDataHolder36 = null;
        if (i36 != 0)
          localDataHolder36 = DataHolder.CREATOR.zzA(paramParcel1);
        zzx(localDataHolder36);
        paramParcel2.writeNoException();
        return true;
      case 5023:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i35 = paramParcel1.readInt();
        DataHolder localDataHolder35 = null;
        if (i35 != 0)
          localDataHolder35 = DataHolder.CREATOR.zzA(paramParcel1);
        zzy(localDataHolder35);
        paramParcel2.writeNoException();
        return true;
      case 5024:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i34 = paramParcel1.readInt();
        DataHolder localDataHolder34 = null;
        if (i34 != 0)
          localDataHolder34 = DataHolder.CREATOR.zzA(paramParcel1);
        zzz(localDataHolder34);
        paramParcel2.writeNoException();
        return true;
      case 5025:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i33 = paramParcel1.readInt();
        DataHolder localDataHolder33 = null;
        if (i33 != 0)
          localDataHolder33 = DataHolder.CREATOR.zzA(paramParcel1);
        zzA(localDataHolder33);
        paramParcel2.writeNoException();
        return true;
      case 5026:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i32 = paramParcel1.readInt();
        DataHolder localDataHolder32 = null;
        if (i32 != 0)
          localDataHolder32 = DataHolder.CREATOR.zzA(paramParcel1);
        zza(localDataHolder32, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5027:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i31 = paramParcel1.readInt();
        DataHolder localDataHolder31 = null;
        if (i31 != 0)
          localDataHolder31 = DataHolder.CREATOR.zzA(paramParcel1);
        zzb(localDataHolder31, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5028:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i30 = paramParcel1.readInt();
        DataHolder localDataHolder30 = null;
        if (i30 != 0)
          localDataHolder30 = DataHolder.CREATOR.zzA(paramParcel1);
        zzc(localDataHolder30, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5029:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i29 = paramParcel1.readInt();
        DataHolder localDataHolder29 = null;
        if (i29 != 0)
          localDataHolder29 = DataHolder.CREATOR.zzA(paramParcel1);
        zzd(localDataHolder29, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5030:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i28 = paramParcel1.readInt();
        DataHolder localDataHolder28 = null;
        if (i28 != 0)
          localDataHolder28 = DataHolder.CREATOR.zzA(paramParcel1);
        zze(localDataHolder28, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5031:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i27 = paramParcel1.readInt();
        DataHolder localDataHolder27 = null;
        if (i27 != 0)
          localDataHolder27 = DataHolder.CREATOR.zzA(paramParcel1);
        zzf(localDataHolder27, paramParcel1.createStringArray());
        paramParcel2.writeNoException();
        return true;
      case 5032:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        if (paramParcel1.readInt() != 0);
        for (RealTimeMessage localRealTimeMessage = (RealTimeMessage)RealTimeMessage.CREATOR.createFromParcel(paramParcel1); ; localRealTimeMessage = null)
        {
          onRealTimeMessageReceived(localRealTimeMessage);
          paramParcel2.writeNoException();
          return true;
        }
      case 5033:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzb(paramParcel1.readInt(), paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 5034:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i26 = paramParcel1.readInt();
        String str2 = paramParcel1.readString();
        if (paramParcel1.readInt() != 0);
        for (boolean bool = true; ; bool = false)
        {
          zza(i26, str2, bool);
          paramParcel2.writeNoException();
          return true;
        }
      case 5038:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i25 = paramParcel1.readInt();
        DataHolder localDataHolder26 = null;
        if (i25 != 0)
          localDataHolder26 = DataHolder.CREATOR.zzA(paramParcel1);
        zzB(localDataHolder26);
        paramParcel2.writeNoException();
        return true;
      case 5035:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i24 = paramParcel1.readInt();
        DataHolder localDataHolder25 = null;
        if (i24 != 0)
          localDataHolder25 = DataHolder.CREATOR.zzA(paramParcel1);
        zzC(localDataHolder25);
        paramParcel2.writeNoException();
        return true;
      case 5036:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzex(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 5039:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i23 = paramParcel1.readInt();
        DataHolder localDataHolder24 = null;
        if (i23 != 0)
          localDataHolder24 = DataHolder.CREATOR.zzA(paramParcel1);
        zzD(localDataHolder24);
        paramParcel2.writeNoException();
        return true;
      case 5040:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzey(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 6001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onP2PConnected(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 6002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onP2PDisconnected(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 8001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i22 = paramParcel1.readInt();
        DataHolder localDataHolder23 = null;
        if (i22 != 0)
          localDataHolder23 = DataHolder.CREATOR.zzA(paramParcel1);
        zzE(localDataHolder23);
        paramParcel2.writeNoException();
        return true;
      case 8002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i21 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle5 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle5 = null)
        {
          zzd(i21, localBundle5);
          paramParcel2.writeNoException();
          return true;
        }
      case 8003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i20 = paramParcel1.readInt();
        DataHolder localDataHolder22 = null;
        if (i20 != 0)
          localDataHolder22 = DataHolder.CREATOR.zzA(paramParcel1);
        zzp(localDataHolder22);
        paramParcel2.writeNoException();
        return true;
      case 8004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i19 = paramParcel1.readInt();
        DataHolder localDataHolder21 = null;
        if (i19 != 0)
          localDataHolder21 = DataHolder.CREATOR.zzA(paramParcel1);
        zzq(localDataHolder21);
        paramParcel2.writeNoException();
        return true;
      case 8005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i18 = paramParcel1.readInt();
        DataHolder localDataHolder20 = null;
        if (i18 != 0)
          localDataHolder20 = DataHolder.CREATOR.zzA(paramParcel1);
        zzr(localDataHolder20);
        paramParcel2.writeNoException();
        return true;
      case 8006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i17 = paramParcel1.readInt();
        DataHolder localDataHolder19 = null;
        if (i17 != 0)
          localDataHolder19 = DataHolder.CREATOR.zzA(paramParcel1);
        zzs(localDataHolder19);
        paramParcel2.writeNoException();
        return true;
      case 8007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzg(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 8008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i16 = paramParcel1.readInt();
        DataHolder localDataHolder18 = null;
        if (i16 != 0)
          localDataHolder18 = DataHolder.CREATOR.zzA(paramParcel1);
        zzt(localDataHolder18);
        paramParcel2.writeNoException();
        return true;
      case 8009:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onTurnBasedMatchRemoved(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 8010:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onInvitationRemoved(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 9001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i15 = paramParcel1.readInt();
        DataHolder localDataHolder17 = null;
        if (i15 != 0)
          localDataHolder17 = DataHolder.CREATOR.zzA(paramParcel1);
        zzl(localDataHolder17);
        paramParcel2.writeNoException();
        return true;
      case 10001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i14 = paramParcel1.readInt();
        DataHolder localDataHolder16 = null;
        if (i14 != 0)
          localDataHolder16 = DataHolder.CREATOR.zzA(paramParcel1);
        zzo(localDataHolder16);
        paramParcel2.writeNoException();
        return true;
      case 10002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        onRequestRemoved(paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 10003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i13 = paramParcel1.readInt();
        DataHolder localDataHolder15 = null;
        if (i13 != 0)
          localDataHolder15 = DataHolder.CREATOR.zzA(paramParcel1);
        zzF(localDataHolder15);
        paramParcel2.writeNoException();
        return true;
      case 10004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i12 = paramParcel1.readInt();
        DataHolder localDataHolder14 = null;
        if (i12 != 0)
          localDataHolder14 = DataHolder.CREATOR.zzA(paramParcel1);
        zzG(localDataHolder14);
        paramParcel2.writeNoException();
        return true;
      case 10005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i11 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle4 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle4 = null)
        {
          zze(i11, localBundle4);
          paramParcel2.writeNoException();
          return true;
        }
      case 10006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i10 = paramParcel1.readInt();
        DataHolder localDataHolder13 = null;
        if (i10 != 0)
          localDataHolder13 = DataHolder.CREATOR.zzA(paramParcel1);
        zzH(localDataHolder13);
        paramParcel2.writeNoException();
        return true;
      case 11001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i9 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle3 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle3 = null)
        {
          zzf(i9, localBundle3);
          paramParcel2.writeNoException();
          return true;
        }
      case 12001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i8 = paramParcel1.readInt();
        DataHolder localDataHolder12 = null;
        if (i8 != 0)
          localDataHolder12 = DataHolder.CREATOR.zzA(paramParcel1);
        zzI(localDataHolder12);
        paramParcel2.writeNoException();
        return true;
      case 12004:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        DataHolder localDataHolder11;
        if (paramParcel1.readInt() != 0)
        {
          localDataHolder11 = DataHolder.CREATOR.zzA(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label2865;
        }
        for (Contents localContents4 = (Contents)Contents.CREATOR.createFromParcel(paramParcel1); ; localContents4 = null)
        {
          zza(localDataHolder11, localContents4);
          paramParcel2.writeNoException();
          return true;
          localDataHolder11 = null;
          break;
        }
      case 12017:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        DataHolder localDataHolder10;
        String str1;
        Contents localContents1;
        if (paramParcel1.readInt() != 0)
        {
          localDataHolder10 = DataHolder.CREATOR.zzA(paramParcel1);
          str1 = paramParcel1.readString();
          if (paramParcel1.readInt() == 0)
            break label2995;
          localContents1 = (Contents)Contents.CREATOR.createFromParcel(paramParcel1);
          if (paramParcel1.readInt() == 0)
            break label3001;
        }
        for (Contents localContents2 = (Contents)Contents.CREATOR.createFromParcel(paramParcel1); ; localContents2 = null)
        {
          int i7 = paramParcel1.readInt();
          Contents localContents3 = null;
          if (i7 != 0)
            localContents3 = (Contents)Contents.CREATOR.createFromParcel(paramParcel1);
          zza(localDataHolder10, str1, localContents1, localContents2, localContents3);
          paramParcel2.writeNoException();
          return true;
          localDataHolder10 = null;
          break;
          localContents1 = null;
          break label2920;
        }
      case 12005:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i6 = paramParcel1.readInt();
        DataHolder localDataHolder9 = null;
        if (i6 != 0)
          localDataHolder9 = DataHolder.CREATOR.zzA(paramParcel1);
        zzJ(localDataHolder9);
        paramParcel2.writeNoException();
        return true;
      case 12012:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        zzh(paramParcel1.readInt(), paramParcel1.readString());
        paramParcel2.writeNoException();
        return true;
      case 12003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i5 = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle2 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle2 = null)
        {
          zzg(i5, localBundle2);
          paramParcel2.writeNoException();
          return true;
        }
      case 12013:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i4 = paramParcel1.readInt();
        DataHolder localDataHolder8 = null;
        if (i4 != 0)
          localDataHolder8 = DataHolder.CREATOR.zzA(paramParcel1);
        zzP(localDataHolder8);
        paramParcel2.writeNoException();
        return true;
      case 12011:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i3 = paramParcel1.readInt();
        DataHolder localDataHolder7 = null;
        if (i3 != 0)
          localDataHolder7 = DataHolder.CREATOR.zzA(paramParcel1);
        zzd(localDataHolder7);
        paramParcel2.writeNoException();
        return true;
      case 12006:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i2 = paramParcel1.readInt();
        DataHolder localDataHolder6 = null;
        if (i2 != 0)
          localDataHolder6 = DataHolder.CREATOR.zzA(paramParcel1);
        zzK(localDataHolder6);
        paramParcel2.writeNoException();
        return true;
      case 12007:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i1 = paramParcel1.readInt();
        DataHolder localDataHolder5 = null;
        if (i1 != 0)
          localDataHolder5 = DataHolder.CREATOR.zzA(paramParcel1);
        zzL(localDataHolder5);
        paramParcel2.writeNoException();
        return true;
      case 12014:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int n = paramParcel1.readInt();
        DataHolder localDataHolder4 = null;
        if (n != 0)
          localDataHolder4 = DataHolder.CREATOR.zzA(paramParcel1);
        zzM(localDataHolder4);
        paramParcel2.writeNoException();
        return true;
      case 12016:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int m = paramParcel1.readInt();
        DataHolder localDataHolder3 = null;
        if (m != 0)
          localDataHolder3 = DataHolder.CREATOR.zzA(paramParcel1);
        zzN(localDataHolder3);
        paramParcel2.writeNoException();
        return true;
      case 12008:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int k = paramParcel1.readInt();
        DataHolder localDataHolder2 = null;
        if (k != 0)
          localDataHolder2 = DataHolder.CREATOR.zzA(paramParcel1);
        zzO(localDataHolder2);
        paramParcel2.writeNoException();
        return true;
      case 12015:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int j = paramParcel1.readInt();
        if (paramParcel1.readInt() != 0);
        for (Bundle localBundle1 = (Bundle)Bundle.CREATOR.createFromParcel(paramParcel1); ; localBundle1 = null)
        {
          zzh(j, localBundle1);
          paramParcel2.writeNoException();
          return true;
        }
      case 13001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        int i = paramParcel1.readInt();
        DataHolder localDataHolder1 = null;
        if (i != 0)
          localDataHolder1 = DataHolder.CREATOR.zzA(paramParcel1);
        zzQ(localDataHolder1);
        paramParcel2.writeNoException();
        return true;
      case 13002:
        label2865: label2920: paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
        label2995: label3001: zzez(paramParcel1.readInt());
        paramParcel2.writeNoException();
        return true;
      case 14001:
      }
      paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesCallbacks");
      zza((DataHolder[])paramParcel1.createTypedArray(DataHolder.CREATOR));
      paramParcel2.writeNoException();
      return true;
    }

    private static class Proxy
      implements IGamesCallbacks
    {
      private IBinder zzle;

      Proxy(IBinder paramIBinder)
      {
        this.zzle = paramIBinder;
      }

      public IBinder asBinder()
      {
        return this.zzle;
      }

      public void onInvitationRemoved(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(8010, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onLeftRoom(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(5020, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onP2PConnected(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(6001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onP2PDisconnected(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(6002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onRealTimeMessageReceived(RealTimeMessage paramRealTimeMessage)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramRealTimeMessage != null)
          {
            localParcel1.writeInt(1);
            paramRealTimeMessage.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5032, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onRequestRemoved(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(10002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void onTurnBasedMatchRemoved(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeString(paramString);
          this.zzle.transact(8009, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzA(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5025, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzB(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5038, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzC(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5035, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzD(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5039, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzE(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzF(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzG(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzH(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzI(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzJ(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzK(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzL(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12007, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzM(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12014, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzN(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12016, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzO(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzP(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12013, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzQ(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(13001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(int paramInt, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(5034, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(DataHolder paramDataHolder1, DataHolder paramDataHolder2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
            if (paramDataHolder1 != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder1.writeToParcel(localParcel1, 0);
              if (paramDataHolder2 != null)
              {
                localParcel1.writeInt(1);
                paramDataHolder2.writeToParcel(localParcel1, 0);
                this.zzle.transact(5005, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          localParcel1.writeInt(0);
        }
      }

      public void zza(DataHolder paramDataHolder, Contents paramContents)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              if (paramContents != null)
              {
                localParcel1.writeInt(1);
                paramContents.writeToParcel(localParcel1, 0);
                this.zzle.transact(12004, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          localParcel1.writeInt(0);
        }
      }

      public void zza(DataHolder paramDataHolder, String paramString, Contents paramContents1, Contents paramContents2, Contents paramContents3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
            if (paramDataHolder != null)
            {
              localParcel1.writeInt(1);
              paramDataHolder.writeToParcel(localParcel1, 0);
              localParcel1.writeString(paramString);
              if (paramContents1 != null)
              {
                localParcel1.writeInt(1);
                paramContents1.writeToParcel(localParcel1, 0);
                if (paramContents2 == null)
                  break label162;
                localParcel1.writeInt(1);
                paramContents2.writeToParcel(localParcel1, 0);
                if (paramContents3 == null)
                  break label171;
                localParcel1.writeInt(1);
                paramContents3.writeToParcel(localParcel1, 0);
                this.zzle.transact(12017, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localParcel1.writeInt(0);
              continue;
            }
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          localParcel1.writeInt(0);
          continue;
          label162: localParcel1.writeInt(0);
          continue;
          label171: localParcel1.writeInt(0);
        }
      }

      public void zza(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5026, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(DataHolder[] paramArrayOfDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeTypedArray(paramArrayOfDataHolder, 0);
          this.zzle.transact(14001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(int paramInt1, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeString(paramString);
          this.zzle.transact(5033, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5027, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5028, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12011, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5029, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(5001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5030, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzex(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5036, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzey(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5040, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzez(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          this.zzle.transact(13002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(11001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(5003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(DataHolder paramDataHolder, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(5031, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(8007, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5007, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(int paramInt, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12015, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(int paramInt, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          localParcel1.writeInt(paramInt);
          localParcel1.writeString(paramString);
          this.zzle.transact(12012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzhb()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          this.zzle.transact(5016, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzi(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5009, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzj(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5010, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzk(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5011, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzl(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(9001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzm(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5017, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzn(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5037, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzo(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(10001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzp(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzq(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzr(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzs(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzt(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzu(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5018, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzv(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5019, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzw(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5021, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzx(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5022, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzy(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5023, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzz(DataHolder paramDataHolder)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesCallbacks");
          if (paramDataHolder != null)
          {
            localParcel1.writeInt(1);
            paramDataHolder.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5024, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }
    }
  }
}