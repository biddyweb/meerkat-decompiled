package com.google.android.gms.games.internal;

import android.app.Activity;
import android.content.Context;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.view.Display;
import android.view.View;
import android.view.View.OnAttachStateChangeListener;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import com.google.android.gms.internal.zzme;
import java.lang.ref.WeakReference;

public class PopupManager
{
  protected GamesClientImpl zzaft;
  protected PopupLocationInfo zzafu;

  private PopupManager(GamesClientImpl paramGamesClientImpl, int paramInt)
  {
    this.zzaft = paramGamesClientImpl;
    zzeI(paramInt);
  }

  public static PopupManager zza(GamesClientImpl paramGamesClientImpl, int paramInt)
  {
    if (zzme.zzke())
      return new PopupManagerHCMR1(paramGamesClientImpl, paramInt);
    return new PopupManager(paramGamesClientImpl, paramInt);
  }

  public void setGravity(int paramInt)
  {
    this.zzafu.gravity = paramInt;
  }

  protected void zzeI(int paramInt)
  {
    this.zzafu = new PopupLocationInfo(paramInt, new Binder(), null);
  }

  public void zzm(View paramView)
  {
  }

  public void zzoc()
  {
    this.zzaft.zza(this.zzafu.zzafv, this.zzafu.zzob());
  }

  public Bundle zzod()
  {
    return this.zzafu.zzob();
  }

  public IBinder zzoe()
  {
    return this.zzafu.zzafv;
  }

  public PopupLocationInfo zzof()
  {
    return this.zzafu;
  }

  public static final class PopupLocationInfo
  {
    public int bottom = 0;
    public int gravity;
    public int left = 0;
    public int right = 0;
    public int top = 0;
    public IBinder zzafv;
    public int zzafw = -1;

    private PopupLocationInfo(int paramInt, IBinder paramIBinder)
    {
      this.gravity = paramInt;
      this.zzafv = paramIBinder;
    }

    public Bundle zzob()
    {
      Bundle localBundle = new Bundle();
      localBundle.putInt("popupLocationInfo.gravity", this.gravity);
      localBundle.putInt("popupLocationInfo.displayId", this.zzafw);
      localBundle.putInt("popupLocationInfo.left", this.left);
      localBundle.putInt("popupLocationInfo.top", this.top);
      localBundle.putInt("popupLocationInfo.right", this.right);
      localBundle.putInt("popupLocationInfo.bottom", this.bottom);
      return localBundle;
    }
  }

  private static final class PopupManagerHCMR1 extends PopupManager
    implements View.OnAttachStateChangeListener, ViewTreeObserver.OnGlobalLayoutListener
  {
    private boolean zzadU = false;
    private WeakReference<View> zzafx;

    protected PopupManagerHCMR1(GamesClientImpl paramGamesClientImpl, int paramInt)
    {
      super(paramInt, null);
    }

    private void zzn(View paramView)
    {
      int i = -1;
      if (zzme.zzki())
      {
        Display localDisplay = paramView.getDisplay();
        if (localDisplay != null)
          i = localDisplay.getDisplayId();
      }
      IBinder localIBinder = paramView.getWindowToken();
      int[] arrayOfInt = new int[2];
      paramView.getLocationInWindow(arrayOfInt);
      int j = paramView.getWidth();
      int k = paramView.getHeight();
      this.zzafu.zzafw = i;
      this.zzafu.zzafv = localIBinder;
      this.zzafu.left = arrayOfInt[0];
      this.zzafu.top = arrayOfInt[1];
      this.zzafu.right = (j + arrayOfInt[0]);
      this.zzafu.bottom = (k + arrayOfInt[1]);
      if (this.zzadU)
      {
        zzoc();
        this.zzadU = false;
      }
    }

    public void onGlobalLayout()
    {
      if (this.zzafx == null);
      View localView;
      do
      {
        return;
        localView = (View)this.zzafx.get();
      }
      while (localView == null);
      zzn(localView);
    }

    public void onViewAttachedToWindow(View paramView)
    {
      zzn(paramView);
    }

    public void onViewDetachedFromWindow(View paramView)
    {
      this.zzaft.zznL();
      paramView.removeOnAttachStateChangeListener(this);
    }

    protected void zzeI(int paramInt)
    {
      this.zzafu = new PopupManager.PopupLocationInfo(paramInt, null, null);
    }

    public void zzm(View paramView)
    {
      this.zzaft.zznL();
      ViewTreeObserver localViewTreeObserver;
      if (this.zzafx != null)
      {
        View localView2 = (View)this.zzafx.get();
        Context localContext2 = this.zzaft.getContext();
        if ((localView2 == null) && ((localContext2 instanceof Activity)))
          localView2 = ((Activity)localContext2).getWindow().getDecorView();
        if (localView2 != null)
        {
          localView2.removeOnAttachStateChangeListener(this);
          localViewTreeObserver = localView2.getViewTreeObserver();
          if (!zzme.zzkh())
            break label184;
          localViewTreeObserver.removeOnGlobalLayoutListener(this);
        }
      }
      while (true)
      {
        this.zzafx = null;
        Context localContext1 = this.zzaft.getContext();
        if ((paramView == null) && ((localContext1 instanceof Activity)))
        {
          View localView1 = ((Activity)localContext1).findViewById(16908290);
          if (localView1 == null)
            localView1 = ((Activity)localContext1).getWindow().getDecorView();
          GamesLog.zzr("PopupManager", "You have not specified a View to use as content view for popups. Falling back to the Activity content view which may not work properly in future versions of the API. Use setViewForPopups() to set your content view.");
          paramView = localView1;
        }
        if (paramView == null)
          break;
        zzn(paramView);
        this.zzafx = new WeakReference(paramView);
        paramView.addOnAttachStateChangeListener(this);
        paramView.getViewTreeObserver().addOnGlobalLayoutListener(this);
        return;
        label184: localViewTreeObserver.removeGlobalOnLayoutListener(this);
      }
      GamesLog.zzs("PopupManager", "No content view usable to display popups. Popups will not be displayed in response to this client's calls. Use setViewForPopups() to set your content view.");
    }

    public void zzoc()
    {
      if (this.zzafu.zzafv != null)
      {
        super.zzoc();
        return;
      }
      if (this.zzafx != null);
      for (boolean bool = true; ; bool = false)
      {
        this.zzadU = bool;
        return;
      }
    }
  }
}