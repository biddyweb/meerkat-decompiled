package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.ActionMode;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.ToggleButton;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.activities.WebViewActivity;
import co.getair.meerkat.dtos.FollowUser;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.TwitterUrlBuilder;
import co.getair.meerkat.views.NavigationBar;
import com.google.common.base.Optional;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import com.nostra13.universalimageloader.core.ImageLoader;
import java.util.ArrayList;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class UserlistMediator extends Mediator
{
  private NavigationBar navigationBar;
  private View rootView;
  private boolean showScore = false;
  private String title;
  private Optional<ActionMode> userActionMode = Optional.absent();
  private ListView userListView;

  public UserlistMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.navigationBar = ((NavigationBar)this.rootView.findViewById(2131624127));
    this.userListView = ((ListView)this.rootView.findViewById(2131624126));
  }

  public void handleNotification(final INotification paramINotification)
  {
    if (paramINotification.getName().equals("userlistLoaded"))
      ((BaseFacade)getFacade()).getOwnerActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          ArrayList localArrayList = (ArrayList)paramINotification.getBody();
          UserlistMediator.UserListArrayAdapter localUserListArrayAdapter = (UserlistMediator.UserListArrayAdapter)UserlistMediator.this.userListView.getAdapter();
          if (localUserListArrayAdapter == null)
          {
            localUserListArrayAdapter = new UserlistMediator.UserListArrayAdapter(UserlistMediator.this, ((BaseFacade)UserlistMediator.this.getFacade()).getOwnerActivity());
            UserlistMediator.this.userListView.setAdapter(localUserListArrayAdapter);
          }
          localUserListArrayAdapter.clear();
          localUserListArrayAdapter.addAll(localArrayList);
          localUserListArrayAdapter.notifyDataSetChanged();
        }
      });
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "userlistLoaded", "eventUserFollowStateChanged" };
  }

  public void onRegister()
  {
    super.onRegister();
    this.navigationBar.setProfileInfoVisible(Boolean.valueOf(false));
    this.navigationBar.setLeaderboardVisible(Boolean.valueOf(false));
    this.navigationBar.setLogoVisible(Boolean.valueOf(false));
    this.navigationBar.setSearchVisible(Boolean.valueOf(false));
    this.navigationBar.setFacade(getFacade());
    this.navigationBar.setTitle(this.title);
  }

  public void setShowScore(boolean paramBoolean)
  {
    this.showScore = paramBoolean;
  }

  public void setTitle(String paramString)
  {
    this.title = paramString;
  }

  private class UserListArrayAdapter extends ArrayAdapter<FollowUser>
  {
    private Context context;

    public UserListArrayAdapter(Context arg2)
    {
      super(2130968652);
      this.context = localContext;
    }

    private View getViewForCap(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView = paramView;
      if (localView == null)
        localView = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968651, paramViewGroup, false);
      if (paramInt == -1 + getCount());
      for (float f = 180.0F; ; f = 0.0F)
      {
        localView.setRotation(f);
        return localView;
      }
    }

    private View getViewForUserRow(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      View localView1 = paramView;
      ViewHolder localViewHolder1;
      final FollowUser localFollowUser;
      View localView2;
      if (localView1 == null)
      {
        localView1 = ((LayoutInflater)this.context.getSystemService("layout_inflater")).inflate(2130968652, paramViewGroup, false);
        localViewHolder1 = new ViewHolder();
        localViewHolder1.name = ((TextView)localView1.findViewById(2131624293));
        localViewHolder1.twitterHandle = ((TextView)localView1.findViewById(2131624294));
        localViewHolder1.icon = ((ImageView)localView1.findViewById(2131624292));
        localViewHolder1.followButton = ((ToggleButton)localView1.findViewById(2131624297));
        localViewHolder1.scoreContainer = localView1.findViewById(2131624295);
        localViewHolder1.score = ((TextView)localView1.findViewById(2131624296));
        localView1.setTag(localViewHolder1);
        DisplayImageOptions localDisplayImageOptions = new DisplayImageOptions.Builder().cacheInMemory(true).resetViewBeforeLoading(true).build();
        localFollowUser = (FollowUser)getItem(paramInt);
        ImageLoader.getInstance().displayImage(localFollowUser.getProfileThumbImage(), localViewHolder1.icon, localDisplayImageOptions);
        localViewHolder1.name.setText(localFollowUser.getDisplayName());
        localViewHolder1.twitterHandle.setText(localFollowUser.getTwitterHandle());
        final boolean bool = ((GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy")).amIFollowingUser(localFollowUser.getId());
        final ViewHolder localViewHolder2 = localViewHolder1;
        localViewHolder1.followButton.setChecked(bool);
        localViewHolder1.followButton.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            ToggleButton localToggleButton = localViewHolder2.followButton;
            boolean bool;
            if (!bool)
            {
              bool = true;
              localToggleButton.setChecked(bool);
              if (!bool)
                break label58;
              ApplicationFacade.getInst(MeerkatApplication.getName()).sendNotification("unfollowUserCommand", localFollowUser, null);
            }
            while (true)
            {
              UserlistMediator.UserListArrayAdapter.this.notifyDataSetChanged();
              return;
              bool = false;
              break;
              label58: ApplicationFacade.getInst(MeerkatApplication.getName()).sendNotification("followUserCommand", localFollowUser, null);
            }
          }
        });
        localView2 = localViewHolder1.scoreContainer;
        if (!UserlistMediator.this.showScore)
          break label341;
      }
      label341: for (int i = 0; ; i = 8)
      {
        localView2.setVisibility(i);
        localViewHolder1.score.setText(Integer.toString(localFollowUser.getScore()));
        localView1.setOnClickListener(new View.OnClickListener()
        {
          public void onClick(View paramAnonymousView)
          {
            Intent localIntent = WebViewActivity.createIntent(UserlistMediator.UserListArrayAdapter.this.context, TwitterUrlBuilder.forUser(localFollowUser.getUsername()), localFollowUser.getTwitterHandle());
            UserlistMediator.UserListArrayAdapter.this.context.startActivity(localIntent);
          }
        });
        return localView1;
        localViewHolder1 = (ViewHolder)localView1.getTag();
        break;
      }
    }

    public int getCount()
    {
      return 2 + super.getCount();
    }

    public int getItemViewType(int paramInt)
    {
      if ((paramInt == 0) || (paramInt == -1 + getCount()))
        return 0;
      return 1;
    }

    public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
    {
      switch (getItemViewType(paramInt))
      {
      default:
        return null;
      case 0:
        return getViewForCap(paramInt, paramView, paramViewGroup);
      case 1:
      }
      return getViewForUserRow(paramInt - 1, paramView, paramViewGroup);
    }

    public int getViewTypeCount()
    {
      return 2;
    }

    class ViewHolder
    {
      ToggleButton followButton;
      ImageView icon;
      TextView name;
      TextView score;
      View scoreContainer;
      TextView twitterHandle;

      ViewHolder()
      {
      }
    }
  }
}