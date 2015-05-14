package pl.charmas.android.reactivelocation.observables;

import android.content.Context;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NotRequiredOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import rx.Observable;
import rx.Observer;

public class GoogleAPIClientObservable extends BaseObservable<GoogleApiClient>
{
  @SafeVarargs
  protected GoogleAPIClientObservable(Context paramContext, Api<? extends Api.ApiOptions.NotRequiredOptions>[] paramArrayOfApi)
  {
    super(paramContext, paramArrayOfApi);
  }

  @SafeVarargs
  public static Observable<GoogleApiClient> create(Context paramContext, Api<? extends Api.ApiOptions.NotRequiredOptions>[] paramArrayOfApi)
  {
    return Observable.create(new GoogleAPIClientObservable(paramContext, paramArrayOfApi));
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, Observer<? super GoogleApiClient> paramObserver)
  {
    paramObserver.onNext(paramGoogleApiClient);
    paramObserver.onCompleted();
  }
}