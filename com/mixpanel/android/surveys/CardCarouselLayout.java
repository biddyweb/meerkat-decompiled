package com.mixpanel.android.surveys;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.DataSetObserver;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.RotateAnimation;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import com.mixpanel.android.R.id;
import com.mixpanel.android.R.layout;
import com.mixpanel.android.mpmetrics.Survey.Question;
import com.mixpanel.android.mpmetrics.Survey.QuestionType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CardCarouselLayout extends ViewGroup
{
  private static final long ANIMATION_DURATION_MILLIS = 330L;
  private static final long ANIMATION_ROTATION_MILLIS = 198L;
  private static int EXIT_ANGLE = 45;
  private static float EXIT_ROTATION_CENTER_X = 0.5F;
  private static float EXIT_ROTATION_CENTER_Y = 0.5F;
  private static float EXIT_SIZE = 0.8F;
  private QuestionCard mBackupCard;
  private OnQuestionAnsweredListener mListener = null;
  private final List<View> mMatchParentChildren = new ArrayList(1);
  private QuestionCard mVisibleCard;

  public CardCarouselLayout(Context paramContext)
  {
    super(paramContext);
    initCards(paramContext);
  }

  public CardCarouselLayout(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    initCards(paramContext);
  }

  public CardCarouselLayout(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    initCards(paramContext);
  }

  private Animation enterLeft()
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    RotateAnimation localRotateAnimation = new RotateAnimation(-EXIT_ANGLE, 0.0F, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localRotateAnimation.setDuration(198L);
    localAnimationSet.addAnimation(localRotateAnimation);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(EXIT_SIZE, 1.0F, EXIT_SIZE, 1.0F, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localScaleAnimation.setDuration(198L);
    localAnimationSet.addAnimation(localScaleAnimation);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(2, -1.3F, 2, 0.0F, 2, 0.0F, 2, 0.0F);
    localTranslateAnimation.setDuration(330L);
    localAnimationSet.addAnimation(localTranslateAnimation);
    return localAnimationSet;
  }

  private Animation enterRight()
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    RotateAnimation localRotateAnimation = new RotateAnimation(EXIT_ANGLE, 0.0F, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localRotateAnimation.setDuration(198L);
    localAnimationSet.addAnimation(localRotateAnimation);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(EXIT_SIZE, 1.0F, EXIT_SIZE, 1.0F, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localScaleAnimation.setDuration(198L);
    localAnimationSet.addAnimation(localScaleAnimation);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(2, 1.3F, 2, 0.0F, 2, 0.0F, 2, 0.0F);
    localTranslateAnimation.setDuration(330L);
    localAnimationSet.addAnimation(localTranslateAnimation);
    return localAnimationSet;
  }

  private Animation exitLeft()
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    RotateAnimation localRotateAnimation = new RotateAnimation(0.0F, -EXIT_ANGLE, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localRotateAnimation.setDuration(330L);
    localRotateAnimation.setStartOffset(132L);
    localAnimationSet.addAnimation(localRotateAnimation);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(1.0F, EXIT_SIZE, 1.0F, EXIT_SIZE, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localScaleAnimation.setDuration(330L);
    localScaleAnimation.setStartOffset(132L);
    localAnimationSet.addAnimation(localScaleAnimation);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(2, -1.0F, 2, -2.3F, 2, 0.0F, 2, 0.0F);
    localTranslateAnimation.setInterpolator(new AccelerateInterpolator());
    localTranslateAnimation.setDuration(330L);
    localAnimationSet.addAnimation(localTranslateAnimation);
    return localAnimationSet;
  }

  private Animation exitRight()
  {
    AnimationSet localAnimationSet = new AnimationSet(false);
    RotateAnimation localRotateAnimation = new RotateAnimation(0.0F, EXIT_ANGLE, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localRotateAnimation.setDuration(198L);
    localRotateAnimation.setStartOffset(132L);
    localAnimationSet.addAnimation(localRotateAnimation);
    ScaleAnimation localScaleAnimation = new ScaleAnimation(1.0F, EXIT_SIZE, 1.0F, EXIT_SIZE, 1, EXIT_ROTATION_CENTER_X, 1, EXIT_ROTATION_CENTER_Y);
    localScaleAnimation.setDuration(198L);
    localScaleAnimation.setStartOffset(132L);
    localAnimationSet.addAnimation(localScaleAnimation);
    TranslateAnimation localTranslateAnimation = new TranslateAnimation(2, -1.0F, 2, 0.3F, 2, 0.0F, 2, 0.0F);
    localTranslateAnimation.setInterpolator(new AccelerateInterpolator());
    localTranslateAnimation.setDuration(330L);
    localAnimationSet.addAnimation(localTranslateAnimation);
    return localAnimationSet;
  }

  private void initCards(Context paramContext)
  {
    LayoutInflater localLayoutInflater = LayoutInflater.from(paramContext);
    View localView1 = localLayoutInflater.inflate(R.layout.com_mixpanel_android_question_card, this, false);
    this.mVisibleCard = new QuestionCard(localView1);
    View localView2 = localLayoutInflater.inflate(R.layout.com_mixpanel_android_question_card, this, false);
    this.mBackupCard = new QuestionCard(localView2);
    addView(localView1);
    addView(localView2);
  }

  public void moveTo(Survey.Question paramQuestion, String paramString, Direction paramDirection)
    throws CardCarouselLayout.UnrecognizedAnswerTypeException
  {
    QuestionCard localQuestionCard = this.mBackupCard;
    this.mBackupCard = this.mVisibleCard;
    this.mVisibleCard = localQuestionCard;
    this.mVisibleCard.showQuestionOnCard(paramQuestion, paramString);
    final View localView1 = this.mBackupCard.getView();
    View localView2 = this.mVisibleCard.getView();
    localView1.setVisibility(0);
    localView2.setVisibility(0);
    int i = 2.$SwitchMap$com$mixpanel$android$surveys$CardCarouselLayout$Direction[paramDirection.ordinal()];
    Animation localAnimation1 = null;
    Animation localAnimation2 = null;
    switch (i)
    {
    default:
    case 1:
    case 2:
    }
    while (true)
    {
      localAnimation2.setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          localView1.setVisibility(8);
        }

        public void onAnimationRepeat(Animation paramAnonymousAnimation)
        {
        }

        public void onAnimationStart(Animation paramAnonymousAnimation)
        {
        }
      });
      localView1.startAnimation(localAnimation2);
      localView2.startAnimation(localAnimation1);
      invalidate();
      return;
      localAnimation2 = exitLeft();
      localAnimation1 = enterRight();
      continue;
      localAnimation2 = exitRight();
      localAnimation1 = enterLeft();
    }
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    View localView1 = this.mVisibleCard.getView();
    int i = localView1.getVisibility();
    int j = 0;
    if (i != 8)
    {
      j = localView1.getMeasuredWidth();
      localView1.layout(0, 0, j, localView1.getMeasuredHeight());
    }
    View localView2 = this.mBackupCard.getView();
    if (localView2.getVisibility() != 8)
    {
      int k = localView2.getMeasuredWidth();
      int m = localView2.getMeasuredHeight();
      localView2.layout(j, 0, j + k, m);
    }
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    int i = getChildCount();
    if ((View.MeasureSpec.getMode(paramInt1) != 1073741824) || (View.MeasureSpec.getMode(paramInt2) != 1073741824));
    int k;
    int m;
    for (int j = 1; ; j = 0)
    {
      this.mMatchParentChildren.clear();
      k = 0;
      m = 0;
      for (int n = 0; n < i; n++)
      {
        View localView2 = getChildAt(n);
        if (localView2.getVisibility() != 8)
        {
          ViewGroup.LayoutParams localLayoutParams2 = localView2.getLayoutParams();
          localView2.measure(getChildMeasureSpec(paramInt1, 0, localLayoutParams2.width), getChildMeasureSpec(paramInt2, 0, localLayoutParams2.height));
          m = Math.max(m, localView2.getMeasuredWidth());
          k = Math.max(k, localView2.getMeasuredHeight());
          if ((j != 0) && ((localLayoutParams2.width == -1) || (localLayoutParams2.height == -1)))
            this.mMatchParentChildren.add(localView2);
        }
      }
    }
    int i1 = Math.max(k, getSuggestedMinimumHeight());
    setMeasuredDimension(resolveSize(Math.max(m, getSuggestedMinimumWidth()), paramInt1), resolveSize(i1, paramInt2));
    Iterator localIterator = this.mMatchParentChildren.iterator();
    if (localIterator.hasNext())
    {
      View localView1 = (View)localIterator.next();
      ViewGroup.LayoutParams localLayoutParams1 = localView1.getLayoutParams();
      int i2;
      if (localLayoutParams1.width == -1)
      {
        i2 = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824);
        label265: if (localLayoutParams1.height != -1)
          break label312;
      }
      label312: for (int i3 = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824); ; i3 = getChildMeasureSpec(paramInt2, 0, localLayoutParams1.height))
      {
        localView1.measure(i2, i3);
        break;
        i2 = getChildMeasureSpec(paramInt1, 0, localLayoutParams1.width);
        break label265;
      }
    }
  }

  public void replaceTo(Survey.Question paramQuestion, String paramString)
    throws CardCarouselLayout.UnrecognizedAnswerTypeException
  {
    this.mVisibleCard.showQuestionOnCard(paramQuestion, paramString);
    removeAllViews();
    addView(this.mVisibleCard.getView());
    addView(this.mBackupCard.getView());
    invalidate();
  }

  public void setOnQuestionAnsweredListener(OnQuestionAnsweredListener paramOnQuestionAnsweredListener)
  {
    this.mListener = paramOnQuestionAnsweredListener;
  }

  public boolean shouldDelayChildPressedState()
  {
    return false;
  }

  private static class ChoiceAdapter
    implements ListAdapter
  {
    private static final int VIEW_TYPE_FIRST = 0;
    private static final int VIEW_TYPE_LAST = 1;
    private static final int VIEW_TYPE_MAX = 3;
    private static final int VIEW_TYPE_MIDDLE = 2;
    private final List<String> mChoices;
    private final LayoutInflater mInflater;

    public ChoiceAdapter(List<String> paramList, LayoutInflater paramLayoutInflater)
    {
      this.mChoices = paramList;
      this.mInflater = paramLayoutInflater;
    }

    public boolean areAllItemsEnabled()
    {
      return true;
    }

    public int getCount()
    {
      return this.mChoices.size();
    }

    public String getItem(int paramInt)
    {
      return (String)this.mChoices.get(paramInt);
    }

    public long getItemId(int paramInt)
    {
      return paramInt;
    }

    public int getItemViewType(int paramInt)
    {
      if (paramInt == 0)
        return 0;
      if (paramInt == -1 + this.mChoices.size())
        return 1;
      return 2;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      int i = -1;
      if (paramView == null)
        switch (getItemViewType(paramInt))
        {
        default:
        case 0:
        case 1:
        case 2:
        }
      while (true)
      {
        paramView = this.mInflater.inflate(i, paramViewGroup, false);
        ((TextView)paramView.findViewById(R.id.com_mixpanel_android_multiple_choice_answer_text)).setText((String)this.mChoices.get(paramInt));
        return paramView;
        i = R.layout.com_mixpanel_android_first_choice_answer;
        continue;
        i = R.layout.com_mixpanel_android_last_choice_answer;
        continue;
        i = R.layout.com_mixpanel_android_middle_choice_answer;
      }
    }

    public int getViewTypeCount()
    {
      return 3;
    }

    public boolean hasStableIds()
    {
      return true;
    }

    public boolean isEmpty()
    {
      return this.mChoices.isEmpty();
    }

    public boolean isEnabled(int paramInt)
    {
      return true;
    }

    public void registerDataSetObserver(DataSetObserver paramDataSetObserver)
    {
    }

    public void unregisterDataSetObserver(DataSetObserver paramDataSetObserver)
    {
    }
  }

  public static enum Direction
  {
    static
    {
      BACKWARD = new Direction("BACKWARD", 1);
      Direction[] arrayOfDirection = new Direction[2];
      arrayOfDirection[0] = FORWARD;
      arrayOfDirection[1] = BACKWARD;
    }
  }

  public static abstract interface OnQuestionAnsweredListener
  {
    public abstract void onQuestionAnswered(Survey.Question paramQuestion, String paramString);
  }

  private class QuestionCard
  {
    private final View mCardView;
    private final ListView mChoiceView;
    private final TextView mEditAnswerView;
    private final TextView mPromptView;
    private Survey.Question mQuestion;

    public QuestionCard(View arg2)
    {
      Object localObject;
      this.mCardView = localObject;
      this.mPromptView = ((TextView)localObject.findViewWithTag("com_mixpanel_android_TAG_prompt_text"));
      this.mEditAnswerView = ((EditText)localObject.findViewWithTag("com_mixpanel_android_TAG_text_answer"));
      this.mChoiceView = ((ListView)localObject.findViewWithTag("com_mixpanel_android_TAG_choice_list"));
      this.mEditAnswerView.setText("");
      this.mEditAnswerView.setOnEditorActionListener(new TextView.OnEditorActionListener()
      {
        public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
        {
          if ((paramAnonymousKeyEvent != null) && (paramAnonymousKeyEvent.getKeyCode() == 66) && (paramAnonymousKeyEvent.getAction() == 0) && ((0x20 & paramAnonymousKeyEvent.getFlags()) == 0));
          for (int i = 1; ; i = 0)
          {
            boolean bool;
            if (i == 0)
            {
              bool = false;
              if (paramAnonymousInt != 6);
            }
            else
            {
              paramAnonymousTextView.clearComposingText();
              if (CardCarouselLayout.this.mListener != null)
              {
                String str = paramAnonymousTextView.getText().toString();
                CardCarouselLayout.this.mListener.onQuestionAnswered(CardCarouselLayout.QuestionCard.this.mQuestion, str);
              }
              bool = true;
            }
            return bool;
          }
        }
      });
      this.mChoiceView.setOnItemClickListener(new AdapterView.OnItemClickListener()
      {
        public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
        {
          if (CardCarouselLayout.this.mListener != null)
          {
            final String str = paramAnonymousAdapterView.getItemAtPosition(paramAnonymousInt).toString();
            CardCarouselLayout.this.postDelayed(new Runnable()
            {
              public void run()
              {
                CardCarouselLayout.this.mListener.onQuestionAnswered(CardCarouselLayout.QuestionCard.this.mQuestion, str);
              }
            }
            , 165L);
          }
        }
      });
    }

    public View getView()
    {
      return this.mCardView;
    }

    public void showQuestionOnCard(Survey.Question paramQuestion, String paramString)
      throws CardCarouselLayout.UnrecognizedAnswerTypeException
    {
      this.mQuestion = paramQuestion;
      this.mPromptView.setText(this.mQuestion.getPrompt());
      InputMethodManager localInputMethodManager = (InputMethodManager)this.mCardView.getContext().getSystemService("input_method");
      Survey.QuestionType localQuestionType = paramQuestion.getType();
      if (Survey.QuestionType.TEXT == localQuestionType)
      {
        this.mChoiceView.setVisibility(8);
        this.mEditAnswerView.setVisibility(0);
        if (paramString != null)
          this.mEditAnswerView.setText(paramString);
        if (CardCarouselLayout.this.getResources().getConfiguration().orientation == 1)
        {
          this.mEditAnswerView.requestFocus();
          localInputMethodManager.showSoftInput(this.mEditAnswerView, 0);
        }
      }
      while (true)
      {
        this.mCardView.invalidate();
        return;
        localInputMethodManager.hideSoftInputFromWindow(this.mCardView.getWindowToken(), 0);
        continue;
        if (Survey.QuestionType.MULTIPLE_CHOICE != localQuestionType)
          break;
        localInputMethodManager.hideSoftInputFromWindow(this.mCardView.getWindowToken(), 0);
        this.mChoiceView.setVisibility(0);
        this.mEditAnswerView.setVisibility(8);
        CardCarouselLayout.ChoiceAdapter localChoiceAdapter = new CardCarouselLayout.ChoiceAdapter(paramQuestion.getChoices(), LayoutInflater.from(CardCarouselLayout.this.getContext()));
        this.mChoiceView.setAdapter(localChoiceAdapter);
        this.mChoiceView.clearChoices();
        if (paramString != null)
          for (int i = 0; i < localChoiceAdapter.getCount(); i++)
            if (localChoiceAdapter.getItem(i).equals(paramString))
              this.mChoiceView.setItemChecked(i, true);
      }
      throw new CardCarouselLayout.UnrecognizedAnswerTypeException("No way to display question type " + localQuestionType, null);
    }
  }

  public static class UnrecognizedAnswerTypeException extends Exception
  {
    private static final long serialVersionUID = -6040399928243560328L;

    private UnrecognizedAnswerTypeException(String paramString)
    {
      super();
    }
  }
}