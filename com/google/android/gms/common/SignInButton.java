package com.google.android.gms.common;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.FrameLayout;
import com.google.android.gms.common.internal.zzac;
import com.google.android.gms.common.internal.zzad;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.dynamic.zzg.zza;

public final class SignInButton extends FrameLayout
  implements View.OnClickListener
{
  public static final int COLOR_DARK = 0;
  public static final int COLOR_LIGHT = 1;
  public static final int SIZE_ICON_ONLY = 2;
  public static final int SIZE_STANDARD = 0;
  public static final int SIZE_WIDE = 1;
  private int mColor;
  private int mSize;
  private View zzLI;
  private View.OnClickListener zzLJ = null;

  public SignInButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public SignInButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }

  public SignInButton(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    setStyle(0, 0);
  }

  private void zzN(Context paramContext)
  {
    if (this.zzLI != null)
      removeView(this.zzLI);
    try
    {
      this.zzLI = zzac.zzb(paramContext, this.mSize, this.mColor);
      addView(this.zzLI);
      this.zzLI.setEnabled(isEnabled());
      this.zzLI.setOnClickListener(this);
      return;
    }
    catch (zzg.zza localzza)
    {
      while (true)
      {
        Log.w("SignInButton", "Sign in button not found, using placeholder instead");
        this.zzLI = zza(paramContext, this.mSize, this.mColor);
      }
    }
  }

  private static Button zza(Context paramContext, int paramInt1, int paramInt2)
  {
    zzad localzzad = new zzad(paramContext);
    localzzad.zza(paramContext.getResources(), paramInt1, paramInt2);
    return localzzad;
  }

  public void onClick(View paramView)
  {
    if ((this.zzLJ != null) && (paramView == this.zzLI))
      this.zzLJ.onClick(this);
  }

  public void setColorScheme(int paramInt)
  {
    setStyle(this.mSize, paramInt);
  }

  public void setEnabled(boolean paramBoolean)
  {
    super.setEnabled(paramBoolean);
    this.zzLI.setEnabled(paramBoolean);
  }

  public void setOnClickListener(View.OnClickListener paramOnClickListener)
  {
    this.zzLJ = paramOnClickListener;
    if (this.zzLI != null)
      this.zzLI.setOnClickListener(this);
  }

  public void setSize(int paramInt)
  {
    setStyle(paramInt, this.mColor);
  }

  public void setStyle(int paramInt1, int paramInt2)
  {
    boolean bool1;
    if ((paramInt1 >= 0) && (paramInt1 < 3))
    {
      bool1 = true;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(paramInt1);
      zzx.zza(bool1, "Unknown button size %d", arrayOfObject1);
      if ((paramInt2 < 0) || (paramInt2 >= 2))
        break label92;
    }
    label92: for (boolean bool2 = true; ; bool2 = false)
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(paramInt2);
      zzx.zza(bool2, "Unknown color scheme %s", arrayOfObject2);
      this.mSize = paramInt1;
      this.mColor = paramInt2;
      zzN(getContext());
      return;
      bool1 = false;
      break;
    }
  }
}