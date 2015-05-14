package com.google.android.gms.games.appcontent;

import com.google.android.gms.common.api.Releasable;
import com.google.android.gms.common.api.Result;

public abstract interface AppContents
{
  public static abstract interface LoadAppContentResult extends Releasable, Result
  {
  }
}