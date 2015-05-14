package retrofit.converter;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import retrofit.mime.TypedOutput;

public class GsonConverter
  implements Converter
{
  private String encoding;
  private final Gson gson;

  public GsonConverter(Gson paramGson)
  {
    this(paramGson, "UTF-8");
  }

  public GsonConverter(Gson paramGson, String paramString)
  {
    this.gson = paramGson;
    this.encoding = paramString;
  }

  // ERROR //
  public Object fromBody(retrofit.mime.TypedInput paramTypedInput, java.lang.reflect.Type paramType)
    throws ConversionException
  {
    // Byte code:
    //   0: ldc 14
    //   2: astore_3
    //   3: aload_1
    //   4: invokeinterface 38 1 0
    //   9: ifnull +13 -> 22
    //   12: aload_1
    //   13: invokeinterface 38 1 0
    //   18: invokestatic 44\011retrofit/mime/MimeUtil:parseCharset\011(Ljava/lang/String;)Ljava/lang/String;
    //   21: astore_3
    //   22: aconst_null
    //   23: astore 4
    //   25: new 46\011java/io/InputStreamReader
    //   28: dup
    //   29: aload_1
    //   30: invokeinterface 50 1 0
    //   35: aload_3
    //   36: invokespecial 53\011java/io/InputStreamReader:<init>\011(Ljava/io/InputStream;Ljava/lang/String;)V
    //   39: astore 5
    //   41: aload_0
    //   42: getfield 22\011retrofit/converter/GsonConverter:gson\011Lcom/google/gson/Gson;
    //   45: aload 5
    //   47: aload_2
    //   48: invokevirtual 59\011com/google/gson/Gson:fromJson\011(Ljava/io/Reader;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    //   51: astore 10
    //   53: aload 5
    //   55: ifnull +8 -> 63
    //   58: aload 5
    //   60: invokevirtual 62\011java/io/InputStreamReader:close\011()V
    //   63: aload 10
    //   65: areturn
    //   66: astore 6
    //   68: new 28\011retrofit/converter/ConversionException
    //   71: dup
    //   72: aload 6
    //   74: invokespecial 65\011retrofit/converter/ConversionException:<init>\011(Ljava/lang/Throwable;)V
    //   77: athrow
    //   78: astore 7
    //   80: aload 4
    //   82: ifnull +8 -> 90
    //   85: aload 4
    //   87: invokevirtual 62\011java/io/InputStreamReader:close\011()V
    //   90: aload 7
    //   92: athrow
    //   93: astore 9
    //   95: new 28\011retrofit/converter/ConversionException
    //   98: dup
    //   99: aload 9
    //   101: invokespecial 65\011retrofit/converter/ConversionException:<init>\011(Ljava/lang/Throwable;)V
    //   104: athrow
    //   105: astore 11
    //   107: aload 10
    //   109: areturn
    //   110: astore 8
    //   112: goto -22 -> 90
    //   115: astore 7
    //   117: aload 5
    //   119: astore 4
    //   121: goto -41 -> 80
    //   124: astore 9
    //   126: aload 5
    //   128: astore 4
    //   130: goto -35 -> 95
    //   133: astore 6
    //   135: aload 5
    //   137: astore 4
    //   139: goto -71 -> 68
    //
    // Exception table:
    //   from\011to\011target\011type
    //   25\01141\01166\011java/io/IOException
    //   25\01141\01178\011finally
    //   68\01178\01178\011finally
    //   95\011105\01178\011finally
    //   25\01141\01193\011com/google/gson/JsonParseException
    //   58\01163\011105\011java/io/IOException
    //   85\01190\011110\011java/io/IOException
    //   41\01153\011115\011finally
    //   41\01153\011124\011com/google/gson/JsonParseException
    //   41\01153\011133\011java/io/IOException
  }

  public TypedOutput toBody(Object paramObject)
  {
    try
    {
      JsonTypedOutput localJsonTypedOutput = new JsonTypedOutput(this.gson.toJson(paramObject).getBytes(this.encoding), this.encoding);
      return localJsonTypedOutput;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new AssertionError(localUnsupportedEncodingException);
    }
  }

  private static class JsonTypedOutput
    implements TypedOutput
  {
    private final byte[] jsonBytes;
    private final String mimeType;

    JsonTypedOutput(byte[] paramArrayOfByte, String paramString)
    {
      this.jsonBytes = paramArrayOfByte;
      this.mimeType = ("application/json; charset=" + paramString);
    }

    public String fileName()
    {
      return null;
    }

    public long length()
    {
      return this.jsonBytes.length;
    }

    public String mimeType()
    {
      return this.mimeType;
    }

    public void writeTo(OutputStream paramOutputStream)
      throws IOException
    {
      paramOutputStream.write(this.jsonBytes);
    }
  }
}