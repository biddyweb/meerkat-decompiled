package pl.charmas.android.reactivelocation.observables;

import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import rx.Observable.OnSubscribe;
import rx.Subscriber;
import rx.functions.Action0;
import rx.subscriptions.Subscriptions;

public class PendingResultObservable<T extends Result>
  implements Observable.OnSubscribe<T>
{
  private boolean complete = false;
  private final PendingResult<T> result;

  public PendingResultObservable(PendingResult<T> paramPendingResult)
  {
    this.result = paramPendingResult;
  }

  public void call(final Subscriber<? super T> paramSubscriber)
  {
    this.result.setResultCallback(new ResultCallback()
    {
      public void onResult(T paramAnonymousT)
      {
        paramSubscriber.onNext(paramAnonymousT);
        PendingResultObservable.access$002(PendingResultObservable.this, true);
        paramSubscriber.onCompleted();
      }
    });
    paramSubscriber.add(Subscriptions.create(new Action0()
    {
      public void call()
      {
        if (!PendingResultObservable.this.complete)
          PendingResultObservable.this.result.cancel();
      }
    }));
  }
}