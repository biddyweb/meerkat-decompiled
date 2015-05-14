package com.mixpanel.android.mpmetrics;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Handler;
import android.util.TypedValue;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;
import android.widget.TextView;
import com.mixpanel.android.R.anim;
import com.mixpanel.android.R.id;
import com.mixpanel.android.R.layout;

@SuppressLint({"ClickableViewAccessibility"})
@TargetApi(16)
public class InAppFragment extends Fragment
{
  private static final String LOGTAG = "MixpanelAPI.InAppFragment";
  private static final int MINI_REMOVE_TIME = 10000;
  private boolean mCleanedUp;
  private GestureDetector mDetector;
  private Runnable mDisplayMini;
  private UpdateDisplayState.DisplayState.InAppNotificationState mDisplayState;
  private int mDisplayStateId;
  private Handler mHandler;
  private View mInAppView;
  private MixpanelAPI mMixpanel;
  private Activity mParent;
  private Runnable mRemover;

  private void cleanUp()
  {
    if (!this.mCleanedUp)
    {
      this.mHandler.removeCallbacks(this.mRemover);
      this.mHandler.removeCallbacks(this.mDisplayMini);
      UpdateDisplayState.releaseDisplayState(this.mDisplayStateId);
      this.mParent.getFragmentManager().beginTransaction().remove(this).commit();
    }
    this.mCleanedUp = true;
  }

  private void remove()
  {
    if ((this.mParent != null) && (!this.mCleanedUp))
    {
      this.mHandler.removeCallbacks(this.mRemover);
      this.mHandler.removeCallbacks(this.mDisplayMini);
      this.mParent.getFragmentManager().beginTransaction().setCustomAnimations(0, R.anim.com_mixpanel_android_slide_down).remove(this).commit();
      UpdateDisplayState.releaseDisplayState(this.mDisplayStateId);
      this.mCleanedUp = true;
    }
  }

  public void onAttach(Activity paramActivity)
  {
    super.onAttach(paramActivity);
    this.mParent = paramActivity;
    if (this.mDisplayState == null)
    {
      cleanUp();
      return;
    }
    this.mHandler = new Handler();
    this.mRemover = new Runnable()
    {
      public void run()
      {
        InAppFragment.this.remove();
      }
    };
    this.mDisplayMini = new Runnable()
    {
      public void run()
      {
        InAppFragment.this.mInAppView.setVisibility(0);
        InAppFragment.this.mInAppView.setBackgroundColor(InAppFragment.this.mDisplayState.getHighlightColor());
        InAppFragment.this.mInAppView.setOnTouchListener(new View.OnTouchListener()
        {
          public boolean onTouch(View paramAnonymous2View, MotionEvent paramAnonymous2MotionEvent)
          {
            return InAppFragment.this.mDetector.onTouchEvent(paramAnonymous2MotionEvent);
          }
        });
        ImageView localImageView = (ImageView)InAppFragment.this.mInAppView.findViewById(R.id.com_mixpanel_android_notification_image);
        float f = TypedValue.applyDimension(1, 75.0F, InAppFragment.this.mParent.getResources().getDisplayMetrics());
        TranslateAnimation localTranslateAnimation = new TranslateAnimation(0.0F, 0.0F, f, 0.0F);
        localTranslateAnimation.setInterpolator(new DecelerateInterpolator());
        localTranslateAnimation.setDuration(200L);
        InAppFragment.this.mInAppView.startAnimation(localTranslateAnimation);
        ScaleAnimation localScaleAnimation = new ScaleAnimation(0.0F, 1.0F, 0.0F, 1.0F, f / 2.0F, f / 2.0F);
        localScaleAnimation.setInterpolator(new InAppFragment.SineBounceInterpolator(InAppFragment.this));
        localScaleAnimation.setDuration(400L);
        localScaleAnimation.setStartOffset(200L);
        localImageView.startAnimation(localScaleAnimation);
      }
    };
    this.mDetector = new GestureDetector(paramActivity, new GestureDetector.OnGestureListener()
    {
      public boolean onDown(MotionEvent paramAnonymousMotionEvent)
      {
        return true;
      }

      public boolean onFling(MotionEvent paramAnonymousMotionEvent1, MotionEvent paramAnonymousMotionEvent2, float paramAnonymousFloat1, float paramAnonymousFloat2)
      {
        if (paramAnonymousFloat2 > 0.0F)
          InAppFragment.this.remove();
        return true;
      }

      public void onLongPress(MotionEvent paramAnonymousMotionEvent)
      {
      }

      public boolean onScroll(MotionEvent paramAnonymousMotionEvent1, MotionEvent paramAnonymousMotionEvent2, float paramAnonymousFloat1, float paramAnonymousFloat2)
      {
        return false;
      }

      public void onShowPress(MotionEvent paramAnonymousMotionEvent)
      {
      }

      // ERROR //
      public boolean onSingleTapUp(MotionEvent paramAnonymousMotionEvent)
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 17\011com/mixpanel/android/mpmetrics/InAppFragment$3:this$0\011Lcom/mixpanel/android/mpmetrics/InAppFragment;
        //   4: invokestatic 40\011com/mixpanel/android/mpmetrics/InAppFragment:access$200\011(Lcom/mixpanel/android/mpmetrics/InAppFragment;)Lcom/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState;
        //   7: invokevirtual 46\011com/mixpanel/android/mpmetrics/UpdateDisplayState$DisplayState$InAppNotificationState:getInAppNotification\011()Lcom/mixpanel/android/mpmetrics/InAppNotification;
        //   10: astore_2
        //   11: aload_2
        //   12: invokevirtual 52\011com/mixpanel/android/mpmetrics/InAppNotification:getCallToActionUrl\011()Ljava/lang/String;
        //   15: astore_3
        //   16: aload_3
        //   17: ifnull +59 -> 76
        //   20: aload_3
        //   21: invokevirtual 58\011java/lang/String:length\011()I
        //   24: ifle +52 -> 76
        //   27: aload_3
        //   28: invokestatic 64\011android/net/Uri:parse\011(Ljava/lang/String;)Landroid/net/Uri;
        //   31: astore 6
        //   33: new 66\011android/content/Intent
        //   36: dup
        //   37: ldc 68
        //   39: aload 6
        //   41: invokespecial 71\011android/content/Intent:<init>\011(Ljava/lang/String;Landroid/net/Uri;)V
        //   44: astore 7
        //   46: aload_0
        //   47: getfield 17\011com/mixpanel/android/mpmetrics/InAppFragment$3:this$0\011Lcom/mixpanel/android/mpmetrics/InAppFragment;
        //   50: invokestatic 75\011com/mixpanel/android/mpmetrics/InAppFragment:access$400\011(Lcom/mixpanel/android/mpmetrics/InAppFragment;)Landroid/app/Activity;
        //   53: aload 7
        //   55: invokevirtual 81\011android/app/Activity:startActivity\011(Landroid/content/Intent;)V
        //   58: aload_0
        //   59: getfield 17\011com/mixpanel/android/mpmetrics/InAppFragment$3:this$0\011Lcom/mixpanel/android/mpmetrics/InAppFragment;
        //   62: invokestatic 85\011com/mixpanel/android/mpmetrics/InAppFragment:access$500\011(Lcom/mixpanel/android/mpmetrics/InAppFragment;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
        //   65: invokevirtual 91\011com/mixpanel/android/mpmetrics/MixpanelAPI:getPeople\011()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
        //   68: ldc 93
        //   70: aload_2
        //   71: invokeinterface 99 3 0
        //   76: aload_0
        //   77: getfield 17\011com/mixpanel/android/mpmetrics/InAppFragment$3:this$0\011Lcom/mixpanel/android/mpmetrics/InAppFragment;
        //   80: invokestatic 27\011com/mixpanel/android/mpmetrics/InAppFragment:access$000\011(Lcom/mixpanel/android/mpmetrics/InAppFragment;)V
        //   83: iconst_1
        //   84: ireturn
        //   85: astore 4
        //   87: ldc 101
        //   89: ldc 103
        //   91: aload 4
        //   93: invokestatic 109\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        //   96: pop
        //   97: iconst_1
        //   98: ireturn
        //   99: astore 8
        //   101: ldc 101
        //   103: new 111\011java/lang/StringBuilder
        //   106: dup
        //   107: invokespecial 112\011java/lang/StringBuilder:<init>\011()V
        //   110: ldc 114
        //   112: invokevirtual 118\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
        //   115: aload 6
        //   117: invokevirtual 121\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
        //   120: invokevirtual 124\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
        //   123: invokestatic 127\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;)I
        //   126: pop
        //   127: goto -51 -> 76
        //
        // Exception table:
        //   from\011to\011target\011type
        //   27\01133\01185\011java/lang/IllegalArgumentException
        //   33\01176\01199\011android/content/ActivityNotFoundException
      }
    });
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mCleanedUp = false;
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    super.onCreateView(paramLayoutInflater, paramViewGroup, paramBundle);
    if (this.mDisplayState == null)
      cleanUp();
    while (true)
    {
      return this.mInAppView;
      this.mInAppView = paramLayoutInflater.inflate(R.layout.com_mixpanel_android_activity_notification_mini, paramViewGroup, false);
      TextView localTextView = (TextView)this.mInAppView.findViewById(R.id.com_mixpanel_android_notification_title);
      ImageView localImageView = (ImageView)this.mInAppView.findViewById(R.id.com_mixpanel_android_notification_image);
      InAppNotification localInAppNotification = this.mDisplayState.getInAppNotification();
      localTextView.setText(localInAppNotification.getTitle());
      localImageView.setImageBitmap(localInAppNotification.getImage());
      this.mHandler.postDelayed(this.mRemover, 10000L);
    }
  }

  public void onPause()
  {
    super.onPause();
    cleanUp();
  }

  public void onResume()
  {
    super.onResume();
    this.mHandler.postDelayed(this.mDisplayMini, 500L);
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    cleanUp();
    super.onSaveInstanceState(paramBundle);
  }

  public void onStart()
  {
    super.onStart();
    if (this.mCleanedUp)
      this.mParent.getFragmentManager().beginTransaction().remove(this).commit();
  }

  public void setDisplayState(MixpanelAPI paramMixpanelAPI, int paramInt, UpdateDisplayState.DisplayState.InAppNotificationState paramInAppNotificationState)
  {
    this.mMixpanel = paramMixpanelAPI;
    this.mDisplayStateId = paramInt;
    this.mDisplayState = paramInAppNotificationState;
  }

  private class SineBounceInterpolator
    implements Interpolator
  {
    public SineBounceInterpolator()
    {
    }

    public float getInterpolation(float paramFloat)
    {
      return 1.0F + (float)-(Math.pow(2.718281828459045D, -8.0F * paramFloat) * Math.cos(12.0F * paramFloat));
    }
  }
}