package com.google.android.gms.games.internal.game;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameRef;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import com.google.android.gms.games.snapshot.SnapshotMetadataRef;
import java.util.ArrayList;

public class ExtendedGameRef extends zzd
  implements ExtendedGame
{
  private final int zzadF;
  private final GameRef zzahU;
  private final SnapshotMetadataRef zzaig;

  ExtendedGameRef(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    super(paramDataHolder, paramInt1);
    this.zzahU = new GameRef(paramDataHolder, paramInt1);
    this.zzadF = paramInt2;
    if ((zzba("external_snapshot_id")) && (!zzbc("external_snapshot_id")))
    {
      this.zzaig = new SnapshotMetadataRef(paramDataHolder, paramInt1);
      return;
    }
    this.zzaig = null;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    return ExtendedGameEntity.zza(this, paramObject);
  }

  public Game getGame()
  {
    return this.zzahU;
  }

  public int hashCode()
  {
    return ExtendedGameEntity.zza(this);
  }

  public String toString()
  {
    return ExtendedGameEntity.zzb(this);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    ((ExtendedGameEntity)zzos()).writeToParcel(paramParcel, paramInt);
  }

  public ArrayList<GameBadge> zzoh()
  {
    int i = 0;
    if (this.zzMd.zzc("badge_title", this.zzNQ, this.zzMd.zzax(this.zzNQ)) == null)
      return new ArrayList(0);
    ArrayList localArrayList = new ArrayList(this.zzadF);
    while (i < this.zzadF)
    {
      localArrayList.add(new GameBadgeRef(this.zzMd, i + this.zzNQ));
      i++;
    }
    return localArrayList;
  }

  public int zzoi()
  {
    return getInteger("availability");
  }

  public boolean zzoj()
  {
    return getBoolean("owned");
  }

  public int zzok()
  {
    return getInteger("achievement_unlocked_count");
  }

  public long zzol()
  {
    return getLong("last_played_server_time");
  }

  public long zzom()
  {
    return getLong("price_micros");
  }

  public String zzon()
  {
    return getString("formatted_price");
  }

  public long zzoo()
  {
    return getLong("full_price_micros");
  }

  public String zzop()
  {
    return getString("formatted_full_price");
  }

  public SnapshotMetadata zzoq()
  {
    return this.zzaig;
  }

  public ExtendedGame zzos()
  {
    return new ExtendedGameEntity(this);
  }
}