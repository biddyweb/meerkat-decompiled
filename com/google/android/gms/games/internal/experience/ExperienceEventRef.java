package com.google.android.gms.games.internal.experience;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzd;
import com.google.android.gms.games.GameRef;

public final class ExperienceEventRef extends zzd
  implements ExperienceEvent
{
  private final GameRef zzahU;

  public ExperienceEventRef(DataHolder paramDataHolder, int paramInt)
  {
    super(paramDataHolder, paramInt);
    if (zzbc("external_game_id"))
    {
      this.zzahU = null;
      return;
    }
    this.zzahU = new GameRef(this.zzMd, this.zzNQ);
  }

  public String getIconImageUrl()
  {
    return getString("icon_url");
  }
}