package co.getair.meerkat.views;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.Window;
import android.widget.EditText;

public class EditTextWithBack extends EditText
{
  public EditTextWithBack(Context paramContext)
  {
    super(paramContext);
  }

  public EditTextWithBack(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }

  public EditTextWithBack(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }

  public boolean onKeyPreIme(int paramInt, KeyEvent paramKeyEvent)
  {
    if ((paramInt == 4) && (paramKeyEvent.getAction() == 1))
    {
      clearFocus();
      ((Activity)getContext()).getWindow().setSoftInputMode(3);
      return false;
    }
    return super.dispatchKeyEvent(paramKeyEvent);
  }
}