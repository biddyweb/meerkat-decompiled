package co.getair.meerkat.activities;

import android.content.Intent;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ScheduleBroadcastActivityFacade;
import co.getair.meerkat.facades.UserlistActivityFacade;
import com.mixpanel.android.mpmetrics.MixpanelAPI;

public class ScheduleBroadcastActivity extends FragmentActivity
{
  public static final String BROADCAST_NAME_KEY = "broadcastName";
  public int CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE = 1;
  private String broadcastName = "";
  ScheduleBroadcastActivityFacade facade;

  public String getBroadcastName()
  {
    return this.broadcastName;
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == this.CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE)
    {
      if (paramInt2 == -1)
      {
        Bitmap localBitmap = (Bitmap)paramIntent.getExtras().get("data");
        this.facade.sendNotification("scheduleBroadcastImageReceived", localBitmap, null);
      }
    }
    else
      return;
    if (paramInt2 == 0)
    {
      this.facade.sendNotification("scheduleBroadcastImageCancelled", null, null);
      return;
    }
    this.facade.sendNotification("scheduleBroadcastImageFailed", null, null);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.broadcastName = getIntent().getStringExtra("broadcastName");
    setContentView(2130968610);
    startUp();
  }

  protected void onDestroy()
  {
    super.onDestroy();
    this.facade.clearFacade();
    UserlistActivityFacade.removeCore(getClass().getName());
  }

  protected void onStop()
  {
    ((MeerkatApplication)getApplication()).getMixpanelAPI().flush();
    super.onStop();
  }

  public void requestPhotoFromUser()
  {
    startActivityForResult(new Intent("android.media.action.IMAGE_CAPTURE"), this.CAPTURE_IMAGE_ACTIVITY_REQUEST_CODE);
  }

  public void startUp()
  {
    ScheduleBroadcastActivityFacade.removeCore(getClass().getName());
    this.facade = ScheduleBroadcastActivityFacade.getInst(this);
    this.facade.startup();
  }
}