package com.google.android.gms.dynamic;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.View;

public final class zzh extends zzc.zza
{
  private Fragment zzPt;

  private zzh(Fragment paramFragment)
  {
    this.zzPt = paramFragment;
  }

  public static zzh zza(Fragment paramFragment)
  {
    if (paramFragment != null)
      return new zzh(paramFragment);
    return null;
  }

  public Bundle getArguments()
  {
    return this.zzPt.getArguments();
  }

  public int getId()
  {
    return this.zzPt.getId();
  }

  public boolean getRetainInstance()
  {
    return this.zzPt.getRetainInstance();
  }

  public String getTag()
  {
    return this.zzPt.getTag();
  }

  public int getTargetRequestCode()
  {
    return this.zzPt.getTargetRequestCode();
  }

  public boolean getUserVisibleHint()
  {
    return this.zzPt.getUserVisibleHint();
  }

  public zzd getView()
  {
    return zze.zzn(this.zzPt.getView());
  }

  public boolean isAdded()
  {
    return this.zzPt.isAdded();
  }

  public boolean isDetached()
  {
    return this.zzPt.isDetached();
  }

  public boolean isHidden()
  {
    return this.zzPt.isHidden();
  }

  public boolean isInLayout()
  {
    return this.zzPt.isInLayout();
  }

  public boolean isRemoving()
  {
    return this.zzPt.isRemoving();
  }

  public boolean isResumed()
  {
    return this.zzPt.isResumed();
  }

  public boolean isVisible()
  {
    return this.zzPt.isVisible();
  }

  public void setHasOptionsMenu(boolean paramBoolean)
  {
    this.zzPt.setHasOptionsMenu(paramBoolean);
  }

  public void setMenuVisibility(boolean paramBoolean)
  {
    this.zzPt.setMenuVisibility(paramBoolean);
  }

  public void setRetainInstance(boolean paramBoolean)
  {
    this.zzPt.setRetainInstance(paramBoolean);
  }

  public void setUserVisibleHint(boolean paramBoolean)
  {
    this.zzPt.setUserVisibleHint(paramBoolean);
  }

  public void startActivity(Intent paramIntent)
  {
    this.zzPt.startActivity(paramIntent);
  }

  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    this.zzPt.startActivityForResult(paramIntent, paramInt);
  }

  public void zzd(zzd paramzzd)
  {
    View localView = (View)zze.zzf(paramzzd);
    this.zzPt.registerForContextMenu(localView);
  }

  public void zze(zzd paramzzd)
  {
    View localView = (View)zze.zzf(paramzzd);
    this.zzPt.unregisterForContextMenu(localView);
  }

  public zzd zzlh()
  {
    return zze.zzn(this.zzPt.getActivity());
  }

  public zzc zzli()
  {
    return zza(this.zzPt.getParentFragment());
  }

  public zzd zzlj()
  {
    return zze.zzn(this.zzPt.getResources());
  }

  public zzc zzlk()
  {
    return zza(this.zzPt.getTargetFragment());
  }
}