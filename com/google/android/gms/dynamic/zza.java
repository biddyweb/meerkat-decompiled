package com.google.android.gms.dynamic;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.util.Iterator;
import java.util.LinkedList;

public abstract class zza<T extends LifecycleDelegate>
{
  private T zzXN;
  private Bundle zzXO;
  private LinkedList<zza> zzXP;
  private final zzf<T> zzXQ = new zzf()
  {
    public void zza(T paramAnonymousT)
    {
      zza.zza(zza.this, paramAnonymousT);
      Iterator localIterator = zza.zza(zza.this).iterator();
      while (localIterator.hasNext())
        ((zza.zza)localIterator.next()).zzb(zza.zzb(zza.this));
      zza.zza(zza.this).clear();
      zza.zza(zza.this, null);
    }
  };

  private void zza(Bundle paramBundle, zza paramzza)
  {
    if (this.zzXN != null)
    {
      paramzza.zzb(this.zzXN);
      return;
    }
    if (this.zzXP == null)
      this.zzXP = new LinkedList();
    this.zzXP.add(paramzza);
    if (paramBundle != null)
    {
      if (this.zzXO != null)
        break label76;
      this.zzXO = ((Bundle)paramBundle.clone());
    }
    while (true)
    {
      zza(this.zzXQ);
      return;
      label76: this.zzXO.putAll(paramBundle);
    }
  }

  public static void zzb(FrameLayout paramFrameLayout)
  {
    Context localContext = paramFrameLayout.getContext();
    final int i = GooglePlayServicesUtil.isGooglePlayServicesAvailable(localContext);
    String str1 = GooglePlayServicesUtil.zze(localContext, i);
    String str2 = GooglePlayServicesUtil.zzf(localContext, i);
    LinearLayout localLinearLayout = new LinearLayout(paramFrameLayout.getContext());
    localLinearLayout.setOrientation(1);
    localLinearLayout.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
    paramFrameLayout.addView(localLinearLayout);
    TextView localTextView = new TextView(paramFrameLayout.getContext());
    localTextView.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
    localTextView.setText(str1);
    localLinearLayout.addView(localTextView);
    if (str2 != null)
    {
      Button localButton = new Button(localContext);
      localButton.setLayoutParams(new FrameLayout.LayoutParams(-2, -2));
      localButton.setText(str2);
      localLinearLayout.addView(localButton);
      localButton.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          this.zznK.startActivity(GooglePlayServicesUtil.zzan(i));
        }
      });
    }
  }

  private void zzdd(int paramInt)
  {
    while ((!this.zzXP.isEmpty()) && (((zza)this.zzXP.getLast()).getState() >= paramInt))
      this.zzXP.removeLast();
  }

  public void onCreate(final Bundle paramBundle)
  {
    zza(paramBundle, new zza()
    {
      public int getState()
      {
        return 1;
      }

      public void zzb(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        zza.zzb(zza.this).onCreate(paramBundle);
      }
    });
  }

  public View onCreateView(final LayoutInflater paramLayoutInflater, final ViewGroup paramViewGroup, final Bundle paramBundle)
  {
    final FrameLayout localFrameLayout = new FrameLayout(paramLayoutInflater.getContext());
    zza(paramBundle, new zza()
    {
      public int getState()
      {
        return 2;
      }

      public void zzb(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        localFrameLayout.removeAllViews();
        localFrameLayout.addView(zza.zzb(zza.this).onCreateView(paramLayoutInflater, paramViewGroup, paramBundle));
      }
    });
    if (this.zzXN == null)
      zza(localFrameLayout);
    return localFrameLayout;
  }

  public void onDestroy()
  {
    if (this.zzXN != null)
    {
      this.zzXN.onDestroy();
      return;
    }
    zzdd(1);
  }

  public void onDestroyView()
  {
    if (this.zzXN != null)
    {
      this.zzXN.onDestroyView();
      return;
    }
    zzdd(2);
  }

  public void onInflate(final Activity paramActivity, final Bundle paramBundle1, final Bundle paramBundle2)
  {
    zza(paramBundle2, new zza()
    {
      public int getState()
      {
        return 0;
      }

      public void zzb(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        zza.zzb(zza.this).onInflate(paramActivity, paramBundle1, paramBundle2);
      }
    });
  }

  public void onLowMemory()
  {
    if (this.zzXN != null)
      this.zzXN.onLowMemory();
  }

  public void onPause()
  {
    if (this.zzXN != null)
    {
      this.zzXN.onPause();
      return;
    }
    zzdd(5);
  }

  public void onResume()
  {
    zza(null, new zza()
    {
      public int getState()
      {
        return 5;
      }

      public void zzb(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        zza.zzb(zza.this).onResume();
      }
    });
  }

  public void onSaveInstanceState(Bundle paramBundle)
  {
    if (this.zzXN != null)
      this.zzXN.onSaveInstanceState(paramBundle);
    while (this.zzXO == null)
      return;
    paramBundle.putAll(this.zzXO);
  }

  public void onStart()
  {
    zza(null, new zza()
    {
      public int getState()
      {
        return 4;
      }

      public void zzb(LifecycleDelegate paramAnonymousLifecycleDelegate)
      {
        zza.zzb(zza.this).onStart();
      }
    });
  }

  public void onStop()
  {
    if (this.zzXN != null)
    {
      this.zzXN.onStop();
      return;
    }
    zzdd(4);
  }

  protected void zza(FrameLayout paramFrameLayout)
  {
    zzb(paramFrameLayout);
  }

  protected abstract void zza(zzf<T> paramzzf);

  public T zzlg()
  {
    return this.zzXN;
  }

  private static abstract interface zza
  {
    public abstract int getState();

    public abstract void zzb(LifecycleDelegate paramLifecycleDelegate);
  }
}