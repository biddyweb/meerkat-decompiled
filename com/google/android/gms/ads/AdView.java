package com.google.android.gms.ads;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.purchase.InAppPurchaseListener;
import com.google.android.gms.ads.purchase.PlayStorePurchaseListener;
import com.google.android.gms.internal.zzat;
import com.google.android.gms.internal.zzbp;

public final class AdView extends ViewGroup
{
  private final zzbp zzll;

  public AdView(Context paramContext)
  {
    super(paramContext);
    this.zzll = new zzbp(this);
  }

  public AdView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    this.zzll = new zzbp(this, paramAttributeSet, false);
  }

  public AdView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    this.zzll = new zzbp(this, paramAttributeSet, false);
  }

  public void destroy()
  {
    this.zzll.destroy();
  }

  public AdListener getAdListener()
  {
    return this.zzll.getAdListener();
  }

  public AdSize getAdSize()
  {
    return this.zzll.getAdSize();
  }

  public String getAdUnitId()
  {
    return this.zzll.getAdUnitId();
  }

  public InAppPurchaseListener getInAppPurchaseListener()
  {
    return this.zzll.getInAppPurchaseListener();
  }

  public String getMediationAdapterClassName()
  {
    return this.zzll.getMediationAdapterClassName();
  }

  public void loadAd(AdRequest paramAdRequest)
  {
    this.zzll.zza(paramAdRequest.zzY());
  }

  protected void onLayout(boolean paramBoolean, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    View localView = getChildAt(0);
    if ((localView != null) && (localView.getVisibility() != 8))
    {
      int i = localView.getMeasuredWidth();
      int j = localView.getMeasuredHeight();
      int k = (paramInt3 - paramInt1 - i) / 2;
      int m = (paramInt4 - paramInt2 - j) / 2;
      localView.layout(k, m, i + k, j + m);
    }
  }

  protected void onMeasure(int paramInt1, int paramInt2)
  {
    View localView = getChildAt(0);
    AdSize localAdSize = getAdSize();
    int j;
    int i;
    if ((localView != null) && (localView.getVisibility() != 8))
    {
      measureChild(localView, paramInt1, paramInt2);
      j = localView.getMeasuredWidth();
      i = localView.getMeasuredHeight();
    }
    while (true)
    {
      int k = Math.max(j, getSuggestedMinimumWidth());
      int m = Math.max(i, getSuggestedMinimumHeight());
      setMeasuredDimension(View.resolveSize(k, paramInt1), View.resolveSize(m, paramInt2));
      return;
      if (localAdSize != null)
      {
        Context localContext = getContext();
        j = localAdSize.getWidthInPixels(localContext);
        i = localAdSize.getHeightInPixels(localContext);
      }
      else
      {
        i = 0;
        j = 0;
      }
    }
  }

  public void pause()
  {
    this.zzll.pause();
  }

  public void resume()
  {
    this.zzll.resume();
  }

  public void setAdListener(AdListener paramAdListener)
  {
    this.zzll.setAdListener(paramAdListener);
    if ((paramAdListener != null) && ((paramAdListener instanceof zzat)))
      this.zzll.zza((zzat)paramAdListener);
    while (paramAdListener != null)
      return;
    this.zzll.zza(null);
  }

  public void setAdSize(AdSize paramAdSize)
  {
    this.zzll.setAdSizes(new AdSize[] { paramAdSize });
  }

  public void setAdUnitId(String paramString)
  {
    this.zzll.setAdUnitId(paramString);
  }

  public void setInAppPurchaseListener(InAppPurchaseListener paramInAppPurchaseListener)
  {
    this.zzll.setInAppPurchaseListener(paramInAppPurchaseListener);
  }

  public void setPlayStorePurchaseParams(PlayStorePurchaseListener paramPlayStorePurchaseListener, String paramString)
  {
    this.zzll.setPlayStorePurchaseParams(paramPlayStorePurchaseListener, paramString);
  }
}