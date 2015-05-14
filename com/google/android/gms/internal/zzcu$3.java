package com.google.android.gms.internal;

final class zzcu$3
  implements zzcv
{
  // ERROR //
  public void zza(zzic paramzzic, java.util.Map<java.lang.String, java.lang.String> paramMap)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokeinterface 22 1 0
    //   6: invokevirtual 28\011android/content/Context:getPackageManager\011()Landroid/content/pm/PackageManager;
    //   9: astore_3
    //   10: aload_2
    //   11: ldc 30
    //   13: invokeinterface 36 2 0
    //   18: checkcast 38\011java/lang/String
    //   21: astore 4
    //   23: new 40\011org/json/JSONObject
    //   26: dup
    //   27: aload 4
    //   29: invokespecial 43\011org/json/JSONObject:<init>\011(Ljava/lang/String;)V
    //   32: astore 5
    //   34: aload 5
    //   36: ldc 45
    //   38: invokevirtual 49\011org/json/JSONObject:getJSONArray\011(Ljava/lang/String;)Lorg/json/JSONArray;
    //   41: astore 7
    //   43: new 40\011org/json/JSONObject
    //   46: dup
    //   47: invokespecial 50\011org/json/JSONObject:<init>\011()V
    //   50: astore 8
    //   52: iconst_0
    //   53: istore 9
    //   55: iload 9
    //   57: aload 7
    //   59: invokevirtual 56\011org/json/JSONArray:length\011()I
    //   62: if_icmpge +300 -> 362
    //   65: aload 7
    //   67: iload 9
    //   69: invokevirtual 60\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
    //   72: astore 11
    //   74: aload 11
    //   76: ldc 62
    //   78: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   81: astore 12
    //   83: aload 11
    //   85: ldc 68
    //   87: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   90: astore 13
    //   92: aload 11
    //   94: ldc 70
    //   96: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   99: astore 14
    //   101: aload 11
    //   103: ldc 72
    //   105: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   108: astore 15
    //   110: aload 11
    //   112: ldc 74
    //   114: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   117: astore 16
    //   119: aload 11
    //   121: ldc 76
    //   123: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   126: astore 17
    //   128: aload 11
    //   130: ldc 78
    //   132: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   135: pop
    //   136: aload 11
    //   138: ldc 80
    //   140: invokevirtual 66\011org/json/JSONObject:optString\011(Ljava/lang/String;)Ljava/lang/String;
    //   143: pop
    //   144: new 82\011android/content/Intent
    //   147: dup
    //   148: invokespecial 83\011android/content/Intent:<init>\011()V
    //   151: astore 20
    //   153: aload 13
    //   155: invokestatic 89\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   158: ifne +14 -> 172
    //   161: aload 20
    //   163: aload 13
    //   165: invokestatic 95\011android/net/Uri:parse\011(Ljava/lang/String;)Landroid/net/Uri;
    //   168: invokevirtual 99\011android/content/Intent:setData\011(Landroid/net/Uri;)Landroid/content/Intent;
    //   171: pop
    //   172: aload 14
    //   174: invokestatic 89\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   177: ifne +11 -> 188
    //   180: aload 20
    //   182: aload 14
    //   184: invokevirtual 103\011android/content/Intent:setAction\011(Ljava/lang/String;)Landroid/content/Intent;
    //   187: pop
    //   188: aload 15
    //   190: invokestatic 89\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   193: ifne +11 -> 204
    //   196: aload 20
    //   198: aload 15
    //   200: invokevirtual 106\011android/content/Intent:setType\011(Ljava/lang/String;)Landroid/content/Intent;
    //   203: pop
    //   204: aload 16
    //   206: invokestatic 89\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   209: ifne +11 -> 220
    //   212: aload 20
    //   214: aload 16
    //   216: invokevirtual 109\011android/content/Intent:setPackage\011(Ljava/lang/String;)Landroid/content/Intent;
    //   219: pop
    //   220: aload 17
    //   222: invokestatic 89\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   225: ifne +41 -> 266
    //   228: aload 17
    //   230: ldc 111
    //   232: iconst_2
    //   233: invokevirtual 115\011java/lang/String:split\011(Ljava/lang/String;I)[Ljava/lang/String;
    //   236: astore 24
    //   238: aload 24
    //   240: arraylength
    //   241: iconst_2
    //   242: if_icmpne +24 -> 266
    //   245: aload 20
    //   247: new 117\011android/content/ComponentName
    //   250: dup
    //   251: aload 24
    //   253: iconst_0
    //   254: aaload
    //   255: aload 24
    //   257: iconst_1
    //   258: aaload
    //   259: invokespecial 120\011android/content/ComponentName:<init>\011(Ljava/lang/String;Ljava/lang/String;)V
    //   262: invokevirtual 124\011android/content/Intent:setComponent\011(Landroid/content/ComponentName;)Landroid/content/Intent;
    //   265: pop
    //   266: aload_3
    //   267: aload 20
    //   269: ldc 125
    //   271: invokevirtual 131\011android/content/pm/PackageManager:resolveActivity\011(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;
    //   274: ifnull +70 -> 344
    //   277: iconst_1
    //   278: istore 21
    //   280: aload 8
    //   282: aload 12
    //   284: iload 21
    //   286: invokevirtual 135\011org/json/JSONObject:put\011(Ljava/lang/String;Z)Lorg/json/JSONObject;
    //   289: pop
    //   290: iinc 9 1
    //   293: goto -238 -> 55
    //   296: astore 30
    //   298: aload_1
    //   299: ldc 137
    //   301: new 40\011org/json/JSONObject
    //   304: dup
    //   305: invokespecial 50\011org/json/JSONObject:<init>\011()V
    //   308: invokeinterface 141 3 0
    //   313: return
    //   314: astore 6
    //   316: aload_1
    //   317: ldc 137
    //   319: new 40\011org/json/JSONObject
    //   322: dup
    //   323: invokespecial 50\011org/json/JSONObject:<init>\011()V
    //   326: invokeinterface 141 3 0
    //   331: return
    //   332: astore 10
    //   334: ldc 143
    //   336: aload 10
    //   338: invokestatic 148\011com/google/android/gms/internal/zzhx:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   341: goto -51 -> 290
    //   344: iconst_0
    //   345: istore 21
    //   347: goto -67 -> 280
    //   350: astore 22
    //   352: ldc 150
    //   354: aload 22
    //   356: invokestatic 148\011com/google/android/gms/internal/zzhx:zzb\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   359: goto -69 -> 290
    //   362: aload_1
    //   363: ldc 137
    //   365: aload 8
    //   367: invokeinterface 141 3 0
    //   372: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   23\01134\011296\011org/json/JSONException
    //   34\01143\011314\011org/json/JSONException
    //   65\01174\011332\011org/json/JSONException
    //   280\011290\011350\011org/json/JSONException
  }
}