package android.support.v7.app;

import android.support.v7.view.ActionMode;

public abstract interface AppCompatCallback
{
  public abstract void onSupportActionModeFinished(ActionMode paramActionMode);

  public abstract void onSupportActionModeStarted(ActionMode paramActionMode);
}