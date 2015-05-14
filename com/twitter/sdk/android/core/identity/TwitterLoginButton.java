package com.twitter.sdk.android.core.identity;

import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.R.color;
import com.twitter.sdk.android.core.R.dimen;
import com.twitter.sdk.android.core.R.drawable;
import com.twitter.sdk.android.core.R.string;
import com.twitter.sdk.android.core.TwitterCore;
import com.twitter.sdk.android.core.TwitterSession;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.lang.ref.WeakReference;

public class TwitterLoginButton extends Button
{
  static final String ERROR_MSG_NO_ACTIVITY = "TwitterLoginButton requires an activity. Override getActivity to provide the activity for this button.";
  static final String TAG = "Twitter";
  final WeakReference<Activity> activityRef = new WeakReference(getActivity());
  volatile TwitterAuthClient authClient;
  Callback<TwitterSession> callback;
  View.OnClickListener onClickListener;

  public TwitterLoginButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public TwitterLoginButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 16842824);
  }

  public TwitterLoginButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    this(paramContext, paramAttributeSet, paramInt, null);
  }

  TwitterLoginButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt, TwitterAuthClient paramTwitterAuthClient)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.authClient = paramTwitterAuthClient;
    setupButton();
    checkTwitterCoreAndEnable();
  }

  private void checkTwitterCoreAndEnable()
  {
    if (isInEditMode())
      return;
    try
    {
      TwitterCore.getInstance();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      Fabric.getLogger().e("Twitter", localIllegalStateException.getMessage());
      setEnabled(false);
    }
  }

  @TargetApi(21)
  private void setupButton()
  {
    Resources localResources = getResources();
    super.setCompoundDrawablesWithIntrinsicBounds(localResources.getDrawable(R.drawable.tw__ic_logo_default), null, null, null);
    super.setCompoundDrawablePadding(localResources.getDimensionPixelSize(R.dimen.tw__login_btn_drawable_padding));
    super.setText(R.string.tw__login_btn_txt);
    super.setTextColor(localResources.getColor(R.color.tw__solid_white));
    super.setTextSize(0, localResources.getDimensionPixelSize(R.dimen.tw__login_btn_text_size));
    super.setTypeface(Typeface.DEFAULT_BOLD);
    super.setPadding(localResources.getDimensionPixelSize(R.dimen.tw__login_btn_left_padding), 0, localResources.getDimensionPixelSize(R.dimen.tw__login_btn_right_padding), 0);
    super.setBackgroundResource(R.drawable.tw__login_btn);
    super.setOnClickListener(new LoginClickListener(null));
    if (Build.VERSION.SDK_INT >= 21)
      super.setAllCaps(false);
  }

  protected Activity getActivity()
  {
    if ((getContext() instanceof Activity))
      return (Activity)getContext();
    if (isInEditMode())
      return null;
    throw new IllegalStateException("TwitterLoginButton requires an activity. Override getActivity to provide the activity for this button.");
  }

  public Callback<TwitterSession> getCallback()
  {
    return this.callback;
  }

  TwitterAuthClient getTwitterAuthClient()
  {
    if (this.authClient == null);
    try
    {
      if (this.authClient == null)
        this.authClient = new TwitterAuthClient();
      return this.authClient;
    }
    finally
    {
    }
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == getTwitterAuthClient().getRequestCode())
      getTwitterAuthClient().onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void setCallback(Callback<TwitterSession> paramCallback)
  {
    if (paramCallback == null)
      throw new IllegalArgumentException("Callback cannot be null");
    this.callback = paramCallback;
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.onClickListener = paramOnClickListener;
  }

  private class LoginClickListener
    implements View.OnClickListener
  {
    private LoginClickListener()
    {
    }

    private void checkActivity(Activity paramActivity)
    {
      if ((paramActivity == null) || (paramActivity.isFinishing()))
        CommonUtils.logOrThrowIllegalStateException("Twitter", "TwitterLoginButton requires an activity. Override getActivity to provide the activity for this button.");
    }

    private void checkCallback(Callback paramCallback)
    {
      if (paramCallback == null)
        CommonUtils.logOrThrowIllegalStateException("Twitter", "Callback must not be null, did you call setCallback?");
    }

    public void onClick(View paramView)
    {
      checkCallback(TwitterLoginButton.this.callback);
      checkActivity((Activity)TwitterLoginButton.this.activityRef.get());
      TwitterLoginButton.this.getTwitterAuthClient().authorize((Activity)TwitterLoginButton.this.activityRef.get(), TwitterLoginButton.this.callback);
      if (TwitterLoginButton.this.onClickListener != null)
        TwitterLoginButton.this.onClickListener.onClick(paramView);
    }
  }
}