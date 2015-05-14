package pl.charmas.android.reactivelocation;

import com.google.android.gms.common.data.AbstractDataBuffer;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

public final class DataBufferObservable
{
  public static <T> Observable<T> from(AbstractDataBuffer<T> paramAbstractDataBuffer)
  {
    return Observable.create(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super T> paramAnonymousSubscriber)
      {
        Observable.from(this.val$buffer).subscribe(paramAnonymousSubscriber);
        paramAnonymousSubscriber.add(Subscriptions.create(new Action0()
        {
          public void call()
          {
            DataBufferObservable.1.this.val$buffer.release();
          }
        }));
      }
    });
  }
}