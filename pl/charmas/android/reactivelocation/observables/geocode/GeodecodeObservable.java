package pl.charmas.android.reactivelocation.observables.geocode;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import java.io.IOException;
import java.util.List;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;

public class GeodecodeObservable
  implements Observable.OnSubscribe<List<Address>>
{
  private final Context ctx;
  private final double latitude;
  private final double longitude;
  private final int maxResults;

  private GeodecodeObservable(Context paramContext, double paramDouble1, double paramDouble2, int paramInt)
  {
    this.ctx = paramContext;
    this.latitude = paramDouble1;
    this.longitude = paramDouble2;
    this.maxResults = paramInt;
  }

  public static Observable<List<Address>> createObservable(Context paramContext, double paramDouble1, double paramDouble2, int paramInt)
  {
    return Observable.create(new GeodecodeObservable(paramContext, paramDouble1, paramDouble2, paramInt));
  }

  public void call(Subscriber<? super List<Address>> paramSubscriber)
  {
    Geocoder localGeocoder = new Geocoder(this.ctx);
    try
    {
      paramSubscriber.onNext(localGeocoder.getFromLocation(this.latitude, this.longitude, this.maxResults));
      paramSubscriber.onCompleted();
      return;
    }
    catch (IOException localIOException)
    {
      paramSubscriber.onError(localIOException);
    }
  }
}