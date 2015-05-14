package co.getair.meerkat.commands.phone_verification;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.os.AsyncTask;
import android.provider.ContactsContract.CommonDataKinds.Phone;
import android.provider.ContactsContract.Contacts;
import co.getair.meerkat.proxies.AddressbookUploadProxy;
import co.getair.meerkat.utilities.ApplicationPreferences;
import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberFormat;
import com.google.i18n.phonenumbers.PhoneNumberUtil.PhoneNumberType;
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;
import java.util.ArrayList;
import java.util.List;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;
import org.puremvc.java.multicore.patterns.facade.Facade;

public class UploadContactsCommand extends SimpleCommand
{
  private List<String> getContactsPhoneNumbers(Context paramContext)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    Cursor localCursor1 = localContentResolver.query(ContactsContract.Contacts.CONTENT_URI, null, null, null, null);
    String str1 = new ApplicationPreferences(paramContext).getDefaultCountryCode();
    ArrayList localArrayList = new ArrayList();
    if (localCursor1.moveToFirst());
    while (true)
    {
      String str2 = localCursor1.getString(localCursor1.getColumnIndex("_id"));
      Cursor localCursor2;
      String str3;
      if (Integer.parseInt(localCursor1.getString(localCursor1.getColumnIndex("has_phone_number"))) > 0)
      {
        localCursor2 = localContentResolver.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, "contact_id = ?", new String[] { str2 }, null);
        if (localCursor2.moveToNext())
          str3 = localCursor2.getString(localCursor2.getColumnIndex("data1"));
      }
      try
      {
        PhoneNumberUtil localPhoneNumberUtil = PhoneNumberUtil.getInstance();
        Phonenumber.PhoneNumber localPhoneNumber = localPhoneNumberUtil.parse(str3, str1);
        String str4 = localPhoneNumberUtil.format(localPhoneNumber, PhoneNumberUtil.PhoneNumberFormat.E164);
        PhoneNumberUtil.PhoneNumberType localPhoneNumberType = localPhoneNumberUtil.getNumberType(localPhoneNumber);
        if ((localPhoneNumberType == PhoneNumberUtil.PhoneNumberType.MOBILE) || (localPhoneNumberType == PhoneNumberUtil.PhoneNumberType.FIXED_LINE_OR_MOBILE))
          localArrayList.add(str4);
        localCursor2.close();
        if (localCursor1.moveToNext())
          continue;
        return localArrayList;
      }
      catch (NumberParseException localNumberParseException)
      {
        while (true)
          localNumberParseException.printStackTrace();
      }
    }
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    new AsyncTask()
    {
      protected Void doInBackground(Void[] paramAnonymousArrayOfVoid)
      {
        List localList = UploadContactsCommand.this.getContactsPhoneNumbers(this.val$context);
        if (!localList.isEmpty())
          ((AddressbookUploadProxy)UploadContactsCommand.this.getFacade().retrieveProxy(AddressbookUploadProxy.getName())).uploadAddressBook(localList);
        return null;
      }
    }
    .execute(new Void[] { null, null, null });
  }
}