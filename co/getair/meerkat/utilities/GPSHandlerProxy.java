package co.getair.meerkat.utilities;

import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.res.Resources;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import java.util.List;
import java.util.Locale;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class GPSHandlerProxy extends Proxy
  implements LocationListener
{
  public static final String NOTIFICATION_LOCATION_RECEIVED = "LocationReceived";
  private Context context;
  private String currentCity = "";
  private String currentCountry = "";
  private Location currentLocation = null;
  private boolean isStarted = false;
  LocationManager locationManager;

  public GPSHandlerProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
    this.locationManager = ((LocationManager)paramContext.getSystemService("location"));
  }

  private boolean checkGpsEnabled(final Context paramContext)
  {
    boolean bool1 = this.locationManager.isProviderEnabled("gps");
    ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(this.context);
    boolean bool2 = localApplicationPreferences.isFirstTimeRequestingLocation();
    if (!bool1)
    {
      if (bool2)
        new AlertDialog.Builder(paramContext).setMessage("Your GPS is not enabled. Please go to settings to enable it.").setPositiveButton("Go to settings", new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            GPSHandlerProxy.this.enableLocationSettings(paramContext);
          }
        }).setNegativeButton(this.context.getResources().getString(2131296290), new DialogInterface.OnClickListener()
        {
          public void onClick(DialogInterface paramAnonymousDialogInterface, int paramAnonymousInt)
          {
            GPSHandlerProxy.this.notifyGPSLocation();
          }
        }).show();
      while (true)
      {
        localApplicationPreferences.saveIsFirstTimeRequestingLocation(false);
        return false;
        notifyGPSLocation();
      }
    }
    return true;
  }

  private void enableLocationSettings(Context paramContext)
  {
    paramContext.startActivity(new Intent("android.settings.LOCATION_SOURCE_SETTINGS"));
  }

  private void notifyGPSLocation()
  {
    Intent localIntent = new Intent("LocationReceived");
    LocalBroadcastManager.getInstance(this.context).sendBroadcast(localIntent);
  }

  private void updateCityCountryTexts()
  {
    Geocoder localGeocoder = new Geocoder(this.context, Locale.getDefault());
    try
    {
      List localList = localGeocoder.getFromLocation(this.currentLocation.getLatitude(), this.currentLocation.getLongitude(), 1);
      this.currentCity = ((Address)localList.get(0)).getLocality();
      this.currentCountry = ((Address)localList.get(0)).getCountryName();
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }

  public String getCurrentCity()
  {
    if (this.currentCity != null)
      return this.currentCity;
    return "";
  }

  public String getCurrentCountry()
  {
    if (this.currentCountry != null)
      return this.currentCountry;
    return "";
  }

  public String getLocationText()
  {
    String str = "";
    if ((!getCurrentCity().isEmpty()) && (!getCurrentCountry().isEmpty()))
      str = this.currentCity + ", " + this.currentCountry;
    do
    {
      return str;
      if (!getCurrentCountry().isEmpty())
        return getCurrentCountry();
    }
    while (getCurrentCity().isEmpty());
    return getCurrentCity();
  }

  public Location getUpdatedLocation()
  {
    return this.currentLocation;
  }

  public boolean isStarted()
  {
    return this.isStarted;
  }

  public void onLocationChanged(Location paramLocation)
  {
    if (paramLocation.getTime() < System.currentTimeMillis() - 300000L);
    while (Math.abs(System.currentTimeMillis() - paramLocation.getTime()) >= 600000L)
      return;
    this.currentLocation = paramLocation;
    updateCityCountryTexts();
    notifyGPSLocation();
  }

  public void onProviderDisabled(String paramString)
  {
  }

  public void onProviderEnabled(String paramString)
  {
  }

  public void onStatusChanged(String paramString, int paramInt, Bundle paramBundle)
  {
  }

  public void start(Context paramContext)
  {
    if (!checkGpsEnabled(paramContext))
      return;
    List localList = this.locationManager.getProviders(true);
    for (int i = -1 + localList.size(); ; i--)
    {
      Location localLocation = null;
      if (i >= 0)
      {
        localLocation = this.locationManager.getLastKnownLocation((String)localList.get(i));
        if ((localLocation != null) && (Math.abs(System.currentTimeMillis() - localLocation.getTime()) < 600000))
        {
          this.currentLocation = localLocation;
          updateCityCountryTexts();
          notifyGPSLocation();
        }
      }
      else
      {
        if (localLocation != null)
          break;
        for (int j = -1 + localList.size(); j >= 0; j--)
          this.locationManager.requestLocationUpdates((String)localList.get(j), 0L, 0.0F, this);
      }
    }
    this.isStarted = true;
  }

  public void stop()
  {
    this.locationManager.removeUpdates(this);
    this.isStarted = false;
  }
}