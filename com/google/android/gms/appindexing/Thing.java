package com.google.android.gms.appindexing;

import android.net.Uri;
import android.os.Bundle;
import com.google.android.gms.common.internal.zzx;

public class Thing
{
  final Bundle zzGJ;

  Thing(Bundle paramBundle)
  {
    this.zzGJ = paramBundle;
  }

  public Bundle zzgZ()
  {
    return this.zzGJ;
  }

  public static class Builder
  {
    final Bundle zzGK = new Bundle();

    public Thing build()
    {
      return new Thing(this.zzGK);
    }

    public Builder put(String paramString, Thing paramThing)
    {
      zzx.zzl(paramString);
      if (paramThing != null)
        this.zzGK.putParcelable(paramString, paramThing.zzGJ);
      return this;
    }

    public Builder put(String paramString1, String paramString2)
    {
      zzx.zzl(paramString1);
      if (paramString2 != null)
        this.zzGK.putString(paramString1, paramString2);
      return this;
    }

    public Builder setDescription(String paramString)
    {
      put("description", paramString);
      return this;
    }

    public Builder setId(String paramString)
    {
      if (paramString != null)
        put("id", paramString);
      return this;
    }

    public Builder setName(String paramString)
    {
      zzx.zzl(paramString);
      put("name", paramString);
      return this;
    }

    public Builder setType(String paramString)
    {
      put("type", paramString);
      return this;
    }

    public Builder setUrl(Uri paramUri)
    {
      zzx.zzl(paramUri);
      put("url", paramUri.toString());
      return this;
    }
  }
}