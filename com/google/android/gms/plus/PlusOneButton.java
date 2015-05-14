package com.google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import com.google.android.gms.common.internal.zzag;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.plus.internal.zzg;

public final class PlusOneButton extends FrameLayout
{
  public static final int ANNOTATION_BUBBLE = 1;
  public static final int ANNOTATION_INLINE = 2;
  public static final int ANNOTATION_NONE = 0;
  public static final int DEFAULT_ACTIVITY_REQUEST_CODE = -1;
  public static final int SIZE_MEDIUM = 1;
  public static final int SIZE_SMALL = 0;
  public static final int SIZE_STANDARD = 3;
  public static final int SIZE_TALL = 2;
  private int mSize;
  private View zzauj;
  private int zzauk;
  private int zzaul;
  private OnPlusOneClickListener zzaum;
  private String zzxX;

  public PlusOneButton(Context paramContext)
  {
    this(paramContext, null);
  }

  public PlusOneButton(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.mSize = getSize(paramContext, paramAttributeSet);
    this.zzauk = getAnnotation(paramContext, paramAttributeSet);
    this.zzaul = -1;
    zzN(getContext());
    if (isInEditMode());
  }

  protected static int getAnnotation(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = zzag.zza("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "annotation", paramContext, paramAttributeSet, true, false, "PlusOneButton");
    int i;
    if ("INLINE".equalsIgnoreCase(str))
      i = 2;
    boolean bool;
    do
    {
      return i;
      bool = "NONE".equalsIgnoreCase(str);
      i = 0;
    }
    while (bool);
    return 1;
  }

  protected static int getSize(Context paramContext, AttributeSet paramAttributeSet)
  {
    String str = zzag.zza("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "size", paramContext, paramAttributeSet, true, false, "PlusOneButton");
    if ("SMALL".equalsIgnoreCase(str))
      return 0;
    if ("MEDIUM".equalsIgnoreCase(str))
      return 1;
    if ("TALL".equalsIgnoreCase(str))
      return 2;
    return 3;
  }

  private void zzN(Context paramContext)
  {
    if (this.zzauj != null)
      removeView(this.zzauj);
    this.zzauj = zzg.zza(paramContext, this.mSize, this.zzauk, this.zzxX, this.zzaul);
    setOnPlusOneClickListener(this.zzaum);
    addView(this.zzauj);
  }

  public void initialize(String paramString, int paramInt)
  {
    zzx.zza(getContext() instanceof Activity, "To use this method, the PlusOneButton must be placed in an Activity. Use initialize(String, OnPlusOneClickListener).");
    this.zzxX = paramString;
    this.zzaul = paramInt;
    zzN(getContext());
  }

  public void initialize(String paramString, OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.zzxX = paramString;
    this.zzaul = 0;
    zzN(getContext());
    setOnPlusOneClickListener(paramOnPlusOneClickListener);
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.zzauj.layout(0, 0, paramInt3 - paramInt1, paramInt4 - paramInt2);
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    View localView = this.zzauj;
    measureChild(localView, paramInt1, paramInt2);
    setMeasuredDimension(localView.getMeasuredWidth(), localView.getMeasuredHeight());
  }

  public void setAnnotation(int paramInt)
  {
    this.zzauk = paramInt;
    zzN(getContext());
  }

  public void setOnPlusOneClickListener(OnPlusOneClickListener paramOnPlusOneClickListener)
  {
    this.zzaum = paramOnPlusOneClickListener;
    this.zzauj.setOnClickListener(new DefaultOnPlusOneClickListener(paramOnPlusOneClickListener));
  }

  public void setSize(int paramInt)
  {
    this.mSize = paramInt;
    zzN(getContext());
  }

  protected class DefaultOnPlusOneClickListener
    implements View.OnClickListener, PlusOneButton.OnPlusOneClickListener
  {
    private final PlusOneButton.OnPlusOneClickListener zzaun;

    public DefaultOnPlusOneClickListener(PlusOneButton.OnPlusOneClickListener arg2)
    {
      Object localObject;
      this.zzaun = localObject;
    }

    public void onClick(View paramView)
    {
      Intent localIntent = (Intent)PlusOneButton.zza(PlusOneButton.this).getTag();
      if (this.zzaun != null)
      {
        this.zzaun.onPlusOneClick(localIntent);
        return;
      }
      onPlusOneClick(localIntent);
    }

    public void onPlusOneClick(Intent paramIntent)
    {
      Context localContext = PlusOneButton.this.getContext();
      if (((localContext instanceof Activity)) && (paramIntent != null))
        ((Activity)localContext).startActivityForResult(paramIntent, PlusOneButton.zzb(PlusOneButton.this));
    }
  }

  public static abstract interface OnPlusOneClickListener
  {
    public abstract void onPlusOneClick(Intent paramIntent);
  }
}