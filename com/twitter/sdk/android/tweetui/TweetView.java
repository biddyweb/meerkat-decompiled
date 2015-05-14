package com.twitter.sdk.android.tweetui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.models.User;

public class TweetView extends BaseTweetView
{
  private static final String VIEW_TYPE_NAME = "default";
  Button shareButton;

  public TweetView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  @TargetApi(11)
  public TweetView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public TweetView(Context paramContext, Tweet paramTweet)
  {
    super(paramContext, paramTweet);
  }

  public TweetView(Context paramContext, Tweet paramTweet, int paramInt)
  {
    super(paramContext, paramTweet, paramInt);
  }

  TweetView(Context paramContext, Tweet paramTweet, int paramInt, BaseTweetView.DependencyProvider paramDependencyProvider)
  {
    super(paramContext, paramTweet, paramInt, paramDependencyProvider);
  }

  private void setShareButtonGone()
  {
    this.shareButton.setVisibility(8);
    int i = (int)getResources().getDimension(R.dimen.tw__tweet_container_padding_bottom);
    this.containerView.setPadding(this.containerView.getPaddingLeft(), this.containerView.getPaddingTop(), this.containerView.getPaddingRight(), i);
  }

  private void setShareButtonVisibility(Tweet paramTweet)
  {
    if (TweetUtils.isTweetResolvable(paramTweet))
    {
      setShareButtonVisible();
      this.shareButton.setOnClickListener(new OnShareButtonClickListener(paramTweet));
      return;
    }
    setShareButtonGone();
    this.shareButton.setOnClickListener(null);
  }

  private void setShareButtonVisible()
  {
    this.shareButton.setVisibility(0);
    this.containerView.setPadding(this.containerView.getPaddingLeft(), this.containerView.getPaddingTop(), this.containerView.getPaddingRight(), 0);
    int i = (int)getResources().getDimension(R.dimen.tw__tweet_share_margin_left);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(this.shareButton.getLayoutParams());
    localLayoutParams.addRule(3, R.id.tw__tweet_text);
    int j = (int)getResources().getDimension(R.dimen.tw__tweet_share_extra_bottom_margin);
    if (TextUtils.isEmpty(this.contentView.getText()))
    {
      localLayoutParams.setMargins(i, (int)getResources().getDimension(R.dimen.tw__tweet_share_extra_top_margin), 0, j);
      this.shareButton.setLayoutParams(localLayoutParams);
    }
    while (true)
    {
      this.shareButton.requestLayout();
      return;
      localLayoutParams.setMargins(i, 0, 0, j);
      this.shareButton.setLayoutParams(localLayoutParams);
    }
  }

  private void setVerifiedCheck(Tweet paramTweet)
  {
    if ((paramTweet != null) && (paramTweet.user != null) && (paramTweet.user.verified))
    {
      this.verifiedCheckView.setVisibility(0);
      return;
    }
    this.verifiedCheckView.setVisibility(8);
  }

  protected void applyStyles()
  {
    super.applyStyles();
    this.shareButton.setTextColor(this.actionColor);
  }

  void findSubviews()
  {
    super.findSubviews();
    this.mediaPhotoView = ((ImageView)findViewById(R.id.tw__tweet_media));
    this.shareButton = ((Button)findViewById(R.id.tw__tweet_share));
  }

  protected int getLayout()
  {
    return R.layout.tw__tweet;
  }

  String getViewTypeName()
  {
    return "default";
  }

  void render()
  {
    super.render();
    setVerifiedCheck(this.tweet);
    setShareButtonVisibility(this.tweet);
  }
}