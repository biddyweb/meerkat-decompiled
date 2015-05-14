package co.getair.meerkat.mediators;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.graphics.Bitmap;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import co.getair.meerkat.activities.ScheduleBroadcastActivity;
import co.getair.meerkat.dtos.ScheduleBroadcastParams;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.DateFormatter;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import co.getair.meerkat.utilities.TimePickerFragment;
import co.getair.meerkat.views.NavigationBar;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.mediator.Mediator;

public class ScheduleBroadcastMediator extends Mediator
{
  private ImageView addedPhotoImageView;
  Bitmap broadcastImage;
  private NavigationBar navigationBar;
  private ProgressBar progressBar;
  private View rootView;
  private Button scheduleButton;
  Date timeOfBroadcast;
  private TextView timeTextView;

  public ScheduleBroadcastMediator(String paramString, Object paramObject)
  {
    super(paramString, paramObject);
    this.rootView = ((View)paramObject);
    this.navigationBar = ((NavigationBar)this.rootView.findViewById(2131624118));
    View localView1 = this.rootView.findViewById(2131624119);
    View localView2 = this.rootView.findViewById(2131624121);
    this.timeTextView = ((TextView)this.rootView.findViewById(2131624120));
    this.addedPhotoImageView = ((ImageView)this.rootView.findViewById(2131624122));
    this.scheduleButton = ((Button)this.rootView.findViewById(2131624124));
    this.progressBar = ((ProgressBar)this.rootView.findViewById(2131624123));
    localView1.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScheduleBroadcastMediator.this.showDatePicker();
      }
    });
    localView2.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScheduleBroadcastMediator.this.addPhoto();
      }
    });
    this.scheduleButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        ScheduleBroadcastMediator.this.scheduleBroadcast();
      }
    });
    this.progressBar.setVisibility(4);
  }

  private void addPhoto()
  {
    ((ScheduleBroadcastActivity)((BaseFacade)getFacade()).getOwnerActivity()).requestPhotoFromUser();
  }

  private void scheduleBroadcast()
  {
    startSchedulingBroadcast();
  }

  private void showDatePicker()
  {
    ScheduleBroadcastActivity localScheduleBroadcastActivity = (ScheduleBroadcastActivity)((BaseFacade)getFacade()).getOwnerActivity();
    TimePickerFragment localTimePickerFragment = TimePickerFragment.newInstance();
    localTimePickerFragment.setDateSelectedRunnable(new RunnableWithResultObject()
    {
      public void run()
      {
        if (this.resultObject == null)
          return;
        ScheduleBroadcastMediator.this.timeOfBroadcast = ((Date)this.resultObject);
        int i = 1 + (int)DateFormatter.timeToFuture(ScheduleBroadcastMediator.this.timeOfBroadcast.getTime()) / 60000;
        int j = i / 60;
        final Calendar localCalendar = Calendar.getInstance();
        localCalendar.setTime(ScheduleBroadcastMediator.this.timeOfBroadcast);
        localCalendar.set(11, j);
        localCalendar.set(12, i % 60);
        ((ScheduleBroadcastActivity)((BaseFacade)ScheduleBroadcastMediator.this.getFacade()).getOwnerActivity()).runOnUiThread(new Runnable()
        {
          public void run()
          {
            SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("HH:mm");
            TextView localTextView = ScheduleBroadcastMediator.this.timeTextView;
            Object[] arrayOfObject = new Object[1];
            arrayOfObject[0] = localSimpleDateFormat.format(localCalendar.getTime());
            localTextView.setText(String.format("%s from now", arrayOfObject));
          }
        });
      }
    });
    localTimePickerFragment.show(localScheduleBroadcastActivity.getSupportFragmentManager(), "datePicker");
  }

  private void startSchedulingBroadcast()
  {
    if (this.timeOfBroadcast == null)
    {
      new AlertDialog.Builder(((BaseFacade)getFacade()).getOwnerActivity()).setTitle("Please select a broadcast date").setPositiveButton("Ok", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
      return;
    }
    sendNotification("scheduleBroadcastStartedScheduling", new ScheduleBroadcastParams(((ScheduleBroadcastActivity)((BaseFacade)getFacade()).getOwnerActivity()).getBroadcastName(), this.timeOfBroadcast, this.broadcastImage), null);
    this.scheduleButton.setVisibility(8);
    this.progressBar.setVisibility(0);
  }

  public void handleNotification(INotification paramINotification)
  {
    if (paramINotification.getName().equals("scheduleBroadcastScheduled"))
      ((BaseFacade)getFacade()).getOwnerActivity().finish();
    if (paramINotification.getName().equals("scheduleBroadcastScheduledError"))
    {
      this.scheduleButton.setVisibility(0);
      this.progressBar.setVisibility(8);
      Activity localActivity = ((BaseFacade)getFacade()).getOwnerActivity();
      Toast.makeText(localActivity, localActivity.getString(2131296386), 1);
    }
    if (paramINotification.getName().equals("scheduleBroadcastImageReceived"))
    {
      this.broadcastImage = ((Bitmap)paramINotification.getBody());
      if (this.broadcastImage != null)
        this.addedPhotoImageView.setImageResource(2130837979);
    }
    if ((!paramINotification.getName().equals("scheduleBroadcastImageCancelled")) || (paramINotification.getName().equals("scheduleBroadcastImageFailed")))
      new AlertDialog.Builder(((BaseFacade)getFacade()).getOwnerActivity()).setTitle("Error Adding Image").setMessage("There was an error adding the image - please try again.").setPositiveButton("Ok", new DialogInterface.OnClickListener()
      {
        public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
        {
        }
      }).show();
  }

  public String[] listNotificationInterests()
  {
    return new String[] { "scheduleBroadcastImageReceived", "scheduleBroadcastImageCancelled", "scheduleBroadcastImageFailed", "scheduleBroadcastScheduled", "scheduleBroadcastScheduledError" };
  }

  public void onRegister()
  {
    super.onRegister();
    this.navigationBar.setProfileInfoVisible(Boolean.valueOf(false));
    this.navigationBar.setLeaderboardVisible(Boolean.valueOf(false));
    this.navigationBar.setLogoVisible(Boolean.valueOf(true));
    this.navigationBar.setSearchVisible(Boolean.valueOf(false));
    this.navigationBar.showBackButton();
    this.navigationBar.setFacade(getFacade());
  }
}