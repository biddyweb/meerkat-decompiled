package com.mixpanel.android.surveys;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.GradientDrawable.Orientation;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.util.Log;
import android.view.Display;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnTouchListener;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.mixpanel.android.R.anim;
import com.mixpanel.android.R.drawable;
import com.mixpanel.android.R.id;
import com.mixpanel.android.R.layout;
import com.mixpanel.android.mpmetrics.InAppNotification;
import com.mixpanel.android.mpmetrics.MPConfig;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import com.mixpanel.android.mpmetrics.MixpanelAPI.People;
import com.mixpanel.android.mpmetrics.Survey;
import com.mixpanel.android.mpmetrics.Survey.Question;
import com.mixpanel.android.mpmetrics.Survey.QuestionType;
import com.mixpanel.android.mpmetrics.UpdateDisplayState;
import com.mixpanel.android.mpmetrics.UpdateDisplayState.AnswerMap;
import com.mixpanel.android.mpmetrics.UpdateDisplayState.DisplayState;
import com.mixpanel.android.mpmetrics.UpdateDisplayState.DisplayState.InAppNotificationState;
import com.mixpanel.android.mpmetrics.UpdateDisplayState.DisplayState.SurveyState;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressLint({"ClickableViewAccessibility"})
@TargetApi(16)
public class SurveyActivity extends Activity
{
  private static final String CURRENT_QUESTION_BUNDLE_KEY = "com.mixpanel.android.surveys.SurveyActivity.CURRENT_QUESTION_BUNDLE_KEY";
  private static final int GRAY_30PERCENT = 0;
  public static final String INTENT_ID_KEY = "com.mixpanel.android.surveys.SurveyActivity.INTENT_ID_KEY";
  private static final String LOGTAG = "MixpanelAPI.SurveyActivity";
  private static final int SHADOW_SIZE_THRESHOLD_PX = 100;
  private static final String SURVEY_BEGUN_BUNDLE_KEY = "com.mixpanel.android.surveys.SurveyActivity.SURVEY_BEGIN_BUNDLE_KEY";
  private static final String SURVEY_STATE_BUNDLE_KEY = "com.mixpanel.android.surveys.SurveyActivity.SURVEY_STATE_BUNDLE_KEY";
  private CardCarouselLayout mCardHolder;
  private int mCurrentQuestion = 0;
  private AlertDialog mDialog;
  private int mIntentId = -1;
  private MixpanelAPI mMixpanel;
  private View mNextButton;
  private View mPreviousButton;
  private TextView mProgressTextView;
  private boolean mSurveyBegun = false;
  private UpdateDisplayState mUpdateDisplayState;

  private void completeSurvey()
  {
    finish();
  }

  private UpdateDisplayState.DisplayState.SurveyState getSurveyState()
  {
    return (UpdateDisplayState.DisplayState.SurveyState)this.mUpdateDisplayState.getDisplayState();
  }

  private void goToNextQuestion()
  {
    int i = getSurveyState().getSurvey().getQuestions().size();
    if (this.mCurrentQuestion < i - 1)
    {
      showQuestion(1 + this.mCurrentQuestion);
      return;
    }
    completeSurvey();
  }

  private void goToPreviousQuestion()
  {
    if (this.mCurrentQuestion > 0)
    {
      showQuestion(-1 + this.mCurrentQuestion);
      return;
    }
    completeSurvey();
  }

  private boolean isShowingInApp()
  {
    if (this.mUpdateDisplayState == null)
      return false;
    return "InAppNotificationState".equals(this.mUpdateDisplayState.getDisplayState().getType());
  }

  private boolean isShowingSurvey()
  {
    if (this.mUpdateDisplayState == null)
      return false;
    return "SurveyState".equals(this.mUpdateDisplayState.getDisplayState().getType());
  }

  private void onCreateInAppNotification(Bundle paramBundle)
  {
    setContentView(R.layout.com_mixpanel_android_activity_notification_full);
    ImageView localImageView = (ImageView)findViewById(R.id.com_mixpanel_android_notification_gradient);
    FadingImageView localFadingImageView = (FadingImageView)findViewById(R.id.com_mixpanel_android_notification_image);
    TextView localTextView1 = (TextView)findViewById(R.id.com_mixpanel_android_notification_title);
    TextView localTextView2 = (TextView)findViewById(R.id.com_mixpanel_android_notification_subtext);
    Button localButton = (Button)findViewById(R.id.com_mixpanel_android_notification_button);
    LinearLayout localLinearLayout = (LinearLayout)findViewById(R.id.com_mixpanel_android_button_exit_wrapper);
    final InAppNotification localInAppNotification = ((UpdateDisplayState.DisplayState.InAppNotificationState)this.mUpdateDisplayState.getDisplayState()).getInAppNotification();
    Display localDisplay = getWindowManager().getDefaultDisplay();
    Point localPoint = new Point();
    localDisplay.getSize(localPoint);
    if (getResources().getConfiguration().orientation == 1)
    {
      RelativeLayout.LayoutParams localLayoutParams = (RelativeLayout.LayoutParams)localLinearLayout.getLayoutParams();
      localLayoutParams.setMargins(0, 0, 0, (int)(0.06F * localPoint.y));
      localLinearLayout.setLayoutParams(localLayoutParams);
    }
    GradientDrawable localGradientDrawable = new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT, new int[] { -446668676, -448247715, -451405793, -451405793 });
    localGradientDrawable.setGradientType(1);
    Bitmap localBitmap;
    if (getResources().getConfiguration().orientation == 2)
    {
      localGradientDrawable.setGradientCenter(0.25F, 0.5F);
      localGradientDrawable.setGradientRadius(0.8F * Math.min(localPoint.x, localPoint.y));
      setViewBackground(localImageView, localGradientDrawable);
      localTextView1.setText(localInAppNotification.getTitle());
      localTextView2.setText(localInAppNotification.getBody());
      localBitmap = localInAppNotification.getImage();
      localFadingImageView.setBackgroundResource(R.drawable.com_mixpanel_android_square_dropshadow);
      if ((localBitmap.getWidth() >= 100) && (localBitmap.getHeight() >= 100))
        break label553;
      localFadingImageView.setBackgroundResource(R.drawable.com_mixpanel_android_square_nodropshadow);
    }
    while (true)
    {
      localFadingImageView.setImageBitmap(localBitmap);
      String str = localInAppNotification.getCallToActionUrl();
      if ((str != null) && (str.length() > 0))
        localButton.setText(localInAppNotification.getCallToAction());
      localButton.setOnClickListener(new View.OnClickListener()
      {
        // ERROR //
        public void onClick(View paramAnonymousView)
        {
          // Byte code:
          //   0: aload_0
          //   1: getfield 21\011com/mixpanel/android/surveys/SurveyActivity$1:val$inApp\011Lcom/mixpanel/android/mpmetrics/InAppNotification;
          //   4: invokevirtual 36\011com/mixpanel/android/mpmetrics/InAppNotification:getCallToActionUrl\011()Ljava/lang/String;
          //   7: astore_2
          //   8: aload_2
          //   9: ifnull +59 -> 68
          //   12: aload_2
          //   13: invokevirtual 42\011java/lang/String:length\011()I
          //   16: ifle +52 -> 68
          //   19: aload_2
          //   20: invokestatic 48\011android/net/Uri:parse\011(Ljava/lang/String;)Landroid/net/Uri;
          //   23: astore 5
          //   25: new 50\011android/content/Intent
          //   28: dup
          //   29: ldc 52
          //   31: aload 5
          //   33: invokespecial 55\011android/content/Intent:<init>\011(Ljava/lang/String;Landroid/net/Uri;)V
          //   36: astore 6
          //   38: aload_0
          //   39: getfield 19\011com/mixpanel/android/surveys/SurveyActivity$1:this$0\011Lcom/mixpanel/android/surveys/SurveyActivity;
          //   42: aload 6
          //   44: invokevirtual 59\011com/mixpanel/android/surveys/SurveyActivity:startActivity\011(Landroid/content/Intent;)V
          //   47: aload_0
          //   48: getfield 19\011com/mixpanel/android/surveys/SurveyActivity$1:this$0\011Lcom/mixpanel/android/surveys/SurveyActivity;
          //   51: invokestatic 63\011com/mixpanel/android/surveys/SurveyActivity:access$000\011(Lcom/mixpanel/android/surveys/SurveyActivity;)Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
          //   54: invokevirtual 69\011com/mixpanel/android/mpmetrics/MixpanelAPI:getPeople\011()Lcom/mixpanel/android/mpmetrics/MixpanelAPI$People;
          //   57: ldc 71
          //   59: aload_0
          //   60: getfield 21\011com/mixpanel/android/surveys/SurveyActivity$1:val$inApp\011Lcom/mixpanel/android/mpmetrics/InAppNotification;
          //   63: invokeinterface 77 3 0
          //   68: aload_0
          //   69: getfield 19\011com/mixpanel/android/surveys/SurveyActivity$1:this$0\011Lcom/mixpanel/android/surveys/SurveyActivity;
          //   72: invokevirtual 80\011com/mixpanel/android/surveys/SurveyActivity:finish\011()V
          //   75: aload_0
          //   76: getfield 19\011com/mixpanel/android/surveys/SurveyActivity$1:this$0\011Lcom/mixpanel/android/surveys/SurveyActivity;
          //   79: invokestatic 84\011com/mixpanel/android/surveys/SurveyActivity:access$100\011(Lcom/mixpanel/android/surveys/SurveyActivity;)I
          //   82: invokestatic 90\011com/mixpanel/android/mpmetrics/UpdateDisplayState:releaseDisplayState\011(I)V
          //   85: return
          //   86: astore_3
          //   87: ldc 92
          //   89: ldc 94
          //   91: aload_3
          //   92: invokestatic 100\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
          //   95: pop
          //   96: return
          //   97: astore 7
          //   99: ldc 92
          //   101: ldc 102
          //   103: invokestatic 105\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;)I
          //   106: pop
          //   107: goto -39 -> 68
          //
          // Exception table:
          //   from\011to\011target\011type
          //   19\01125\01186\011java/lang/IllegalArgumentException
          //   25\01168\01197\011android/content/ActivityNotFoundException
        }
      });
      localButton.setOnTouchListener(new View.OnTouchListener()
      {
        public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
        {
          if (paramAnonymousMotionEvent.getAction() == 0)
            paramAnonymousView.setBackgroundResource(R.drawable.com_mixpanel_android_cta_button_highlight);
          while (true)
          {
            return false;
            paramAnonymousView.setBackgroundResource(R.drawable.com_mixpanel_android_cta_button);
          }
        }
      });
      localLinearLayout.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          SurveyActivity.this.finish();
          UpdateDisplayState.releaseDisplayState(SurveyActivity.this.mIntentId);
        }
      });
      ScaleAnimation localScaleAnimation = new ScaleAnimation(0.95F, 1.0F, 0.95F, 1.0F, 1, 0.5F, 1, 1.0F);
      localScaleAnimation.setDuration(200L);
      localFadingImageView.startAnimation(localScaleAnimation);
      TranslateAnimation localTranslateAnimation = new TranslateAnimation(1, 0.0F, 1, 0.0F, 1, 0.5F, 1, 0.0F);
      localTranslateAnimation.setInterpolator(new DecelerateInterpolator());
      localTranslateAnimation.setDuration(200L);
      localTextView1.startAnimation(localTranslateAnimation);
      localTextView2.startAnimation(localTranslateAnimation);
      localButton.startAnimation(localTranslateAnimation);
      localLinearLayout.startAnimation(AnimationUtils.loadAnimation(this, R.anim.com_mixpanel_android_fade_in));
      return;
      localGradientDrawable.setGradientCenter(0.5F, 0.33F);
      localGradientDrawable.setGradientRadius(0.7F * Math.min(localPoint.x, localPoint.y));
      break;
      label553: if (Color.alpha(Bitmap.createScaledBitmap(localBitmap, 1, 1, false).getPixel(0, 0)) < 255)
        localFadingImageView.setBackgroundResource(R.drawable.com_mixpanel_android_square_nodropshadow);
    }
  }

  private void onCreateSurvey(Bundle paramBundle)
  {
    requestOrientationLock();
    if (paramBundle != null)
    {
      this.mCurrentQuestion = paramBundle.getInt("com.mixpanel.android.surveys.SurveyActivity.CURRENT_QUESTION_BUNDLE_KEY", 0);
      this.mSurveyBegun = paramBundle.getBoolean("com.mixpanel.android.surveys.SurveyActivity.SURVEY_BEGIN_BUNDLE_KEY");
    }
    if (this.mUpdateDisplayState.getDistinctId() == null)
    {
      Log.i("MixpanelAPI.SurveyActivity", "Can't show a survey to a user with no distinct id set");
      finish();
      return;
    }
    setContentView(R.layout.com_mixpanel_android_activity_survey);
    Bitmap localBitmap = getSurveyState().getBackground();
    if (localBitmap == null)
      findViewById(R.id.com_mixpanel_android_activity_survey_id).setBackgroundColor(GRAY_30PERCENT);
    while (true)
    {
      this.mPreviousButton = findViewById(R.id.com_mixpanel_android_button_previous);
      this.mNextButton = findViewById(R.id.com_mixpanel_android_button_next);
      this.mProgressTextView = ((TextView)findViewById(R.id.com_mixpanel_android_progress_text));
      this.mCardHolder = ((CardCarouselLayout)findViewById(R.id.com_mixpanel_android_question_card_holder));
      this.mCardHolder.setOnQuestionAnsweredListener(new CardCarouselLayout.OnQuestionAnsweredListener()
      {
        public void onQuestionAnswered(Survey.Question paramAnonymousQuestion, String paramAnonymousString)
        {
          SurveyActivity.this.saveAnswer(paramAnonymousQuestion, paramAnonymousString);
          SurveyActivity.this.goToNextQuestion();
        }
      });
      return;
      getWindow().setBackgroundDrawable(new BitmapDrawable(getResources(), localBitmap));
    }
  }

  @SuppressLint({"SimpleDateFormat"})
  private void onDestroySurvey()
  {
    if (this.mMixpanel != null)
    {
      if (this.mUpdateDisplayState != null)
      {
        UpdateDisplayState.DisplayState.SurveyState localSurveyState = getSurveyState();
        Survey localSurvey = localSurveyState.getSurvey();
        List localList = localSurvey.getQuestions();
        String str1 = this.mUpdateDisplayState.getDistinctId();
        MixpanelAPI.People localPeople = this.mMixpanel.getPeople().withIdentity(str1);
        localPeople.append("$responses", Integer.valueOf(localSurvey.getCollectionId()));
        UpdateDisplayState.AnswerMap localAnswerMap = localSurveyState.getAnswers();
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          Survey.Question localQuestion = (Survey.Question)localIterator.next();
          String str2 = localAnswerMap.get(Integer.valueOf(localQuestion.getId()));
          if (str2 != null)
            try
            {
              JSONObject localJSONObject = new JSONObject();
              localJSONObject.put("$survey_id", localSurvey.getId());
              localJSONObject.put("$collection_id", localSurvey.getCollectionId());
              localJSONObject.put("$question_id", localQuestion.getId());
              localJSONObject.put("$question_type", localQuestion.getType().toString());
              SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
              localSimpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
              localJSONObject.put("$time", localSimpleDateFormat.format(new Date()));
              localJSONObject.put("$value", str2);
              localPeople.append("$answers", localJSONObject);
            }
            catch (JSONException localJSONException)
            {
              Log.e("MixpanelAPI.SurveyActivity", "Couldn't record user's answer.", localJSONException);
            }
        }
      }
      this.mMixpanel.flush();
    }
    UpdateDisplayState.releaseDisplayState(this.mIntentId);
  }

  private void onSaveInstanceStateSurvey(Bundle paramBundle)
  {
    paramBundle.putBoolean("com.mixpanel.android.surveys.SurveyActivity.SURVEY_BEGIN_BUNDLE_KEY", this.mSurveyBegun);
    paramBundle.putInt("com.mixpanel.android.surveys.SurveyActivity.CURRENT_QUESTION_BUNDLE_KEY", this.mCurrentQuestion);
    paramBundle.putParcelable("com.mixpanel.android.surveys.SurveyActivity.SURVEY_STATE_BUNDLE_KEY", this.mUpdateDisplayState);
  }

  private void onStartSurvey()
  {
    if (this.mSurveyBegun)
      return;
    if (!MPConfig.getInstance(this).getTestMode())
      trackSurveyAttempted();
    AlertDialog.Builder localBuilder = new AlertDialog.Builder(this);
    localBuilder.setTitle("We'd love your feedback!");
    localBuilder.setMessage("Mind taking a quick survey?");
    localBuilder.setPositiveButton("Sure", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        SurveyActivity.this.findViewById(R.id.com_mixpanel_android_activity_survey_id).setVisibility(0);
        SurveyActivity.access$402(SurveyActivity.this, true);
        SurveyActivity.this.showQuestion(SurveyActivity.this.mCurrentQuestion);
      }
    });
    localBuilder.setNegativeButton("No, Thanks", new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        SurveyActivity.this.finish();
      }
    });
    localBuilder.setCancelable(false);
    this.mDialog = localBuilder.create();
    this.mDialog.show();
  }

  @SuppressLint({"NewApi"})
  private void requestOrientationLock()
  {
    if (Build.VERSION.SDK_INT >= 18)
      setRequestedOrientation(14);
    int i;
    do
    {
      return;
      i = getResources().getConfiguration().orientation;
      if (i == 2)
      {
        setRequestedOrientation(0);
        return;
      }
    }
    while (i != 1);
    setRequestedOrientation(1);
  }

  private void saveAnswer(Survey.Question paramQuestion, String paramString)
  {
    getSurveyState().getAnswers().put(Integer.valueOf(paramQuestion.getId()), paramString.toString());
  }

  @SuppressLint({"NewApi"})
  private void setViewBackground(View paramView, Drawable paramDrawable)
  {
    if (Build.VERSION.SDK_INT < 16)
    {
      paramView.setBackgroundDrawable(paramDrawable);
      return;
    }
    paramView.setBackground(paramDrawable);
  }

  private void showQuestion(int paramInt)
  {
    UpdateDisplayState.DisplayState.SurveyState localSurveyState = getSurveyState();
    List localList = localSurveyState.getSurvey().getQuestions();
    label54: int i;
    Survey.Question localQuestion;
    String str;
    if ((paramInt == 0) || (localList.size() == 0))
    {
      this.mPreviousButton.setEnabled(false);
      if (paramInt < -1 + localList.size())
        break label180;
      this.mNextButton.setEnabled(false);
      i = this.mCurrentQuestion;
      this.mCurrentQuestion = paramInt;
      localQuestion = (Survey.Question)localList.get(paramInt);
      str = localSurveyState.getAnswers().get(Integer.valueOf(localQuestion.getId()));
      if (i >= paramInt)
        break label191;
    }
    while (true)
    {
      try
      {
        this.mCardHolder.moveTo(localQuestion, str, CardCarouselLayout.Direction.FORWARD);
        if (localList.size() <= 1)
          break label235;
        this.mProgressTextView.setText("" + (paramInt + 1) + " of " + localList.size());
        return;
        this.mPreviousButton.setEnabled(true);
        break;
        label180: this.mNextButton.setEnabled(true);
        break label54;
        label191: if (i > paramInt)
        {
          this.mCardHolder.moveTo(localQuestion, str, CardCarouselLayout.Direction.BACKWARD);
          continue;
        }
      }
      catch (CardCarouselLayout.UnrecognizedAnswerTypeException localUnrecognizedAnswerTypeException)
      {
        goToNextQuestion();
        return;
      }
      this.mCardHolder.replaceTo(localQuestion, str);
    }
    label235: this.mProgressTextView.setText("");
  }

  private void trackSurveyAttempted()
  {
    Survey localSurvey = getSurveyState().getSurvey();
    MixpanelAPI.People localPeople = this.mMixpanel.getPeople().withIdentity(this.mUpdateDisplayState.getDistinctId());
    localPeople.append("$surveys", Integer.valueOf(localSurvey.getId()));
    localPeople.append("$collections", Integer.valueOf(localSurvey.getCollectionId()));
  }

  public void completeSurvey(View paramView)
  {
    completeSurvey();
  }

  public void goToNextQuestion(View paramView)
  {
    goToNextQuestion();
  }

  public void goToPreviousQuestion(View paramView)
  {
    goToPreviousQuestion();
  }

  public void onBackPressed()
  {
    if ((isShowingSurvey()) && (this.mCurrentQuestion > 0))
    {
      goToPreviousQuestion();
      return;
    }
    if (isShowingInApp())
      UpdateDisplayState.releaseDisplayState(this.mIntentId);
    super.onBackPressed();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mIntentId = getIntent().getIntExtra("com.mixpanel.android.surveys.SurveyActivity.INTENT_ID_KEY", 2147483647);
    this.mUpdateDisplayState = UpdateDisplayState.claimDisplayState(this.mIntentId);
    if (this.mUpdateDisplayState == null)
    {
      Log.e("MixpanelAPI.SurveyActivity", "SurveyActivity intent received, but nothing was found to show.");
      finish();
      return;
    }
    this.mMixpanel = MixpanelAPI.getInstance(this, this.mUpdateDisplayState.getToken());
    if (isShowingInApp())
    {
      onCreateInAppNotification(paramBundle);
      return;
    }
    if (isShowingSurvey())
    {
      onCreateSurvey(paramBundle);
      return;
    }
    finish();
  }

  protected void onDestroy()
  {
    if (isShowingSurvey())
      onDestroySurvey();
    super.onDestroy();
  }

  protected void onPause()
  {
    super.onPause();
    if (this.mDialog != null)
    {
      this.mDialog.dismiss();
      this.mDialog = null;
    }
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (isShowingSurvey())
      onSaveInstanceStateSurvey(paramBundle);
  }

  protected void onStart()
  {
    super.onStart();
    UpdateDisplayState.DisplayState localDisplayState = this.mUpdateDisplayState.getDisplayState();
    if ((localDisplayState != null) && (localDisplayState.getType() == "SurveyState"))
      onStartSurvey();
  }
}