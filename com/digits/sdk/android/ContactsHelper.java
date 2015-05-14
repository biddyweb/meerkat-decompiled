package com.digits.sdk.android;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.net.Uri;
import android.net.Uri.Builder;
import android.provider.ContactsContract.Data;
import com.digits.sdk.vcard.VCardBuilder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

class ContactsHelper
{
  private static final int MAX_CONTACTS = 2500;
  private static final String[] allProjectionColumns = { "mimetype", "lookup", "data2", "data3", "is_primary", "data1", "data1", "data2", "data3", "is_primary", "data1", "data2", "data3" };
  private static final String[] selectionArgs = { "vnd.android.cursor.item/phone_v2", "vnd.android.cursor.item/email_v2", "vnd.android.cursor.item/name" };
  private static final String selectionQuery = "mimetype=? OR mimetype=? OR mimetype=?";
  private final Context context;

  ContactsHelper(Context paramContext)
  {
    this.context = paramContext;
  }

  private List<String> processContactsMap(Map<String, List<ContentValues>> paramMap)
  {
    ArrayList localArrayList = new ArrayList();
    HashMap localHashMap = new HashMap();
    VCardBuilder localVCardBuilder = new VCardBuilder(-1073741823, "UTF-8");
    Iterator localIterator1 = paramMap.keySet().iterator();
    while (localIterator1.hasNext())
    {
      List localList = (List)paramMap.get((String)localIterator1.next());
      int i = 0;
      localHashMap.clear();
      localVCardBuilder.clear();
      Iterator localIterator2 = localList.iterator();
      while (localIterator2.hasNext())
      {
        ContentValues localContentValues = (ContentValues)localIterator2.next();
        String str = localContentValues.getAsString("mimetype");
        if (("vnd.android.cursor.item/phone_v2".equals(str)) || ("vnd.android.cursor.item/email_v2".equals(str)))
          i = 1;
        Object localObject = (List)localHashMap.get(str);
        if (localObject == null)
        {
          localObject = new ArrayList();
          localHashMap.put(str, localObject);
        }
        ((List)localObject).add(localContentValues);
      }
      if (i != 0)
      {
        localVCardBuilder.appendNameProperties((List)localHashMap.get("vnd.android.cursor.item/name")).appendPhones((List)localHashMap.get("vnd.android.cursor.item/phone_v2"), null).appendEmails((List)localHashMap.get("vnd.android.cursor.item/email_v2"));
        localArrayList.add(localVCardBuilder.toString());
      }
    }
    return localArrayList;
  }

  public List<String> createContactList(Cursor paramCursor)
  {
    if ((paramCursor == null) || (paramCursor.getCount() == 0))
      return Collections.EMPTY_LIST;
    int i = paramCursor.getColumnIndex("mimetype");
    int j = paramCursor.getColumnIndex("lookup");
    HashMap localHashMap = new HashMap();
    while (paramCursor.moveToNext())
    {
      String str1 = paramCursor.getString(i);
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("mimetype", str1);
      int k = -1;
      switch (str1.hashCode())
      {
      default:
        switch (k)
        {
        default:
          break;
        case 0:
          DatabaseUtils.cursorIntToContentValuesIfPresent(paramCursor, localContentValues, "data2");
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data3");
          DatabaseUtils.cursorIntToContentValuesIfPresent(paramCursor, localContentValues, "is_primary");
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data1");
        case 1:
        case 2:
        }
        break;
      case 684173810:
      case -1569536764:
      case -1079224304:
        while (true)
        {
          label124: String str2 = paramCursor.getString(j);
          Object localObject = (List)localHashMap.get(str2);
          if (localObject == null)
          {
            localObject = new ArrayList();
            localHashMap.put(str2, localObject);
          }
          ((List)localObject).add(localContentValues);
          break;
          if (!str1.equals("vnd.android.cursor.item/phone_v2"))
            break label124;
          k = 0;
          break label124;
          if (!str1.equals("vnd.android.cursor.item/email_v2"))
            break label124;
          k = 1;
          break label124;
          if (!str1.equals("vnd.android.cursor.item/name"))
            break label124;
          k = 2;
          break label124;
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data1");
          DatabaseUtils.cursorIntToContentValuesIfPresent(paramCursor, localContentValues, "data2");
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data3");
          DatabaseUtils.cursorIntToContentValuesIfPresent(paramCursor, localContentValues, "is_primary");
          continue;
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data1");
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data2");
          DatabaseUtils.cursorStringToContentValuesIfPresent(paramCursor, localContentValues, "data3");
        }
      }
    }
    return processContactsMap(localHashMap);
  }

  public Cursor getContactsCursor()
  {
    HashSet localHashSet = new HashSet(Arrays.asList(allProjectionColumns));
    String[] arrayOfString = (String[])localHashSet.toArray(new String[localHashSet.size()]);
    Uri localUri = ContactsContract.Data.CONTENT_URI.buildUpon().appendQueryParameter("limit", Integer.toString(2500)).build();
    return this.context.getContentResolver().query(localUri, arrayOfString, "mimetype=? OR mimetype=? OR mimetype=?", selectionArgs, null);
  }
}