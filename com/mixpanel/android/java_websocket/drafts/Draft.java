package com.mixpanel.android.java_websocket.drafts;

import com.mixpanel.android.java_websocket.WebSocket.Role;
import com.mixpanel.android.java_websocket.exceptions.IncompleteHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.LimitExedeedException;
import com.mixpanel.android.java_websocket.framing.FrameBuilder;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.framing.FramedataImpl1;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.HandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.HandshakeImpl1Client;
import com.mixpanel.android.java_websocket.handshake.HandshakeImpl1Server;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.handshake.ServerHandshake;
import com.mixpanel.android.java_websocket.handshake.ServerHandshakeBuilder;
import com.mixpanel.android.java_websocket.util.Charsetfunctions;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public abstract class Draft
{
  public static final byte[] FLASH_POLICY_REQUEST = Charsetfunctions.utf8Bytes("");
  public static int INITIAL_FAMESIZE;
  public static int MAX_FAME_SIZE = 1000;
  protected Framedata.Opcode continuousFrameType = null;
  protected WebSocket.Role role = null;

  static
  {
    INITIAL_FAMESIZE = 64;
  }

  public static ByteBuffer readLine(ByteBuffer paramByteBuffer)
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(paramByteBuffer.remaining());
    byte b1 = 48;
    while (paramByteBuffer.hasRemaining())
    {
      byte b2 = b1;
      b1 = paramByteBuffer.get();
      localByteBuffer.put(b1);
      if ((b2 == 13) && (b1 == 10))
      {
        localByteBuffer.limit(-2 + localByteBuffer.position());
        localByteBuffer.position(0);
        return localByteBuffer;
      }
    }
    paramByteBuffer.position(paramByteBuffer.position() - localByteBuffer.position());
    return null;
  }

  public static String readStringLine(ByteBuffer paramByteBuffer)
  {
    ByteBuffer localByteBuffer = readLine(paramByteBuffer);
    if (localByteBuffer == null)
      return null;
    return Charsetfunctions.stringAscii(localByteBuffer.array(), 0, localByteBuffer.limit());
  }

  public static HandshakeBuilder translateHandshakeHttp(ByteBuffer paramByteBuffer, WebSocket.Role paramRole)
    throws InvalidHandshakeException, IncompleteHandshakeException
  {
    String str1 = readStringLine(paramByteBuffer);
    if (str1 == null)
      throw new IncompleteHandshakeException(128 + paramByteBuffer.capacity());
    String[] arrayOfString1 = str1.split(" ", 3);
    if (arrayOfString1.length != 3)
      throw new InvalidHandshakeException();
    Object localObject;
    if (paramRole == WebSocket.Role.CLIENT)
    {
      localObject = new HandshakeImpl1Server();
      ServerHandshakeBuilder localServerHandshakeBuilder = (ServerHandshakeBuilder)localObject;
      localServerHandshakeBuilder.setHttpStatus(Short.parseShort(arrayOfString1[1]));
      localServerHandshakeBuilder.setHttpStatusMessage(arrayOfString1[2]);
    }
    for (String str2 = readStringLine(paramByteBuffer); ; str2 = readStringLine(paramByteBuffer))
    {
      if ((str2 == null) || (str2.length() <= 0))
        break label196;
      String[] arrayOfString2 = str2.split(":", 2);
      if (arrayOfString2.length != 2)
      {
        throw new InvalidHandshakeException("not an http header");
        HandshakeImpl1Client localHandshakeImpl1Client = new HandshakeImpl1Client();
        localHandshakeImpl1Client.setResourceDescriptor(arrayOfString1[1]);
        localObject = localHandshakeImpl1Client;
        break;
      }
      ((HandshakeBuilder)localObject).put(arrayOfString2[0], arrayOfString2[1].replaceFirst("^ +", ""));
    }
    label196: if (str2 == null)
      throw new IncompleteHandshakeException();
    return localObject;
  }

  public abstract HandshakeState acceptHandshakeAsClient(ClientHandshake paramClientHandshake, ServerHandshake paramServerHandshake)
    throws InvalidHandshakeException;

  public abstract HandshakeState acceptHandshakeAsServer(ClientHandshake paramClientHandshake)
    throws InvalidHandshakeException;

  protected boolean basicAccept(Handshakedata paramHandshakedata)
  {
    return (paramHandshakedata.getFieldValue("Upgrade").equalsIgnoreCase("websocket")) && (paramHandshakedata.getFieldValue("Connection").toLowerCase(Locale.ENGLISH).contains("upgrade"));
  }

  public int checkAlloc(int paramInt)
    throws LimitExedeedException, InvalidDataException
  {
    if (paramInt < 0)
      throw new InvalidDataException(1002, "Negative count");
    return paramInt;
  }

  public List<Framedata> continuousFrame(Framedata.Opcode paramOpcode, ByteBuffer paramByteBuffer, boolean paramBoolean)
  {
    if ((paramOpcode != Framedata.Opcode.BINARY) && (paramOpcode != Framedata.Opcode.TEXT) && (paramOpcode != Framedata.Opcode.TEXT))
      throw new IllegalArgumentException("Only Opcode.BINARY or  Opcode.TEXT are allowed");
    FramedataImpl1 localFramedataImpl1;
    if (this.continuousFrameType != null)
    {
      this.continuousFrameType = Framedata.Opcode.CONTINUOUS;
      localFramedataImpl1 = new FramedataImpl1(this.continuousFrameType);
    }
    while (true)
    {
      try
      {
        localFramedataImpl1.setPayload(paramByteBuffer);
        localFramedataImpl1.setFin(paramBoolean);
        if (paramBoolean)
        {
          this.continuousFrameType = null;
          return Collections.singletonList(localFramedataImpl1);
          this.continuousFrameType = paramOpcode;
        }
      }
      catch (InvalidDataException localInvalidDataException)
      {
        throw new RuntimeException(localInvalidDataException);
      }
      this.continuousFrameType = paramOpcode;
    }
  }

  public abstract Draft copyInstance();

  public abstract ByteBuffer createBinaryFrame(Framedata paramFramedata);

  public abstract List<Framedata> createFrames(String paramString, boolean paramBoolean);

  public abstract List<Framedata> createFrames(ByteBuffer paramByteBuffer, boolean paramBoolean);

  public List<ByteBuffer> createHandshake(Handshakedata paramHandshakedata, WebSocket.Role paramRole)
  {
    return createHandshake(paramHandshakedata, paramRole, true);
  }

  public List<ByteBuffer> createHandshake(Handshakedata paramHandshakedata, WebSocket.Role paramRole, boolean paramBoolean)
  {
    StringBuilder localStringBuilder = new StringBuilder(100);
    if ((paramHandshakedata instanceof ClientHandshake))
    {
      localStringBuilder.append("GET ");
      localStringBuilder.append(((ClientHandshake)paramHandshakedata).getResourceDescriptor());
      localStringBuilder.append(" HTTP/1.1");
    }
    while (true)
    {
      localStringBuilder.append("\r\n");
      Iterator localIterator = paramHandshakedata.iterateHttpFields();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        String str2 = paramHandshakedata.getFieldValue(str1);
        localStringBuilder.append(str1);
        localStringBuilder.append(": ");
        localStringBuilder.append(str2);
        localStringBuilder.append("\r\n");
      }
      if (!(paramHandshakedata instanceof ServerHandshake))
        break;
      localStringBuilder.append("HTTP/1.1 101 " + ((ServerHandshake)paramHandshakedata).getHttpStatusMessage());
    }
    throw new RuntimeException("unknow role");
    localStringBuilder.append("\r\n");
    byte[] arrayOfByte1 = Charsetfunctions.asciiBytes(localStringBuilder.toString());
    byte[] arrayOfByte2;
    if (paramBoolean)
    {
      arrayOfByte2 = paramHandshakedata.getContent();
      if (arrayOfByte2 != null)
        break label281;
    }
    label281: for (int i = 0; ; i = arrayOfByte2.length)
    {
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i + arrayOfByte1.length);
      localByteBuffer.put(arrayOfByte1);
      if (arrayOfByte2 != null)
        localByteBuffer.put(arrayOfByte2);
      localByteBuffer.flip();
      return Collections.singletonList(localByteBuffer);
      arrayOfByte2 = null;
      break;
    }
  }

  public abstract CloseHandshakeType getCloseHandshakeType();

  public WebSocket.Role getRole()
  {
    return this.role;
  }

  public abstract ClientHandshakeBuilder postProcessHandshakeRequestAsClient(ClientHandshakeBuilder paramClientHandshakeBuilder)
    throws InvalidHandshakeException;

  public abstract HandshakeBuilder postProcessHandshakeResponseAsServer(ClientHandshake paramClientHandshake, ServerHandshakeBuilder paramServerHandshakeBuilder)
    throws InvalidHandshakeException;

  public abstract void reset();

  public void setParseMode(WebSocket.Role paramRole)
  {
    this.role = paramRole;
  }

  public abstract List<Framedata> translateFrame(ByteBuffer paramByteBuffer)
    throws InvalidDataException;

  public Handshakedata translateHandshake(ByteBuffer paramByteBuffer)
    throws InvalidHandshakeException
  {
    return translateHandshakeHttp(paramByteBuffer, this.role);
  }

  public static enum CloseHandshakeType
  {
    static
    {
      CloseHandshakeType[] arrayOfCloseHandshakeType = new CloseHandshakeType[3];
      arrayOfCloseHandshakeType[0] = NONE;
      arrayOfCloseHandshakeType[1] = ONEWAY;
      arrayOfCloseHandshakeType[2] = TWOWAY;
    }
  }

  public static enum HandshakeState
  {
    static
    {
      HandshakeState[] arrayOfHandshakeState = new HandshakeState[2];
      arrayOfHandshakeState[0] = MATCHED;
      arrayOfHandshakeState[1] = NOT_MATCHED;
    }
  }
}