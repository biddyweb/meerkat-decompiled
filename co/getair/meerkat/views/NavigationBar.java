package co.getair.meerkat.views;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.dtos.User;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.GraphProxy;
import co.getair.meerkat.proxies.InboxProxy;
import co.getair.meerkat.proxies.ScoreProxy;
import java.util.ArrayList;
import java.util.HashMap;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class NavigationBar extends FrameLayout
{
  private ImageButton backButton;
  private Facade facade;
  private ImageButton leaderBoardButton;
  private ImageView logoImageView;
  private LinearLayout profileInfoView;
  private TextView scoreTextView;
  private ImageButton searchButton;
  private TextView titleTextView;
  private TextView usernameTextView;

  public NavigationBar(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null, 0);
  }

  public NavigationBar(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet, 0);
  }

  public NavigationBar(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet, paramInt);
  }

  private void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130968641, this);
    this.profileInfoView = ((LinearLayout)findViewById(2131624267));
    this.logoImageView = ((ImageView)findViewById(2131624272));
    this.titleTextView = ((TextView)findViewById(2131624266));
    this.usernameTextView = ((TextView)findViewById(2131624268));
    this.scoreTextView = ((TextView)findViewById(2131624269));
    this.leaderBoardButton = ((ImageButton)findViewById(2131624271));
    this.searchButton = ((ImageButton)findViewById(2131624270));
    this.backButton = ((ImageButton)findViewById(2131624265));
    this.backButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if ((NavigationBar.this.facade != null) && ((NavigationBar.this.facade instanceof BaseFacade)))
          ((BaseFacade)NavigationBar.this.facade).getOwnerActivity().finish();
      }
    });
    this.profileInfoView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (NavigationBar.this.facade != null)
          NavigationBar.this.facade.sendNotification("navigationBarProfileViewClicked", null, null);
      }
    });
    this.leaderBoardButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (NavigationBar.this.facade != null)
          NavigationBar.this.facade.sendNotification("navigationBarLeaderboardClicked", null, null);
      }
    });
    this.searchButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (NavigationBar.this.facade != null)
          NavigationBar.this.facade.sendNotification("navigationBarSearchClicked", null, null);
      }
    });
    loadUsername();
    InboxProxy localInboxProxy = (InboxProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("inboxProxy");
    try
    {
      ((Double)((HashMap)localInboxProxy.getBucket("score").get(0)).get("o")).intValue();
      label226: loadScore();
      this.logoImageView.setOnClickListener(new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          if (NavigationBar.this.logoImageView.getScaleX() == -1.0F)
          {
            NavigationBar.this.logoImageView.setScaleX(1.0F);
            NavigationBar.this.getFacade().sendNotification("eventFeedFilteringEnabled", null, null);
            return;
          }
          NavigationBar.this.logoImageView.setScaleX(-1.0F);
          NavigationBar.this.getFacade().sendNotification("eventFeedFilteringDisabled", null, null);
        }
      });
      return;
    }
    catch (Exception localException)
    {
      break label226;
    }
  }

  public Facade getFacade()
  {
    return this.facade;
  }

  public void hideBackButton()
  {
    this.backButton.setVisibility(8);
  }

  public void loadScore()
  {
    TextView localTextView = this.scoreTextView;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(ScoreProxy.getScore());
    localTextView.setText(String.format("Score: %d", arrayOfObject));
  }

  public void loadUsername()
  {
    User localUser = new GraphProxy("graphProxy", getContext()).getMyUser();
    TextView localTextView = this.usernameTextView;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = localUser.getUsername();
    localTextView.setText(String.format("@%s", arrayOfObject));
  }

  public void setFacade(Facade paramFacade)
  {
    this.facade = paramFacade;
  }

  public void setLeaderboardVisible(Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      this.leaderBoardButton.setVisibility(0);
      return;
    }
    this.leaderBoardButton.setVisibility(8);
  }

  public void setLogoVisible(Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      this.logoImageView.setVisibility(0);
      return;
    }
    this.logoImageView.setVisibility(8);
  }

  public void setProfileInfoVisible(Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      this.profileInfoView.setVisibility(0);
      return;
    }
    this.profileInfoView.setVisibility(8);
  }

  public void setSearchVisible(Boolean paramBoolean)
  {
    if (paramBoolean.booleanValue())
    {
      this.searchButton.setVisibility(0);
      return;
    }
    this.searchButton.setVisibility(8);
  }

  public void setTitle(String paramString)
  {
    if (paramString == null)
    {
      this.titleTextView.setVisibility(8);
      this.backButton.setVisibility(8);
      return;
    }
    this.titleTextView.setText(paramString);
    if (paramString.isEmpty())
    {
      this.backButton.setVisibility(8);
      this.titleTextView.setVisibility(8);
      return;
    }
    this.backButton.setVisibility(0);
    this.titleTextView.setVisibility(0);
  }

  public void showBackButton()
  {
    this.backButton.setVisibility(0);
  }
}