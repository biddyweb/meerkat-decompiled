package pl.charmas.android.reactivelocation.observables;

import android.content.Context;
import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Api.ApiOptions.NotRequiredOptions;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import rx.Observable.OnSubscribe;
import rx.Observer;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

public abstract class BaseObservable<T>
  implements Observable.OnSubscribe<T>
{
  private final Context ctx;
  private final List<Api<? extends Api.ApiOptions.NotRequiredOptions>> services;

  @SafeVarargs
  protected BaseObservable(Context paramContext, Api<? extends Api.ApiOptions.NotRequiredOptions>[] paramArrayOfApi)
  {
    this.ctx = paramContext;
    this.services = Arrays.asList(paramArrayOfApi);
  }

  public void call(Subscriber<? super T> paramSubscriber)
  {
    final GoogleApiClient localGoogleApiClient = createApiClient(paramSubscriber);
    try
    {
      localGoogleApiClient.connect();
      paramSubscriber.add(Subscriptions.create(new Action0()
      {
        public void call()
        {
          if ((localGoogleApiClient.isConnected()) || (localGoogleApiClient.isConnecting()))
          {
            BaseObservable.this.onUnsubscribed(localGoogleApiClient);
            localGoogleApiClient.disconnect();
          }
        }
      }));
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
        paramSubscriber.onError(localThrowable);
    }
  }

  protected GoogleApiClient createApiClient(Subscriber<? super T> paramSubscriber)
  {
    ApiClientConnectionCallbacks localApiClientConnectionCallbacks = new ApiClientConnectionCallbacks(paramSubscriber, null);
    GoogleApiClient.Builder localBuilder = new GoogleApiClient.Builder(this.ctx);
    Iterator localIterator = this.services.iterator();
    while (localIterator.hasNext())
      localBuilder.addApi((Api)localIterator.next());
    localBuilder.addConnectionCallbacks(localApiClientConnectionCallbacks);
    localBuilder.addOnConnectionFailedListener(localApiClientConnectionCallbacks);
    GoogleApiClient localGoogleApiClient = localBuilder.build();
    localApiClientConnectionCallbacks.setClient(localGoogleApiClient);
    return localGoogleApiClient;
  }

  protected abstract void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, Observer<? super T> paramObserver);

  protected void onUnsubscribed(GoogleApiClient paramGoogleApiClient)
  {
  }

  private class ApiClientConnectionCallbacks
    implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
  {
    private GoogleApiClient apiClient;
    private final Observer<? super T> observer;

    private ApiClientConnectionCallbacks()
    {
      Object localObject;
      this.observer = localObject;
    }

    public void onConnected(Bundle paramBundle)
    {
      try
      {
        BaseObservable.this.onGoogleApiClientReady(this.apiClient, this.observer);
        return;
      }
      catch (Throwable localThrowable)
      {
        this.observer.onError(localThrowable);
      }
    }

    public void onConnectionFailed(ConnectionResult paramConnectionResult)
    {
      this.observer.onError(new GoogleAPIConnectionException("Error connecting to GoogleApiClient.", paramConnectionResult));
    }

    public void onConnectionSuspended(int paramInt)
    {
      this.observer.onError(new GoogleAPIConnectionSuspendedException(paramInt));
    }

    public void setClient(GoogleApiClient paramGoogleApiClient)
    {
      this.apiClient = paramGoogleApiClient;
    }
  }
}