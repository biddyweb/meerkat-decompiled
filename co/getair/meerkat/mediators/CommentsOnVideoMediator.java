package co.getair.meerkat.mediators;

import android.content.Context;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import co.getair.meerkat.dtos.watch_broadcast.BroadcastActivity;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.MLog;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class CommentsOnVideoMediator extends Mediator
{
  private boolean allowScroll;
  private ListView commentsList;
  private View rootView;

  public CommentsOnVideoMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.commentsList = ((ListView)this.rootView.findViewById(2131624058));
    this.commentsList.setTranscriptMode(1);
    this.commentsList.setOnScrollListener(new AbsListView.OnScrollListener()
    {
      public void onScroll(AbsListView paramAnonymousAbsListView, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3)
      {
        int i = paramAnonymousInt1 + paramAnonymousInt2;
        CommentsOnVideoMediator localCommentsOnVideoMediator = CommentsOnVideoMediator.this;
        if (i == paramAnonymousInt3);
        for (boolean bool = true; ; bool = false)
        {
          CommentsOnVideoMediator.access$002(localCommentsOnVideoMediator, bool);
          return;
        }
      }

      public void onScrollStateChanged(AbsListView paramAnonymousAbsListView, int paramAnonymousInt)
      {
      }
    });
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("eventActivityArrived"))
    {
      BroadcastActivity localBroadcastActivity = (BroadcastActivity)paramINotification.getBody();
      CommentsListAdapter localCommentsListAdapter3 = (CommentsListAdapter)this.commentsList.getAdapter();
      localCommentsListAdapter3.add(localBroadcastActivity);
      localCommentsListAdapter3.notifyDataSetChanged();
      if (this.allowScroll)
        this.commentsList.smoothScrollToPosition(-1 + localCommentsListAdapter3.getCount());
    }
    CommentsListAdapter localCommentsListAdapter1;
    if ((paramINotification.getName().equals("eventPlaylistArrived")) || (paramINotification.getName().equals("eventBroadcastBegan")))
    {
      localCommentsListAdapter1 = (CommentsListAdapter)this.commentsList.getAdapter();
      if (localCommentsListAdapter1 == null)
      {
        CommentsListAdapter localCommentsListAdapter2 = new CommentsListAdapter(((BaseFacade)getFacade()).getOwnerActivity());
        this.commentsList.setAdapter(localCommentsListAdapter2);
      }
    }
    else
    {
      return;
    }
    localCommentsListAdapter1.clear();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "eventActivityArrived", "eventPlaylistArrived", "eventBroadcastBegan" };
  }

  public void onRemove()
  {
    super.onRemove();
    MLog.d("removing all comments stuff");
    CommentsListAdapter localCommentsListAdapter = (CommentsListAdapter)this.commentsList.getAdapter();
    localCommentsListAdapter.clear();
    localCommentsListAdapter.notifyDataSetChanged();
  }

  private class CommentsListAdapter extends ArrayAdapter<BroadcastActivity>
  {
    private Context context;

    public CommentsListAdapter(Context arg2)
    {
      super(2130968635);
      this.context = localContext;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      BroadcastActivity localBroadcastActivity = (BroadcastActivity)getItem(paramInt);
      String str;
      ViewHolder localViewHolder;
      if (localBroadcastActivity.getTitle().equals("liked"))
      {
        str = "<font color=#ffe200>@" + localBroadcastActivity.getUsername() + "</font> <font color=#1dd4ff>" + " " + localBroadcastActivity.getMessage() + "</font>";
        if (localView != null)
          break label263;
        localView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968635, paramViewGroup, false);
        localViewHolder = new ViewHolder();
        localViewHolder.comment = ((TextView)localView.findViewById(2131624235));
        localView.setTag(localViewHolder);
      }
      while (true)
      {
        localViewHolder.comment.setText(Html.fromHtml(str));
        return localView;
        if (localBroadcastActivity.getTitle().equals("restreamed & retweeted"))
        {
          str = "<font color=#ffe200>@" + localBroadcastActivity.getUsername() + "</font> <font color=#aca5ff>" + " " + localBroadcastActivity.getMessage() + "</font>";
          break;
        }
        str = "<font color=#ffe200>@" + localBroadcastActivity.getUsername() + "</font> <font color=#ffffff>" + " " + localBroadcastActivity.getMessage() + "</font>";
        break;
        label263: localViewHolder = (ViewHolder)localView.getTag();
      }
    }

    class ViewHolder
    {
      TextView comment;

      ViewHolder()
      {
      }
    }
  }
}