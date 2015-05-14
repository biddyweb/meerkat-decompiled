package co.getair.meerkat.mediators;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import co.getair.meerkat.activities.UserListActivity;
import co.getair.meerkat.activities.WebViewActivity;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.utilities.TwitterUrlBuilder;
import co.getair.meerkat.views.NavigationBar;
import java.util.ArrayList;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class ProfileMediator extends Mediator
{
  private TextView followersCountTextView;
  private TextView followingCountTextView;
  private NavigationBar navigationBar;
  private View rootView;
  private TextView versionTextView;

  public ProfileMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.navigationBar = ((NavigationBar)this.rootView.findViewById(2131624107));
    this.followersCountTextView = ((TextView)this.rootView.findViewById(2131624111));
    this.followingCountTextView = ((TextView)this.rootView.findViewById(2131624109));
    this.versionTextView = ((TextView)this.rootView.findViewById(2131624116));
    this.rootView.findViewById(2131624108).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Activity localActivity = ProfileMediator.this.getOwnerActivity();
        Intent localIntent = new Intent(localActivity, UserListActivity.class);
        localIntent.putExtra("listSourceBundleKey", "following");
        localIntent.putExtra("listTitleBundleKey", "Following");
        localActivity.startActivity(localIntent);
      }
    });
    this.rootView.findViewById(2131624110).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        Activity localActivity = ProfileMediator.this.getOwnerActivity();
        Intent localIntent = new Intent(localActivity, UserListActivity.class);
        localIntent.putExtra("listSourceBundleKey", "followers");
        localIntent.putExtra("listTitleBundleKey", "Followers");
        localActivity.startActivity(localIntent);
      }
    });
    ((Button)this.rootView.findViewById(2131624112)).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ProfileMediator.this.getFacade().sendNotification("userLogout", null, null);
      }
    });
    this.rootView.findViewById(2131624113).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ProfileMediator.this.openWebView(ProfileMediator.access$000(ProfileMediator.this), TwitterUrlBuilder.forUser("appmeerkat"), "@appmeerkat");
      }
    });
    this.rootView.findViewById(2131624114).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ProfileMediator.this.openWebView(ProfileMediator.access$000(ProfileMediator.this), "https://meerkatapp.co/rules", "The Rules");
      }
    });
    this.rootView.findViewById(2131624115).setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ProfileMediator.this.openWebView(ProfileMediator.access$000(ProfileMediator.this), "https://meerkatapp.co/legal", "Terms and Privacy");
      }
    });
  }

  private Activity getOwnerActivity()
  {
    return ((BaseFacade)getFacade()).getOwnerActivity();
  }

  private void openWebView(Activity paramActivity, String paramString1, String paramString2)
  {
    paramActivity.startActivity(WebViewActivity.createIntent(paramActivity, paramString1, paramString2));
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("profileFollowerLoaded"))
    {
      final ArrayList localArrayList = (ArrayList)paramINotification.getBody();
      getOwnerActivity().runOnUiThread(new Runnable()
      {
        public void run()
        {
          TextView localTextView = ProfileMediator.this.followersCountTextView;
          Object[] arrayOfObject = new Object[1];
          arrayOfObject[0] = Integer.valueOf(localArrayList.size());
          localTextView.setText(String.format("%d", arrayOfObject));
        }
      });
    }
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "profileFollowerLoaded" };
  }

  public void onRegister()
  {
    super.onRegister();
    GraphProxy localGraphProxy = new GraphProxy("graphProxy", getOwnerActivity());
    User localUser = localGraphProxy.getMyUser();
    Integer localInteger = localGraphProxy.getMyFollowingCount();
    this.followingCountTextView.setText(String.format("%d", new Object[] { localInteger }));
    this.navigationBar.setTitle(localUser.getDisplayName());
    this.navigationBar.setProfileInfoVisible(Boolean.valueOf(false));
    this.navigationBar.setLeaderboardVisible(Boolean.valueOf(false));
    this.navigationBar.setLogoVisible(Boolean.valueOf(false));
    this.navigationBar.setSearchVisible(Boolean.valueOf(false));
    this.navigationBar.setFacade(getFacade());
    try
    {
      PackageInfo localPackageInfo = getOwnerActivity().getPackageManager().getPackageInfo(getOwnerActivity().getPackageName(), 0);
      String str1 = getOwnerActivity().getResources().getString(2131296492);
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = localPackageInfo.versionName;
      arrayOfObject[1] = Integer.valueOf(localPackageInfo.versionCode);
      String str2 = String.format(str1, arrayOfObject);
      this.versionTextView.setText(str2);
      return;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      localNameNotFoundException.printStackTrace();
    }
  }
}