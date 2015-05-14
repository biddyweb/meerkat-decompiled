package io.fabric.sdk.android.services.settings;

import io.fabric.sdk.android.Kit;

class DefaultCachedSettingsIo
  implements CachedSettingsIo
{
  private final Kit kit;

  public DefaultCachedSettingsIo(Kit paramKit)
  {
    this.kit = paramKit;
  }

  // ERROR //
  public org.json.JSONObject readCachedSettings()
  {
    // Byte code:
    //   0: invokestatic 25\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   3: ldc 27
    //   5: ldc 29
    //   7: invokeinterface 35 3 0
    //   12: aconst_null
    //   13: astore_1
    //   14: new 37\011java/io/File
    //   17: dup
    //   18: new 39\011io/fabric/sdk/android/services/persistence/FileStoreImpl
    //   21: dup
    //   22: aload_0
    //   23: getfield 15\011io/fabric/sdk/android/services/settings/DefaultCachedSettingsIo:kit\011Lio/fabric/sdk/android/Kit;
    //   26: invokespecial 41\011io/fabric/sdk/android/services/persistence/FileStoreImpl:<init>\011(Lio/fabric/sdk/android/Kit;)V
    //   29: invokevirtual 45\011io/fabric/sdk/android/services/persistence/FileStoreImpl:getFilesDir\011()Ljava/io/File;
    //   32: ldc 47
    //   34: invokespecial 50\011java/io/File:<init>\011(Ljava/io/File;Ljava/lang/String;)V
    //   37: astore_2
    //   38: aload_2
    //   39: invokevirtual 54\011java/io/File:exists\011()Z
    //   42: istore 5
    //   44: aconst_null
    //   45: astore_1
    //   46: iload 5
    //   48: ifeq +45 -> 93
    //   51: new 56\011java/io/FileInputStream
    //   54: dup
    //   55: aload_2
    //   56: invokespecial 59\011java/io/FileInputStream:<init>\011(Ljava/io/File;)V
    //   59: astore 6
    //   61: new 61\011org/json/JSONObject
    //   64: dup
    //   65: aload 6
    //   67: invokestatic 67\011io/fabric/sdk/android/services/common/CommonUtils:streamToString\011(Ljava/io/InputStream;)Ljava/lang/String;
    //   70: invokespecial 70\011org/json/JSONObject:<init>\011(Ljava/lang/String;)V
    //   73: astore 7
    //   75: aload 7
    //   77: astore 8
    //   79: aload 6
    //   81: astore 9
    //   83: aload 9
    //   85: ldc 72
    //   87: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   90: aload 8
    //   92: areturn
    //   93: invokestatic 25\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   96: ldc 27
    //   98: ldc 78
    //   100: invokeinterface 35 3 0
    //   105: aconst_null
    //   106: astore 9
    //   108: aconst_null
    //   109: astore 8
    //   111: goto -28 -> 83
    //   114: astore 4
    //   116: invokestatic 25\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   119: ldc 27
    //   121: ldc 80
    //   123: aload 4
    //   125: invokeinterface 84 4 0
    //   130: aload_1
    //   131: ldc 72
    //   133: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   136: aconst_null
    //   137: areturn
    //   138: astore_3
    //   139: aload_1
    //   140: ldc 72
    //   142: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   145: aload_3
    //   146: athrow
    //   147: astore_3
    //   148: aload 6
    //   150: astore_1
    //   151: goto -12 -> 139
    //   154: astore 4
    //   156: aload 6
    //   158: astore_1
    //   159: goto -43 -> 116
    //
    // Exception table:
    //   from\011to\011target\011type
    //   14\01144\011114\011java/lang/Exception
    //   51\01161\011114\011java/lang/Exception
    //   93\011105\011114\011java/lang/Exception
    //   14\01144\011138\011finally
    //   51\01161\011138\011finally
    //   93\011105\011138\011finally
    //   116\011130\011138\011finally
    //   61\01175\011147\011finally
    //   61\01175\011154\011java/lang/Exception
  }

  // ERROR //
  public void writeCachedSettings(long paramLong, org.json.JSONObject paramJSONObject)
  {
    // Byte code:
    //   0: invokestatic 25\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   3: ldc 27
    //   5: ldc 88
    //   7: invokeinterface 35 3 0
    //   12: aload_3
    //   13: ifnull +67 -> 80
    //   16: aconst_null
    //   17: astore 4
    //   19: aload_3
    //   20: ldc 90
    //   22: lload_1
    //   23: invokevirtual 94\011org/json/JSONObject:put\011(Ljava/lang/String;J)Lorg/json/JSONObject;
    //   26: pop
    //   27: new 96\011java/io/FileWriter
    //   30: dup
    //   31: new 37\011java/io/File
    //   34: dup
    //   35: new 39\011io/fabric/sdk/android/services/persistence/FileStoreImpl
    //   38: dup
    //   39: aload_0
    //   40: getfield 15\011io/fabric/sdk/android/services/settings/DefaultCachedSettingsIo:kit\011Lio/fabric/sdk/android/Kit;
    //   43: invokespecial 41\011io/fabric/sdk/android/services/persistence/FileStoreImpl:<init>\011(Lio/fabric/sdk/android/Kit;)V
    //   46: invokevirtual 45\011io/fabric/sdk/android/services/persistence/FileStoreImpl:getFilesDir\011()Ljava/io/File;
    //   49: ldc 47
    //   51: invokespecial 50\011java/io/File:<init>\011(Ljava/io/File;Ljava/lang/String;)V
    //   54: invokespecial 97\011java/io/FileWriter:<init>\011(Ljava/io/File;)V
    //   57: astore 8
    //   59: aload 8
    //   61: aload_3
    //   62: invokevirtual 101\011org/json/JSONObject:toString\011()Ljava/lang/String;
    //   65: invokevirtual 104\011java/io/FileWriter:write\011(Ljava/lang/String;)V
    //   68: aload 8
    //   70: invokevirtual 107\011java/io/FileWriter:flush\011()V
    //   73: aload 8
    //   75: ldc 109
    //   77: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   80: return
    //   81: astore 6
    //   83: invokestatic 25\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   86: ldc 27
    //   88: ldc 111
    //   90: aload 6
    //   92: invokeinterface 84 4 0
    //   97: aload 4
    //   99: ldc 109
    //   101: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   104: return
    //   105: astore 5
    //   107: aload 4
    //   109: ldc 109
    //   111: invokestatic 76\011io/fabric/sdk/android/services/common/CommonUtils:closeOrLog\011(Ljava/io/Closeable;Ljava/lang/String;)V
    //   114: aload 5
    //   116: athrow
    //   117: astore 5
    //   119: aload 8
    //   121: astore 4
    //   123: goto -16 -> 107
    //   126: astore 6
    //   128: aload 8
    //   130: astore 4
    //   132: goto -49 -> 83
    //
    // Exception table:
    //   from\011to\011target\011type
    //   19\01159\01181\011java/lang/Exception
    //   19\01159\011105\011finally
    //   83\01197\011105\011finally
    //   59\01173\011117\011finally
    //   59\01173\011126\011java/lang/Exception
  }
}