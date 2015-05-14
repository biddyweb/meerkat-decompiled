package com.twitter.sdk.android.core.identity;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.Signature;
import com.twitter.sdk.android.core.Callback;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterSession;

class SSOAuthHandler extends AuthHandler
{
  static final String APP_SIGNATURE = "3082025d308201c6a00302010202044bd76cce300d06092a864886f70d01010505003073310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f31163014060355040a130d547769747465722c20496e632e310f300d060355040b13064d6f62696c65311630140603550403130d4c656c616e6420526563686973301e170d3130303432373233303133345a170d3438303832353233303133345a3073310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f31163014060355040a130d547769747465722c20496e632e310f300d060355040b13064d6f62696c65311630140603550403130d4c656c616e642052656368697330819f300d06092a864886f70d010101050003818d003081890281810086233c2e51c62232d49cc932e470713d63a6a1106b38f9e442e01bc79ca4f95c72b2cb3f1369ef7dea6036bff7c4b2828cb3787e7657ad83986751ced5b131fcc6f413efb7334e32ed9787f9e9a249ae108fa66009ac7a7932c25d37e1e07d4f9f66aa494c270dbac87d261c9668d321c2fba4ef2800e46671a597ff2eac5d7f0203010001300d06092a864886f70d0101050500038181003e1f01cb6ea8be8d2cecef5cd2a64c97ba8728aa5f08f8275d00508d64d139b6a72c5716b40a040df0eeeda04de9361107e123ee8d3dc05e70c8a355f46dbadf1235443b0b214c57211afd4edd147451c443d49498d2a7ff27e45a99c39b9e47429a1dae843ba233bf8ca81296dbe1dc5c5434514d995b0279246809392a219b";
  private static final String EXTRA_CONSUMER_KEY = "ck";
  private static final String EXTRA_CONSUMER_SECRET = "cs";
  static final String PACKAGE_NAME = "com.twitter.android";
  static final ComponentName SSO_ACTIVITY = new ComponentName("com.twitter.android", "com.twitter.android.SingleSignOnActivity");
  static final String SSO_CLASS_NAME = "com.twitter.android.SingleSignOnActivity";

  public SSOAuthHandler(TwitterAuthConfig paramTwitterAuthConfig, Callback<TwitterSession> paramCallback, int paramInt)
  {
    super(paramTwitterAuthConfig, paramCallback, paramInt);
  }

  private static boolean checkAppSignature(PackageManager paramPackageManager)
  {
    while (true)
    {
      int j;
      try
      {
        PackageInfo localPackageInfo = paramPackageManager.getPackageInfo("com.twitter.android", 64);
        Signature[] arrayOfSignature = localPackageInfo.signatures;
        int i = arrayOfSignature.length;
        j = 0;
        boolean bool = false;
        if (j < i)
        {
          if ("3082025d308201c6a00302010202044bd76cce300d06092a864886f70d01010505003073310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f31163014060355040a130d547769747465722c20496e632e310f300d060355040b13064d6f62696c65311630140603550403130d4c656c616e6420526563686973301e170d3130303432373233303133345a170d3438303832353233303133345a3073310b3009060355040613025553310b3009060355040813024341311630140603550407130d53616e204672616e636973636f31163014060355040a130d547769747465722c20496e632e310f300d060355040b13064d6f62696c65311630140603550403130d4c656c616e642052656368697330819f300d06092a864886f70d010101050003818d003081890281810086233c2e51c62232d49cc932e470713d63a6a1106b38f9e442e01bc79ca4f95c72b2cb3f1369ef7dea6036bff7c4b2828cb3787e7657ad83986751ced5b131fcc6f413efb7334e32ed9787f9e9a249ae108fa66009ac7a7932c25d37e1e07d4f9f66aa494c270dbac87d261c9668d321c2fba4ef2800e46671a597ff2eac5d7f0203010001300d06092a864886f70d0101050500038181003e1f01cb6ea8be8d2cecef5cd2a64c97ba8728aa5f08f8275d00508d64d139b6a72c5716b40a040df0eeeda04de9361107e123ee8d3dc05e70c8a355f46dbadf1235443b0b214c57211afd4edd147451c443d49498d2a7ff27e45a99c39b9e47429a1dae843ba233bf8ca81296dbe1dc5c5434514d995b0279246809392a219b".equals(arrayOfSignature[j].toCharsString()))
            bool = true;
        }
        else
          return bool;
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        return false;
      }
      j++;
    }
  }

  public static boolean isAvailable(Context paramContext)
  {
    return checkAppSignature(paramContext.getPackageManager());
  }

  // ERROR //
  private boolean startAuthActivityForResult(Activity paramActivity)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 80\011android/app/Activity:getPackageManager\011()Landroid/content/pm/PackageManager;
    //   4: astore_2
    //   5: aload_2
    //   6: invokestatic 73\011com/twitter/sdk/android/core/identity/SSOAuthHandler:checkAppSignature\011(Landroid/content/pm/PackageManager;)Z
    //   9: ifne +18 -> 27
    //   12: invokestatic 86\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   15: ldc 88
    //   17: ldc 90
    //   19: aconst_null
    //   20: invokeinterface 96 4 0
    //   25: iconst_0
    //   26: ireturn
    //   27: aload_2
    //   28: getstatic 32\011com/twitter/sdk/android/core/identity/SSOAuthHandler:SSO_ACTIVITY\011Landroid/content/ComponentName;
    //   31: iconst_0
    //   32: invokevirtual 100\011android/content/pm/PackageManager:getActivityInfo\011(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    //   35: pop
    //   36: aload_0
    //   37: invokevirtual 104\011com/twitter/sdk/android/core/identity/SSOAuthHandler:getAuthConfig\011()Lcom/twitter/sdk/android/core/TwitterAuthConfig;
    //   40: astore 5
    //   42: new 106\011android/content/Intent
    //   45: dup
    //   46: invokespecial 108\011android/content/Intent:<init>\011()V
    //   49: getstatic 32\011com/twitter/sdk/android/core/identity/SSOAuthHandler:SSO_ACTIVITY\011Landroid/content/ComponentName;
    //   52: invokevirtual 112\011android/content/Intent:setComponent\011(Landroid/content/ComponentName;)Landroid/content/Intent;
    //   55: astore 6
    //   57: aload 6
    //   59: ldc 11
    //   61: aload 5
    //   63: invokevirtual 117\011com/twitter/sdk/android/core/TwitterAuthConfig:getConsumerKey\011()Ljava/lang/String;
    //   66: invokevirtual 121\011android/content/Intent:putExtra\011(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   69: ldc 14
    //   71: aload 5
    //   73: invokevirtual 124\011com/twitter/sdk/android/core/TwitterAuthConfig:getConsumerSecret\011()Ljava/lang/String;
    //   76: invokevirtual 121\011android/content/Intent:putExtra\011(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    //   79: pop
    //   80: aload_1
    //   81: aload 6
    //   83: aload_0
    //   84: getfield 128\011com/twitter/sdk/android/core/identity/SSOAuthHandler:requestCode\011I
    //   87: invokevirtual 132\011android/app/Activity:startActivityForResult\011(Landroid/content/Intent;I)V
    //   90: iconst_1
    //   91: ireturn
    //   92: astore_3
    //   93: invokestatic 86\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   96: ldc 88
    //   98: ldc 134
    //   100: aconst_null
    //   101: invokeinterface 96 4 0
    //   106: iconst_0
    //   107: ireturn
    //   108: astore 8
    //   110: invokestatic 86\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   113: ldc 88
    //   115: ldc 136
    //   117: aload 8
    //   119: invokeinterface 96 4 0
    //   124: iconst_0
    //   125: ireturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   27\01136\01192\011android/content/pm/PackageManager$NameNotFoundException
    //   80\01190\011108\011java/lang/Exception
  }

  public boolean authorize(Activity paramActivity)
  {
    return startAuthActivityForResult(paramActivity);
  }
}