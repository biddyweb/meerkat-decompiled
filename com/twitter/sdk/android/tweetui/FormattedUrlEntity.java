package com.twitter.sdk.android.tweetui;

import com.twitter.sdk.android.core.models.UrlEntity;

class FormattedUrlEntity
{
  final String displayUrl;
  int end;
  int start;
  final String url;

  FormattedUrlEntity(UrlEntity paramUrlEntity)
  {
    this.start = paramUrlEntity.getStart();
    this.end = paramUrlEntity.getEnd();
    this.displayUrl = paramUrlEntity.displayUrl;
    this.url = paramUrlEntity.url;
  }
}