package com.google.gson;

import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.MalformedJsonException;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;

public final class JsonParser
{
  // ERROR //
  public JsonElement parse(JsonReader paramJsonReader)
    throws JsonIOException, JsonSyntaxException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 24\011com/google/gson/stream/JsonReader:isLenient\011()Z
    //   4: istore_2
    //   5: aload_1
    //   6: iconst_1
    //   7: invokevirtual 28\011com/google/gson/stream/JsonReader:setLenient\011(Z)V
    //   10: aload_1
    //   11: invokestatic 32\011com/google/gson/internal/Streams:parse\011(Lcom/google/gson/stream/JsonReader;)Lcom/google/gson/JsonElement;
    //   14: astore 6
    //   16: aload_1
    //   17: iload_2
    //   18: invokevirtual 28\011com/google/gson/stream/JsonReader:setLenient\011(Z)V
    //   21: aload 6
    //   23: areturn
    //   24: astore 5
    //   26: new 34\011com/google/gson/JsonParseException
    //   29: dup
    //   30: new 36\011java/lang/StringBuilder
    //   33: dup
    //   34: invokespecial 37\011java/lang/StringBuilder:<init>\011()V
    //   37: ldc 39
    //   39: invokevirtual 43\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   42: aload_1
    //   43: invokevirtual 46\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   46: ldc 48
    //   48: invokevirtual 43\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   51: invokevirtual 52\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   54: aload 5
    //   56: invokespecial 55\011com/google/gson/JsonParseException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   59: athrow
    //   60: astore 4
    //   62: aload_1
    //   63: iload_2
    //   64: invokevirtual 28\011com/google/gson/stream/JsonReader:setLenient\011(Z)V
    //   67: aload 4
    //   69: athrow
    //   70: astore_3
    //   71: new 34\011com/google/gson/JsonParseException
    //   74: dup
    //   75: new 36\011java/lang/StringBuilder
    //   78: dup
    //   79: invokespecial 37\011java/lang/StringBuilder:<init>\011()V
    //   82: ldc 39
    //   84: invokevirtual 43\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: aload_1
    //   88: invokevirtual 46\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   91: ldc 48
    //   93: invokevirtual 43\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   96: invokevirtual 52\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   99: aload_3
    //   100: invokespecial 55\011com/google/gson/JsonParseException:<init>\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   103: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   10\01116\01124\011java/lang/StackOverflowError
    //   10\01116\01160\011finally
    //   26\01160\01160\011finally
    //   71\011104\01160\011finally
    //   10\01116\01170\011java/lang/OutOfMemoryError
  }

  public JsonElement parse(Reader paramReader)
    throws JsonIOException, JsonSyntaxException
  {
    JsonElement localJsonElement;
    try
    {
      JsonReader localJsonReader = new JsonReader(paramReader);
      localJsonElement = parse(localJsonReader);
      if ((!localJsonElement.isJsonNull()) && (localJsonReader.peek() != JsonToken.END_DOCUMENT))
        throw new JsonSyntaxException("Did not consume the entire document.");
    }
    catch (MalformedJsonException localMalformedJsonException)
    {
      throw new JsonSyntaxException(localMalformedJsonException);
    }
    catch (IOException localIOException)
    {
      throw new JsonIOException(localIOException);
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new JsonSyntaxException(localNumberFormatException);
    }
    return localJsonElement;
  }

  public JsonElement parse(String paramString)
    throws JsonSyntaxException
  {
    return parse(new StringReader(paramString));
  }
}