package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.models.MediaEntity;

abstract interface LinkClickListener
{
  public abstract void onPhotoClicked(MediaEntity paramMediaEntity);

  public abstract void onUrlClicked(String paramString);
}