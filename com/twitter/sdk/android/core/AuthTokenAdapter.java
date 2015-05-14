package com.twitter.sdk.android.core;

import com.google.gson.Gson;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.twitter.sdk.android.core.internal.oauth.GuestAuthToken;
import com.twitter.sdk.android.core.internal.oauth.OAuth2Token;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class AuthTokenAdapter
  implements JsonSerializer<AuthToken>, JsonDeserializer<AuthToken>
{
  private static final String AUTH_TOKEN = "auth_token";
  private static final String AUTH_TYPE = "auth_type";
  static final Map<String, Class<? extends AuthToken>> authTypeRegistry = new HashMap();
  private final Gson gson = new Gson();

  static
  {
    authTypeRegistry.put("oauth1a", TwitterAuthToken.class);
    authTypeRegistry.put("oauth2", OAuth2Token.class);
    authTypeRegistry.put("guest", GuestAuthToken.class);
  }

  static String getAuthTypeString(Class<? extends AuthToken> paramClass)
  {
    Iterator localIterator = authTypeRegistry.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((Class)localEntry.getValue()).equals(paramClass))
        return (String)localEntry.getKey();
    }
    return "";
  }

  public AuthToken deserialize(JsonElement paramJsonElement, Type paramType, JsonDeserializationContext paramJsonDeserializationContext)
    throws JsonParseException
  {
    JsonObject localJsonObject = paramJsonElement.getAsJsonObject();
    String str = localJsonObject.getAsJsonPrimitive("auth_type").getAsString();
    JsonElement localJsonElement = localJsonObject.get("auth_token");
    return (AuthToken)this.gson.fromJson(localJsonElement, (Class)authTypeRegistry.get(str));
  }

  public JsonElement serialize(AuthToken paramAuthToken, Type paramType, JsonSerializationContext paramJsonSerializationContext)
  {
    JsonObject localJsonObject = new JsonObject();
    localJsonObject.addProperty("auth_type", getAuthTypeString(paramAuthToken.getClass()));
    localJsonObject.add("auth_token", this.gson.toJsonTree(paramAuthToken));
    return localJsonObject;
  }
}