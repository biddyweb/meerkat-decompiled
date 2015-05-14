package pl.charmas.android.reactivelocation.observables;

import android.content.Context;
import com.google.android.gms.common.api.Api;

public abstract class BaseLocationObservable<T> extends BaseObservable<T>
{
  protected BaseLocationObservable(Context paramContext)
  {
    super(paramContext, arrayOfApi);
  }
}