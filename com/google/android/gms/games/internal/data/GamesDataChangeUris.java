package com.google.android.gms.games.internal.data;

import android.net.Uri;
import android.net.Uri.Builder;

public final class GamesDataChangeUris
{
  private static final Uri zzahK = Uri.parse("content://com.google.android.gms.games/").buildUpon().appendPath("data_change").build();
  public static final Uri zzahL = zzahK.buildUpon().appendPath("invitations").build();
  public static final Uri zzahM = zzahK.buildUpon().appendEncodedPath("players").build();
}