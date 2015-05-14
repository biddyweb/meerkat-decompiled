package co.getair.meerkat.mediators;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.support.v4.widget.SwipeRefreshLayout;
import android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener;
import android.text.Editable;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.activities.CommentsActivity;
import co.getair.meerkat.activities.ProfileActivity;
import co.getair.meerkat.activities.ScheduleBroadcastActivity;
import co.getair.meerkat.activities.UserListActivity;
import co.getair.meerkat.activities.WatchActivity;
import co.getair.meerkat.commands.feed.GetLiveParams;
import co.getair.meerkat.dtos.GoLiveParams;
import co.getair.meerkat.dtos.Influencer;
import co.getair.meerkat.dtos.Influencer.Type;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.dtos.feed.BroadcastSummary;
import co.getair.meerkat.dtos.feed.LiveBroadcastSummary;
import co.getair.meerkat.dtos.feed.ScheduledBroadcastSummary;
import co.getair.meerkat.dtos.feed.StreamFeedItemProxy;
import co.getair.meerkat.dtos.feed.StreamFeedItemProxy.Type;
import co.getair.meerkat.dtos.feed.StreamFeedLiveItemProxy;
import co.getair.meerkat.dtos.feed.StreamFeedScheduledItemProxy;
import co.getair.meerkat.dtos.feed.StreamsCacheProxy;
import co.getair.meerkat.dtos.watch_broadcast.Broadcaster;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.DateFormatter;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.MeerkatUrlBuilder;
import co.getair.meerkat.views.NavigationBar;
import com.google.common.base.Optional;
import com.google.common.collect.Lists;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.ocpsoft.prettytime.PrettyTime;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class FeedMediator extends Mediator
{
  private static final String MEERKAT_HASHTAG = "#meerkat";
  private static final Pattern MEERKAT_HASHTAG_PATTERN = Pattern.compile(String.format("(^|\\s)%s\\b", new Object[] { "#meerkat" }));
  private final Context context;
  private FeedArrayAdapter feedAdapter;
  private ListView feedLiveListView;
  private Button goLiveButton;
  private Handler handler = new Handler(Looper.getMainLooper());
  private int lastFocussedPosition = -1;
  private int liveCount = 0;
  private NavigationBar navigationBar;
  private ProgressBar progressBar;
  private View rootView;
  private int scheduledCount = 0;
  private boolean searchingForUser = false;
  private boolean shouldFilterStreams = true;
  private SwipeRefreshLayout swipeRefreshLayout;

  public FeedMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.context = this.rootView.getContext();
    this.navigationBar = ((NavigationBar)this.rootView.findViewById(2131624082));
    this.navigationBar.loadScore();
    this.navigationBar.loadUsername();
    this.progressBar = ((ProgressBar)this.rootView.findViewById(2131624080));
    this.feedLiveListView = ((ListView)this.rootView.findViewById(2131624081));
    this.feedLiveListView.setOnItemClickListener(new AdapterView.OnItemClickListener()
    {
      public void onItemClick(AdapterView<?> paramAnonymousAdapterView, View paramAnonymousView, int paramAnonymousInt, long paramAnonymousLong)
      {
        FeedMediator.FeedArrayAdapter localFeedArrayAdapter = (FeedMediator.FeedArrayAdapter)FeedMediator.this.feedLiveListView.getAdapter();
        if (localFeedArrayAdapter == null);
        StreamFeedItemProxy localStreamFeedItemProxy;
        BroadcastSummary localBroadcastSummary;
        do
        {
          do
          {
            return;
            localStreamFeedItemProxy = localFeedArrayAdapter.getItem(paramAnonymousInt);
          }
          while (localStreamFeedItemProxy == null);
          localBroadcastSummary = localStreamFeedItemProxy.getBroadcastSummary();
          if (localStreamFeedItemProxy.getType() == StreamFeedItemProxy.Type.Live)
            FeedMediator.this.openWatchForFeed(localBroadcastSummary);
        }
        while (localStreamFeedItemProxy.getType() != StreamFeedItemProxy.Type.Scheduled);
        FeedMediator.this.openShareScheduledStream(localBroadcastSummary);
      }
    });
    this.goLiveButton = ((Button)this.rootView.findViewById(2131624075));
    this.goLiveButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
      }
    });
    this.swipeRefreshLayout = ((SwipeRefreshLayout)this.rootView.findViewById(2131624077));
    this.swipeRefreshLayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener()
    {
      public void onRefresh()
      {
        FeedMediator.this.refreshFeed();
      }
    });
    this.feedAdapter = new FeedArrayAdapter(this.rootView.getContext());
    this.feedAdapter.clear();
    this.feedLiveListView.setAdapter(this.feedAdapter);
  }

  private int binarySearch(StreamFeedItemProxy paramStreamFeedItemProxy, FeedArrayAdapter paramFeedArrayAdapter, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    int j = paramInt2;
    while (i <= j)
    {
      k = (i + j) / 2;
      int m = paramFeedArrayAdapter.getDataItem(k).compareTo(paramStreamFeedItemProxy);
      if (m < 0)
      {
        i = k + 1;
      }
      else
      {
        if (m <= 0)
          break label67;
        j = k - 1;
      }
    }
    int k = i;
    label67: return k;
  }

  private String buildShareText(BroadcastSummary paramBroadcastSummary)
  {
    Date localDate = new Date(1000L * paramBroadcastSummary.getEndTime());
    String str1 = new PrettyTime().format(localDate);
    String str2 = paramBroadcastSummary.getCaption();
    Uri localUri = MeerkatUrlBuilder.scheduledBroadcast(paramBroadcastSummary.getBroadcaster().getUsername(), paramBroadcastSummary.getId());
    StringBuilder localStringBuilder = new StringBuilder().append(str1).append(": ").append(str2.trim()).append(" ");
    if (!MEERKAT_HASHTAG_PATTERN.matcher(str2).find())
    {
      localStringBuilder.append("#meerkat");
      localStringBuilder.append(" ");
    }
    localStringBuilder.append(localUri);
    return localStringBuilder.toString();
  }

  private String getCountStringOrEmpty(int paramInt)
  {
    if (paramInt > 0)
      return Integer.toString(paramInt);
    return "";
  }

  private void openShareScheduledStream(BroadcastSummary paramBroadcastSummary)
  {
    String str = buildShareText(paramBroadcastSummary);
    this.context.startActivity(new Intent().setAction("android.intent.action.SEND").setType("text/plain").putExtra("android.intent.extra.TEXT", str));
  }

  private void openWatchForFeed(BroadcastSummary paramBroadcastSummary)
  {
    this.context.startActivity(WatchActivity.createIntent(this.context, paramBroadcastSummary.getId()));
  }

  private void refreshFeed()
  {
    GetLiveParams localGetLiveParams = new GetLiveParams(this.shouldFilterStreams);
    getFacade().sendNotification("feedGetLive", localGetLiveParams, null);
  }

  private void scheduleBroadcast(String paramString)
  {
    Intent localIntent = new Intent(this.context, ScheduleBroadcastActivity.class);
    localIntent.putExtra("broadcastName", paramString);
    this.context.startActivity(localIntent);
  }

  private void startBroadcast(String paramString)
  {
    getFacade().sendNotification("commandGoLive", new GoLiveParams(paramString), null);
  }

  public void handleNotification(final INotification paramINotification)
  {
    if (paramINotification.getName().equals("feedGetLive"))
      this.progressBar.setVisibility(0);
    if (paramINotification.getName().equals("feedLiveArrived"))
      this.handler.post(new Runnable()
      {
        public void run()
        {
          MLog.d("CRASH", "CLEANING ALL LIVE");
          FeedMediator.this.progressBar.setVisibility(4);
          FeedMediator.this.feedAdapter.removeAllOfType(StreamFeedItemProxy.Type.Live);
          FeedMediator.access$602(FeedMediator.this, 0);
          FeedMediator.this.feedAdapter.notifyDataSetChanged();
        }
      });
    if (paramINotification.getName().equals("feedScheduledArrived"))
      this.handler.post(new Runnable()
      {
        public void run()
        {
          MLog.d("CRASH", "CLEANING ALL SCHEDULED");
          FeedMediator.this.progressBar.setVisibility(4);
          FeedMediator.this.feedAdapter.removeAllOfType(StreamFeedItemProxy.Type.Scheduled);
          FeedMediator.access$702(FeedMediator.this, 0);
          FeedMediator.this.feedAdapter.notifyDataSetChanged();
        }
      });
    if (paramINotification.getName().equals("feedLiveArrivedError"))
    {
      this.progressBar.setVisibility(4);
      this.rootView.setBackgroundColor(-65536);
    }
    if (paramINotification.getName().equals("newStreamArrived"))
      this.handler.post(new Runnable()
      {
        public void run()
        {
          StreamFeedItemProxy localStreamFeedItemProxy = (StreamFeedItemProxy)paramINotification.getBody();
          switch (FeedMediator.11.$SwitchMap$co$getair$meerkat$dtos$feed$StreamFeedItemProxy$Type[localStreamFeedItemProxy.getType().ordinal()])
          {
          default:
          case 1:
          case 2:
          }
          while (true)
          {
            FeedMediator.this.feedAdapter.notifyDataSetChanged();
            FeedMediator.this.swipeRefreshLayout.setRefreshing(false);
            return;
            int j = FeedMediator.this.binarySearch(localStreamFeedItemProxy, FeedMediator.this.feedAdapter, 0, -1 + FeedMediator.this.liveCount);
            FeedMediator.this.feedAdapter.insert(localStreamFeedItemProxy, j);
            FeedMediator.access$608(FeedMediator.this);
            continue;
            int i = FeedMediator.this.binarySearch(localStreamFeedItemProxy, FeedMediator.this.feedAdapter, FeedMediator.this.liveCount, -1 + (FeedMediator.this.scheduledCount + FeedMediator.this.liveCount));
            FeedMediator.this.feedAdapter.insert(localStreamFeedItemProxy, i);
            FeedMediator.access$708(FeedMediator.this);
          }
        }
      });
    if (paramINotification.getName().equals("navigationBarProfileViewClicked"))
      this.context.startActivity(new Intent(this.context, ProfileActivity.class));
    if (paramINotification.getName().equals("navigationBarLeaderboardClicked"))
      this.context.startActivity(new Intent(this.context, UserListActivity.class).putExtra("listSourceBundleKey", "leaderboard").putExtra("listTitleBundleKey", "Leaderboard").putExtra("listShowScoreBundleKey", true));
    if (paramINotification.getName().equals("navigationBarSearchClicked"))
    {
      final EditText localEditText = new EditText(this.context);
      new AlertDialog.Builder(this.context).setTitle("Search for users to follow").setView(localEditText).setPositiveButton("Follow", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
          Editable localEditable = localEditText.getText();
          FeedMediator.access$1002(FeedMediator.this, true);
          String str = localEditable.toString();
          if (str.startsWith("@"))
            str = str.substring(1);
          FeedMediator.this.getFacade().sendNotification("searchForUserCommand", str, null);
        }
      }).setNegativeButton(2131296290, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
    }
    if ((paramINotification.getName().equals("eventUserNotFound")) && (this.searchingForUser))
    {
      this.searchingForUser = false;
      new AlertDialog.Builder(this.context).setTitle("User not found").setMessage("Try another name please").setPositiveButton(2131296428, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
    }
    if ((paramINotification.getName().equals("followSuccessfull")) && (this.searchingForUser))
    {
      this.searchingForUser = false;
      new AlertDialog.Builder(this.context).setTitle("Success!").setPositiveButton(2131296428, new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
    }
    if (paramINotification.getName().equals("scoreInboxItemsArrived"))
      this.navigationBar.loadScore();
    if (paramINotification.getName().equals("eventFeedFilteringEnabled"))
    {
      this.shouldFilterStreams = true;
      refreshFeed();
    }
    if (paramINotification.getName().equals("eventFeedFilteringDisabled"))
    {
      this.shouldFilterStreams = false;
      refreshFeed();
    }
    if (paramINotification.getName().equals("eventFeedResumed"))
    {
      this.navigationBar.loadScore();
      this.navigationBar.loadUsername();
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "feedGetLive", "feedLiveArrived", "feedScheduledArrived", "feedLiveArrivedError", "newStreamArrived", "navigationBarProfileViewClicked", "navigationBarLeaderboardClicked", "navigationBarSearchClicked", "scheduledEventCommentPressed", "followSuccessfull", "eventUserNotFound", "scoreInboxItemsArrived", "eventFeedFilteringEnabled", "eventFeedFilteringDisabled", "eventFeedResumed" };
  }

  public void onRegister()
  {
    super.onRegister();
    this.navigationBar.setFacade(getFacade());
  }

  private class FeedArrayAdapter extends ArrayAdapter<StreamFeedItemProxy>
  {
    public static final String CREATOR_TAG = "CREATOR";
    public static final String HEADER_TAG = "HEADER_TAG";
    private static final int ROW_INDEX_CREATE_BROADCAST = 0;
    private static final int ROW_INDEX_LIVE_HEADER = 1;
    private static final int VIEW_TYPE_ID_CREATE_BROADCAST = 0;
    private static final int VIEW_TYPE_ID_HEADER = 1;
    private static final int VIEW_TYPE_ID_ITEM_LIVE = 2;
    private static final int VIEW_TYPE_ID_ITEM_SCHEDULED = 3;
    private Context context;

    public FeedArrayAdapter(Context arg2)
    {
      super(2130968638);
      this.context = localContext;
    }

    private View createLiveStreamRow(ViewGroup paramViewGroup, View paramView, StreamFeedLiveItemProxy paramStreamFeedLiveItemProxy)
    {
      LiveBroadcastSummary localLiveBroadcastSummary = paramStreamFeedLiveItemProxy.getBroadcastSummary();
      Broadcaster localBroadcaster = localLiveBroadcastSummary.getBroadcaster();
      LiveViewHolder localLiveViewHolder;
      Influencer localInfluencer;
      if ((paramView == null) || (paramView.getTag().getClass() != LiveViewHolder.class))
      {
        paramView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968638, paramViewGroup, false);
        localLiveViewHolder = new LiveViewHolder(paramView);
        paramView.setTag(localLiveViewHolder);
        localInfluencer = paramStreamFeedLiveItemProxy.getInfluencer();
        if (localInfluencer == null)
          break label649;
        localLiveViewHolder.extraInfo.setVisibility(0);
        localLiveViewHolder.extraInfo.setBackgroundResource(2130837992);
        localLiveViewHolder.extraInfo.setTextAppearance(this.context, 2131820550);
        switch (FeedMediator.11.$SwitchMap$co$getair$meerkat$dtos$Influencer$Type[localInfluencer.getType().ordinal()])
        {
        default:
          localLiveViewHolder.extraInfo.setVisibility(8);
        case 1:
        case 2:
        case 3:
        }
      }
      while (true)
      {
        if (localLiveBroadcastSummary.isTrending())
        {
          localLiveViewHolder.extraInfo.setVisibility(0);
          localLiveViewHolder.extraInfo.setBackgroundResource(2130837996);
          localLiveViewHolder.extraInfo.setTextAppearance(this.context, 2131820551);
          TextView localTextView2 = localLiveViewHolder.extraInfo;
          Object[] arrayOfObject4 = new Object[1];
          arrayOfObject4[0] = this.context.getString(2131296427);
          localTextView2.setText(String.format("\uD83D\uDE80 %s", arrayOfObject4));
        }
        DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(true).showImageOnLoading(2130837990).build();
        ImageLoader localImageLoader = ImageLoader.getInstance();
        localImageLoader.displayImage(localLiveBroadcastSummary.getCoverImageUrl(), localLiveViewHolder.cover, localDisplayImageOptions);
        localLiveViewHolder.location.setText(localLiveBroadcastSummary.getLocation());
        localLiveViewHolder.broadcasterNameTextView.setText(localBroadcaster.getDisplayName());
        TextView localTextView1 = localLiveViewHolder.broadcasterHandleTextView;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = localBroadcaster.getUsername();
        localTextView1.setText(String.format("@%s", arrayOfObject1));
        localImageLoader.displayImage(localBroadcaster.getImageUrl(), localLiveViewHolder.broadcasterImage, localDisplayImageOptions);
        StringBuilder localStringBuilder1 = new StringBuilder();
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = localLiveBroadcastSummary.getCaption();
        StringBuilder localStringBuilder2 = localStringBuilder1.append(String.format("<font color=#ffffff>%s</font>", arrayOfObject2));
        if (localLiveBroadcastSummary.getWatchersCount() > 0)
        {
          Object[] arrayOfObject3 = new Object[1];
          arrayOfObject3[0] = Integer.valueOf(localLiveBroadcastSummary.getWatchersCount());
          localStringBuilder2.append(String.format(" <font color=#ffe200>%d watchers</font>", arrayOfObject3));
        }
        localLiveViewHolder.caption.setText(Html.fromHtml(localStringBuilder2.toString()));
        localLiveViewHolder.liveInfoView.setVisibility(0);
        localLiveViewHolder.likeCount.setText(FeedMediator.this.getCountStringOrEmpty(localLiveBroadcastSummary.getLikesCount()));
        localLiveViewHolder.liveCommentCount.setText(FeedMediator.this.getCountStringOrEmpty(localLiveBroadcastSummary.getCommentsCount().intValue()));
        localLiveViewHolder.restreamCount.setText(FeedMediator.this.getCountStringOrEmpty(localLiveBroadcastSummary.getRestreamsCount().intValue()));
        return paramView;
        localLiveViewHolder = (LiveViewHolder)paramView.getTag();
        break;
        localLiveViewHolder.extraInfo.setText(2131296331);
        continue;
        TextView localTextView4 = localLiveViewHolder.extraInfo;
        Context localContext2 = this.context;
        Object[] arrayOfObject6 = new Object[1];
        arrayOfObject6[0] = localInfluencer.getUserName();
        localTextView4.setText(localContext2.getString(2131296447, arrayOfObject6));
        continue;
        TextView localTextView3 = localLiveViewHolder.extraInfo;
        Context localContext1 = this.context;
        Object[] arrayOfObject5 = new Object[1];
        arrayOfObject5[0] = localInfluencer.getUserName();
        localTextView3.setText(localContext1.getString(2131296420, arrayOfObject5));
        continue;
        label649: localLiveViewHolder.extraInfo.setVisibility(8);
      }
    }

    private View createScheduledStreamRow(ViewGroup paramViewGroup, View paramView, final StreamFeedScheduledItemProxy paramStreamFeedScheduledItemProxy)
    {
      final ScheduledBroadcastSummary localScheduledBroadcastSummary = paramStreamFeedScheduledItemProxy.getBroadcastSummary();
      Broadcaster localBroadcaster = localScheduledBroadcastSummary.getBroadcaster();
      ScheduledViewHolder localScheduledViewHolder1;
      int i;
      label158: final Drawable localDrawable2;
      label283: Drawable localDrawable3;
      label370: final Drawable localDrawable5;
      int j;
      label484: int k;
      label535: Drawable localDrawable6;
      label560: TextView localTextView4;
      Context localContext;
      Object[] arrayOfObject;
      if ((paramView == null) || (paramView.getTag().getClass() != ScheduledViewHolder.class))
      {
        paramView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968639, paramViewGroup, false);
        localScheduledViewHolder1 = new ScheduledViewHolder(paramView);
        paramView.setTag(localScheduledViewHolder1);
        DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(true).showImageOnLoading(2130837990).build();
        ImageLoader localImageLoader = ImageLoader.getInstance();
        localImageLoader.displayImage(localScheduledBroadcastSummary.getCoverImageUrl(), localScheduledViewHolder1.cover, localDisplayImageOptions);
        localScheduledViewHolder1.location.setText((CharSequence)localScheduledBroadcastSummary.getLocation().or(""));
        TextView localTextView1 = localScheduledViewHolder1.location;
        if (!localScheduledBroadcastSummary.getLocation().isPresent())
          break label668;
        i = 0;
        localTextView1.setVisibility(i);
        localScheduledViewHolder1.broadcasterNameTextView.setText(localBroadcaster.getDisplayName());
        localScheduledViewHolder1.broadcasterHandleTextView.setText(localBroadcaster.getUsername());
        localImageLoader.displayImage(localBroadcaster.getImageUrl(), localScheduledViewHolder1.broadcasterImage, localDisplayImageOptions);
        localScheduledViewHolder1.caption.setText(localScheduledBroadcastSummary.getCaption());
        localScheduledViewHolder1.scheduledInfoView.setVisibility(0);
        localScheduledViewHolder1.scheduledCommentCountButton.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            FeedMediator.FeedArrayAdapter.this.context.startActivity(new Intent(FeedMediator.FeedArrayAdapter.this.context, CommentsActivity.class));
          }
        });
        String str1 = DateFormatter.futureTimeString(localScheduledBroadcastSummary.getEndTime(), "In %d %s");
        if (str1 == null)
          break label675;
        localScheduledViewHolder1.extraInfo.setText(str1);
        localScheduledViewHolder1.extraInfo.setVisibility(0);
        List localList = localScheduledBroadcastSummary.getSubscribers();
        final User localUser = ((GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy")).getMyUser();
        final boolean bool = localList.contains(localUser.getId());
        final Drawable localDrawable1 = this.context.getResources().getDrawable(2130838022);
        localDrawable2 = this.context.getResources().getDrawable(2130838021);
        ImageView localImageView1 = localScheduledViewHolder1.subscribeToggle;
        if (!bool)
          break label688;
        localDrawable3 = localDrawable1;
        localImageView1.setImageDrawable(localDrawable3);
        final ScheduledViewHolder localScheduledViewHolder2 = localScheduledViewHolder1;
        localScheduledViewHolder1.subscribeView.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            StreamsCacheProxy.getInstance().invalidateScheduledStream(paramStreamFeedScheduledItemProxy.getBroadcastSummary().getId());
            ImageView localImageView = localScheduledViewHolder2.subscribeToggle;
            Drawable localDrawable;
            List localList;
            String str;
            if (bool)
            {
              localDrawable = localDrawable2;
              localImageView.setImageDrawable(localDrawable);
              localList = localScheduledBroadcastSummary.getSubscribers();
              if (bool)
                break label109;
              str = "scheduledEventSubscribeCommand";
              localList.add(localUser.getId());
            }
            while (true)
            {
              FeedMediator.this.sendNotification(str, paramStreamFeedScheduledItemProxy, null);
              FeedMediator.FeedArrayAdapter.this.notifyDataSetChanged();
              return;
              localDrawable = localDrawable1;
              break;
              label109: str = "scheduledEventUnsubscribeCommand";
              localList.remove(localUser.getId());
            }
          }
        });
        final Drawable localDrawable4 = this.context.getResources().getDrawable(2130837568);
        localDrawable5 = this.context.getResources().getDrawable(2130837567);
        localScheduledViewHolder1.retweetCountLabel.setText(FeedMediator.this.getCountStringOrEmpty(localScheduledBroadcastSummary.getRestreamsCount().intValue()));
        TextView localTextView2 = localScheduledViewHolder1.retweetCountLabel;
        if (localScheduledBroadcastSummary.getRestreamsCount().intValue() <= 0)
          break label695;
        j = 0;
        localTextView2.setVisibility(j);
        localScheduledViewHolder1.scheduledCommentCountLabel.setText(FeedMediator.this.getCountStringOrEmpty(localScheduledBroadcastSummary.getCommentsCount().intValue()));
        TextView localTextView3 = localScheduledViewHolder1.scheduledCommentCountLabel;
        if (localScheduledBroadcastSummary.getCommentsCount().intValue() <= 0)
          break label702;
        k = 0;
        localTextView3.setVisibility(k);
        ImageView localImageView2 = localScheduledViewHolder1.retweetCountIcon;
        if (!paramStreamFeedScheduledItemProxy.didRestream())
          break label709;
        localDrawable6 = localDrawable4;
        localImageView2.setImageDrawable(localDrawable6);
        localScheduledViewHolder1.retweetCountButton.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            StreamsCacheProxy.getInstance().invalidateScheduledStream(paramStreamFeedScheduledItemProxy.getBroadcastSummary().getId());
            ImageView localImageView = localScheduledViewHolder2.retweetCountIcon;
            Drawable localDrawable;
            if (paramStreamFeedScheduledItemProxy.didRestream())
            {
              localDrawable = localDrawable4;
              localImageView.setImageDrawable(localDrawable);
              if (paramStreamFeedScheduledItemProxy.didRestream())
                break label114;
              FeedMediator.this.sendNotification("scheduledEventRestreamCommand", paramStreamFeedScheduledItemProxy, null);
              localScheduledBroadcastSummary.setRestreamsCount(1 + localScheduledBroadcastSummary.getRestreamsCount().intValue());
              paramStreamFeedScheduledItemProxy.setDidRestream(true);
            }
            while (true)
            {
              FeedMediator.FeedArrayAdapter.this.notifyDataSetChanged();
              return;
              localDrawable = localDrawable5;
              break;
              label114: FeedMediator.this.sendNotification("scheduledEventUnrestreamCommand", paramStreamFeedScheduledItemProxy, null);
              localScheduledBroadcastSummary.setRestreamsCount(-1 + localScheduledBroadcastSummary.getRestreamsCount().intValue());
              paramStreamFeedScheduledItemProxy.setDidRestream(false);
            }
          }
        });
        localTextView4 = localScheduledViewHolder1.subscribeCount;
        if (localList.size() <= 0)
          break label716;
        localContext = this.context;
        arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(localList.size());
      }
      label668: label675: label688: label695: label702: label709: label716: for (String str2 = localContext.getString(2131296409, arrayOfObject); ; str2 = this.context.getString(2131296408))
      {
        localTextView4.setText(str2);
        return paramView;
        localScheduledViewHolder1 = (ScheduledViewHolder)paramView.getTag();
        break;
        i = 8;
        break label158;
        localScheduledViewHolder1.extraInfo.setVisibility(8);
        break label283;
        localDrawable3 = localDrawable2;
        break label370;
        j = 8;
        break label484;
        k = 8;
        break label535;
        localDrawable6 = localDrawable5;
        break label560;
      }
    }

    private View getCreateBroadcastView(ViewGroup paramViewGroup, View paramView)
    {
      if ((paramView == null) || (!paramView.getTag().equals("CREATOR")))
      {
        paramView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968636, paramViewGroup, false);
        paramView.setTag("CREATOR");
      }
      final EditText localEditText = (EditText)paramView.findViewById(2131624236);
      paramView.findViewById(2131624237).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          FeedMediator.this.scheduleBroadcast(localEditText.getText().toString());
        }
      });
      paramView.findViewById(2131624238).setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          FeedMediator.this.startBroadcast(localEditText.getText().toString());
        }
      });
      return paramView;
    }

    private View getHeaderView(ViewGroup paramViewGroup, View paramView, int paramInt)
    {
      if ((paramView == null) || (!paramView.getTag().equals("HEADER_TAG")))
      {
        paramView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968637, paramViewGroup, false);
        paramView.setTag("HEADER_TAG");
      }
      if ((paramInt == 1) && (isLiveLabelVisible()));
      for (int i = 2131296404; ; i = 2131296410)
      {
        ((TextView)paramView).setText(this.context.getResources().getString(i));
        return paramView;
      }
    }

    private boolean isLiveLabelVisible()
    {
      return FeedMediator.this.liveCount > 0;
    }

    private boolean isScheduledBroadcastsVisible()
    {
      return FeedMediator.this.scheduledCount > 0;
    }

    public int getCount()
    {
      int i = 1 + super.getCount();
      if (isLiveLabelVisible())
        i++;
      if (isScheduledBroadcastsVisible())
        i++;
      return i;
    }

    public int getDataCount()
    {
      return super.getCount();
    }

    public StreamFeedItemProxy getDataItem(int paramInt)
    {
      return (StreamFeedItemProxy)super.getItem(paramInt);
    }

    public StreamFeedItemProxy getItem(int paramInt)
    {
      if (paramInt == 0);
      while (((isLiveLabelVisible()) && (paramInt == 1)) || ((!isLiveLabelVisible()) && (isScheduledBroadcastsVisible()) && (paramInt == 1)) || ((isLiveLabelVisible()) && (isScheduledBroadcastsVisible()) && (paramInt == 2 + FeedMediator.this.liveCount)))
        return null;
      int i = paramInt;
      if (isLiveLabelVisible())
        i--;
      if ((isScheduledBroadcastsVisible()) && (paramInt > 1 + FeedMediator.this.liveCount))
        i--;
      return (StreamFeedItemProxy)super.getItem(i - 1);
    }

    public int getItemViewType(int paramInt)
    {
      StreamFeedItemProxy localStreamFeedItemProxy = getItem(paramInt);
      if (paramInt == 0)
        return 0;
      if ((localStreamFeedItemProxy != null) && (localStreamFeedItemProxy.getType() == StreamFeedItemProxy.Type.Live))
        return 2;
      if ((localStreamFeedItemProxy != null) && (localStreamFeedItemProxy.getType() == StreamFeedItemProxy.Type.Scheduled))
        return 3;
      return 1;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      int i = getItemViewType(paramInt);
      StreamFeedItemProxy localStreamFeedItemProxy = getItem(paramInt);
      if (i == 0)
        return getCreateBroadcastView(paramViewGroup, paramView);
      if (i == 1)
        return getHeaderView(paramViewGroup, paramView, paramInt);
      if (i == 2)
        return createLiveStreamRow(paramViewGroup, paramView, (StreamFeedLiveItemProxy)localStreamFeedItemProxy);
      if (i == 3)
        return createScheduledStreamRow(paramViewGroup, paramView, (StreamFeedScheduledItemProxy)localStreamFeedItemProxy);
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(i);
      throw new RuntimeException(String.format("Unknown Feed item type: %d", arrayOfObject));
    }

    public int getViewTypeCount()
    {
      return 4;
    }

    public boolean isEnabled(int paramInt)
    {
      if (paramInt == 0)
        return false;
      return super.isEnabled(paramInt);
    }

    public void removeAllOfType(StreamFeedItemProxy.Type paramType)
    {
      ArrayList localArrayList = Lists.newArrayList();
      for (int i = 0; i < getCount(); i++)
      {
        StreamFeedItemProxy localStreamFeedItemProxy = getItem(i);
        if ((localStreamFeedItemProxy != null) && (localStreamFeedItemProxy.getType() == paramType))
          localArrayList.add(localStreamFeedItemProxy);
      }
      Iterator localIterator = localArrayList.iterator();
      while (localIterator.hasNext())
        remove((StreamFeedItemProxy)localIterator.next());
    }

    class LiveViewHolder
    {
      TextView broadcasterHandleTextView;
      ImageView broadcasterImage;
      TextView broadcasterNameTextView;
      TextView caption;
      ImageView cover;
      TextView extraInfo;
      TextView likeCount;
      TextView liveCommentCount;
      View liveInfoView;
      TextView location;
      TextView restreamCount;

      public LiveViewHolder(View arg2)
      {
        Object localObject;
        this.liveInfoView = localObject.findViewById(2131624247);
        this.caption = ((TextView)localObject.findViewById(2131624246));
        this.location = ((TextView)localObject.findViewById(2131624248));
        this.cover = ((ImageView)localObject.findViewById(2131624240));
        this.likeCount = ((TextView)localObject.findViewById(2131624249));
        this.liveCommentCount = ((TextView)localObject.findViewById(2131624250));
        this.restreamCount = ((TextView)localObject.findViewById(2131624251));
        this.broadcasterImage = ((ImageView)localObject.findViewById(2131624242));
        this.broadcasterHandleTextView = ((TextView)localObject.findViewById(2131624244));
        this.broadcasterNameTextView = ((TextView)localObject.findViewById(2131624243));
        this.extraInfo = ((TextView)localObject.findViewById(2131624245));
      }
    }

    class ScheduledViewHolder
    {
      TextView broadcasterHandleTextView;
      ImageView broadcasterImage;
      TextView broadcasterNameTextView;
      TextView caption;
      ImageView cover;
      TextView extraInfo;
      View liveInfoView;
      TextView location;
      View retweetCountButton;
      ImageView retweetCountIcon;
      TextView retweetCountLabel;
      View scheduledCommentCountButton;
      ImageView scheduledCommentCountIcon;
      TextView scheduledCommentCountLabel;
      View scheduledInfoView;
      TextView subscribeCount;
      ImageView subscribeToggle;
      View subscribeView;

      public ScheduledViewHolder(View arg2)
      {
        Object localObject;
        this.liveInfoView = localObject.findViewById(2131624247);
        this.caption = ((TextView)localObject.findViewById(2131624246));
        this.location = ((TextView)localObject.findViewById(2131624248));
        this.cover = ((ImageView)localObject.findViewById(2131624240));
        this.scheduledInfoView = localObject.findViewById(2131624252);
        this.retweetCountButton = localObject.findViewById(2131624256);
        this.retweetCountLabel = ((TextView)localObject.findViewById(2131624258));
        this.retweetCountIcon = ((ImageView)localObject.findViewById(2131624257));
        this.scheduledCommentCountButton = localObject.findViewById(2131624259);
        this.scheduledCommentCountLabel = ((TextView)localObject.findViewById(2131624261));
        this.scheduledCommentCountIcon = ((ImageView)localObject.findViewById(2131624260));
        this.subscribeView = localObject.findViewById(2131624253);
        this.subscribeCount = ((TextView)localObject.findViewById(2131624255));
        this.subscribeToggle = ((ImageView)localObject.findViewById(2131624254));
        this.broadcasterImage = ((ImageView)localObject.findViewById(2131624242));
        this.broadcasterHandleTextView = ((TextView)localObject.findViewById(2131624244));
        this.broadcasterNameTextView = ((TextView)localObject.findViewById(2131624243));
        this.extraInfo = ((TextView)localObject.findViewById(2131624245));
      }
    }
  }
}