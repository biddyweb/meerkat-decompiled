package co.getair.meerkat.mediators;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnFocusChangeListener;
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
import android.widget.Toast;
import android.widget.ToggleButton;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.dtos.feed.LiveBroadcastSummary;
import co.getair.meerkat.dtos.twitter.ReplyParams;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.dtos.watch_broadcast.Watcher;
import co.getair.meerkat.dtos.watch_broadcast.WatchersCountParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.facades.WatchActivityFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.proxies.ResourcesProxy;
import co.getair.meerkat.proxies.WatchProxy;
import co.getair.meerkat.video.VideoPlayerView;
import com.makeramen.roundedimageview.RoundedImageView;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class WatchMediator extends Mediator
{
  private ImageButton addCommentButton;
  private View addCommentContainer;
  private EditText addCommentEditText;
  private TextView addCommentHandleTextView;
  private Button addCommentSendButton;
  private TextView broadcastDescriptionTextView;
  private View broadcastTrendingTextView;
  private View broadcasterContainer;
  private TextView broadcasterHandleTextView;
  private ImageView broadcasterImage;
  private TextView broadcasterLocationTextView;
  private TextView broadcasterNameTextView;
  private Context context;
  HashMap<String, Watcher> currentWatchers;
  private ImageButton homeButton;
  private View interactionsContainer;
  private ImageButton likeButton;
  private ToggleButton optOutTweetsButton;
  private ImageButton reportButton;
  private ImageButton restreamButton;
  private View rootView;
  private ImageButton saySomethingNiceButton;
  private ImageButton streamEndedHomeButton;
  private View streamEndedOverylay;
  private TextView streamEndedWatchedTextView;
  private VideoPlayerView videoPlayerView;
  private TextView watcherCountTextView;
  private LinearLayout watchersList;

  public WatchMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.context = this.rootView.getContext();
    this.videoPlayerView = ((VideoPlayerView)this.rootView.findViewById(2131624129));
    this.interactionsContainer = this.rootView.findViewById(2131624143);
    this.homeButton = ((ImageButton)this.rootView.findViewById(2131624145));
    this.likeButton = ((ImageButton)this.rootView.findViewById(2131624146));
    this.restreamButton = ((ImageButton)this.rootView.findViewById(2131624147));
    this.addCommentButton = ((ImageButton)this.rootView.findViewById(2131624144));
    this.addCommentContainer = this.rootView.findViewById(2131624064);
    this.addCommentHandleTextView = ((TextView)this.rootView.findViewById(2131624148));
    this.addCommentEditText = ((EditText)this.rootView.findViewById(2131624149));
    this.addCommentSendButton = ((Button)this.rootView.findViewById(2131624150));
    this.optOutTweetsButton = ((ToggleButton)this.rootView.findViewById(2131624065));
    this.optOutTweetsButton.setChecked(Boolean.TRUE.booleanValue());
    this.streamEndedOverylay = this.rootView.findViewById(2131624151);
    this.streamEndedWatchedTextView = ((TextView)this.rootView.findViewById(2131624153));
    this.saySomethingNiceButton = ((ImageButton)this.rootView.findViewById(2131624154));
    this.streamEndedHomeButton = ((ImageButton)this.rootView.findViewById(2131624155));
    this.broadcasterContainer = this.rootView.findViewById(2131624132);
    this.broadcasterImage = ((RoundedImageView)this.rootView.findViewById(2131624133));
    this.broadcasterNameTextView = ((TextView)this.rootView.findViewById(2131624134));
    this.broadcasterHandleTextView = ((TextView)this.rootView.findViewById(2131624135));
    this.broadcasterLocationTextView = ((TextView)this.rootView.findViewById(2131624137));
    this.broadcastDescriptionTextView = ((TextView)this.rootView.findViewById(2131624138));
    this.watchersList = ((LinearLayout)this.rootView.findViewById(2131624141));
    this.watcherCountTextView = ((TextView)this.rootView.findViewById(2131624139));
    this.broadcastTrendingTextView = this.rootView.findViewById(2131624142);
    this.reportButton = ((ImageButton)this.rootView.findViewById(2131624136));
    User localUser = new GraphProxy("graphProxy", this.rootView.getContext()).getMyUser();
    TextView localTextView = this.addCommentHandleTextView;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = localUser.getUsername();
    localTextView.setText(String.format("@%s", arrayOfObject));
    this.homeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.finishWatchingStream();
      }
    });
    this.likeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.getWatchActivityFacade().sendNotification("eventLikeGotClicked", null, null);
      }
    });
    this.restreamButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.getWatchActivityFacade().sendNotification("eventRestreamGotClicked", null, null);
      }
    });
    this.addCommentButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.setCommentsVisibility(true);
      }
    });
    this.addCommentSendButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.sendComment();
      }
    });
    this.addCommentEditText.setOnFocusChangeListener(new View.OnFocusChangeListener()
    {
      public void onFocusChange(View paramAnonymousView, boolean paramAnonymousBoolean)
      {
        WatchMediator.this.setCommentsVisibility(paramAnonymousBoolean);
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
          WatchMediator.this.sendComment();
        }
      }
    });
    this.saySomethingNiceButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchProxy localWatchProxy = (WatchProxy)WatchMediator.this.getWatchActivityFacade().retrieveProxy("watchProxy");
        WatchMediator.this.getWatchActivityFacade().sendNotification("eventEndWatchSaySomethingNiceButtonClicked", localWatchProxy.getBroadcastSummary(), null);
      }
    });
    this.streamEndedHomeButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.finishWatchingStream();
      }
    });
    this.reportButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        WatchMediator.this.getWatchActivityFacade().sendNotification("eventReportGotClicked", null, null);
      }
    });
    this.optOutTweetsButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener()
    {
      public void onCheckedChanged(CompoundButton paramAnonymousCompoundButton, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousBoolean)
        {
          WatchMediator.this.getFacade().sendNotification("commandOptInTweets", null, null);
          return;
        }
        WatchMediator.this.getFacade().sendNotification("commandOptOutTweets", null, null);
      }
    });
    setBroadcastInfoVisibility(false);
    setCommentsVisibility(false);
  }

  private void finishWatchingStream()
  {
    ((WatchActivityFacade)getFacade()).getOwnerActivity().finish();
  }

  private WatchActivityFacade getWatchActivityFacade()
  {
    return WatchActivityFacade.getInst(((BaseFacade)getFacade()).getOwnerActivity());
  }

  private void showToastError(String paramString)
  {
    Toast.makeText(((BaseFacade)getFacade()).getOwnerActivity(), paramString, 0).show();
  }

  private void updateWatchersCount(int paramInt1, int paramInt2)
  {
    String str1 = this.rootView.getResources().getString(2131296405);
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = Integer.valueOf(paramInt2);
    arrayOfObject[1] = Integer.valueOf(paramInt1);
    String str2 = String.format(str1, arrayOfObject);
    this.watcherCountTextView.setText(str2);
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

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventPlaylistArrived"))
      this.videoPlayerView.watchStream((String)paramINotification.getBody());
    if (paramINotification.getName().equals("eventBroadcastInfoArrived"))
      refreshBroadcastInfo((LiveBroadcastSummary)paramINotification.getBody());
    if (paramINotification.getName().equals("eventStreamHasEnded"))
    {
      this.interactionsContainer.setVisibility(4);
      this.streamEndedOverylay.setVisibility(0);
      this.videoPlayerView.stopProgressBar();
    }
    if (paramINotification.getName().equals("eventEndWatchSaySomethingNiceButtonClicked"))
    {
      final LiveBroadcastSummary localLiveBroadcastSummary = (LiveBroadcastSummary)paramINotification.getBody();
      final EditText localEditText = new EditText(this.context);
      localEditText.setInputType(1);
      AlertDialog.Builder localBuilder = new AlertDialog.Builder(this.context);
      Context localContext = this.context;
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = localLiveBroadcastSummary.getBroadcaster().getTwitterHandle();
      localBuilder.setMessage(localContext.getString(2131296278, arrayOfObject)).setView(localEditText).setPositiveButton(2131296455, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          String str = localLiveBroadcastSummary.getBroadcaster().getUsername();
          ReplyParams localReplyParams = new ReplyParams(localEditText.getText().toString(), localLiveBroadcastSummary.getTweetId(), str);
          WatchMediator.this.sendNotification("commandReplyToTweet", localReplyParams, null);
        }
      }).setNegativeButton(2131296290, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          paramAnonymousDialogInterface.cancel();
        }
      }).create().show();
    }
    if (paramINotification.getName().equals("eventStreamRestreamed"))
      setRestreamVisibility(false);
    if (paramINotification.getName().equals("eventStreamRestreamError"))
      showToastError("Error restreaming - Please try again");
    if (paramINotification.getName().equals("eventStreamLiked"))
      setLikeVisibility(false);
    if (paramINotification.getName().equals("eventStreamLikeError"))
      showToastError("Error liking stream - Please try again");
    if ((!paramINotification.getName().equals("eventCommentAdded")) || (paramINotification.getName().equals("eventStreamWatchersReceived")))
      updateWatchersList((ArrayList)paramINotification.getBody());
    if (paramINotification.getName().equals("eventCommentAddedError"))
      showToastError("Error adding stream - Please try again");
    if (paramINotification.getName().equals("eventStreamWatchersCountUpdated"))
    {
      WatchersCountParams localWatchersCountParams = (WatchersCountParams)paramINotification.getBody();
      updateWatchersCount(localWatchersCountParams.getCurrentWatchersCount(), localWatchersCountParams.getTotalWatchersCount());
    }
    if (paramINotification.getName().equals("eventDismissWatchScreen"))
      finishWatchingStream();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventPlaylistArrived", "eventBroadcastInfoArrived", "eventStreamHasEnded", "eventLikeGotClicked", "eventStreamRestreamed", "eventStreamRestreamError", "eventStreamLiked", "eventStreamLikeError", "eventCommentAdded", "eventCommentAddedError", "eventStreamWatchersReceived", "eventStreamWatchersCountUpdated", "eventEndWatchSaySomethingNiceButtonClicked", "eventDismissWatchScreen" };
  }

  public void onRemove()
  {
    try
    {
      this.videoPlayerView.cleanVideoView();
      super.onRemove();
      return;
    }
    catch (Exception localException)
    {
      while (true)
        localException.printStackTrace();
    }
  }

  public void refreshBroadcastInfo(LiveBroadcastSummary paramLiveBroadcastSummary)
  {
    String str1 = paramLiveBroadcastSummary.getLocation();
    label51: boolean bool1;
    label144: boolean bool2;
    label161: View localView;
    int i;
    if ((str1 != null) && (!str1.isEmpty()))
    {
      this.broadcasterLocationTextView.setText(paramLiveBroadcastSummary.getLocation());
      String str2 = paramLiveBroadcastSummary.getCaption();
      if ((str2 == null) || (str2.isEmpty()))
        break label212;
      this.broadcastDescriptionTextView.setText(str2);
      Broadcaster localBroadcaster = paramLiveBroadcastSummary.getBroadcaster();
      this.broadcasterNameTextView.setText(localBroadcaster.getDisplayName());
      this.broadcasterHandleTextView.setText(localBroadcaster.getTwitterHandle());
      DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(true).build();
      ImageLoader.getInstance().displayImage(localBroadcaster.getImageUrl(), this.broadcasterImage, localDisplayImageOptions);
      WatchProxy localWatchProxy = (WatchProxy)getWatchActivityFacade().retrieveProxy("watchProxy");
      if (localWatchProxy.didLikeStream())
        break label224;
      bool1 = true;
      setLikeVisibility(bool1);
      if (localWatchProxy.didRestream())
        break label230;
      bool2 = true;
      setRestreamVisibility(bool2);
      setBroadcastInfoVisibility(true);
      localView = this.broadcastTrendingTextView;
      boolean bool3 = paramLiveBroadcastSummary.isTrending();
      i = 0;
      if (!bool3)
        break label236;
    }
    while (true)
    {
      localView.setVisibility(i);
      return;
      this.broadcasterLocationTextView.setVisibility(8);
      break;
      label212: this.broadcastDescriptionTextView.setVisibility(8);
      break label51;
      label224: bool1 = false;
      break label144;
      label230: bool2 = false;
      break label161;
      label236: i = 8;
    }
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

  public void setBroadcastInfoVisibility(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = 0; ; i = 8)
    {
      this.broadcasterContainer.setVisibility(i);
      this.broadcastDescriptionTextView.setVisibility(i);
      TextView localTextView = this.broadcasterLocationTextView;
      if (this.broadcasterLocationTextView.getText().toString().isEmpty())
        i = 8;
      localTextView.setVisibility(i);
      return;
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

  public void setLikeVisibility(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.likeButton.setVisibility(0);
      return;
    }
    this.likeButton.setVisibility(4);
  }

  public void setRestreamVisibility(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      this.restreamButton.setVisibility(0);
      return;
    }
    this.restreamButton.setVisibility(4);
  }
}