package pl.charmas.android.reactivelocation.observables.activity;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.ActivityRecognition;
import com.google.android.gms.location.ActivityRecognitionApi;
import com.google.android.gms.location.ActivityRecognitionResult;
import rx.Observable;
import rx.Observer;

public class ActivityUpdatesObservable extends BaseActivityObservable<ActivityRecognitionResult>
{
  private static final String ACTION_ACTIVITY_DETECTED = "pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED";
  private final Context context;
  private final int detectionIntervalMilliseconds;
  private ActivityUpdatesBroadcastReceiver receiver;

  private ActivityUpdatesObservable(Context paramContext, int paramInt)
  {
    super(paramContext);
    this.context = paramContext;
    this.detectionIntervalMilliseconds = paramInt;
  }

  public static Observable<ActivityRecognitionResult> createObservable(Context paramContext, int paramInt)
  {
    return Observable.create(new ActivityUpdatesObservable(paramContext, paramInt));
  }

  private PendingIntent getReceiverPendingIntent()
  {
    return PendingIntent.getBroadcast(this.context, 0, new Intent("pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED"), 134217728);
  }

  protected void onGoogleApiClientReady(GoogleApiClient paramGoogleApiClient, Observer<? super ActivityRecognitionResult> paramObserver)
  {
    this.receiver = new ActivityUpdatesBroadcastReceiver(paramObserver);
    this.context.registerReceiver(this.receiver, new IntentFilter("pl.charmas.android.reactivelocation.ACTION_ACTIVITY_UPDATE_DETECTED"));
    PendingIntent localPendingIntent = getReceiverPendingIntent();
    ActivityRecognition.ActivityRecognitionApi.requestActivityUpdates(paramGoogleApiClient, this.detectionIntervalMilliseconds, localPendingIntent);
  }

  protected void onUnsubscribed(GoogleApiClient paramGoogleApiClient)
  {
    if (paramGoogleApiClient.isConnected())
      ActivityRecognition.ActivityRecognitionApi.removeActivityUpdates(paramGoogleApiClient, getReceiverPendingIntent());
    this.context.unregisterReceiver(this.receiver);
    this.receiver = null;
  }

  private static class ActivityUpdatesBroadcastReceiver extends BroadcastReceiver
  {
    private final Observer<? super ActivityRecognitionResult> observer;

    public ActivityUpdatesBroadcastReceiver(Observer<? super ActivityRecognitionResult> paramObserver)
    {
      this.observer = paramObserver;
    }

    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if (ActivityRecognitionResult.hasResult(paramIntent))
      {
        ActivityRecognitionResult localActivityRecognitionResult = ActivityRecognitionResult.extractResult(paramIntent);
        this.observer.onNext(localActivityRecognitionResult);
      }
    }
  }
}