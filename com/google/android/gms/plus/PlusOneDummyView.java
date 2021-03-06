package com.google.android.gms.plus;

import android.content.Context;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;

public class PlusOneDummyView extends FrameLayout
{
  public static final String TAG = "PlusOneDummyView";

  public PlusOneDummyView(Context paramContext, int paramInt)
  {
    super(paramContext);
    Button localButton = new Button(paramContext);
    localButton.setEnabled(false);
    localButton.setBackgroundDrawable(zzrJ().getDrawable(paramInt));
    Point localPoint = zzgJ(paramInt);
    addView(localButton, new FrameLayout.LayoutParams(localPoint.x, localPoint.y, 17));
  }

  private Point zzgJ(int paramInt)
  {
    int i = 24;
    int j = 20;
    Point localPoint = new Point();
    switch (paramInt)
    {
    default:
      int k = i;
      i = 38;
      j = k;
    case 1:
    case 0:
    case 2:
    }
    while (true)
    {
      DisplayMetrics localDisplayMetrics = getResources().getDisplayMetrics();
      float f1 = TypedValue.applyDimension(1, i, localDisplayMetrics);
      float f2 = TypedValue.applyDimension(1, j, localDisplayMetrics);
      localPoint.x = ((int)(0.5D + f1));
      localPoint.y = ((int)(0.5D + f2));
      return localPoint;
      i = 32;
      continue;
      j = 14;
      continue;
      i = 50;
    }
  }

  private zzd zzrJ()
  {
    Object localObject = new zzb(getContext(), null);
    if (!((zzd)localObject).isValid())
      localObject = new zzc(getContext(), null);
    if (!((zzd)localObject).isValid())
      localObject = new zza(getContext(), null);
    return localObject;
  }

  private static class zza
    implements PlusOneDummyView.zzd
  {
    private Context mContext;

    private zza(Context paramContext)
    {
      this.mContext = paramContext;
    }

    public Drawable getDrawable(int paramInt)
    {
      return this.mContext.getResources().getDrawable(17301508);
    }

    public boolean isValid()
    {
      return true;
    }
  }

  private static class zzb
    implements PlusOneDummyView.zzd
  {
    private Context mContext;

    private zzb(Context paramContext)
    {
      this.mContext = paramContext;
    }

    public Drawable getDrawable(int paramInt)
    {
      while (true)
      {
        try
        {
          Resources localResources = this.mContext.createPackageContext("com.google.android.gms", 4).getResources();
          switch (paramInt)
          {
          case 2:
            return localResources.getDrawable(localResources.getIdentifier(str, "drawable", "com.google.android.gms"));
            str = "ic_plusone_tall";
            continue;
          default:
          case 0:
          case 1:
          }
        }
        catch (PackageManager.NameNotFoundException localNameNotFoundException)
        {
          return null;
        }
        String str = "ic_plusone_standard";
        continue;
        str = "ic_plusone_small";
        continue;
        str = "ic_plusone_medium";
      }
    }

    public boolean isValid()
    {
      try
      {
        this.mContext.createPackageContext("com.google.android.gms", 4).getResources();
        return true;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
      }
      return false;
    }
  }

  private static class zzc
    implements PlusOneDummyView.zzd
  {
    private Context mContext;

    private zzc(Context paramContext)
    {
      this.mContext = paramContext;
    }

    public Drawable getDrawable(int paramInt)
    {
      String str;
      switch (paramInt)
      {
      default:
        str = "ic_plusone_standard_off_client";
      case 0:
      case 1:
      case 2:
      }
      while (true)
      {
        int i = this.mContext.getResources().getIdentifier(str, "drawable", this.mContext.getPackageName());
        return this.mContext.getResources().getDrawable(i);
        str = "ic_plusone_small_off_client";
        continue;
        str = "ic_plusone_medium_off_client";
        continue;
        str = "ic_plusone_tall_off_client";
      }
    }

    public boolean isValid()
    {
      int i = this.mContext.getResources().getIdentifier("ic_plusone_small_off_client", "drawable", this.mContext.getPackageName());
      int j = this.mContext.getResources().getIdentifier("ic_plusone_medium_off_client", "drawable", this.mContext.getPackageName());
      int k = this.mContext.getResources().getIdentifier("ic_plusone_tall_off_client", "drawable", this.mContext.getPackageName());
      int m = this.mContext.getResources().getIdentifier("ic_plusone_standard_off_client", "drawable", this.mContext.getPackageName());
      return (i != 0) && (j != 0) && (k != 0) && (m != 0);
    }
  }

  private static abstract interface zzd
  {
    public abstract Drawable getDrawable(int paramInt);

    public abstract boolean isValid();
  }
}