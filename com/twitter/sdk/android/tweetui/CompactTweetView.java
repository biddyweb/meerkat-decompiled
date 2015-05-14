package com.twitter.sdk.android.tweetui;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
import android.widget.TextView;
import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestCreator;
import com.twitter.sdk.android.core.models.MediaEntity;
import com.twitter.sdk.android.core.models.Tweet;

public class CompactTweetView extends BaseTweetView
{
  private static final String VIEW_TYPE_NAME = "compact";

  public CompactTweetView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  @TargetApi(11)
  public CompactTweetView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public CompactTweetView(Context paramContext, Tweet paramTweet)
  {
    super(paramContext, paramTweet);
  }

  public CompactTweetView(Context paramContext, Tweet paramTweet, int paramInt)
  {
    super(paramContext, paramTweet, paramInt);
  }

  CompactTweetView(Context paramContext, Tweet paramTweet, int paramInt, BaseTweetView.DependencyProvider paramDependencyProvider)
  {
    super(paramContext, paramTweet, paramInt, paramDependencyProvider);
  }

  protected int getLayout()
  {
    return R.layout.tw__tweet_compact;
  }

  String getViewTypeName()
  {
    return "compact";
  }

  void render()
  {
    super.render();
    this.screenNameView.requestLayout();
  }

  protected void setTweetPhoto(MediaEntity paramMediaEntity)
  {
    Picasso localPicasso = this.dependencyProvider.getImageLoader();
    if (localPicasso == null)
      return;
    localPicasso.load(paramMediaEntity.mediaUrlHttps).placeholder(this.mediaBg).fit().centerCrop().into(this.mediaPhotoView, new Callback()
    {
      public void onError()
      {
        CompactTweetView.this.setErrorImage();
      }

      public void onSuccess()
      {
      }
    });
    this.mediaPhotoView.setVisibility(0);
  }
}