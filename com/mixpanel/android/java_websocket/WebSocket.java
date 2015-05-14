package com.mixpanel.android.java_websocket;

import com.mixpanel.android.java_websocket.drafts.Draft;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.NotYetConnectedException;

public abstract interface WebSocket
{
  public static final int DEFAULT_PORT = 80;
  public static final int DEFAULT_WSS_PORT = 443;

  public abstract void close();

  public abstract void close(int paramInt);

  public abstract void close(int paramInt, String paramString);

  public abstract void closeConnection(int paramInt, String paramString);

  public abstract Draft getDraft();

  public abstract InetSocketAddress getLocalSocketAddress();

  public abstract READYSTATE getReadyState();

  public abstract InetSocketAddress getRemoteSocketAddress();

  public abstract String getResourceDescriptor();

  public abstract boolean hasBufferedData();

  public abstract boolean isClosed();

  public abstract boolean isClosing();

  public abstract boolean isConnecting();

  public abstract boolean isFlushAndClose();

  public abstract boolean isOpen();

  public abstract void send(String paramString)
    throws NotYetConnectedException;

  public abstract void send(ByteBuffer paramByteBuffer)
    throws IllegalArgumentException, NotYetConnectedException;

  public abstract void send(byte[] paramArrayOfByte)
    throws IllegalArgumentException, NotYetConnectedException;

  public abstract void sendFragmentedFrame(Framedata.Opcode paramOpcode, ByteBuffer paramByteBuffer, boolean paramBoolean);

  public abstract void sendFrame(Framedata paramFramedata);

  public static enum READYSTATE
  {
    static
    {
      CONNECTING = new READYSTATE("CONNECTING", 1);
      OPEN = new READYSTATE("OPEN", 2);
      CLOSING = new READYSTATE("CLOSING", 3);
      CLOSED = new READYSTATE("CLOSED", 4);
      READYSTATE[] arrayOfREADYSTATE = new READYSTATE[5];
      arrayOfREADYSTATE[0] = NOT_YET_CONNECTED;
      arrayOfREADYSTATE[1] = CONNECTING;
      arrayOfREADYSTATE[2] = OPEN;
      arrayOfREADYSTATE[3] = CLOSING;
      arrayOfREADYSTATE[4] = CLOSED;
    }
  }

  public static enum Role
  {
    static
    {
      Role[] arrayOfRole = new Role[2];
      arrayOfRole[0] = CLIENT;
      arrayOfRole[1] = SERVER;
    }
  }
}