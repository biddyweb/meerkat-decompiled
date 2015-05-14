package com.twitter.sdk.android.tweetui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.squareup.picasso.Callback;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestCreator;
import com.twitter.cobalt.metrics.MetricsManager;
import com.twitter.sdk.android.core.TwitterException;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace;
import com.twitter.sdk.android.core.internal.scribe.EventNamespace.Builder;
import com.twitter.sdk.android.core.models.MediaEntity;
import com.twitter.sdk.android.core.models.Tweet;
import com.twitter.sdk.android.core.models.TweetBuilder;
import com.twitter.sdk.android.core.models.User;
import com.twitter.sdk.android.tweetui.internal.TweetViewMetric;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.text.DateFormat;
import java.util.Date;

public abstract class BaseTweetView extends LinearLayout
{
  private static final int DEFAULT_STYLE = 0;
  private static final String EMPTY_STRING = "";
  static final long INVALID_ID = -1L;
  static final double MEDIA_BG_DARK_OPACITY = 0.12D;
  static final double MEDIA_BG_LIGHT_OPACITY = 0.08D;
  private static final String SCRIBE_CLICK_ACTION = "click";
  private static final String SCRIBE_IMPRESSION_ACTION = "impression";
  static final double SECONDARY_TEXT_COLOR_DARK_OPACITY = 0.35D;
  static final double SECONDARY_TEXT_COLOR_LIGHT_OPACITY = 0.4D;
  private static final String SYNDICATED_SDK_IMPRESSION_COMPONENT = "";
  private static final String SYNDICATED_SDK_IMPRESSION_ELEMENT = "";
  private static final String SYNDICATED_SDK_IMPRESSION_PAGE = "tweet";
  private static final String TAG = "TweetUi";
  private static final String TFW_CLIENT_EVENT_ELEMENT = "";
  private static final String TFW_CLIENT_EVENT_PAGE = "android";
  private static final String TFW_CLIENT_EVENT_SECTION = "tweet";
  int actionColor;
  ImageView avatarView;
  int birdLogoResId;
  int containerBgColor;
  RelativeLayout containerView;
  TextView contentView;
  final DependencyProvider dependencyProvider;
  TextView fullNameView;
  private LinkClickListener linkClickListener;
  ColorDrawable mediaBg;
  int mediaBgColor;
  ImageView mediaPhotoView;
  private Uri permalinkUri;
  int photoErrorResId;
  int primaryTextColor;
  TextView screenNameView;
  int secondaryTextColor;
  TextView timestampView;
  Tweet tweet;
  private TweetViewMetric tweetViewMetric;
  ImageView twitterLogoView;
  ImageView verifiedCheckView;

  public BaseTweetView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, new DependencyProvider());
  }

  public BaseTweetView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, new DependencyProvider());
  }

  @TargetApi(11)
  BaseTweetView(Context paramContext, AttributeSet paramAttributeSet, int paramInt, DependencyProvider paramDependencyProvider)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.dependencyProvider = paramDependencyProvider;
    initXmlAttributes(paramContext, paramAttributeSet);
    inflateView(paramContext);
  }

  BaseTweetView(Context paramContext, AttributeSet paramAttributeSet, DependencyProvider paramDependencyProvider)
  {
    super(paramContext, paramAttributeSet);
    this.dependencyProvider = paramDependencyProvider;
    initXmlAttributes(paramContext, paramAttributeSet);
    inflateView(paramContext);
  }

  BaseTweetView(Context paramContext, Tweet paramTweet)
  {
    this(paramContext, paramTweet, DEFAULT_STYLE);
  }

  BaseTweetView(Context paramContext, Tweet paramTweet, int paramInt)
  {
    this(paramContext, paramTweet, paramInt, new DependencyProvider());
  }

  BaseTweetView(Context paramContext, Tweet paramTweet, int paramInt, DependencyProvider paramDependencyProvider)
  {
    super(paramContext, null);
    this.dependencyProvider = paramDependencyProvider;
    initAttributes(paramInt);
    inflateView(paramContext);
    findSubviews();
    applyStyles();
    if (!isTweetUiEnabled())
      return;
    initComponents();
    setTweet(paramTweet);
  }

  private void inflateView(Context paramContext)
  {
    View localView = LayoutInflater.from(paramContext).inflate(getLayout(), null, false);
    localView.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
    addView(localView);
  }

  private void initAttributes(int paramInt)
  {
    TypedArray localTypedArray = getContext().getTheme().obtainStyledAttributes(paramInt, R.styleable.tw__TweetView);
    try
    {
      setStyleAttributes(localTypedArray);
      return;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }

  private void initComponents()
  {
    this.tweetViewMetric = getTweetViewMetric(this.dependencyProvider.getMetricsManager());
  }

  private void initXmlAttributes(Context paramContext, AttributeSet paramAttributeSet)
  {
    if (paramAttributeSet == null)
      return;
    TypedArray localTypedArray = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.tw__TweetView, 0, 0);
    try
    {
      setXmlDataAttributes(localTypedArray);
      setStyleAttributes(localTypedArray);
      return;
    }
    finally
    {
      localTypedArray.recycle();
    }
  }

  private void loadTweet()
  {
    LoadCallback local1 = new LoadCallback()
    {
      public void failure(TwitterException paramAnonymousTwitterException)
      {
        Logger localLogger = Fabric.getLogger();
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Long.valueOf(this.val$tweetId);
        localLogger.d("TweetUi", String.format("loadTweet failure for Tweet Id %d.", arrayOfObject));
      }

      public void success(Tweet paramAnonymousTweet)
      {
        BaseTweetView.this.setTweet(paramAnonymousTweet);
      }
    };
    this.dependencyProvider.getTweetUi().getTweetRepository().loadTweet(getTweetId(), local1);
  }

  private void setName(Tweet paramTweet)
  {
    if ((paramTweet != null) && (paramTweet.user != null))
    {
      this.fullNameView.setText(Utils.stringOrEmpty(paramTweet.user.name));
      return;
    }
    this.fullNameView.setText("");
  }

  private void setPermalinkLauncher()
  {
    PermalinkClickListener localPermalinkClickListener = new PermalinkClickListener();
    setOnClickListener(localPermalinkClickListener);
    this.contentView.setOnClickListener(localPermalinkClickListener);
  }

  private void setScreenName(Tweet paramTweet)
  {
    if ((paramTweet != null) && (paramTweet.user != null))
    {
      this.screenNameView.setText(UserUtils.formatScreenName(Utils.stringOrEmpty(paramTweet.user.screenName)));
      return;
    }
    this.screenNameView.setText("");
  }

  private void setStyleAttributes(TypedArray paramTypedArray)
  {
    int i = -16777216;
    this.containerBgColor = paramTypedArray.getColor(R.styleable.tw__TweetView_tw__container_bg_color, getResources().getColor(R.color.tw__tweet_light_container_bg_color));
    this.primaryTextColor = paramTypedArray.getColor(R.styleable.tw__TweetView_tw__primary_text_color, getResources().getColor(R.color.tw__tweet_light_primary_text_color));
    this.actionColor = paramTypedArray.getColor(R.styleable.tw__TweetView_tw__action_color, getResources().getColor(R.color.tw__tweet_action_color));
    boolean bool = ColorUtils.isLightColor(this.containerBgColor);
    double d1;
    label102: int j;
    label109: double d2;
    if (bool)
    {
      this.photoErrorResId = R.drawable.tw__ic_tweet_photo_error_light;
      this.birdLogoResId = R.drawable.tw__ic_logo_blue;
      if (!bool)
        break label184;
      d1 = 0.4D;
      if (!bool)
        break label192;
      j = -1;
      this.secondaryTextColor = ColorUtils.calculateOpacityTransform(d1, j, this.primaryTextColor);
      if (!bool)
        break label198;
      d2 = 0.08D;
      label133: if (!bool)
        break label206;
    }
    while (true)
    {
      this.mediaBgColor = ColorUtils.calculateOpacityTransform(d2, i, this.containerBgColor);
      this.mediaBg = new ColorDrawable(this.mediaBgColor);
      return;
      this.photoErrorResId = R.drawable.tw__ic_tweet_photo_error_dark;
      this.birdLogoResId = R.drawable.tw__ic_logo_white;
      break;
      label184: d1 = 0.35D;
      break label102;
      label192: j = i;
      break label109;
      label198: d2 = 0.12D;
      break label133;
      label206: i = -1;
    }
  }

  @TargetApi(16)
  private void setText(Tweet paramTweet)
  {
    this.contentView.setMovementMethod(LinkMovementMethod.getInstance());
    this.contentView.setFocusable(false);
    if (Build.VERSION.SDK_INT >= 16)
      this.contentView.setImportantForAccessibility(2);
    CharSequence localCharSequence = Utils.charSeqOrEmpty(getLinkifiedText(paramTweet));
    if (!TextUtils.isEmpty(localCharSequence))
    {
      this.contentView.setText(localCharSequence);
      this.contentView.setVisibility(0);
      return;
    }
    this.contentView.setText("");
    this.contentView.setVisibility(8);
  }

  private void setTimestamp(Tweet paramTweet)
  {
    Long localLong;
    if ((paramTweet != null) && (paramTweet.createdAt != null) && (TweetDateUtils.isValidTimestamp(paramTweet.createdAt)))
      localLong = Long.valueOf(TweetDateUtils.apiTimeToLong(paramTweet.createdAt));
    for (String str = TweetDateUtils.dotPrefix(TweetDateUtils.getRelativeTimeString(getResources(), System.currentTimeMillis(), localLong.longValue())); ; str = "")
    {
      this.timestampView.setText(str);
      return;
    }
  }

  private void setXmlDataAttributes(TypedArray paramTypedArray)
  {
    long l = Utils.numberOrDefault(paramTypedArray.getString(R.styleable.tw__TweetView_tw__tweet_id), -1L).longValue();
    if (l <= 0L)
      throw new IllegalArgumentException("Invalid tw__tweet_id");
    setPermalinkUri(null, Long.valueOf(l));
    this.tweet = new TweetBuilder().setId(l).build();
  }

  protected void applyStyles()
  {
    this.containerView.setBackgroundColor(this.containerBgColor);
    this.avatarView.setImageDrawable(this.mediaBg);
    this.mediaPhotoView.setImageDrawable(this.mediaBg);
    this.fullNameView.setTextColor(this.primaryTextColor);
    this.screenNameView.setTextColor(this.secondaryTextColor);
    this.contentView.setTextColor(this.primaryTextColor);
    this.timestampView.setTextColor(this.secondaryTextColor);
    this.twitterLogoView.setImageResource(this.birdLogoResId);
  }

  @TargetApi(16)
  protected void clearMediaBackground()
  {
    if (Build.VERSION.SDK_INT >= 16)
    {
      this.mediaPhotoView.setBackground(null);
      return;
    }
    this.mediaPhotoView.setBackgroundDrawable(null);
  }

  void findSubviews()
  {
    this.containerView = ((RelativeLayout)findViewById(R.id.tw__tweet_view));
    this.avatarView = ((ImageView)findViewById(R.id.tw__tweet_author_avatar));
    this.fullNameView = ((TextView)findViewById(R.id.tw__tweet_author_full_name));
    this.screenNameView = ((TextView)findViewById(R.id.tw__tweet_author_screen_name));
    this.verifiedCheckView = ((ImageView)findViewById(R.id.tw__tweet_author_verified));
    this.mediaPhotoView = ((ImageView)findViewById(R.id.tw__tweet_media));
    this.contentView = ((TextView)findViewById(R.id.tw__tweet_text));
    this.timestampView = ((TextView)findViewById(R.id.tw__tweet_timestamp));
    this.twitterLogoView = ((ImageView)findViewById(R.id.tw__twitter_logo));
  }

  abstract int getLayout();

  protected LinkClickListener getLinkClickListener()
  {
    if (this.linkClickListener == null)
      this.linkClickListener = new LinkClickListener()
      {
        public void onPhotoClicked(MediaEntity paramAnonymousMediaEntity)
        {
        }

        public void onUrlClicked(String paramAnonymousString)
        {
          if (TextUtils.isEmpty(paramAnonymousString))
            return;
          Intent localIntent = new Intent("android.intent.action.VIEW", Uri.parse(paramAnonymousString));
          BaseTweetView.this.getContext().startActivity(localIntent);
        }
      };
    return this.linkClickListener;
  }

  protected CharSequence getLinkifiedText(Tweet paramTweet)
  {
    FormattedTweetText localFormattedTweetText = this.dependencyProvider.getTweetUi().getTweetRepository().formatTweetText(paramTweet);
    if (localFormattedTweetText == null)
      return null;
    boolean bool = TweetTextUtils.hasPhotoUrl(paramTweet.entities);
    return TweetTextLinkifier.linkifyUrls(localFormattedTweetText, getLinkClickListener(), bool, this.actionColor);
  }

  Uri getPermalinkUri()
  {
    return this.permalinkUri;
  }

  EventNamespace getSyndicatedSdkClickNamespace()
  {
    return new EventNamespace.Builder().setClient("android").setPage("tweet").setSection(getViewTypeName()).setComponent("").setElement("").setAction("click").builder();
  }

  EventNamespace getSyndicatedSdkImpressionNamespace()
  {
    return new EventNamespace.Builder().setClient("android").setPage("tweet").setSection(getViewTypeName()).setComponent("").setElement("").setAction("impression").builder();
  }

  EventNamespace getTfwEventClickNamespace()
  {
    return new EventNamespace.Builder().setClient("tfw").setPage("android").setSection("tweet").setComponent(getViewTypeName()).setElement("").setAction("click").builder();
  }

  EventNamespace getTfwEventImpressionNamespace()
  {
    return new EventNamespace.Builder().setClient("tfw").setPage("android").setSection("tweet").setComponent(getViewTypeName()).setElement("").setAction("impression").builder();
  }

  public Tweet getTweet()
  {
    return this.tweet;
  }

  public long getTweetId()
  {
    if (this.tweet == null)
      return -1L;
    return this.tweet.id;
  }

  TweetViewMetric getTweetViewMetric(MetricsManager paramMetricsManager)
  {
    return new TweetViewMetric(paramMetricsManager);
  }

  abstract String getViewTypeName();

  boolean isTweetUiEnabled()
  {
    if (isInEditMode())
      return false;
    try
    {
      this.dependencyProvider.getTweetUi();
      return true;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Fabric.getLogger().e("TweetUi", localIllegalStateException.getMessage());
      setEnabled(false);
    }
    return false;
  }

  void launchPermalink()
  {
    Intent localIntent = new Intent("android.intent.action.VIEW", getPermalinkUri());
    getContext().startActivity(localIntent);
  }

  protected void onFinishInflate()
  {
    super.onFinishInflate();
    if (!isTweetUiEnabled())
      return;
    initComponents();
    findSubviews();
    applyStyles();
    loadTweet();
  }

  void render()
  {
    this.tweetViewMetric.start();
    setProfilePhotoView(this.tweet);
    setName(this.tweet);
    setScreenName(this.tweet);
    setTimestamp(this.tweet);
    setTweetPhoto(this.tweet);
    setText(this.tweet);
    setContentDescription(this.tweet);
    if (TweetUtils.isTweetResolvable(this.tweet))
      setPermalinkUri(this.tweet.user.screenName, Long.valueOf(getTweetId()));
    while (true)
    {
      setPermalinkLauncher();
      scribeImpression();
      this.tweetViewMetric.finishRender();
      return;
      this.permalinkUri = null;
    }
  }

  void scribeImpression()
  {
    TweetUi localTweetUi = this.dependencyProvider.getTweetUi();
    EventNamespace[] arrayOfEventNamespace = new EventNamespace[2];
    arrayOfEventNamespace[0] = getTfwEventImpressionNamespace();
    arrayOfEventNamespace[1] = getSyndicatedSdkImpressionNamespace();
    localTweetUi.scribe(arrayOfEventNamespace);
  }

  void scribePermalinkClick()
  {
    TweetUi localTweetUi = this.dependencyProvider.getTweetUi();
    EventNamespace[] arrayOfEventNamespace = new EventNamespace[2];
    arrayOfEventNamespace[0] = getTfwEventClickNamespace();
    arrayOfEventNamespace[1] = getSyndicatedSdkClickNamespace();
    localTweetUi.scribe(arrayOfEventNamespace);
  }

  void setContentDescription(Tweet paramTweet)
  {
    if (!TweetUtils.isTweetResolvable(paramTweet))
    {
      setContentDescription(getResources().getString(R.string.tw__loading_tweet));
      return;
    }
    FormattedTweetText localFormattedTweetText = this.dependencyProvider.getTweetUi().getTweetRepository().formatTweetText(paramTweet);
    String str1 = null;
    if (localFormattedTweetText != null)
      str1 = localFormattedTweetText.text;
    long l = TweetDateUtils.apiTimeToLong(paramTweet.createdAt);
    boolean bool = l < -1L;
    String str2 = null;
    if (bool)
      str2 = DateFormat.getDateInstance().format(new Date(l));
    Resources localResources = getResources();
    int i = R.string.tw__tweet_content_description;
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Utils.stringOrEmpty(paramTweet.user.name);
    arrayOfObject[1] = Utils.stringOrEmpty(str1);
    arrayOfObject[2] = Utils.stringOrEmpty(str2);
    setContentDescription(localResources.getString(i, arrayOfObject));
  }

  protected void setErrorImage()
  {
    Picasso localPicasso = this.dependencyProvider.getImageLoader();
    if (localPicasso == null)
      return;
    localPicasso.load(this.photoErrorResId).into(this.mediaPhotoView, new Callback()
    {
      public void onError()
      {
      }

      public void onSuccess()
      {
        BaseTweetView.this.mediaPhotoView.setBackgroundColor(BaseTweetView.this.mediaBgColor);
      }
    });
  }

  void setPermalinkUri(String paramString, Long paramLong)
  {
    if (paramLong.longValue() <= 0L)
      return;
    this.permalinkUri = TweetUtils.getPermalink(paramString, paramLong.longValue());
  }

  void setProfilePhotoView(Tweet paramTweet)
  {
    Picasso localPicasso = this.dependencyProvider.getImageLoader();
    if (localPicasso == null)
      return;
    if ((paramTweet == null) || (paramTweet.user == null));
    for (String str = null; ; str = UserUtils.getProfileImageUrlHttps(paramTweet.user, UserUtils.AvatarSize.REASONABLY_SMALL))
    {
      localPicasso.load(str).placeholder(this.mediaBg).into(this.avatarView);
      return;
    }
  }

  public void setTweet(Tweet paramTweet)
  {
    this.tweet = paramTweet;
    render();
  }

  protected void setTweetPhoto(MediaEntity paramMediaEntity)
  {
    Picasso localPicasso = this.dependencyProvider.getImageLoader();
    if (localPicasso == null)
      return;
    localPicasso.load(paramMediaEntity.mediaUrlHttps).placeholder(this.mediaBg).into(this.mediaPhotoView, new Callback()
    {
      public void onError()
      {
        BaseTweetView.this.setErrorImage();
      }

      public void onSuccess()
      {
      }
    });
  }

  final void setTweetPhoto(Tweet paramTweet)
  {
    clearMediaBackground();
    if ((paramTweet != null) && (TweetTextUtils.hasPhotoUrl(paramTweet.entities)))
    {
      MediaEntity localMediaEntity = TweetTextUtils.getLastPhotoEntity(paramTweet.entities);
      this.mediaPhotoView.setVisibility(0);
      setTweetPhoto(localMediaEntity);
      return;
    }
    this.mediaPhotoView.setVisibility(8);
  }

  static class DependencyProvider
  {
    Picasso getImageLoader()
    {
      return TweetUi.getInstance().getImageLoader();
    }

    MetricsManager getMetricsManager()
    {
      return TweetUi.getInstance().getMetricsManager();
    }

    TweetUi getTweetUi()
    {
      return TweetUi.getInstance();
    }
  }

  class PermalinkClickListener
    implements View.OnClickListener
  {
    PermalinkClickListener()
    {
    }

    public void onClick(View paramView)
    {
      if (BaseTweetView.this.getPermalinkUri() == null)
        return;
      BaseTweetView.this.scribePermalinkClick();
      BaseTweetView.this.launchPermalink();
    }
  }
}