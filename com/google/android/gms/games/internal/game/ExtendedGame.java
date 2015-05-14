package com.google.android.gms.games.internal.game;

import android.os.Parcelable;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.snapshot.SnapshotMetadata;
import java.util.ArrayList;

public abstract interface ExtendedGame extends Parcelable, Freezable<ExtendedGame>
{
  public abstract Game getGame();

  public abstract ArrayList<GameBadge> zzoh();

  public abstract int zzoi();

  public abstract boolean zzoj();

  public abstract int zzok();

  public abstract long zzol();

  public abstract long zzom();

  public abstract String zzon();

  public abstract long zzoo();

  public abstract String zzop();

  public abstract SnapshotMetadata zzoq();
}