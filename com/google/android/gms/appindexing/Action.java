package com.google.android.gms.appindexing;

import android.net.Uri;
import android.os.Bundle;
import com.google.android.gms.common.internal.zzx;

public final class Action extends Thing
{
  public static final String STATUS_TYPE_ACTIVE = "http://schema.org/ActiveActionStatus";
  public static final String STATUS_TYPE_COMPLETED = "http://schema.org/CompletedActionStatus";
  public static final String STATUS_TYPE_FAILED = "http://schema.org/FailedActionStatus";
  public static final String TYPE_ADD = "http://schema.org/AddAction";
  public static final String TYPE_BOOKMARK = "http://schema.org/BookmarkAction";
  public static final String TYPE_LIKE = "http://schema.org/LikeAction";
  public static final String TYPE_LISTEN = "http://schema.org/ListenAction";
  public static final String TYPE_VIEW = "http://schema.org/ViewAction";
  public static final String TYPE_WANT = "http://schema.org/WantAction";
  public static final String TYPE_WATCH = "http://schema.org/WatchAction";

  private Action(Bundle paramBundle)
  {
    super(paramBundle);
  }

  public static Action newAction(String paramString1, String paramString2, Uri paramUri)
  {
    return newAction(paramString1, paramString2, null, paramUri);
  }

  public static Action newAction(String paramString1, String paramString2, Uri paramUri1, Uri paramUri2)
  {
    Builder localBuilder = new Builder(paramString1);
    Thing.Builder localBuilder1 = new Thing.Builder().setName(paramString2);
    if (paramUri1 == null);
    for (String str = null; ; str = paramUri1.toString())
      return localBuilder.setObject(localBuilder1.setId(str).setUrl(paramUri2).build()).build();
  }

  public static final class Builder extends Thing.Builder
  {
    public Builder(String paramString)
    {
      zzx.zzl(paramString);
      super.put("type", paramString);
    }

    public Action build()
    {
      zzx.zzb(this.zzGK.get("object"), "setObject is required before calling build().");
      zzx.zzb(this.zzGK.get("type"), "setType is required before calling build().");
      Bundle localBundle = (Bundle)this.zzGK.getParcelable("object");
      zzx.zzb(localBundle.get("name"), "Must call setObject() with a valid name. Example: setObject(new Thing.Builder().setName(name).setUrl(url))");
      zzx.zzb(localBundle.get("url"), "Must call setObject() with a valid app URI. Example: setObject(new Thing.Builder().setName(name).setUrl(url))");
      return new Action(this.zzGK, null);
    }

    public Builder put(String paramString, Thing paramThing)
    {
      return (Builder)super.put(paramString, paramThing);
    }

    public Builder put(String paramString1, String paramString2)
    {
      return (Builder)super.put(paramString1, paramString2);
    }

    public Builder setActionStatus(String paramString)
    {
      zzx.zzl(paramString);
      return (Builder)super.put("actionStatus", paramString);
    }

    public Builder setName(String paramString)
    {
      return (Builder)super.put("name", paramString);
    }

    public Builder setObject(Thing paramThing)
    {
      zzx.zzl(paramThing);
      return (Builder)super.put("object", paramThing);
    }

    public Builder setUrl(Uri paramUri)
    {
      if (paramUri != null)
        super.put("url", paramUri.toString());
      return this;
    }
  }
}