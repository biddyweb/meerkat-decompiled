package co.getair.meerkat.dtos;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.MLog;

public class Session
{
  private int appVersionCode = -1;
  private String authToken;
  private long expirationTime;
  private boolean shouldAskForAddressBook = false;
  private boolean shouldProvidePhoneNumber = false;

  public Session(String paramString, long paramLong, boolean paramBoolean)
  {
    this.authToken = paramString;
    this.expirationTime = paramLong;
    this.shouldProvidePhoneNumber = paramBoolean;
  }

  public Session(String paramString, long paramLong, boolean paramBoolean1, boolean paramBoolean2, int paramInt)
  {
    this.authToken = paramString;
    this.expirationTime = paramLong;
    this.appVersionCode = paramInt;
    this.shouldProvidePhoneNumber = paramBoolean1;
    this.shouldAskForAddressBook = paramBoolean2;
  }

  public static Session loadSession(Context paramContext)
  {
    ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(paramContext.getApplicationContext());
    String str = localApplicationPreferences.getAuthToken();
    long l = localApplicationPreferences.getAuthoTokenExpirationDate();
    int i = localApplicationPreferences.getAuthTokenAppVersionCode();
    boolean bool1 = localApplicationPreferences.getShouldProvidePhoneNumberState();
    boolean bool2 = localApplicationPreferences.getShouldAskForAddressBookState();
    boolean bool3 = str.isEmpty();
    Session localSession = null;
    if (!bool3)
      localSession = new Session(str, l, bool1, bool2, i);
    return localSession;
  }

  public int getAppVersionCode()
  {
    return this.appVersionCode;
  }

  public String getAuthToken()
  {
    return this.authToken;
  }

  public long getExpirationTime()
  {
    return this.expirationTime;
  }

  public void saveSession(Context paramContext)
  {
    ApplicationPreferences localApplicationPreferences = new ApplicationPreferences(paramContext.getApplicationContext());
    localApplicationPreferences.saveAuthToken(this.authToken);
    localApplicationPreferences.saveAuthTokenExpirationDate(this.expirationTime);
    localApplicationPreferences.saveShouldProvidePhoneNumber(this.shouldProvidePhoneNumber);
    localApplicationPreferences.saveShouldAskForAddressBook(this.shouldAskForAddressBook);
    try
    {
      localApplicationPreferences.setAuthTokenAppVersionCode(paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0).versionCode);
      return;
    }
    catch (Exception localException)
    {
      MLog.e("Error retrieving version code");
      localException.printStackTrace();
    }
  }

  public void setShouldAskForAddressBook(boolean paramBoolean)
  {
    this.shouldAskForAddressBook = paramBoolean;
  }

  public void setShouldProvidePhoneNumber(boolean paramBoolean)
  {
    this.shouldProvidePhoneNumber = paramBoolean;
  }

  public boolean shouldAskForAddressBook()
  {
    return this.shouldAskForAddressBook;
  }

  public boolean shouldProvidePhoneNumber()
  {
    return this.shouldProvidePhoneNumber;
  }
}