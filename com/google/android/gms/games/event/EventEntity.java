package com.google.android.gms.games.event;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzw.zza;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.zzlw;

public final class EventEntity
  implements SafeParcelable, Event
{
  public static final EventEntityCreator CREATOR = new EventEntityCreator();
  private final String mName;
  private final int zzFG;
  private final String zzZO;
  private final Uri zzacc;
  private final String zzacn;
  private final String zzadJ;
  private final long zzadK;
  private final String zzadL;
  private final boolean zzadM;
  private final PlayerEntity zzadf;

  EventEntity(int paramInt, String paramString1, String paramString2, String paramString3, Uri paramUri, String paramString4, Player paramPlayer, long paramLong, String paramString5, boolean paramBoolean)
  {
    this.zzFG = paramInt;
    this.zzadJ = paramString1;
    this.mName = paramString2;
    this.zzZO = paramString3;
    this.zzacc = paramUri;
    this.zzacn = paramString4;
    this.zzadf = new PlayerEntity(paramPlayer);
    this.zzadK = paramLong;
    this.zzadL = paramString5;
    this.zzadM = paramBoolean;
  }

  public EventEntity(Event paramEvent)
  {
    this.zzFG = 1;
    this.zzadJ = paramEvent.getEventId();
    this.mName = paramEvent.getName();
    this.zzZO = paramEvent.getDescription();
    this.zzacc = paramEvent.getIconImageUri();
    this.zzacn = paramEvent.getIconImageUrl();
    this.zzadf = ((PlayerEntity)paramEvent.getPlayer().freeze());
    this.zzadK = paramEvent.getValue();
    this.zzadL = paramEvent.getFormattedValue();
    this.zzadM = paramEvent.isVisible();
  }

  static int zza(Event paramEvent)
  {
    Object[] arrayOfObject = new Object[9];
    arrayOfObject[0] = paramEvent.getEventId();
    arrayOfObject[1] = paramEvent.getName();
    arrayOfObject[2] = paramEvent.getDescription();
    arrayOfObject[3] = paramEvent.getIconImageUri();
    arrayOfObject[4] = paramEvent.getIconImageUrl();
    arrayOfObject[5] = paramEvent.getPlayer();
    arrayOfObject[6] = Long.valueOf(paramEvent.getValue());
    arrayOfObject[7] = paramEvent.getFormattedValue();
    arrayOfObject[8] = Boolean.valueOf(paramEvent.isVisible());
    return zzw.hashCode(arrayOfObject);
  }

  static boolean zza(Event paramEvent, Object paramObject)
  {
    boolean bool = true;
    if (!(paramObject instanceof Event))
      bool = false;
    Event localEvent;
    do
    {
      do
        return bool;
      while (paramEvent == paramObject);
      localEvent = (Event)paramObject;
    }
    while ((zzw.equal(localEvent.getEventId(), paramEvent.getEventId())) && (zzw.equal(localEvent.getName(), paramEvent.getName())) && (zzw.equal(localEvent.getDescription(), paramEvent.getDescription())) && (zzw.equal(localEvent.getIconImageUri(), paramEvent.getIconImageUri())) && (zzw.equal(localEvent.getIconImageUrl(), paramEvent.getIconImageUrl())) && (zzw.equal(localEvent.getPlayer(), paramEvent.getPlayer())) && (zzw.equal(Long.valueOf(localEvent.getValue()), Long.valueOf(paramEvent.getValue()))) && (zzw.equal(localEvent.getFormattedValue(), paramEvent.getFormattedValue())) && (zzw.equal(Boolean.valueOf(localEvent.isVisible()), Boolean.valueOf(paramEvent.isVisible()))));
    return false;
  }

  static String zzb(Event paramEvent)
  {
    return zzw.zzk(paramEvent).zza("Id", paramEvent.getEventId()).zza("Name", paramEvent.getName()).zza("Description", paramEvent.getDescription()).zza("IconImageUri", paramEvent.getIconImageUri()).zza("IconImageUrl", paramEvent.getIconImageUrl()).zza("Player", paramEvent.getPlayer()).zza("Value", Long.valueOf(paramEvent.getValue())).zza("FormattedValue", paramEvent.getFormattedValue()).zza("isVisible", Boolean.valueOf(paramEvent.isVisible())).toString();
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return zza(this, paramObject);
  }

  public Event freeze()
  {
    return this;
  }

  public String getDescription()
  {
    return this.zzZO;
  }

  public void getDescription(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzZO, paramCharArrayBuffer);
  }

  public String getEventId()
  {
    return this.zzadJ;
  }

  public String getFormattedValue()
  {
    return this.zzadL;
  }

  public void getFormattedValue(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.zzadL, paramCharArrayBuffer);
  }

  public Uri getIconImageUri()
  {
    return this.zzacc;
  }

  public String getIconImageUrl()
  {
    return this.zzacn;
  }

  public String getName()
  {
    return this.mName;
  }

  public void getName(CharArrayBuffer paramCharArrayBuffer)
  {
    zzlw.zzb(this.mName, paramCharArrayBuffer);
  }

  public Player getPlayer()
  {
    return this.zzadf;
  }

  public long getValue()
  {
    return this.zzadK;
  }

  public int getVersionCode()
  {
    return this.zzFG;
  }

  public int hashCode()
  {
    return zza(this);
  }

  public boolean isDataValid()
  {
    return true;
  }

  public boolean isVisible()
  {
    return this.zzadM;
  }

  public String toString()
  {
    return zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    EventEntityCreator.zza(this, paramParcel, paramInt);
  }
}