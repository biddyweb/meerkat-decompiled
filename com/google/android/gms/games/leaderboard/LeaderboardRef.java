package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameRef;
import java.util.ArrayList;

public final class LeaderboardRef extends zzd
  implements Leaderboard
{
  private final int zzadF;
  private final Game zzaiU;

  LeaderboardRef(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    super(paramDataHolder, paramInt1);
    this.zzadF = paramInt2;
    this.zzaiU = new GameRef(paramDataHolder, paramInt1);
  }

  public boolean equals(Object paramObject)
  {
    return LeaderboardEntity.zza(this, paramObject);
  }

  public String getDisplayName()
  {
    return getString("name");
  }

  public void getDisplayName(CharArrayBuffer paramCharArrayBuffer)
  {
    zza("name", paramCharArrayBuffer);
  }

  public Game getGame()
  {
    return this.zzaiU;
  }

  public Uri getIconImageUri()
  {
    return zzbb("board_icon_image_uri");
  }

  public String getIconImageUrl()
  {
    return getString("board_icon_image_url");
  }

  public String getLeaderboardId()
  {
    return getString("external_leaderboard_id");
  }

  public int getScoreOrder()
  {
    return getInteger("score_order");
  }

  public ArrayList<LeaderboardVariant> getVariants()
  {
    ArrayList localArrayList = new ArrayList(this.zzadF);
    for (int i = 0; i < this.zzadF; i++)
      localArrayList.add(new LeaderboardVariantRef(this.zzMd, i + this.zzNQ));
    return localArrayList;
  }

  public int hashCode()
  {
    return LeaderboardEntity.zza(this);
  }

  public String toString()
  {
    return LeaderboardEntity.zzb(this);
  }

  public Leaderboard zzoP()
  {
    return new LeaderboardEntity(this);
  }
}