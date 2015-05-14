package pl.charmas.android.reactivelocation.observables.activity;

import android.content.Context;
import com.google.android.gms.common.api.Api;
import pl.charmas.android.reactivelocation.observables.BaseObservable;

public abstract class BaseActivityObservable<T> extends BaseObservable<T>
{
  protected BaseActivityObservable(Context paramContext)
  {
    super(paramContext, arrayOfApi);
  }
}