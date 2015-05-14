package co.getair.meerkat.utilities;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Configuration;
import android.content.res.Resources;
import java.util.Locale;

public class ApplicationPreferences
{
  private static final String APP_SHARED_PREFS = ApplicationPreferences.class.getSimpleName();
  private static final String KEY_PREFRENCES_ADD_WATCHER_TEMPLATE = "addWatcherTemplate";
  private static final String KEY_PREFRENCES_AUTHENTICATION_TOKEN = "authToken";
  private static final String KEY_PREFRENCES_AUTHENTICATION_TOKEN_APP_VERSION_CODE = "authTokenAppVersionCode";
  private static final String KEY_PREFRENCES_AUTHENTICATION_TOKEN_EXPIRATION_DATE = "authTokenExpirationDate";
  private static final String KEY_PREFRENCES_COUNTRY_CODE = "defaultCountryCode";
  private static final String KEY_PREFRENCES_IS_FIRST_RETWEET = "isFirstRetweet";
  private static final String KEY_PREFRENCES_IS_FIRST_TIME_REQUESTING_LOCATION = "isFirstTimeRequestingLocation";
  private static final String KEY_PREFRENCES_IS_FIRST_UPLOAD_IMAGE = "isFirstUploadImage2";
  private static final String KEY_PREFRENCES_NOTIFICATIONS_TOKEN = "notificationsToken";
  private static final String KEY_PREFRENCES_SHOULD_ASK_FOR_ADDRESS_BOOK = "shouldAskForAddressBook";
  private static final String KEY_PREFRENCES_SHOULD_PROVIDE_PHONE_NUMBER = "shouldProvidePhoneNumver";
  private Context context;
  private SharedPreferences.Editor prefrencesEditor;
  private SharedPreferences sharedPrefrences;

  public ApplicationPreferences(Context paramContext)
  {
    this.context = paramContext;
    this.sharedPrefrences = paramContext.getSharedPreferences(APP_SHARED_PREFS, 0);
    this.prefrencesEditor = this.sharedPrefrences.edit();
  }

  public String getAddWatcherTemplate()
  {
    return this.sharedPrefrences.getString("addWatcherTemplate", "");
  }

  public String getAuthToken()
  {
    return this.sharedPrefrences.getString("authToken", "");
  }

  public int getAuthTokenAppVersionCode()
  {
    return this.sharedPrefrences.getInt("authTokenAppVersionCode", -1);
  }

  public long getAuthoTokenExpirationDate()
  {
    return this.sharedPrefrences.getLong("authTokenExpirationDate", -1L);
  }

  public String getDefaultCountryCode()
  {
    return this.sharedPrefrences.getString("defaultCountryCode", this.context.getResources().getConfiguration().locale.getCountry());
  }

  public String getNotificationsToken()
  {
    return this.sharedPrefrences.getString("notificationsToken", "");
  }

  public boolean getShouldAskForAddressBookState()
  {
    return this.sharedPrefrences.getBoolean("shouldAskForAddressBook", false);
  }

  public boolean getShouldProvidePhoneNumberState()
  {
    return this.sharedPrefrences.getBoolean("shouldProvidePhoneNumver", false);
  }

  public boolean isFirstTimeRequestingLocation()
  {
    return this.sharedPrefrences.getBoolean("isFirstTimeRequestingLocation", true);
  }

  public boolean isFirstTimeRetweetStream()
  {
    return this.sharedPrefrences.getBoolean("isFirstRetweet", true);
  }

  public boolean isFirstTimeUploadingProfileImage()
  {
    return this.sharedPrefrences.getBoolean("isFirstUploadImage2", true);
  }

  public void saveAddWatchersTemplate(String paramString)
  {
    this.prefrencesEditor.putString("addWatcherTemplate", paramString);
    this.prefrencesEditor.commit();
  }

  public void saveAuthToken(String paramString)
  {
    this.prefrencesEditor.putString("authToken", paramString);
    this.prefrencesEditor.commit();
  }

  public void saveAuthTokenExpirationDate(long paramLong)
  {
    this.prefrencesEditor.putLong("authTokenExpirationDate", paramLong);
    this.prefrencesEditor.commit();
  }

  public void saveDefaultCountryCode(String paramString)
  {
    this.prefrencesEditor.putString("defaultCountryCode", paramString);
    this.prefrencesEditor.commit();
  }

  public void saveIsFirstTimeRequestingLocation(boolean paramBoolean)
  {
    this.prefrencesEditor.putBoolean("isFirstTimeRequestingLocation", paramBoolean);
    this.prefrencesEditor.commit();
  }

  public void saveIsFirstTimeRetweetStream(boolean paramBoolean)
  {
    this.prefrencesEditor.putBoolean("isFirstRetweet", paramBoolean);
    this.prefrencesEditor.commit();
  }

  public void saveIsFirstTimeUploadingProfileImage(boolean paramBoolean)
  {
    this.prefrencesEditor.putBoolean("isFirstUploadImage2", paramBoolean);
    this.prefrencesEditor.commit();
  }

  public void saveNotificationsToken(String paramString)
  {
    this.prefrencesEditor.putString("notificationsToken", paramString);
    this.prefrencesEditor.commit();
  }

  public void saveShouldAskForAddressBook(boolean paramBoolean)
  {
    this.prefrencesEditor.putBoolean("shouldAskForAddressBook", paramBoolean);
    this.prefrencesEditor.commit();
  }

  public void saveShouldProvidePhoneNumber(boolean paramBoolean)
  {
    this.prefrencesEditor.putBoolean("shouldProvidePhoneNumver", paramBoolean);
    this.prefrencesEditor.commit();
  }

  public void setAuthTokenAppVersionCode(int paramInt)
  {
    this.prefrencesEditor.putInt("authTokenAppVersionCode", paramInt);
    this.prefrencesEditor.commit();
  }
}