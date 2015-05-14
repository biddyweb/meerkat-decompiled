package co.getair.meerkat.mediators;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.graphics.Point;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import android.opengl.EGL14;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.KeyEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import android.widget.TextView.OnEditorActionListener;
import android.widget.ToggleButton;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.dtos.watch_broadcast.BroadcastBeganParams;
import co.getair.meerkat.dtos.watch_broadcast.Watcher;
import co.getair.meerkat.dtos.watch_broadcast.WatchersCountParams;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.proxies.ResourcesProxy;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import co.getair.meerkat.video.broadcast.ChunkedHWRecorder;
import co.getair.meerkat.video.broadcast.mp4writer.MeerkatMp4Builder;
import com.makeramen.roundedimageview.RoundedImageView;
import com.nanotasks.BackgroundWork;
import com.nanotasks.Completion;
import com.nanotasks.Tasks;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class BroadcastMediator extends Mediator
  implements SurfaceHolder.Callback
{
  private static final int COVER_IMAGE_CAPTURE_DELAY = 3000;
  private static final String NAME = "BroadcastMediator";
  private static final int PIPE_BUFFER = 2000000;
  private ImageButton addCommentButton;
  private View addCommentContainer;
  private EditText addCommentEditText;
  private TextView addCommentHandleTextView;
  private Button addCommentSendButton;
  private TextView broadcastCaptionTextView;
  private View broadcastEndedContainer;
  private ImageButton broadcastEndedHomeButton;
  private TextView broadcastEndedWatchedCountTextView;
  private View broadcastTrendingTextView;
  private View broadcasterContainer;
  private TextView broadcasterHandleTextView;
  private ImageView broadcasterImage;
  private TextView broadcasterLocationTextView;
  private TextView broadcasterNameTextView;
  ChunkedHWRecorder chunkedHWRecorder;
  private Context context;
  private MeerkatMp4Builder currentBuilder;
  private int currentCameraDirection = 0;
  HashMap<String, Watcher> currentWatchers;
  private boolean didEndBroadcasting = false;
  private boolean didSendCoverImage = false;
  private ImageButton flashlightSwitchButton;
  private ImageButton flipCameraButton;
  private ImageButton homeButton;
  public PipedInputStream inPipe = new PipedInputStream(2000000);
  private View interactionsContainer;
  private View lowConnectivityContainer;
  private View lowConnectivityNoAudioContainer;
  private String mediaServerUrl = null;
  private ToggleButton optOutTweetsButton;
  public PipedOutputStream outPipe;
  boolean recording = false;
  private ViewGroup rootView;
  boolean surfaceReady = false;
  private SurfaceView surfaceView;
  int totalNumberOfWatchers = 0;
  private TextView watcherCountTextView;
  private LinearLayout watchersList;

  public BroadcastMediator(Object paramObject)
  {
    super(NAME(), paramObject);
    this.rootView = ((ViewGroup)paramObject);
    this.context = this.rootView.getContext();
    this.surfaceView = ((SurfaceView)this.rootView.findViewById(2131624047));
    this.surfaceView.getHolder().addCallback(this);
    this.interactionsContainer = this.rootView.findViewById(2131624059);
    this.homeButton = ((ImageButton)this.rootView.findViewById(2131624061));
    this.flipCameraButton = ((ImageButton)this.rootView.findViewById(2131624062));
    this.flashlightSwitchButton = ((ImageButton)this.rootView.findViewById(2131624063));
    this.addCommentButton = ((ImageButton)this.rootView.findViewById(2131624060));
    this.addCommentContainer = this.rootView.findViewById(2131624064);
    this.addCommentHandleTextView = ((TextView)this.rootView.findViewById(2131624067));
    this.addCommentEditText = ((EditText)this.rootView.findViewById(2131624068));
    this.addCommentSendButton = ((Button)this.rootView.findViewById(2131624069));
    this.optOutTweetsButton = ((ToggleButton)this.rootView.findViewById(2131624065));
    this.optOutTweetsButton.setChecked(Boolean.TRUE.booleanValue());
    this.lowConnectivityNoAudioContainer = this.rootView.findViewById(2131624130);
    this.lowConnectivityContainer = this.rootView.findViewById(2131624131);
    this.broadcasterContainer = this.rootView.findViewById(2131624048);
    this.broadcasterImage = ((RoundedImageView)this.rootView.findViewById(2131624049));
    this.broadcasterNameTextView = ((TextView)this.rootView.findViewById(2131624050));
    this.broadcasterHandleTextView = ((TextView)this.rootView.findViewById(2131624051));
    this.broadcasterLocationTextView = ((TextView)this.rootView.findViewById(2131624052));
    this.broadcastCaptionTextView = ((TextView)this.rootView.findViewById(2131624053));
    this.watchersList = ((LinearLayout)this.rootView.findViewById(2131624056));
    this.watcherCountTextView = ((TextView)this.rootView.findViewById(2131624054));
    this.broadcastEndedContainer = this.rootView.findViewById(2131624070);
    this.broadcastEndedWatchedCountTextView = ((TextView)this.rootView.findViewById(2131624071));
    this.broadcastEndedHomeButton = ((ImageButton)this.rootView.findViewById(2131624073));
    User localUser = new GraphProxy("graphProxy", this.rootView.getContext()).getMyUser();
    TextView localTextView = this.addCommentHandleTextView;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = localUser.getUsername();
    localTextView.setText(String.format("@%s", arrayOfObject));
    this.homeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.stopBroadcast();
      }
    });
    this.flipCameraButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.toggleCameraClicked();
      }
    });
    this.flashlightSwitchButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.toggleTorchMode();
      }
    });
    this.addCommentButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.setCommentsVisibility(true);
      }
    });
    this.addCommentSendButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.sendComment();
      }
    });
    this.addCommentEditText.setOnFocusChangeListener(new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        BroadcastMediator.this.setCommentsVisibility(paramAnonymousBoolean);
      }
    });
    this.addCommentEditText.setOnEditorActionListener(new TextView.OnEditorActionListener()
    {
      public boolean onEditorAction(TextView paramAnonymousTextView, int paramAnonymousInt, KeyEvent paramAnonymousKeyEvent)
      {
        switch (paramAnonymousInt)
        {
        default:
        case 4:
        }
        while (true)
        {
          return false;
          BroadcastMediator.this.sendComment();
        }
      }
    });
    this.optOutTweetsButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean)
        {
          BroadcastMediator.this.getFacade().sendNotification("commandOptInTweets", null, null);
          return;
        }
        BroadcastMediator.this.getFacade().sendNotification("commandOptOutTweets", null, null);
      }
    });
    this.broadcastEndedHomeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        BroadcastMediator.this.leaveBroadcast();
      }
    });
    showBroadcasterInfo();
    updateWatchersCount(0, 0);
  }

  public static String NAME()
  {
    return "BroadcastMediator";
  }

  private void broadcastCutOff()
  {
    Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
    new AlertDialog.Builder(localActivity).setTitle(localActivity.getString(2131296282)).setMessage(localActivity.getString(2131296281)).setPositiveButton(localActivity.getString(2131296428), new DialogInterface.OnClickListener()
    {
      public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
      {
        BroadcastMediator.this.finishBroadcasting();
      }
    }).show();
  }

  private Context getApplicationContext()
  {
    try
    {
      Context localContext = ((BaseFacade)getFacade()).getOwnerActivity().getApplicationContext();
      return localContext;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return null;
  }

  private void handleConnectionIssues()
  {
    try
    {
      Log.d("BroadcastMediator", "Connection Issues");
      this.outPipe.close();
      this.inPipe.close();
      this.inPipe = new PipedInputStream(2000000);
      this.outPipe = new PipedOutputStream(this.inPipe);
      this.chunkedHWRecorder.builder = this.currentBuilder.createRecoveryBuilder(this.outPipe);
      new Handler().postDelayed(new Runnable()
      {
        public void run()
        {
          if (BroadcastMediator.this.recording)
            BroadcastMediator.this.startSubmission(BroadcastMediator.this.mediaServerUrl);
        }
      }
      , 10000L);
      return;
    }
    catch (Throwable localThrowable)
    {
    }
  }

  private void revealAllBroadcastScreen(String paramString1, String paramString2)
  {
    if (!paramString2.isEmpty())
    {
      this.broadcasterLocationTextView.setText(paramString2);
      this.broadcasterLocationTextView.setVisibility(0);
      if (paramString1.isEmpty())
        break label83;
      this.broadcastCaptionTextView.setText(paramString1);
      this.broadcastCaptionTextView.setVisibility(0);
    }
    while (true)
    {
      this.addCommentButton.setVisibility(0);
      this.flipCameraButton.setVisibility(0);
      this.flashlightSwitchButton.setVisibility(0);
      return;
      this.broadcasterLocationTextView.setVisibility(8);
      break;
      label83: this.broadcastCaptionTextView.setVisibility(8);
    }
  }

  private void setLowConnectivityNoAudioVisible(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.lowConnectivityNoAudioContainer.setVisibility(0);
      return;
    }
    this.lowConnectivityNoAudioContainer.setVisibility(8);
  }

  private void setLowConnectivityVisible(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.lowConnectivityContainer.setVisibility(0);
      return;
    }
    this.lowConnectivityContainer.setVisibility(8);
  }

  private void startAdaptiveBitrateMonitor()
  {
    Tasks.executeInBackground(((BaseFacade)getFacade()).getOwnerActivity().getApplicationContext(), new BackgroundWork()
    {
      public String doInBackground()
        throws Exception
      {
        while (BroadcastMediator.this.recording)
        {
          int i = BroadcastMediator.this.inPipe.available();
          MLog.i("buffer available " + i);
          Thread.sleep(1000L);
          if (i > 1000000)
          {
            BroadcastMediator.this.chunkedHWRecorder.setBitRateRatio(0.5D);
            MLog.i("bitrate reduced by 0.5");
          }
        }
        return "";
      }
    }
    , new Completion()
    {
      public void onError(Context paramAnonymousContext, Exception paramAnonymousException)
      {
        MLog.e(paramAnonymousException.getMessage());
      }

      public void onSuccess(Context paramAnonymousContext, String paramAnonymousString)
      {
      }
    });
  }

  private void startSubmission(final String paramString)
  {
    Tasks.executeInBackground(getApplicationContext(), new BackgroundWork()
    {
      public BroadcastMediator.StreamerResult doInBackground()
        throws Exception
      {
        MLog.i("Starting submission");
        DefaultHttpClient localDefaultHttpClient = new DefaultHttpClient();
        HttpParams localHttpParams = localDefaultHttpClient.getParams();
        HttpConnectionParams.setSoTimeout(localHttpParams, 30000);
        HttpConnectionParams.setTcpNoDelay(localHttpParams, true);
        HttpPost localHttpPost = new HttpPost(paramString);
        InputStreamEntity localInputStreamEntity = new InputStreamEntity(BroadcastMediator.this.inPipe, -1L);
        localInputStreamEntity.setContentType("binary/octet-stream");
        localInputStreamEntity.setChunked(true);
        localHttpPost.setEntity(localInputStreamEntity);
        localDefaultHttpClient.execute(localHttpPost).getEntity();
        return BroadcastMediator.StreamerResult.connectionIssues;
      }
    }
    , new Completion()
    {
      public void onError(Context paramAnonymousContext, Exception paramAnonymousException)
      {
        MLog.e("Connection issues. Reconnecting - " + paramAnonymousException.getMessage());
        BroadcastMediator.this.handleConnectionIssues();
      }

      public void onSuccess(Context paramAnonymousContext, BroadcastMediator.StreamerResult paramAnonymousStreamerResult)
      {
      }
    });
  }

  private void stopBroadcast()
  {
    this.surfaceReady = false;
    if (this.recording)
    {
      Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
      new AlertDialog.Builder(localActivity).setTitle(localActivity.getString(2131296287)).setMessage(localActivity.getString(2131296284)).setPositiveButton(localActivity.getString(2131296286), new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          BroadcastMediator.access$402(BroadcastMediator.this, true);
          BroadcastMediator.this.chunkedHWRecorder.endStream();
          BroadcastMediator.this.finishBroadcasting();
        }
      }).setNegativeButton(localActivity.getString(2131296285), new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
      return;
    }
    leaveBroadcast();
  }

  private void toggleTorchMode()
  {
    if (this.context.getPackageManager().hasSystemFeature("android.hardware.camera.flash"))
      this.chunkedHWRecorder.toggleFlashMode();
  }

  private void updateWatchersCount(int paramInt1, int paramInt2)
  {
    String str1 = this.rootView.getResources().getString(2131296405);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(paramInt2);
    arrayOfObject[1] = Integer.valueOf(paramInt1);
    String str2 = String.format(str1, arrayOfObject);
    this.watcherCountTextView.setText(str2);
    this.totalNumberOfWatchers = paramInt2;
  }

  private void updateWatchersList(ArrayList<Watcher> paramArrayList)
  {
    if (this.currentWatchers == null)
      this.currentWatchers = new HashMap();
    Iterator localIterator1 = this.currentWatchers.entrySet().iterator();
    while (localIterator1.hasNext())
      if (!paramArrayList.contains((Map.Entry)localIterator1.next()))
        localIterator1.remove();
    Iterator localIterator2 = paramArrayList.iterator();
    while (localIterator2.hasNext())
    {
      Watcher localWatcher2 = (Watcher)localIterator2.next();
      if (!this.currentWatchers.containsKey(localWatcher2.id))
        this.currentWatchers.put(localWatcher2.id, localWatcher2);
    }
    this.watchersList.removeAllViews();
    DisplayImageOptions.Builder localBuilder = new DisplayImageOptions.Builder();
    localBuilder.cacheInMemory(true);
    localBuilder.resetViewBeforeLoading(true);
    localBuilder.showImageForEmptyUri(ResourcesProxy.getInstance().getUserPhotoPlaceholder());
    localBuilder.showImageOnFail(ResourcesProxy.getInstance().getUserPhotoPlaceholder());
    localBuilder.showImageOnLoading(ResourcesProxy.getInstance().getUserPhotoPlaceholder());
    DisplayImageOptions localDisplayImageOptions = localBuilder.build();
    Iterator localIterator3 = this.currentWatchers.keySet().iterator();
    while (localIterator3.hasNext())
    {
      String str = (String)localIterator3.next();
      Watcher localWatcher1 = (Watcher)this.currentWatchers.get(str);
      Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
      RoundedImageView localRoundedImageView = new RoundedImageView(localActivity);
      DisplayMetrics localDisplayMetrics = new DisplayMetrics();
      localActivity.getWindowManager().getDefaultDisplay().getMetrics(localDisplayMetrics);
      LinearLayout.LayoutParams localLayoutParams = new LinearLayout.LayoutParams((int)(40.0F * localDisplayMetrics.density), (int)(40.0F * localDisplayMetrics.density));
      localLayoutParams.setMargins(5, 0, 5, 0);
      localRoundedImageView.setLayoutParams(localLayoutParams);
      localRoundedImageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
      localRoundedImageView.setCornerRadius(90.0F);
      localRoundedImageView.setClickable(true);
      localRoundedImageView.setTag(localWatcher1);
      this.watchersList.addView(localRoundedImageView);
      if (localWatcher1.profileThumbImage != null)
        ImageLoader.getInstance().displayImage(localWatcher1.profileThumbImage, localRoundedImageView, localDisplayImageOptions);
    }
  }

  // ERROR //
  public void finishBroadcasting()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 692\011co/getair/meerkat/mediators/BroadcastMediator:stopChunkedRecorder\011()V
    //   4: aload_0
    //   5: getfield 224\011co/getair/meerkat/mediators/BroadcastMediator:broadcastEndedWatchedCountTextView\011Landroid/widget/TextView;
    //   8: astore 5
    //   10: iconst_1
    //   11: anewarray 240\011java/lang/Object
    //   14: astore 6
    //   16: aload 6
    //   18: iconst_0
    //   19: aload_0
    //   20: getfield 97\011co/getair/meerkat/mediators/BroadcastMediator:totalNumberOfWatchers\011I
    //   23: invokestatic 520\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   26: aastore
    //   27: aload 5
    //   29: ldc_w 694
    //   32: aload 6
    //   34: invokestatic 253\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   37: invokevirtual 257\011android/widget/TextView:setText\011(Ljava/lang/CharSequence;)V
    //   40: aload_0
    //   41: getfield 221\011co/getair/meerkat/mediators/BroadcastMediator:broadcastEndedContainer\011Landroid/view/View;
    //   44: iconst_0
    //   45: invokevirtual 453\011android/view/View:setVisibility\011(I)V
    //   48: aload_0
    //   49: iconst_0
    //   50: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   53: aload_0
    //   54: getfield 224\011co/getair/meerkat/mediators/BroadcastMediator:broadcastEndedWatchedCountTextView\011Landroid/widget/TextView;
    //   57: astore_3
    //   58: iconst_1
    //   59: anewarray 240\011java/lang/Object
    //   62: astore 4
    //   64: aload 4
    //   66: iconst_0
    //   67: aload_0
    //   68: getfield 97\011co/getair/meerkat/mediators/BroadcastMediator:totalNumberOfWatchers\011I
    //   71: invokestatic 520\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   74: aastore
    //   75: aload_3
    //   76: ldc_w 694
    //   79: aload 4
    //   81: invokestatic 253\011java/lang/String:format\011(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   84: invokevirtual 257\011android/widget/TextView:setText\011(Ljava/lang/CharSequence;)V
    //   87: aload_0
    //   88: getfield 221\011co/getair/meerkat/mediators/BroadcastMediator:broadcastEndedContainer\011Landroid/view/View;
    //   91: iconst_0
    //   92: invokevirtual 453\011android/view/View:setVisibility\011(I)V
    //   95: aload_0
    //   96: iconst_0
    //   97: putfield 86\011co/getair/meerkat/mediators/BroadcastMediator:surfaceReady\011Z
    //   100: aload_0
    //   101: iconst_0
    //   102: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   105: return
    //   106: astore_2
    //   107: aload_0
    //   108: iconst_0
    //   109: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   112: goto -59 -> 53
    //   115: astore_1
    //   116: aload_0
    //   117: iconst_0
    //   118: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   121: aload_1
    //   122: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01148\011106\011java/lang/Throwable
    //   0\01148\011115\011finally
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventBroadcastBegan"))
    {
      BroadcastBeganParams localBroadcastBeganParams = (BroadcastBeganParams)paramINotification.getBody();
      revealAllBroadcastScreen(localBroadcastBeganParams.getCaption(), localBroadcastBeganParams.getLocationText());
    }
    if (paramINotification.getName().equals("eventStreamWatchersReceived"))
      updateWatchersList((ArrayList)paramINotification.getBody());
    if (paramINotification.getName().equals("eventStreamWatchersCountUpdated"))
    {
      WatchersCountParams localWatchersCountParams = (WatchersCountParams)paramINotification.getBody();
      updateWatchersCount(localWatchersCountParams.getCurrentWatchersCount(), localWatchersCountParams.getTotalWatchersCount());
    }
    if (paramINotification.getName().equals("broadcastActivityResumed"))
      ownerResumed();
    if (paramINotification.getName().equals("broadcastActivityPaused"))
      ownerPaused();
    if (paramINotification.getName().equals("eventMediaServerUrlArrived"))
    {
      this.mediaServerUrl = ((String)paramINotification.getBody() + "?mkfr=" + 90);
      startBroadcast();
    }
    if ((paramINotification.getName().equals("eventStreamHasEnded")) && (!this.didEndBroadcasting))
      broadcastCutOff();
    if (paramINotification.getName().equals("eventDismissBroadcastScreen"))
    {
      finishBroadcasting();
      leaveBroadcast();
    }
  }

  public void leaveBroadcast()
  {
    ((BaseFacade)getFacade()).getOwnerActivity().finish();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventBroadcastBegan", "eventStreamWatchersReceived", "eventStreamWatchersCountUpdated", "broadcastActivityResumed", "broadcastActivityPaused", "eventMediaServerUrlArrived", "eventStreamHasEnded", "eventDismissBroadcastScreen" };
  }

  public void ownerPaused()
  {
    stopBroadcast();
  }

  public void ownerResumed()
  {
    finishBroadcasting();
  }

  public void sendComment()
  {
    String str = this.addCommentEditText.getText().toString();
    if ((str != null) && (!str.isEmpty()))
    {
      sendNotification("eventAddComment", str, null);
      this.addCommentEditText.setText("");
      this.addCommentEditText.clearFocus();
      ((InputMethodManager)((BaseFacade)getFacade()).getOwnerActivity().getSystemService("input_method")).hideSoftInputFromWindow(this.rootView.getWindowToken(), 0);
    }
  }

  public void setCameraDisplayOrientation()
  {
    int i = ((BaseFacade)getFacade()).getOwnerActivity().getWindowManager().getDefaultDisplay().getRotation();
    int j = 0;
    Camera.CameraInfo localCameraInfo;
    switch (i)
    {
    default:
      localCameraInfo = new Camera.CameraInfo();
      Camera.getCameraInfo(this.currentCameraDirection, localCameraInfo);
      if (localCameraInfo.facing != 1)
        break;
    case 0:
    case 1:
    case 2:
    case 3:
    }
    for (int k = (360 - (j + localCameraInfo.orientation) % 360) % 360; ; k = (360 + (localCameraInfo.orientation - j)) % 360)
    {
      this.chunkedHWRecorder.setCameraDisplayOrientation(k);
      return;
      j = 0;
      break;
      j = 90;
      break;
      j = 180;
      break;
      j = 270;
      break;
    }
  }

  public void setCommentsVisibility(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.addCommentContainer.setVisibility(0);
      this.interactionsContainer.setVisibility(8);
      if (this.addCommentEditText.requestFocus())
        ((InputMethodManager)((BaseFacade)getFacade()).getOwnerActivity().getSystemService("input_method")).showSoftInput(this.addCommentEditText, 0);
      return;
    }
    this.addCommentContainer.setVisibility(8);
    this.interactionsContainer.setVisibility(0);
  }

  public void showBroadcasterInfo()
  {
    User localUser = ((GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy")).getMyUser();
    this.broadcasterNameTextView.setText(localUser.getDisplayName());
    this.broadcasterHandleTextView.setText(localUser.getUsername());
    DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(true).build();
    ImageLoader.getInstance().displayImage(localUser.getThumbnailImageUrl(), this.broadcasterImage, localDisplayImageOptions);
  }

  public void startBroadcast()
  {
    if ((!this.surfaceReady) || (this.mediaServerUrl == null));
    while (true)
    {
      return;
      try
      {
        startChunkedHWRecorder(this.currentCameraDirection);
        this.recording = true;
        if (!this.didSendCoverImage)
        {
          new Handler().postDelayed(new Runnable()
          {
            public void run()
            {
              BroadcastMediator.this.chunkedHWRecorder.requestFrameFromCamera(new RunnableWithResultObject()
              {
                public void run()
                {
                  BroadcastMediator.access$502(BroadcastMediator.this, true);
                  BroadcastMediator.this.getFacade().sendNotification("broadcastReceivedCoverImage", this.resultObject, null);
                }
              });
            }
          }
          , 3000L);
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        localThrowable.printStackTrace();
      }
    }
  }

  public void startChunkedHWRecorder(int paramInt)
    throws Throwable
  {
    this.inPipe = new PipedInputStream(2000000);
    this.outPipe = new PipedOutputStream(this.inPipe);
    this.currentBuilder = new MeerkatMp4Builder(this.outPipe);
    Display localDisplay = ((BaseFacade)getFacade()).getOwnerActivity().getWindowManager().getDefaultDisplay();
    Point localPoint = new Point();
    localDisplay.getSize(localPoint);
    int i = localPoint.x;
    int j = localPoint.y;
    this.chunkedHWRecorder = new ChunkedHWRecorder(this.currentBuilder, i, j);
    this.chunkedHWRecorder.setCameraId(paramInt);
    this.chunkedHWRecorder.setDisplayEGLContext(EGL14.eglGetCurrentContext());
    this.chunkedHWRecorder.setSurfaceHolder(this.surfaceView.getHolder());
    setCameraDisplayOrientation();
    ChunkedHWRecorderWrapper.runTest(this.chunkedHWRecorder);
    startSubmission(this.mediaServerUrl);
  }

  public void stopChunkedRecorder()
    throws Throwable
  {
    this.chunkedHWRecorder.stopRecording();
  }

  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    this.surfaceReady = true;
    startBroadcast();
  }

  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
  }

  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    Log.d("", "Surface destroyed");
    this.surfaceReady = false;
  }

  // ERROR //
  public void toggleCameraClicked()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 692\011co/getair/meerkat/mediators/BroadcastMediator:stopChunkedRecorder\011()V
    //   4: aload_0
    //   5: iconst_0
    //   6: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   9: new 118\011android/view/SurfaceView
    //   12: dup
    //   13: aload_0
    //   14: getfield 111\011co/getair/meerkat/mediators/BroadcastMediator:context\011Landroid/content/Context;
    //   17: invokespecial 923\011android/view/SurfaceView:<init>\011(Landroid/content/Context;)V
    //   20: astore_3
    //   21: aload_3
    //   22: aload_0
    //   23: getfield 120\011co/getair/meerkat/mediators/BroadcastMediator:surfaceView\011Landroid/view/SurfaceView;
    //   26: invokevirtual 927\011android/view/SurfaceView:getLayoutParams\011()Landroid/view/ViewGroup$LayoutParams;
    //   29: invokevirtual 928\011android/view/SurfaceView:setLayoutParams\011(Landroid/view/ViewGroup$LayoutParams;)V
    //   32: aload_3
    //   33: invokevirtual 124\011android/view/SurfaceView:getHolder\011()Landroid/view/SurfaceHolder;
    //   36: aload_0
    //   37: invokeinterface 130 2 0
    //   42: aload_0
    //   43: getfield 105\011co/getair/meerkat/mediators/BroadcastMediator:rootView\011Landroid/view/ViewGroup;
    //   46: aload_0
    //   47: getfield 120\011co/getair/meerkat/mediators/BroadcastMediator:surfaceView\011Landroid/view/SurfaceView;
    //   50: invokevirtual 931\011android/view/ViewGroup:removeView\011(Landroid/view/View;)V
    //   53: aload_0
    //   54: getfield 105\011co/getair/meerkat/mediators/BroadcastMediator:rootView\011Landroid/view/ViewGroup;
    //   57: aload_3
    //   58: iconst_0
    //   59: invokevirtual 934\011android/view/ViewGroup:addView\011(Landroid/view/View;I)V
    //   62: aload_0
    //   63: aload_3
    //   64: putfield 120\011co/getair/meerkat/mediators/BroadcastMediator:surfaceView\011Landroid/view/SurfaceView;
    //   67: aload_0
    //   68: getfield 82\011co/getair/meerkat/mediators/BroadcastMediator:currentCameraDirection\011I
    //   71: istore 4
    //   73: iconst_0
    //   74: istore 5
    //   76: iload 4
    //   78: ifne +6 -> 84
    //   81: iconst_1
    //   82: istore 5
    //   84: aload_0
    //   85: iload 5
    //   87: putfield 82\011co/getair/meerkat/mediators/BroadcastMediator:currentCameraDirection\011I
    //   90: aload_0
    //   91: invokevirtual 764\011co/getair/meerkat/mediators/BroadcastMediator:startBroadcast\011()V
    //   94: return
    //   95: astore_2
    //   96: aload_0
    //   97: iconst_0
    //   98: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   101: goto -92 -> 9
    //   104: astore_1
    //   105: aload_0
    //   106: iconst_0
    //   107: putfield 88\011co/getair/meerkat/mediators/BroadcastMediator:recording\011Z
    //   110: aload_1
    //   111: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\0114\01195\011java/lang/Throwable
    //   0\0114\011104\011finally
  }

  private static class ChunkedHWRecorderWrapper
    implements Runnable
  {
    private ChunkedHWRecorder chunkedHwRecorder;
    private Throwable mThrowable;

    private ChunkedHWRecorderWrapper(ChunkedHWRecorder paramChunkedHWRecorder)
    {
      this.chunkedHwRecorder = paramChunkedHWRecorder;
    }

    public static void runTest(ChunkedHWRecorder paramChunkedHWRecorder)
      throws Throwable
    {
      ChunkedHWRecorderWrapper localChunkedHWRecorderWrapper = new ChunkedHWRecorderWrapper(paramChunkedHWRecorder);
      new Thread(localChunkedHWRecorderWrapper, "broadcast codec").start();
      if (localChunkedHWRecorderWrapper.mThrowable != null)
        throw localChunkedHWRecorderWrapper.mThrowable;
    }

    public void run()
    {
      try
      {
        this.chunkedHwRecorder.startRecording();
        return;
      }
      catch (Throwable localThrowable)
      {
        this.mThrowable = localThrowable;
      }
    }
  }

  public static enum StreamerResult
  {
    static
    {
      failure = new StreamerResult("failure", 1);
      connectionIssues = new StreamerResult("connectionIssues", 2);
      cancelled = new StreamerResult("cancelled", 3);
      StreamerResult[] arrayOfStreamerResult = new StreamerResult[4];
      arrayOfStreamerResult[0] = success;
      arrayOfStreamerResult[1] = failure;
      arrayOfStreamerResult[2] = connectionIssues;
      arrayOfStreamerResult[3] = cancelled;
    }
  }
}