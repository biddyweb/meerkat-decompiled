package com.twitter.sdk.android.tweetcomposer;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.TextUtils;
import io.fabric.sdk.android.services.network.UrlUtils;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

public class TweetComposer$Builder
{
  private final Context context;
  private Uri imageUri;
  private String text;
  private URL url;

  public TweetComposer$Builder(Context paramContext)
  {
    if (paramContext == null)
      throw new IllegalArgumentException("Context must not be null.");
    this.context = paramContext;
  }

  public Intent createIntent()
  {
    Intent localIntent = createTwitterIntent();
    if (localIntent == null)
      localIntent = createWebIntent();
    return localIntent;
  }

  Intent createTwitterIntent()
  {
    Intent localIntent = new Intent("android.intent.action.SEND");
    StringBuilder localStringBuilder = new StringBuilder();
    if (!TextUtils.isEmpty(this.text))
      localStringBuilder.append(this.text);
    if (this.url != null)
    {
      if (localStringBuilder.length() > 0)
        localStringBuilder.append(' ');
      localStringBuilder.append(this.url.toString());
    }
    localIntent.putExtra("android.intent.extra.TEXT", localStringBuilder.toString());
    localIntent.setType("text/plain");
    if (this.imageUri != null)
    {
      localIntent.putExtra("android.intent.extra.STREAM", this.imageUri);
      localIntent.setType("image/jpeg");
    }
    Iterator localIterator = this.context.getPackageManager().queryIntentActivities(localIntent, 65536).iterator();
    while (localIterator.hasNext())
    {
      ResolveInfo localResolveInfo = (ResolveInfo)localIterator.next();
      if (localResolveInfo.activityInfo.packageName.startsWith("com.twitter.android"))
      {
        localIntent.setClassName(localResolveInfo.activityInfo.packageName, localResolveInfo.activityInfo.name);
        return localIntent;
      }
    }
    return null;
  }

  Intent createWebIntent()
  {
    if (this.url == null);
    for (String str = ""; ; str = this.url.toString())
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = UrlUtils.urlEncode(this.text);
      arrayOfObject[1] = UrlUtils.urlEncode(str);
      return new Intent("android.intent.action.VIEW", Uri.parse(String.format("https://twitter.com/intent/tweet?text=%s&url=%s", arrayOfObject)));
    }
  }

  public Builder image(Uri paramUri)
  {
    if (paramUri == null)
      throw new IllegalArgumentException("imageUri must not be null.");
    if (this.imageUri != null)
      throw new IllegalStateException("imageUri already set.");
    this.imageUri = paramUri;
    return this;
  }

  public void show()
  {
    Intent localIntent = createIntent();
    this.context.startActivity(localIntent);
  }

  public Builder text(String paramString)
  {
    if (paramString == null)
      throw new IllegalArgumentException("text must not be null.");
    if (this.text != null)
      throw new IllegalStateException("text already set.");
    this.text = paramString;
    return this;
  }

  public Builder url(URL paramURL)
  {
    if (paramURL == null)
      throw new IllegalArgumentException("url must not be null.");
    if (this.url != null)
      throw new IllegalStateException("url already set.");
    this.url = paramURL;
    return this;
  }
}