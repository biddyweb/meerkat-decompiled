package android.support.v4.app;

import android.support.annotation.Nullable;
import android.view.View;

abstract interface FragmentContainer
{
  @Nullable
  public abstract View findViewById(int paramInt);

  public abstract boolean hasView();
}