package com.mixpanel.android.java_websocket.drafts;

import com.mixpanel.android.java_websocket.WebSocket.Role;
import com.mixpanel.android.java_websocket.exceptions.IncompleteHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidFrameException;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.framing.CloseFrameBuilder;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.HandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.handshake.ServerHandshake;
import com.mixpanel.android.java_websocket.handshake.ServerHandshakeBuilder;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class Draft_76 extends Draft_75
{
  private static final byte[] closehandshake = { -1, 0 };
  private boolean failed = false;
  private final Random reuseableRandom = new Random();

  public static byte[] createChallenge(String paramString1, String paramString2, byte[] paramArrayOfByte)
    throws InvalidHandshakeException
  {
    byte[] arrayOfByte1 = getPart(paramString1);
    byte[] arrayOfByte2 = getPart(paramString2);
    byte[] arrayOfByte3 = new byte[16];
    arrayOfByte3[0] = arrayOfByte1[0];
    arrayOfByte3[1] = arrayOfByte1[1];
    arrayOfByte3[2] = arrayOfByte1[2];
    arrayOfByte3[3] = arrayOfByte1[3];
    arrayOfByte3[4] = arrayOfByte2[0];
    arrayOfByte3[5] = arrayOfByte2[1];
    arrayOfByte3[6] = arrayOfByte2[2];
    arrayOfByte3[7] = arrayOfByte2[3];
    arrayOfByte3[8] = paramArrayOfByte[0];
    arrayOfByte3[9] = paramArrayOfByte[1];
    arrayOfByte3[10] = paramArrayOfByte[2];
    arrayOfByte3[11] = paramArrayOfByte[3];
    arrayOfByte3[12] = paramArrayOfByte[4];
    arrayOfByte3[13] = paramArrayOfByte[5];
    arrayOfByte3[14] = paramArrayOfByte[6];
    arrayOfByte3[15] = paramArrayOfByte[7];
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
      return localMessageDigest.digest(arrayOfByte3);
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
  }

  private static String generateKey()
  {
    Random localRandom = new Random();
    long l = 1 + localRandom.nextInt(12);
    Long localLong = new Long(4294967295L / l);
    String str = Long.toString(l * (1 + localRandom.nextInt(Math.abs(localLong.intValue()))));
    int i = 1 + localRandom.nextInt(12);
    for (int j = 0; j < i; j++)
    {
      int n = Math.abs(localRandom.nextInt(str.length()));
      char c = (char)(33 + localRandom.nextInt(95));
      if ((c >= '0') && (c <= '9'))
        c = (char)(c - '\017');
      StringBuilder localStringBuilder2 = new StringBuilder(str);
      str = localStringBuilder2.insert(n, c).toString();
    }
    for (int k = 0; k < l; k++)
    {
      int m = Math.abs(1 + localRandom.nextInt(-1 + str.length()));
      StringBuilder localStringBuilder1 = new StringBuilder(str);
      str = localStringBuilder1.insert(m, " ").toString();
    }
    return str;
  }

  private static byte[] getPart(String paramString)
    throws InvalidHandshakeException
  {
    long l1;
    long l2;
    try
    {
      l1 = Long.parseLong(paramString.replaceAll("[^0-9]", ""));
      l2 = -1 + paramString.split(" ").length;
      if (l2 == 0L)
        throw new InvalidHandshakeException("invalid Sec-WebSocket-Key (/key2/)");
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new InvalidHandshakeException("invalid Sec-WebSocket-Key (/key1/ or /key2/)");
    }
    long l3 = new Long(l1 / l2).longValue();
    byte[] arrayOfByte = new byte[4];
    arrayOfByte[0] = ((byte)(int)(l3 >> 24));
    arrayOfByte[1] = ((byte)(int)(l3 << 8 >> 24));
    arrayOfByte[2] = ((byte)(int)(l3 << 16 >> 24));
    arrayOfByte[3] = ((byte)(int)(l3 << 24 >> 24));
    return arrayOfByte;
  }

  public Draft.HandshakeState acceptHandshakeAsClient(ClientHandshake paramClientHandshake, ServerHandshake paramServerHandshake)
  {
    if (this.failed)
      return Draft.HandshakeState.NOT_MATCHED;
    byte[] arrayOfByte;
    try
    {
      if ((!paramServerHandshake.getFieldValue("Sec-WebSocket-Origin").equals(paramClientHandshake.getFieldValue("Origin"))) || (!basicAccept(paramServerHandshake)))
        return Draft.HandshakeState.NOT_MATCHED;
      arrayOfByte = paramServerHandshake.getContent();
      if ((arrayOfByte == null) || (arrayOfByte.length == 0))
        throw new IncompleteHandshakeException();
    }
    catch (InvalidHandshakeException localInvalidHandshakeException)
    {
      throw new RuntimeException("bad handshakerequest", localInvalidHandshakeException);
    }
    if (Arrays.equals(arrayOfByte, createChallenge(paramClientHandshake.getFieldValue("Sec-WebSocket-Key1"), paramClientHandshake.getFieldValue("Sec-WebSocket-Key2"), paramClientHandshake.getContent())))
      return Draft.HandshakeState.MATCHED;
    Draft.HandshakeState localHandshakeState = Draft.HandshakeState.NOT_MATCHED;
    return localHandshakeState;
  }

  public Draft.HandshakeState acceptHandshakeAsServer(ClientHandshake paramClientHandshake)
  {
    if ((paramClientHandshake.getFieldValue("Upgrade").equals("WebSocket")) && (paramClientHandshake.getFieldValue("Connection").contains("Upgrade")) && (paramClientHandshake.getFieldValue("Sec-WebSocket-Key1").length() > 0) && (!paramClientHandshake.getFieldValue("Sec-WebSocket-Key2").isEmpty()) && (paramClientHandshake.hasFieldValue("Origin")))
      return Draft.HandshakeState.MATCHED;
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft copyInstance()
  {
    return new Draft_76();
  }

  public ByteBuffer createBinaryFrame(Framedata paramFramedata)
  {
    if (paramFramedata.getOpcode() == Framedata.Opcode.CLOSING)
      return ByteBuffer.wrap(closehandshake);
    return super.createBinaryFrame(paramFramedata);
  }

  public Draft.CloseHandshakeType getCloseHandshakeType()
  {
    return Draft.CloseHandshakeType.ONEWAY;
  }

  public ClientHandshakeBuilder postProcessHandshakeRequestAsClient(ClientHandshakeBuilder paramClientHandshakeBuilder)
  {
    paramClientHandshakeBuilder.put("Upgrade", "WebSocket");
    paramClientHandshakeBuilder.put("Connection", "Upgrade");
    paramClientHandshakeBuilder.put("Sec-WebSocket-Key1", generateKey());
    paramClientHandshakeBuilder.put("Sec-WebSocket-Key2", generateKey());
    if (!paramClientHandshakeBuilder.hasFieldValue("Origin"))
      paramClientHandshakeBuilder.put("Origin", "random" + this.reuseableRandom.nextInt());
    byte[] arrayOfByte = new byte[8];
    this.reuseableRandom.nextBytes(arrayOfByte);
    paramClientHandshakeBuilder.setContent(arrayOfByte);
    return paramClientHandshakeBuilder;
  }

  public HandshakeBuilder postProcessHandshakeResponseAsServer(ClientHandshake paramClientHandshake, ServerHandshakeBuilder paramServerHandshakeBuilder)
    throws InvalidHandshakeException
  {
    paramServerHandshakeBuilder.setHttpStatusMessage("WebSocket Protocol Handshake");
    paramServerHandshakeBuilder.put("Upgrade", "WebSocket");
    paramServerHandshakeBuilder.put("Connection", paramClientHandshake.getFieldValue("Connection"));
    paramServerHandshakeBuilder.put("Sec-WebSocket-Origin", paramClientHandshake.getFieldValue("Origin"));
    paramServerHandshakeBuilder.put("Sec-WebSocket-Location", "ws://" + paramClientHandshake.getFieldValue("Host") + paramClientHandshake.getResourceDescriptor());
    String str1 = paramClientHandshake.getFieldValue("Sec-WebSocket-Key1");
    String str2 = paramClientHandshake.getFieldValue("Sec-WebSocket-Key2");
    byte[] arrayOfByte = paramClientHandshake.getContent();
    if ((str1 == null) || (str2 == null) || (arrayOfByte == null) || (arrayOfByte.length != 8))
      throw new InvalidHandshakeException("Bad keys");
    paramServerHandshakeBuilder.setContent(createChallenge(str1, str2, arrayOfByte));
    return paramServerHandshakeBuilder;
  }

  public List<Framedata> translateFrame(ByteBuffer paramByteBuffer)
    throws InvalidDataException
  {
    paramByteBuffer.mark();
    List localList1 = super.translateRegularFrame(paramByteBuffer);
    if (localList1 == null)
    {
      paramByteBuffer.reset();
      List localList2 = this.readyframes;
      this.readingState = true;
      if (this.currentFrame == null)
      {
        this.currentFrame = ByteBuffer.allocate(2);
        if (paramByteBuffer.remaining() > this.currentFrame.remaining())
          throw new InvalidFrameException();
      }
      else
      {
        throw new InvalidFrameException();
      }
      this.currentFrame.put(paramByteBuffer);
      if (!this.currentFrame.hasRemaining())
      {
        if (Arrays.equals(this.currentFrame.array(), closehandshake))
        {
          localList2.add(new CloseFrameBuilder(1000));
          return localList2;
        }
        throw new InvalidFrameException();
      }
      this.readyframes = new LinkedList();
      return localList2;
    }
    return localList1;
  }

  public Handshakedata translateHandshake(ByteBuffer paramByteBuffer)
    throws InvalidHandshakeException
  {
    HandshakeBuilder localHandshakeBuilder = translateHandshakeHttp(paramByteBuffer, this.role);
    int i;
    if (((localHandshakeBuilder.hasFieldValue("Sec-WebSocket-Key1")) || (this.role == WebSocket.Role.CLIENT)) && (!localHandshakeBuilder.hasFieldValue("Sec-WebSocket-Version")))
    {
      if (this.role != WebSocket.Role.SERVER)
        break label77;
      i = 8;
    }
    while (true)
    {
      byte[] arrayOfByte = new byte[i];
      try
      {
        paramByteBuffer.get(arrayOfByte);
        localHandshakeBuilder.setContent(arrayOfByte);
        return localHandshakeBuilder;
        label77: i = 16;
      }
      catch (BufferUnderflowException localBufferUnderflowException)
      {
      }
    }
    throw new IncompleteHandshakeException(16 + paramByteBuffer.capacity());
  }
}