package com.twitter.sdk.android.core.models;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

public class SafeMapAdapter
  implements TypeAdapterFactory
{
  public <T> TypeAdapter<T> create(Gson paramGson, final TypeToken<T> paramTypeToken)
  {
    return new TypeAdapter()
    {
      public T read(JsonReader paramAnonymousJsonReader)
        throws IOException
      {
        Object localObject = this.val$delegate.read(paramAnonymousJsonReader);
        if (Map.class.isAssignableFrom(paramTypeToken.getRawType()))
        {
          if (localObject == null)
            localObject = Collections.EMPTY_MAP;
        }
        else
          return localObject;
        return Collections.unmodifiableMap((Map)localObject);
      }

      public void write(JsonWriter paramAnonymousJsonWriter, T paramAnonymousT)
        throws IOException
      {
        this.val$delegate.write(paramAnonymousJsonWriter, paramAnonymousT);
      }
    };
  }
}