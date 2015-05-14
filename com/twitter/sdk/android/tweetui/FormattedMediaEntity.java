package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.models.MediaEntity;

class FormattedMediaEntity extends FormattedUrlEntity
{
  final String mediaUrlHttps;
  final String type;

  FormattedMediaEntity(MediaEntity paramMediaEntity)
  {
    super(paramMediaEntity);
    this.type = paramMediaEntity.type;
    this.mediaUrlHttps = paramMediaEntity.mediaUrlHttps;
  }
}