package com.mixpanel.android.java_websocket.drafts;

import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;

public class Draft_17 extends Draft_10
{
  public Draft.HandshakeState acceptHandshakeAsServer(ClientHandshake paramClientHandshake)
    throws InvalidHandshakeException
  {
    if (readVersion(paramClientHandshake) == 13)
      return Draft.HandshakeState.MATCHED;
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft copyInstance()
  {
    return new Draft_17();
  }

  public ClientHandshakeBuilder postProcessHandshakeRequestAsClient(ClientHandshakeBuilder paramClientHandshakeBuilder)
  {
    super.postProcessHandshakeRequestAsClient(paramClientHandshakeBuilder);
    paramClientHandshakeBuilder.put("Sec-WebSocket-Version", "13");
    return paramClientHandshakeBuilder;
  }
}