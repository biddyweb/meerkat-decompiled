package com.twitter.sdk.android.tweetui;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.models.User;

class OnShareButtonClickListener
  implements View.OnClickListener
{
  final Tweet tweet;

  OnShareButtonClickListener(Tweet paramTweet)
  {
    this.tweet = paramTweet;
  }

  String getShareContent(Resources paramResources)
  {
    int i = R.string.tw__share_content_format;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.tweet.user.screenName;
    arrayOfObject[1] = Long.valueOf(this.tweet.id);
    return paramResources.getString(i, arrayOfObject);
  }

  Intent getShareIntent(String paramString1, String paramString2)
  {
    Intent localIntent = new Intent();
    localIntent.setAction("android.intent.action.SEND");
    localIntent.putExtra("android.intent.extra.SUBJECT", paramString1);
    localIntent.putExtra("android.intent.extra.TEXT", paramString2);
    localIntent.setType("text/plain");
    return localIntent;
  }

  String getShareSubject(Resources paramResources)
  {
    int i = R.string.tw__share_subject_format;
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.tweet.user.name;
    arrayOfObject[1] = this.tweet.user.screenName;
    return paramResources.getString(i, arrayOfObject);
  }

  void launchShareIntent(Intent paramIntent, Context paramContext)
  {
    paramContext.startActivity(paramIntent);
  }

  void onClick(Context paramContext, Resources paramResources)
  {
    if ((this.tweet == null) || (this.tweet.user == null))
      return;
    launchShareIntent(Intent.createChooser(getShareIntent(getShareSubject(paramResources), getShareContent(paramResources)), paramResources.getString(R.string.tw__share_tweet)), paramContext);
  }

  public void onClick(View paramView)
  {
    onClick(paramView.getContext(), paramView.getResources());
  }
}