package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import co.getair.meerkat.dtos.FollowUser;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.views.NavigationBar;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.ArrayList;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class CommentsMediator extends Mediator
{
  private ListView commentsListView;
  private NavigationBar navigationBar;
  private View rootView;

  public CommentsMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.navigationBar = ((NavigationBar)this.rootView.findViewById(2131624076));
    this.commentsListView = ((ListView)this.rootView.findViewById(2131624078));
  }

  public void handleNotification(final INotification paramINotification)
  {
    if (paramINotification.getName().equals("commentsLoaded"))
      ((BaseFacade)getFacade()).getOwnerActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          ArrayList localArrayList = (ArrayList)paramINotification.getBody();
          CommentsMediator.CommentsArrayAdapter localCommentsArrayAdapter = (CommentsMediator.CommentsArrayAdapter)CommentsMediator.this.commentsListView.getAdapter();
          if (localCommentsArrayAdapter == null)
          {
            localCommentsArrayAdapter = new CommentsMediator.CommentsArrayAdapter(CommentsMediator.this, ((BaseFacade)CommentsMediator.this.getFacade()).getOwnerActivity());
            CommentsMediator.this.commentsListView.setAdapter(localCommentsArrayAdapter);
          }
          localCommentsArrayAdapter.clear();
          localCommentsArrayAdapter.addAll(localArrayList);
          localCommentsArrayAdapter.notifyDataSetChanged();
        }
      });
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "commentsLoaded" };
  }

  public void onRegister()
  {
    super.onRegister();
    this.navigationBar.setProfileInfoVisible(Boolean.valueOf(false));
    this.navigationBar.setLeaderboardVisible(Boolean.valueOf(false));
    this.navigationBar.setLogoVisible(Boolean.valueOf(false));
    this.navigationBar.setSearchVisible(Boolean.valueOf(false));
    this.navigationBar.setFacade(getFacade());
  }

  private class CommentsArrayAdapter extends ArrayAdapter<FollowUser>
  {
    private Context context;

    public CommentsArrayAdapter(Context arg2)
    {
      super(2130968652);
      this.context = localContext;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      ViewHolder localViewHolder;
      if (localView == null)
      {
        localView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968621, paramViewGroup, false);
        localViewHolder = new ViewHolder();
        localViewHolder.comment = ((TextView)localView.findViewById(2131624175));
        localViewHolder.twitterHandle = ((TextView)localView.findViewById(2131624174));
        localViewHolder.icon = ((ImageView)localView.findViewById(2131624173));
        localView.setTag(localViewHolder);
      }
      while (true)
      {
        DisplayImageOptions.Builder localBuilder = new DisplayImageOptions.Builder();
        localBuilder.cacheInMemory(true);
        localBuilder.resetViewBeforeLoading(true);
        DisplayImageOptions localDisplayImageOptions = localBuilder.build();
        FollowUser localFollowUser = (FollowUser)getItem(paramInt);
        ImageLoader.getInstance().displayImage(localFollowUser.getProfileThumbImage(), localViewHolder.icon, localDisplayImageOptions);
        localViewHolder.comment.setText(localFollowUser.getDisplayName());
        TextView localTextView = localViewHolder.twitterHandle;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = localFollowUser.getUsername();
        localTextView.setText(String.format("@%s", arrayOfObject));
        return localView;
        localViewHolder = (ViewHolder)localView.getTag();
      }
    }

    class ViewHolder
    {
      TextView comment;
      ImageView icon;
      TextView twitterHandle;

      ViewHolder()
      {
      }
    }
  }
}