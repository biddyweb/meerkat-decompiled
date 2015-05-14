package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable.Creator;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.games.internal.GamesDowngradeableSafeParcel;
import com.google.android.gms.internal.zzlw;

public final class ParticipantEntity extends GamesDowngradeableSafeParcel
  implements Participant
{
  public static final Parcelable.Creator<ParticipantEntity> CREATOR = new ParticipantEntityCreatorCompat();
  private final int zzFG;
  private final int zzIM;
  private final String zzSJ;
  private final Uri zzacc;
  private final Uri zzacd;
  private final String zzacn;
  private final String zzaco;
  private final String zzadN;
  private final PlayerEntity zzadf;
  private final String zzaeO;
  private final boolean zzajD;
  private final ParticipantResult zzajE;
  private final int zzrX;

  ParticipantEntity(int paramInt1, String paramString1, String paramString2, Uri paramUri1, Uri paramUri2, int paramInt2, String paramString3, boolean paramBoolean, PlayerEntity paramPlayerEntity, int paramInt3, ParticipantResult paramParticipantResult, String paramString4, String paramString5)
  {
    this.zzFG = paramInt1;
    this.zzaeO = paramString1;
    this.zzSJ = paramString2;
    this.zzacc = paramUri1;
    this.zzacd = paramUri2;
    this.zzrX = paramInt2;
    this.zzadN = paramString3;
    this.zzajD = paramBoolean;
    this.zzadf = paramPlayerEntity;
    this.zzIM = paramInt3;
    this.zzajE = paramParticipantResult;
    this.zzacn = paramString4;
    this.zzaco = paramString5;
  }

  public ParticipantEntity(Participant paramParticipant)
  {
    this.zzFG = 3;
    this.zzaeO = paramParticipant.getParticipantId();
    this.zzSJ = paramParticipant.getDisplayName();
    this.zzacc = paramParticipant.getIconImageUri();
    this.zzacd = paramParticipant.getHiResImageUri();
    this.zzrX = paramParticipant.getStatus();
    this.zzadN = paramParticipant.zznl();
    this.zzajD = paramParticipant.isConnectedToRoom();
    Player localPlayer = paramParticipant.getPlayer();
    if (localPlayer == null);
    for (PlayerEntity localPlayerEntity = null; ; localPlayerEntity = new PlayerEntity(localPlayer))
    {
      this.zzadf = localPlayerEntity;
      this.zzIM = paramParticipant.getCapabilities();
      this.zzajE = paramParticipant.getResult();
      this.zzacn = paramParticipant.getIconImageUrl();
      this.zzaco = paramParticipant.getHiResImageUrl();
      return;
    }
  }

  static int zza(Participant paramParticipant)
  {
    Object[] arrayOfObject = new Object[10];
    arrayOfObject[0] = paramParticipant.getPlayer();
    arrayOfObject[1] = Integer.valueOf(paramParticipant.getStatus());
    arrayOfObject[2] = paramParticipant.zznl();
    arrayOfObject[3] = Boolean.valueOf(paramParticipant.isConnectedToRoom());
    arrayOfObject[4] = paramParticipant.getDisplayName();
    arrayOfObject[5] = paramParticipant.getIconImageUri();
    arrayOfObject[6] = paramParticipant.getHiResImageUri();
    arrayOfObject[7] = Integer.valueOf(paramParticipant.getCapabilities());
    arrayOfObject[8] = paramParticipant.getResult();
    arrayOfObject[9] = paramParticipant.getParticipantId();
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Participant paramParticipant, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Participant))
      bool = false;
    Participant localParticipant;
    do
    {
      do
        return bool;
      while (paramParticipant == paramObject);
      localParticipant = (Participant)paramObject;
    }
    while ((zzw.equal(localParticipant.getPlayer(), paramParticipant.getPlayer())) && (zzw.equal(Integer.valueOf(localParticipant.getStatus()), Integer.valueOf(paramParticipant.getStatus()))) && (zzw.equal(localParticipant.zznl(), paramParticipant.zznl())) && (zzw.equal(Boolean.valueOf(localParticipant.isConnectedToRoom()), Boolean.valueOf(paramParticipant.isConnectedToRoom()))) && (zzw.equal(localParticipant.getDisplayName(), paramParticipant.getDisplayName())) && (zzw.equal(localParticipant.getIconImageUri(), paramParticipant.getIconImageUri())) && (zzw.equal(localParticipant.getHiResImageUri(), paramParticipant.getHiResImageUri())) && (zzw.equal(Integer.valueOf(localParticipant.getCapabilities()), Integer.valueOf(paramParticipant.getCapabilities()))) && (zzw.equal(localParticipant.getResult(), paramParticipant.getResult())) && (zzw.equal(localParticipant.getParticipantId(), paramParticipant.getParticipantId())));
    return false;
  }

  static String zzb(Participant paramParticipant)
  {
    return zzw.zzk(paramParticipant).zza("ParticipantId", paramParticipant.getParticipantId()).zza("Player", paramParticipant.getPlayer()).zza("Status", Integer.valueOf(paramParticipant.getStatus())).zza("ClientAddress", paramParticipant.zznl()).zza("ConnectedToRoom", Boolean.valueOf(paramParticipant.isConnectedToRoom())).zza("DisplayName", paramParticipant.getDisplayName()).zza("IconImage", paramParticipant.getIconImageUri()).zza("IconImageUrl", paramParticipant.getIconImageUrl()).zza("HiResImage", paramParticipant.getHiResImageUri()).zza("HiResImageUrl", paramParticipant.getHiResImageUrl()).zza("Capabilities", Integer.valueOf(paramParticipant.getCapabilities())).zza("Result", paramParticipant.getResult()).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Participant freeze()
  {
    return this;
  }

  public int getCapabilities()
  {
    return this.zzIM;
  }

  public String getDisplayName()
  {
    if (this.zzadf == null)
      return this.zzSJ;
    return this.zzadf.getDisplayName();
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    if (this.zzadf == null)
    {
      zzlw.zzb(this.zzSJ, paramCharArrayBuffer);
      return;
    }
    this.zzadf.getDisplayName(paramCharArrayBuffer);
  }

  public Uri getHiResImageUri()
  {
    if (this.zzadf == null)
      return this.zzacd;
    return this.zzadf.getHiResImageUri();
  }

  public String getHiResImageUrl()
  {
    if (this.zzadf == null)
      return this.zzaco;
    return this.zzadf.getHiResImageUrl();
  }

  public Uri getIconImageUri()
  {
    if (this.zzadf == null)
      return this.zzacc;
    return this.zzadf.getIconImageUri();
  }

  public String getIconImageUrl()
  {
    if (this.zzadf == null)
      return this.zzacn;
    return this.zzadf.getIconImageUrl();
  }

  public String getParticipantId()
  {
    return this.zzaeO;
  }

  public Player getPlayer()
  {
    return this.zzadf;
  }

  public ParticipantResult getResult()
  {
    return this.zzajE;
  }

  public int getStatus()
  {
    return this.zzrX;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isConnectedToRoom()
  {
    return this.zzajD;
  }

  public boolean isDataValid()
  {
    return true;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (!zziY())
    {
      ParticipantEntityCreator.zza(this, paramParcel, paramInt);
      return;
    }
    paramParcel.writeString(this.zzaeO);
    paramParcel.writeString(this.zzSJ);
    String str1;
    label39: String str2;
    label58: int i;
    label90: int j;
    if (this.zzacc == null)
    {
      str1 = null;
      paramParcel.writeString(str1);
      Uri localUri = this.zzacd;
      str2 = null;
      if (localUri != null)
        break label144;
      paramParcel.writeString(str2);
      paramParcel.writeInt(this.zzrX);
      paramParcel.writeString(this.zzadN);
      if (!this.zzajD)
        break label156;
      i = 1;
      paramParcel.writeInt(i);
      PlayerEntity localPlayerEntity = this.zzadf;
      j = 0;
      if (localPlayerEntity != null)
        break label162;
    }
    while (true)
    {
      paramParcel.writeInt(j);
      if (this.zzadf == null)
        break;
      this.zzadf.writeToParcel(paramParcel, paramInt);
      return;
      str1 = this.zzacc.toString();
      break label39;
      label144: str2 = this.zzacd.toString();
      break label58;
      label156: i = 0;
      break label90;
      label162: j = 1;
    }
  }

  public String zznl()
  {
    return this.zzadN;
  }

  static final class ParticipantEntityCreatorCompat extends ParticipantEntityCreator
  {
    public ParticipantEntity zzdf(Parcel paramParcel)
    {
      boolean bool1 = true;
      if ((ParticipantEntity.zzc(ParticipantEntity.zzmC())) || (ParticipantEntity.zzbN(ParticipantEntity.class.getCanonicalName())))
        return super.zzdf(paramParcel);
      String str1 = paramParcel.readString();
      String str2 = paramParcel.readString();
      String str3 = paramParcel.readString();
      Uri localUri1;
      String str4;
      Uri localUri2;
      label67: int i;
      String str5;
      boolean bool2;
      if (str3 == null)
      {
        localUri1 = null;
        str4 = paramParcel.readString();
        if (str4 != null)
          break label153;
        localUri2 = null;
        i = paramParcel.readInt();
        str5 = paramParcel.readString();
        if (paramParcel.readInt() <= 0)
          break label163;
        bool2 = bool1;
        label89: if (paramParcel.readInt() <= 0)
          break label169;
        label96: if (!bool1)
          break label174;
      }
      label153: label163: label169: label174: for (PlayerEntity localPlayerEntity = (PlayerEntity)PlayerEntity.CREATOR.createFromParcel(paramParcel); ; localPlayerEntity = null)
      {
        return new ParticipantEntity(3, str1, str2, localUri1, localUri2, i, str5, bool2, localPlayerEntity, 7, null, null, null);
        localUri1 = Uri.parse(str3);
        break;
        localUri2 = Uri.parse(str4);
        break label67;
        bool2 = false;
        break label89;
        bool1 = false;
        break label96;
      }
    }
  }
}