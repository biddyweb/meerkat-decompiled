package com.google.android.gms.dynamic;

import android.app.Fragment;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public final class zzb extends zzc.zza
{
  private Fragment zzXZ;

  private zzb(Fragment paramFragment)
  {
    this.zzXZ = paramFragment;
  }

  public static zzb zza(Fragment paramFragment)
  {
    if (paramFragment != null)
      return new zzb(paramFragment);
    return null;
  }

  public Bundle getArguments()
  {
    return this.zzXZ.getArguments();
  }

  public int getId()
  {
    return this.zzXZ.getId();
  }

  public boolean getRetainInstance()
  {
    return this.zzXZ.getRetainInstance();
  }

  public String getTag()
  {
    return this.zzXZ.getTag();
  }

  public int getTargetRequestCode()
  {
    return this.zzXZ.getTargetRequestCode();
  }

  public boolean getUserVisibleHint()
  {
    return this.zzXZ.getUserVisibleHint();
  }

  public zzd getView()
  {
    return zze.zzn(this.zzXZ.getView());
  }

  public boolean isAdded()
  {
    return this.zzXZ.isAdded();
  }

  public boolean isDetached()
  {
    return this.zzXZ.isDetached();
  }

  public boolean isHidden()
  {
    return this.zzXZ.isHidden();
  }

  public boolean isInLayout()
  {
    return this.zzXZ.isInLayout();
  }

  public boolean isRemoving()
  {
    return this.zzXZ.isRemoving();
  }

  public boolean isResumed()
  {
    return this.zzXZ.isResumed();
  }

  public boolean isVisible()
  {
    return this.zzXZ.isVisible();
  }

  public void setHasOptionsMenu(boolean paramBoolean)
  {
    this.zzXZ.setHasOptionsMenu(paramBoolean);
  }

  public void setMenuVisibility(boolean paramBoolean)
  {
    this.zzXZ.setMenuVisibility(paramBoolean);
  }

  public void setRetainInstance(boolean paramBoolean)
  {
    this.zzXZ.setRetainInstance(paramBoolean);
  }

  public void setUserVisibleHint(boolean paramBoolean)
  {
    this.zzXZ.setUserVisibleHint(paramBoolean);
  }

  public void startActivity(Intent paramIntent)
  {
    this.zzXZ.startActivity(paramIntent);
  }

  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    this.zzXZ.startActivityForResult(paramIntent, paramInt);
  }

  public void zzd(zzd paramzzd)
  {
    View localView = (View)zze.zzf(paramzzd);
    this.zzXZ.registerForContextMenu(localView);
  }

  public void zze(zzd paramzzd)
  {
    View localView = (View)zze.zzf(paramzzd);
    this.zzXZ.unregisterForContextMenu(localView);
  }

  public zzd zzlh()
  {
    return zze.zzn(this.zzXZ.getActivity());
  }

  public zzc zzli()
  {
    return zza(this.zzXZ.getParentFragment());
  }

  public zzd zzlj()
  {
    return zze.zzn(this.zzXZ.getResources());
  }

  public zzc zzlk()
  {
    return zza(this.zzXZ.getTargetFragment());
  }
}