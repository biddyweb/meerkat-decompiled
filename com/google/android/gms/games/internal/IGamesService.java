package com.google.android.gms.games.internal;

import android.content.Intent;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable.Creator;
import android.os.RemoteException;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzf;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.achievement.AchievementEntity;
import com.google.android.gms.games.internal.multiplayer.ZInvitationCluster;
import com.google.android.gms.games.internal.request.GameRequestCluster;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.realtime.RoomEntity;
import com.google.android.gms.games.snapshot.SnapshotMetadataChangeEntity;

public abstract interface IGamesService extends IInterface
{
  public abstract void zzS(boolean paramBoolean)
    throws RemoteException;

  public abstract void zzT(boolean paramBoolean)
    throws RemoteException;

  public abstract void zzU(boolean paramBoolean)
    throws RemoteException;

  public abstract int zza(IGamesCallbacks paramIGamesCallbacks, byte[] paramArrayOfByte, String paramString1, String paramString2)
    throws RemoteException;

  public abstract Intent zza(int paramInt1, int paramInt2, boolean paramBoolean)
    throws RemoteException;

  public abstract Intent zza(int paramInt1, byte[] paramArrayOfByte, int paramInt2, String paramString)
    throws RemoteException;

  public abstract Intent zza(PlayerEntity paramPlayerEntity)
    throws RemoteException;

  public abstract Intent zza(AchievementEntity paramAchievementEntity)
    throws RemoteException;

  public abstract Intent zza(ZInvitationCluster paramZInvitationCluster, String paramString1, String paramString2)
    throws RemoteException;

  public abstract Intent zza(GameRequestCluster paramGameRequestCluster, String paramString)
    throws RemoteException;

  public abstract Intent zza(RoomEntity paramRoomEntity, int paramInt)
    throws RemoteException;

  public abstract Intent zza(String paramString, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
    throws RemoteException;

  public abstract Intent zza(ParticipantEntity[] paramArrayOfParticipantEntity, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2)
    throws RemoteException;

  public abstract Intent zza(ParticipantEntity[] paramArrayOfParticipantEntity, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, String paramString3)
    throws RemoteException;

  public abstract void zza(long paramLong, String paramString)
    throws RemoteException;

  public abstract void zza(IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(Contents paramContents)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, String[] paramArrayOfString, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, String paramString, String[] paramArrayOfString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, int[] paramArrayOfInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, long paramLong)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, Bundle paramBundle, int paramInt1, int paramInt2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, IBinder paramIBinder, int paramInt, String[] paramArrayOfString, Bundle paramBundle, boolean paramBoolean, long paramLong)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, IBinder paramIBinder, String paramString, boolean paramBoolean, long paramLong)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, int[] paramArrayOfInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, long paramLong)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, long paramLong, String paramString2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, SnapshotMetadataChangeEntity paramSnapshotMetadataChangeEntity, Contents paramContents)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, SnapshotMetadataChangeEntity paramSnapshotMetadataChangeEntity, Contents paramContents)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, String[] paramArrayOfString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean, int paramInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, byte[] paramArrayOfByte, String paramString2, ParticipantResult[] paramArrayOfParticipantResult)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, byte[] paramArrayOfByte, ParticipantResult[] paramArrayOfParticipantResult)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int[] paramArrayOfInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, String[] paramArrayOfString, int paramInt1, byte[] paramArrayOfByte, int paramInt2)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean, Bundle paramBundle)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int[] paramArrayOfInt)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zza(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zza(IGamesClient paramIGamesClient, long paramLong)
    throws RemoteException;

  public abstract void zza(String paramString, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract int zzb(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
    throws RemoteException;

  public abstract Intent zzb(int paramInt1, int paramInt2, boolean paramBoolean)
    throws RemoteException;

  public abstract Intent zzb(int[] paramArrayOfInt)
    throws RemoteException;

  public abstract void zzb(long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, long paramLong)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, IBinder paramIBinder, Bundle paramBundle)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzb(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
    throws RemoteException;

  public abstract Intent zzbP(String paramString)
    throws RemoteException;

  public abstract String zzbR(String paramString)
    throws RemoteException;

  public abstract String zzbS(String paramString)
    throws RemoteException;

  public abstract void zzbT(String paramString)
    throws RemoteException;

  public abstract int zzbU(String paramString)
    throws RemoteException;

  public abstract Uri zzbV(String paramString)
    throws RemoteException;

  public abstract void zzbW(String paramString)
    throws RemoteException;

  public abstract Intent zzbX(String paramString)
    throws RemoteException;

  public abstract ParcelFileDescriptor zzbY(String paramString)
    throws RemoteException;

  public abstract void zzc(long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, long paramLong)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzc(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzc(String paramString1, String paramString2, int paramInt)
    throws RemoteException;

  public abstract void zzc(String[] paramArrayOfString)
    throws RemoteException;

  public abstract void zzd(long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, long paramLong)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzd(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzd(String paramString1, String paramString2, int paramInt)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zze(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzeC(int paramInt)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzf(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract void zzg(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzg(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzg(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract RoomEntity zzh(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzh(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzh(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
    throws RemoteException;

  public abstract Bundle zzhp()
    throws RemoteException;

  public abstract void zzi(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzi(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract ParcelFileDescriptor zzj(Uri paramUri)
    throws RemoteException;

  public abstract void zzj(IGamesCallbacks paramIGamesCallbacks)
    throws RemoteException;

  public abstract void zzj(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzk(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzl(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzm(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzn(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract Intent zznB()
    throws RemoteException;

  public abstract Intent zznC()
    throws RemoteException;

  public abstract int zznD()
    throws RemoteException;

  public abstract String zznE()
    throws RemoteException;

  public abstract int zznF()
    throws RemoteException;

  public abstract Intent zznG()
    throws RemoteException;

  public abstract int zznH()
    throws RemoteException;

  public abstract int zznI()
    throws RemoteException;

  public abstract int zznJ()
    throws RemoteException;

  public abstract int zznK()
    throws RemoteException;

  public abstract void zznL()
    throws RemoteException;

  public abstract DataHolder zznN()
    throws RemoteException;

  public abstract boolean zznO()
    throws RemoteException;

  public abstract DataHolder zznP()
    throws RemoteException;

  public abstract void zznQ()
    throws RemoteException;

  public abstract Intent zznR()
    throws RemoteException;

  public abstract void zznS()
    throws RemoteException;

  public abstract boolean zznT()
    throws RemoteException;

  public abstract void zznU()
    throws RemoteException;

  public abstract String zznp()
    throws RemoteException;

  public abstract String zznq()
    throws RemoteException;

  public abstract Intent zznt()
    throws RemoteException;

  public abstract Intent zznu()
    throws RemoteException;

  public abstract Intent zznv()
    throws RemoteException;

  public abstract Intent zznw()
    throws RemoteException;

  public abstract void zzo(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzp(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzp(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzq(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzq(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzr(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzr(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzs(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzt(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzt(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzu(long paramLong)
    throws RemoteException;

  public abstract void zzu(IGamesCallbacks paramIGamesCallbacks, String paramString)
    throws RemoteException;

  public abstract void zzu(String paramString, int paramInt)
    throws RemoteException;

  public abstract Intent zzv(String paramString, int paramInt)
    throws RemoteException;

  public abstract void zzv(long paramLong)
    throws RemoteException;

  public abstract void zzv(String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzw(long paramLong)
    throws RemoteException;

  public abstract void zzw(String paramString1, String paramString2)
    throws RemoteException;

  public abstract void zzx(long paramLong)
    throws RemoteException;

  public abstract void zzy(long paramLong)
    throws RemoteException;

  public abstract void zzz(long paramLong)
    throws RemoteException;

  public static abstract class Stub extends Binder
    implements IGamesService
  {
    public Stub()
    {
      attachInterface(this, "com.google.android.gms.games.internal.IGamesService");
    }

    public static IGamesService zzaZ(IBinder paramIBinder)
    {
      if (paramIBinder == null)
        return null;
      IInterface localIInterface = paramIBinder.queryLocalInterface("com.google.android.gms.games.internal.IGamesService");
      if ((localIInterface != null) && ((localIInterface instanceof IGamesService)))
        return (IGamesService)localIInterface;
      return new Proxy(paramIBinder);
    }

    public boolean onTransact(int paramInt1, Parcel paramParcel1, Parcel paramParcel2, int paramInt2)
      throws RemoteException
    {
      switch (paramInt1)
      {
      default:
        return super.onTransact(paramInt1, paramParcel1, paramParcel2, paramInt2);
      case 1598968902:
        paramParcel2.writeString("com.google.android.gms.games.internal.IGamesService");
        return true;
      case 5001:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        zzu(paramParcel1.readLong());
        paramParcel2.writeNoException();
        return true;
      case 5002:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        zza(IGamesCallbacks.Stub.zzaX(paramParcel1.readStrongBinder()));
        paramParcel2.writeNoException();
        return true;
      case 5003:
        paramParcel1.enforceInterface("com.google.android.gms.games.internal.IGamesService");
        String str = zznE();
      case 5004:
      case 5005:
      case 5006:
      case 5007:
      case 5064:
      case 5065:
      case 5012:
      case 5013:
      case 5014:
      case 5015:
      case 5016:
      case 5017:
      case 5018:
      case 5019:
      case 5020:
      case 5021:
      case 5022:
      case 5023:
      case 5024:
      case 5025:
      case 5026:
      case 5027:
      case 5028:
      case 5029:
      case 5058:
      case 5059:
      case 5030:
      case 5031:
      case 5032:
      case 5033:
      case 5034:
      case 5035:
      case 5036:
      case 5037:
      case 5038:
      case 5039:
      case 5040:
      case 5041:
      case 5042:
      case 5043:
      case 5044:
      case 5045:
      case 5046:
      case 5047:
      case 5048:
      case 5049:
      case 5050:
      case 5051:
      case 5052:
      case 5053:
      case 5060:
      case 5054:
      case 5061:
      case 5055:
      case 5067:
      case 5068:
      case 5056:
      case 5057:
      case 5062:
      case 5063:
      case 5066:
      case 5501:
      case 5502:
      case 6001:
      case 6002:
      case 6003:
      case 6004:
      case 6501:
      case 6502:
      case 6503:
      case 6504:
      case 6505:
      case 6506:
      case 6507:
      case 7001:
      case 7002:
      case 7003:
      case 8001:
      case 8002:
      case 8003:
      case 8004:
      case 8005:
      case 8006:
      case 8007:
      case 8008:
      case 8009:
      case 8010:
      case 8011:
      case 8012:
      case 8013:
      case 8014:
      case 8024:
      case 8025:
      case 8015:
      case 8016:
      case 8017:
      case 8026:
      case 8018:
      case 8019:
      case 8020:
      case 8021:
      case 8022:
      case 8023:
      case 8027:
      case 9001:
      case 9002:
      case 9003:
      case 9004:
      case 9005:
      case 9006:
      case 9007:
      case 9008:
      case 9009:
      case 9010:
      case 9011:
      case 9012:
      case 9013:
      case 9031:
      case 9019:
      case 9020:
      case 9028:
      case 9030:
      case 10001:
      case 10002:
      case 10003:
      case 10004:
      case 10005:
      case 10006:
      case 10007:
      case 10008:
      case 10009:
      case 10010:
      case 10011:
      case 10012:
      case 10013:
      case 10023:
      case 10015:
      case 10022:
      case 10014:
      case 10016:
      case 10017:
      case 10021:
      case 10018:
      case 10019:
      case 10020:
      case 11001:
      case 11002:
      case 12001:
      case 12002:
      case 12003:
      case 12006:
      case 12007:
      case 12019:
      case 12020:
      case 12033:
      case 12035:
      case 12036:
      case 12005:
      case 12023:
      case 12024:
      case 12021:
      case 12022:
      case 12025:
      case 12026:
      case 12027:
      case 12032:
      case 12016:
      case 12031:
      case 12017:
      case 12008:
      case 12009:
      case 12010:
      case 12029:
      case 12015:
      case 12028:
      case 12011:
      case 12013:
      case 12012:
      case 12014:
      case 12030:
      case 12034:
      case 12018:
      case 13001:
      case 13002:
      case 13003:
      case 13004:
      case 13005:
      case 13006:
      case 14001:
      case 14002:
      case 14003:
      case 15001:
      case 15002:
      case 15501:
      case 15502:
      case 15503:
      case 15504:
      }
    }

    private static class Proxy
      implements IGamesService
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

      public void zzS(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(5068, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzT(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(12026, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzU(boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(13001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zza(IGamesCallbacks paramIGamesCallbacks, byte[] paramArrayOfByte, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(5033, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            return i;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zza(int paramInt1, int paramInt2, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(9008, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0);
          for (Intent localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2); ; localIntent = null)
            return localIntent;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zza(int paramInt1, byte[] paramArrayOfByte, int paramInt2, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeByteArray(paramArrayOfByte);
          localParcel1.writeInt(paramInt2);
          localParcel1.writeString(paramString);
          this.zzle.transact(10012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zza(PlayerEntity paramPlayerEntity)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramPlayerEntity != null)
            {
              localParcel1.writeInt(1);
              paramPlayerEntity.writeToParcel(localParcel1, 0);
              this.zzle.transact(15503, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          Intent localIntent = null;
        }
      }

      public Intent zza(AchievementEntity paramAchievementEntity)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramAchievementEntity != null)
            {
              localParcel1.writeInt(1);
              paramAchievementEntity.writeToParcel(localParcel1, 0);
              this.zzle.transact(13005, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          Intent localIntent = null;
        }
      }

      public Intent zza(ZInvitationCluster paramZInvitationCluster, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramZInvitationCluster != null)
            {
              localParcel1.writeInt(1);
              paramZInvitationCluster.writeToParcel(localParcel1, 0);
              localParcel1.writeString(paramString1);
              localParcel1.writeString(paramString2);
              this.zzle.transact(10021, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          Intent localIntent = null;
        }
      }

      public Intent zza(GameRequestCluster paramGameRequestCluster, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramGameRequestCluster != null)
            {
              localParcel1.writeInt(1);
              paramGameRequestCluster.writeToParcel(localParcel1, 0);
              localParcel1.writeString(paramString);
              this.zzle.transact(10022, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          Intent localIntent = null;
        }
      }

      public Intent zza(RoomEntity paramRoomEntity, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramRoomEntity != null)
            {
              localParcel1.writeInt(1);
              paramRoomEntity.writeToParcel(localParcel1, 0);
              localParcel1.writeInt(paramInt);
              this.zzle.transact(9011, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          Intent localIntent = null;
        }
      }

      public Intent zza(String paramString, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          int j;
          if (paramBoolean1)
          {
            j = i;
            localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label124;
            label45: localParcel1.writeInt(i);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(12001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            if (localParcel2.readInt() == 0)
              break label130;
          }
          label130: for (Intent localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2); ; localIntent = null)
          {
            return localIntent;
            j = 0;
            break;
            label124: i = 0;
            break label45;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zza(ParticipantEntity[] paramArrayOfParticipantEntity, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            localParcel1.writeTypedArray(paramArrayOfParticipantEntity, 0);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            if (paramUri1 != null)
            {
              localParcel1.writeInt(1);
              paramUri1.writeToParcel(localParcel1, 0);
              if (paramUri2 != null)
              {
                localParcel1.writeInt(1);
                paramUri2.writeToParcel(localParcel1, 0);
                this.zzle.transact(9031, localParcel1, localParcel2, 0);
                localParcel2.readException();
                if (localParcel2.readInt() == 0)
                  break label166;
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          label166: Intent localIntent = null;
        }
      }

      public Intent zza(ParticipantEntity[] paramArrayOfParticipantEntity, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, String paramString3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            localParcel1.writeTypedArray(paramArrayOfParticipantEntity, 0);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            if (paramUri1 != null)
            {
              localParcel1.writeInt(1);
              paramUri1.writeToParcel(localParcel1, 0);
              if (paramUri2 != null)
              {
                localParcel1.writeInt(1);
                paramUri2.writeToParcel(localParcel1, 0);
                localParcel1.writeString(paramString3);
                this.zzle.transact(14003, localParcel1, localParcel2, 0);
                localParcel2.readException();
                if (localParcel2.readInt() == 0)
                  break label173;
                localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
                return localIntent;
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
          label173: Intent localIntent = null;
        }
      }

      public void zza(long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          localParcel1.writeString(paramString);
          this.zzle.transact(8019, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeStrongBinder(paramIBinder);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5005, localParcel1, localParcel2, 0);
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

      public void zza(Contents paramContents)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramContents != null)
          {
            localParcel1.writeInt(1);
            paramContents.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(12019, localParcel1, localParcel2, 0);
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

      public void zza(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(10016, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, int paramInt3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            this.zzle.transact(10009, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5044, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt1, int paramInt2, String[] paramArrayOfString, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeStringArray(paramArrayOfString);
            if (paramBundle == null)
              break label114;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(8004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label114: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, String paramString, String[] paramArrayOfString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeString(paramString);
            localParcel1.writeStringArray(paramArrayOfString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(14002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5015, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int paramInt, int[] paramArrayOfInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            localParcel1.writeIntArray(paramArrayOfInt);
            this.zzle.transact(10018, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(5058, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            localParcel1.writeString(paramString);
            this.zzle.transact(8018, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, Bundle paramBundle, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (paramBundle == null)
              break label106;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            this.zzle.transact(5021, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label106: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, IBinder paramIBinder, int paramInt, String[] paramArrayOfString, Bundle paramBundle, boolean paramBoolean, long paramLong)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            IBinder localIBinder;
            if (paramIGamesCallbacks != null)
            {
              localIBinder = paramIGamesCallbacks.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              localParcel1.writeStrongBinder(paramIBinder);
              localParcel1.writeInt(paramInt);
              localParcel1.writeStringArray(paramArrayOfString);
              if (paramBundle != null)
              {
                localParcel1.writeInt(1);
                paramBundle.writeToParcel(localParcel1, 0);
                break label164;
                localParcel1.writeInt(i);
                localParcel1.writeLong(paramLong);
                this.zzle.transact(5030, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label164: 
          while (!paramBoolean)
          {
            i = 0;
            break;
          }
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, IBinder paramIBinder, String paramString, boolean paramBoolean, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStrongBinder(paramIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(5031, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5014, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(10011, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(5019, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label114;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5025, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label114: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(8023, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5045, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2, boolean paramBoolean3, boolean paramBoolean4)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          label60: int k;
          label76: int m;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label151;
            j = i;
            localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label157;
            k = i;
            localParcel1.writeInt(k);
            if (!paramBoolean3)
              break label163;
            m = i;
            label92: localParcel1.writeInt(m);
            if (!paramBoolean4)
              break label169;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(6501, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label151: j = 0;
            break label60;
            label157: k = 0;
            break label76;
            label163: m = 0;
            break label92;
            label169: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, int[] paramArrayOfInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            localParcel1.writeIntArray(paramArrayOfInt);
            this.zzle.transact(10019, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(5016, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, long paramLong, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeLong(paramLong);
            localParcel1.writeString(paramString2);
            this.zzle.transact(7002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label107;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5023, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label107: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, SnapshotMetadataChangeEntity paramSnapshotMetadataChangeEntity, Contents paramContents)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            IBinder localIBinder;
            if (paramIGamesCallbacks != null)
            {
              localIBinder = paramIGamesCallbacks.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              localParcel1.writeString(paramString);
              if (paramSnapshotMetadataChangeEntity != null)
              {
                localParcel1.writeInt(1);
                paramSnapshotMetadataChangeEntity.writeToParcel(localParcel1, 0);
                if (paramContents == null)
                  break label142;
                localParcel1.writeInt(1);
                paramContents.writeToParcel(localParcel1, 0);
                this.zzle.transact(12007, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label142: localParcel1.writeInt(0);
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(5038, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            this.zzle.transact(8001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            this.zzle.transact(10010, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(5039, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label126;
            j = i;
            label67: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label132;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(9028, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label126: j = 0;
            break label67;
            label132: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, SnapshotMetadataChangeEntity paramSnapshotMetadataChangeEntity, Contents paramContents)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            IBinder localIBinder;
            if (paramIGamesCallbacks != null)
            {
              localIBinder = paramIGamesCallbacks.asBinder();
              localParcel1.writeStrongBinder(localIBinder);
              localParcel1.writeString(paramString1);
              localParcel1.writeString(paramString2);
              if (paramSnapshotMetadataChangeEntity != null)
              {
                localParcel1.writeInt(1);
                paramSnapshotMetadataChangeEntity.writeToParcel(localParcel1, 0);
                if (paramContents == null)
                  break label150;
                localParcel1.writeInt(1);
                paramContents.writeToParcel(localParcel1, 0);
                this.zzle.transact(12033, localParcel1, localParcel2, 0);
                localParcel2.readException();
              }
            }
            else
            {
              localIBinder = null;
              continue;
            }
            localParcel1.writeInt(0);
            continue;
          }
          finally
          {
            localParcel2.recycle();
            localParcel1.recycle();
          }
          label150: localParcel1.writeInt(0);
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeIntArray(paramArrayOfInt);
            localParcel1.writeInt(paramInt);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12015, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(10008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, String[] paramArrayOfString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeStringArray(paramArrayOfString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12028, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(5054, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(15001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString1, byte[] paramArrayOfByte, String paramString2, ParticipantResult[] paramArrayOfParticipantResult)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeString(paramString2);
            localParcel1.writeTypedArray(paramArrayOfParticipantResult, 0);
            this.zzle.transact(8007, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, byte[] paramArrayOfByte, ParticipantResult[] paramArrayOfParticipantResult)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeTypedArray(paramArrayOfParticipantResult, 0);
            this.zzle.transact(8008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, int[] paramArrayOfInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeIntArray(paramArrayOfInt);
            this.zzle.transact(8017, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String paramString, String[] paramArrayOfString, int paramInt1, byte[] paramArrayOfByte, int paramInt2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStringArray(paramArrayOfString);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeByteArray(paramArrayOfByte);
            localParcel1.writeInt(paramInt2);
            this.zzle.transact(10005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean, Bundle paramBundle)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            if (!paramBoolean)
              break label107;
            label43: localParcel1.writeInt(i);
            if (paramBundle == null)
              break label113;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5063, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label107: i = 0;
            break label43;
            label113: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(12031, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int[] paramArrayOfInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeIntArray(paramArrayOfInt);
            this.zzle.transact(8003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, int[] paramArrayOfInt, int paramInt, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeIntArray(paramArrayOfInt);
            localParcel1.writeInt(paramInt);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12010, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(10006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStringArray(paramArrayOfString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12029, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(IGamesClient paramIGamesClient, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesClient != null);
          for (IBinder localIBinder = paramIGamesClient.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(15501, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zza(String paramString, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeStrongBinder(paramIBinder);
          if (paramBundle != null)
          {
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(13002, localParcel1, localParcel2, 0);
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

      public int zzb(byte[] paramArrayOfByte, String paramString, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeByteArray(paramArrayOfByte);
          localParcel1.writeString(paramString);
          localParcel1.writeStringArray(paramArrayOfString);
          this.zzle.transact(5034, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zzb(int paramInt1, int paramInt2, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeInt(paramInt1);
          localParcel1.writeInt(paramInt2);
          int i = 0;
          if (paramBoolean)
            i = 1;
          localParcel1.writeInt(i);
          this.zzle.transact(9009, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0);
          for (Intent localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2); ; localIntent = null)
            return localIntent;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zzb(int[] paramArrayOfInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeIntArray(paramArrayOfInt);
          this.zzle.transact(12030, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          localParcel1.writeString(paramString);
          this.zzle.transact(8021, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5017, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5046, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(8012, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            localParcel1.writeString(paramString);
            this.zzle.transact(8020, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5018, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(12023, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(5020, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label114;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(7003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label114: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(10017, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5501, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, IBinder paramIBinder, Bundle paramBundle)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeStrongBinder(paramIBinder);
            if (paramBundle == null)
              break label107;
            localParcel1.writeInt(1);
            paramBundle.writeToParcel(localParcel1, 0);
          }
          while (true)
          {
            this.zzle.transact(5024, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label107: localParcel1.writeInt(0);
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(5041, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt1);
            localParcel1.writeInt(paramInt2);
            localParcel1.writeInt(paramInt3);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(5040, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label126;
            j = i;
            label67: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label132;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(12018, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label126: j = 0;
            break label67;
            label132: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6506, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6502, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6503, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzb(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(10007, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zzbP(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(12034, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zzbR(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5064, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zzbS(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5035, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzbT(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5050, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zzbU(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5060, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Uri zzbV(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(5066, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localUri = (Uri)Uri.CREATOR.createFromParcel(localParcel2);
            return localUri;
          }
          Uri localUri = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzbW(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(8002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zzbX(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(9004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public ParcelFileDescriptor zzbY(String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          this.zzle.transact(9030, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localParcelFileDescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(localParcel2);
            return localParcelFileDescriptor;
          }
          ParcelFileDescriptor localParcelFileDescriptor = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          localParcel1.writeString(paramString);
          this.zzle.transact(10004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5022, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(5048, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(10001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            localParcel1.writeString(paramString);
            this.zzle.transact(10003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5032, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            this.zzle.transact(12024, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(9001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(8011, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6504, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(8027, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(IGamesCallbacks paramIGamesCallbacks, String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeStringArray(paramArrayOfString);
            this.zzle.transact(10020, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(String paramString1, String paramString2, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5051, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzc(String[] paramArrayOfString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeStringArray(paramArrayOfString);
          this.zzle.transact(15002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          localParcel1.writeString(paramString);
          this.zzle.transact(12014, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5026, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(6003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            this.zzle.transact(12011, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, long paramLong, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeLong(paramLong);
            localParcel1.writeString(paramString);
            this.zzle.transact(12013, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5037, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(9020, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(8015, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(6505, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzd(String paramString1, String paramString2, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(8026, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5027, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label112;
            j = i;
            label53: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label118;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(6004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label112: j = 0;
            break label53;
            label118: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5042, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(12021, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(8016, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zze(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12032, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzeC(int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
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

      public void zzf(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5047, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5043, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
        throws RemoteException
      {
        int i = 1;
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          IBinder localIBinder;
          int j;
          if (paramIGamesCallbacks != null)
          {
            localIBinder = paramIGamesCallbacks.asBinder();
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            localParcel1.writeInt(paramInt);
            if (!paramBoolean1)
              break label119;
            j = i;
            label60: localParcel1.writeInt(j);
            if (!paramBoolean2)
              break label125;
          }
          while (true)
          {
            localParcel1.writeInt(i);
            this.zzle.transact(12022, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
            localIBinder = null;
            break;
            label119: j = 0;
            break label60;
            label125: i = 0;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString1);
            localParcel1.writeString(paramString2);
            this.zzle.transact(12009, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(IGamesCallbacks paramIGamesCallbacks, String paramString, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(13006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzf(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(12016, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5049, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5052, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzg(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(13003, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public RoomEntity zzh(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5053, localParcel1, localParcel2, 0);
            localParcel2.readException();
            int i = localParcel2.readInt();
            RoomEntity localRoomEntity = null;
            if (i != 0)
              localRoomEntity = (RoomEntity)RoomEntity.CREATOR.createFromParcel(localParcel2);
            return localRoomEntity;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5056, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzh(IGamesCallbacks paramIGamesCallbacks, boolean paramBoolean)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            int i = 0;
            if (paramBoolean)
              i = 1;
            localParcel1.writeInt(i);
            this.zzle.transact(13004, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Bundle zzhp()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5004, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localBundle = (Bundle)Bundle.CREATOR.createFromParcel(localParcel2);
            return localBundle;
          }
          Bundle localBundle = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzi(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(5062, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzi(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5061, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public ParcelFileDescriptor zzj(Uri paramUri)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        while (true)
        {
          try
          {
            localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
            if (paramUri != null)
            {
              localParcel1.writeInt(1);
              paramUri.writeToParcel(localParcel1, 0);
              this.zzle.transact(6507, localParcel1, localParcel2, 0);
              localParcel2.readException();
              if (localParcel2.readInt() != 0)
              {
                localParcelFileDescriptor = (ParcelFileDescriptor)ParcelFileDescriptor.CREATOR.createFromParcel(localParcel2);
                return localParcelFileDescriptor;
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
          ParcelFileDescriptor localParcelFileDescriptor = null;
        }
      }

      public void zzj(IGamesCallbacks paramIGamesCallbacks)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            this.zzle.transact(11001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzj(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(5057, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzk(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(7001, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzl(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(8005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzm(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(8006, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzn(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(8009, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznB()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9010, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznC()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznD()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9019, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zznE()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznF()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(8024, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznG()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(10015, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznH()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(10013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznI()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(10023, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznJ()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(12035, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public int zznK()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(12036, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          return i;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zznL()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5006, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public DataHolder zznN()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            DataHolder localDataHolder2 = DataHolder.CREATOR.zzA(localParcel2);
            localDataHolder1 = localDataHolder2;
            return localDataHolder1;
          }
          DataHolder localDataHolder1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean zznO()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5067, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public DataHolder zznP()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5502, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            DataHolder localDataHolder2 = DataHolder.CREATOR.zzA(localParcel2);
            localDataHolder1 = localDataHolder2;
            return localDataHolder1;
          }
          DataHolder localDataHolder1 = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zznQ()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(8022, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznR()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zznS()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(11002, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public boolean zznT()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(12025, localParcel1, localParcel2, 0);
          localParcel2.readException();
          int i = localParcel2.readInt();
          boolean bool = false;
          if (i != 0)
            bool = true;
          return bool;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zznU()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(15504, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zznp()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5007, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public String zznq()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(5012, localParcel1, localParcel2, 0);
          localParcel2.readException();
          String str = localParcel2.readString();
          return str;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznt()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9003, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznu()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9005, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznv()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9006, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zznw()
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          this.zzle.transact(9007, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzo(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(8010, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzp(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(8014, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzp(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(12017, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzq(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(9002, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzq(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5029, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzr(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(12020, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzr(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5028, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzs(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(12005, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzt(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(12027, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzt(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(5055, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzu(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
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

      public void zzu(IGamesCallbacks paramIGamesCallbacks, String paramString)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          if (paramIGamesCallbacks != null);
          for (IBinder localIBinder = paramIGamesCallbacks.asBinder(); ; localIBinder = null)
          {
            localParcel1.writeStrongBinder(localIBinder);
            localParcel1.writeString(paramString);
            this.zzle.transact(12008, localParcel1, localParcel2, 0);
            localParcel2.readException();
            return;
          }
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzu(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(10014, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public Intent zzv(String paramString, int paramInt)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString);
          localParcel1.writeInt(paramInt);
          this.zzle.transact(14001, localParcel1, localParcel2, 0);
          localParcel2.readException();
          if (localParcel2.readInt() != 0)
          {
            localIntent = (Intent)Intent.CREATOR.createFromParcel(localParcel2);
            return localIntent;
          }
          Intent localIntent = null;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzv(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(5059, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzv(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.zzle.transact(5065, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzw(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(8013, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzw(String paramString1, String paramString2)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeString(paramString1);
          localParcel1.writeString(paramString2);
          this.zzle.transact(8025, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
        }
        finally
        {
          localParcel2.recycle();
          localParcel1.recycle();
        }
      }

      public void zzx(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
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

      public void zzy(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
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

      public void zzz(long paramLong)
        throws RemoteException
      {
        Parcel localParcel1 = Parcel.obtain();
        Parcel localParcel2 = Parcel.obtain();
        try
        {
          localParcel1.writeInterfaceToken("com.google.android.gms.games.internal.IGamesService");
          localParcel1.writeLong(paramLong);
          this.zzle.transact(15502, localParcel1, localParcel2, 0);
          localParcel2.readException();
          return;
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