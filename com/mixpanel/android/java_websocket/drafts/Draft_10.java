package com.mixpanel.android.java_websocket.drafts;

import com.mixpanel.android.java_websocket.WebSocket.Role;
import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidFrameException;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.LimitExedeedException;
import com.mixpanel.android.java_websocket.exceptions.NotSendableException;
import com.mixpanel.android.java_websocket.framing.CloseFrameBuilder;
import com.mixpanel.android.java_websocket.framing.FrameBuilder;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.framing.FramedataImpl1;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.HandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.handshake.ServerHandshake;
import com.mixpanel.android.java_websocket.handshake.ServerHandshakeBuilder;
import com.mixpanel.android.java_websocket.util.Base64;
import com.mixpanel.android.java_websocket.util.Charsetfunctions;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class Draft_10 extends Draft
{
  private Framedata fragmentedframe = null;
  private ByteBuffer incompleteframe;
  private final Random reuseableRandom = new Random();

  static
  {
    if (!Draft_10.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  private byte fromOpcode(Framedata.Opcode paramOpcode)
  {
    if (paramOpcode == Framedata.Opcode.CONTINUOUS)
      return 0;
    if (paramOpcode == Framedata.Opcode.TEXT)
      return 1;
    if (paramOpcode == Framedata.Opcode.BINARY)
      return 2;
    if (paramOpcode == Framedata.Opcode.CLOSING)
      return 8;
    if (paramOpcode == Framedata.Opcode.PING)
      return 9;
    if (paramOpcode == Framedata.Opcode.PONG)
      return 10;
    throw new RuntimeException("Don't know how to handle " + paramOpcode.toString());
  }

  private String generateFinalKey(String paramString)
  {
    String str1 = paramString.trim();
    String str2 = str1 + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("SHA1");
      return Base64.encodeBytes(localMessageDigest.digest(str2.getBytes()));
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      throw new RuntimeException(localNoSuchAlgorithmException);
    }
  }

  public static int readVersion(Handshakedata paramHandshakedata)
  {
    int i = -1;
    String str = paramHandshakedata.getFieldValue("Sec-WebSocket-Version");
    if (str.length() > 0);
    try
    {
      int j = new Integer(str.trim()).intValue();
      i = j;
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return i;
  }

  private byte[] toByteArray(long paramLong, int paramInt)
  {
    byte[] arrayOfByte = new byte[paramInt];
    int i = -8 + paramInt * 8;
    for (int j = 0; j < paramInt; j++)
      arrayOfByte[j] = ((byte)(int)(paramLong >>> i - j * 8));
    return arrayOfByte;
  }

  private Framedata.Opcode toOpcode(byte paramByte)
    throws InvalidFrameException
  {
    switch (paramByte)
    {
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    default:
      throw new InvalidFrameException("unknow optcode " + (short)paramByte);
    case 0:
      return Framedata.Opcode.CONTINUOUS;
    case 1:
      return Framedata.Opcode.TEXT;
    case 2:
      return Framedata.Opcode.BINARY;
    case 8:
      return Framedata.Opcode.CLOSING;
    case 9:
      return Framedata.Opcode.PING;
    case 10:
    }
    return Framedata.Opcode.PONG;
  }

  public Draft.HandshakeState acceptHandshakeAsClient(ClientHandshake paramClientHandshake, ServerHandshake paramServerHandshake)
    throws InvalidHandshakeException
  {
    if ((!paramClientHandshake.hasFieldValue("Sec-WebSocket-Key")) || (!paramServerHandshake.hasFieldValue("Sec-WebSocket-Accept")))
      return Draft.HandshakeState.NOT_MATCHED;
    String str = paramServerHandshake.getFieldValue("Sec-WebSocket-Accept");
    if (generateFinalKey(paramClientHandshake.getFieldValue("Sec-WebSocket-Key")).equals(str))
      return Draft.HandshakeState.MATCHED;
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft.HandshakeState acceptHandshakeAsServer(ClientHandshake paramClientHandshake)
    throws InvalidHandshakeException
  {
    int i = readVersion(paramClientHandshake);
    if ((i == 7) || (i == 8))
    {
      if (basicAccept(paramClientHandshake))
        return Draft.HandshakeState.MATCHED;
      return Draft.HandshakeState.NOT_MATCHED;
    }
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft copyInstance()
  {
    return new Draft_10();
  }

  public ByteBuffer createBinaryFrame(Framedata paramFramedata)
  {
    ByteBuffer localByteBuffer1 = paramFramedata.getPayloadData();
    int i;
    int j;
    label31: int k;
    label43: int n;
    label56: ByteBuffer localByteBuffer2;
    int i1;
    if (this.role == WebSocket.Role.CLIENT)
    {
      i = 1;
      if (localByteBuffer1.remaining() > 125)
        break label148;
      j = 1;
      if (j <= 1)
        break label170;
      k = j + 1;
      int m = k + 1;
      if (i == 0)
        break label177;
      n = 4;
      localByteBuffer2 = ByteBuffer.allocate(n + m + localByteBuffer1.remaining());
      i1 = fromOpcode(paramFramedata.getOpcode());
      if (!paramFramedata.isFin())
        break label183;
    }
    byte[] arrayOfByte;
    label148: label170: label177: label183: for (int i2 = -128; ; i2 = 0)
    {
      localByteBuffer2.put((byte)(i1 | i2));
      arrayOfByte = toByteArray(localByteBuffer1.remaining(), j);
      if (($assertionsDisabled) || (arrayOfByte.length == j))
        break label189;
      throw new AssertionError();
      i = 0;
      break;
      if (localByteBuffer1.remaining() <= 65535)
      {
        j = 2;
        break label31;
      }
      j = 8;
      break label31;
      k = j;
      break label43;
      n = 0;
      break label56;
    }
    label189: if (j == 1)
    {
      int i6 = arrayOfByte[0];
      if (i != 0);
      for (int i7 = -128; ; i7 = 0)
      {
        localByteBuffer2.put((byte)(i7 | i6));
        if (i == 0)
          break;
        ByteBuffer localByteBuffer3 = ByteBuffer.allocate(4);
        localByteBuffer3.putInt(this.reuseableRandom.nextInt());
        localByteBuffer2.put(localByteBuffer3.array());
        for (int i4 = 0; localByteBuffer1.hasRemaining(); i4++)
          localByteBuffer2.put((byte)(localByteBuffer1.get() ^ localByteBuffer3.get(i4 % 4)));
      }
    }
    if (j == 2)
    {
      if (i != 0);
      for (int i5 = -128; ; i5 = 0)
      {
        localByteBuffer2.put((byte)(i5 | 0x7E));
        localByteBuffer2.put(arrayOfByte);
        break;
      }
    }
    if (j == 8)
    {
      if (i != 0);
      for (int i3 = -128; ; i3 = 0)
      {
        localByteBuffer2.put((byte)(i3 | 0x7F));
        localByteBuffer2.put(arrayOfByte);
        break;
      }
    }
    throw new RuntimeException("Size representation not supported/specified");
    localByteBuffer2.put(localByteBuffer1);
    assert (localByteBuffer2.remaining() == 0) : localByteBuffer2.remaining();
    localByteBuffer2.flip();
    return localByteBuffer2;
  }

  public List<Framedata> createFrames(String paramString, boolean paramBoolean)
  {
    FramedataImpl1 localFramedataImpl1 = new FramedataImpl1();
    try
    {
      localFramedataImpl1.setPayload(ByteBuffer.wrap(Charsetfunctions.utf8Bytes(paramString)));
      localFramedataImpl1.setFin(true);
      localFramedataImpl1.setOptcode(Framedata.Opcode.TEXT);
      localFramedataImpl1.setTransferemasked(paramBoolean);
      return Collections.singletonList(localFramedataImpl1);
    }
    catch (InvalidDataException localInvalidDataException)
    {
      throw new NotSendableException(localInvalidDataException);
    }
  }

  public List<Framedata> createFrames(ByteBuffer paramByteBuffer, boolean paramBoolean)
  {
    FramedataImpl1 localFramedataImpl1 = new FramedataImpl1();
    try
    {
      localFramedataImpl1.setPayload(paramByteBuffer);
      localFramedataImpl1.setFin(true);
      localFramedataImpl1.setOptcode(Framedata.Opcode.BINARY);
      localFramedataImpl1.setTransferemasked(paramBoolean);
      return Collections.singletonList(localFramedataImpl1);
    }
    catch (InvalidDataException localInvalidDataException)
    {
      throw new NotSendableException(localInvalidDataException);
    }
  }

  public Draft.CloseHandshakeType getCloseHandshakeType()
  {
    return Draft.CloseHandshakeType.TWOWAY;
  }

  public ClientHandshakeBuilder postProcessHandshakeRequestAsClient(ClientHandshakeBuilder paramClientHandshakeBuilder)
  {
    paramClientHandshakeBuilder.put("Upgrade", "websocket");
    paramClientHandshakeBuilder.put("Connection", "Upgrade");
    paramClientHandshakeBuilder.put("Sec-WebSocket-Version", "8");
    byte[] arrayOfByte = new byte[16];
    this.reuseableRandom.nextBytes(arrayOfByte);
    paramClientHandshakeBuilder.put("Sec-WebSocket-Key", Base64.encodeBytes(arrayOfByte));
    return paramClientHandshakeBuilder;
  }

  public HandshakeBuilder postProcessHandshakeResponseAsServer(ClientHandshake paramClientHandshake, ServerHandshakeBuilder paramServerHandshakeBuilder)
    throws InvalidHandshakeException
  {
    paramServerHandshakeBuilder.put("Upgrade", "websocket");
    paramServerHandshakeBuilder.put("Connection", paramClientHandshake.getFieldValue("Connection"));
    paramServerHandshakeBuilder.setHttpStatusMessage("Switching Protocols");
    String str = paramClientHandshake.getFieldValue("Sec-WebSocket-Key");
    if (str == null)
      throw new InvalidHandshakeException("missing Sec-WebSocket-Key");
    paramServerHandshakeBuilder.put("Sec-WebSocket-Accept", generateFinalKey(str));
    return paramServerHandshakeBuilder;
  }

  public void reset()
  {
    this.incompleteframe = null;
  }

  public List<Framedata> translateFrame(ByteBuffer paramByteBuffer)
    throws LimitExedeedException, InvalidDataException
  {
    Object localObject = new LinkedList();
    if (this.incompleteframe != null);
    try
    {
      paramByteBuffer.mark();
      int i = paramByteBuffer.remaining();
      int j = this.incompleteframe.remaining();
      if (j > i)
      {
        this.incompleteframe.put(paramByteBuffer.array(), paramByteBuffer.position(), i);
        paramByteBuffer.position(i + paramByteBuffer.position());
        return Collections.emptyList();
      }
      this.incompleteframe.put(paramByteBuffer.array(), paramByteBuffer.position(), j);
      paramByteBuffer.position(j + paramByteBuffer.position());
      ((List)localObject).add(translateSingleFrame((ByteBuffer)this.incompleteframe.duplicate().position(0)));
      this.incompleteframe = null;
      while (true)
        if (paramByteBuffer.hasRemaining())
        {
          paramByteBuffer.mark();
          try
          {
            ((List)localObject).add(translateSingleFrame(paramByteBuffer));
          }
          catch (IncompleteException localIncompleteException1)
          {
            paramByteBuffer.reset();
            this.incompleteframe = ByteBuffer.allocate(checkAlloc(localIncompleteException1.getPreferedSize()));
            this.incompleteframe.put(paramByteBuffer);
            return localObject;
          }
        }
    }
    catch (IncompleteException localIncompleteException2)
    {
      this.incompleteframe.limit();
      ByteBuffer localByteBuffer = ByteBuffer.allocate(checkAlloc(localIncompleteException2.getPreferedSize()));
      assert (localByteBuffer.limit() > this.incompleteframe.limit());
      this.incompleteframe.rewind();
      localByteBuffer.put(this.incompleteframe);
      this.incompleteframe = localByteBuffer;
      localObject = translateFrame(paramByteBuffer);
    }
    return localObject;
  }

  public Framedata translateSingleFrame(ByteBuffer paramByteBuffer)
    throws Draft_10.IncompleteException, InvalidDataException
  {
    int i = paramByteBuffer.remaining();
    int j = 2;
    if (i < j)
    {
      IncompleteException localIncompleteException1 = new IncompleteException(j);
      throw localIncompleteException1;
    }
    int k = paramByteBuffer.get();
    if (k >> 8 != 0);
    for (boolean bool = true; ; bool = false)
    {
      int m = (byte)((k & 0x7F) >> 4);
      if (m == 0)
        break;
      throw new InvalidFrameException("bad rsv " + m);
    }
    int n = paramByteBuffer.get();
    if ((n & 0xFFFFFF80) != 0);
    int i2;
    Framedata.Opcode localOpcode;
    for (int i1 = 1; ; i1 = 0)
    {
      i2 = (byte)(n & 0x7F);
      localOpcode = toOpcode((byte)(k & 0xF));
      if ((bool) || ((localOpcode != Framedata.Opcode.PING) && (localOpcode != Framedata.Opcode.PONG) && (localOpcode != Framedata.Opcode.CLOSING)))
        break;
      throw new InvalidFrameException("control frames may no be fragmented");
    }
    if ((i2 >= 0) && (i2 <= 125))
      if (i1 == 0)
        break label431;
    label431: for (int i4 = 4; ; i4 = 0)
    {
      int i5 = i2 + (j + i4);
      if (i >= i5)
        break label437;
      IncompleteException localIncompleteException3 = new IncompleteException(i5);
      throw localIncompleteException3;
      if ((localOpcode == Framedata.Opcode.PING) || (localOpcode == Framedata.Opcode.PONG) || (localOpcode == Framedata.Opcode.CLOSING))
        throw new InvalidFrameException("more than 125 octets");
      if (i2 == 126)
      {
        j += 2;
        if (i < j)
        {
          IncompleteException localIncompleteException4 = new IncompleteException(j);
          throw localIncompleteException4;
        }
        byte[] arrayOfByte3 = new byte[3];
        arrayOfByte3[1] = paramByteBuffer.get();
        arrayOfByte3[2] = paramByteBuffer.get();
        BigInteger localBigInteger2 = new BigInteger(arrayOfByte3);
        i2 = localBigInteger2.intValue();
        break;
      }
      j += 8;
      if (i < j)
      {
        IncompleteException localIncompleteException2 = new IncompleteException(j);
        throw localIncompleteException2;
      }
      byte[] arrayOfByte1 = new byte[8];
      for (int i3 = 0; i3 < 8; i3++)
        arrayOfByte1[i3] = paramByteBuffer.get();
      BigInteger localBigInteger1 = new BigInteger(arrayOfByte1);
      long l = localBigInteger1.longValue();
      if (l > 2147483647L)
        throw new LimitExedeedException("Payloadsize is to big...");
      i2 = (int)l;
      break;
    }
    label437: ByteBuffer localByteBuffer = ByteBuffer.allocate(checkAlloc(i2));
    if (i1 != 0)
    {
      byte[] arrayOfByte2 = new byte[4];
      paramByteBuffer.get(arrayOfByte2);
      for (int i6 = 0; i6 < i2; i6++)
        localByteBuffer.put((byte)(paramByteBuffer.get() ^ arrayOfByte2[(i6 % 4)]));
    }
    localByteBuffer.put(paramByteBuffer.array(), paramByteBuffer.position(), localByteBuffer.limit());
    paramByteBuffer.position(paramByteBuffer.position() + localByteBuffer.limit());
    Object localObject;
    if (localOpcode == Framedata.Opcode.CLOSING)
      localObject = new CloseFrameBuilder();
    while (true)
    {
      localByteBuffer.flip();
      ((FrameBuilder)localObject).setPayload(localByteBuffer);
      return localObject;
      localObject = new FramedataImpl1();
      ((FrameBuilder)localObject).setFin(bool);
      ((FrameBuilder)localObject).setOptcode(localOpcode);
    }
  }

  private class IncompleteException extends Throwable
  {
    private static final long serialVersionUID = 7330519489840500997L;
    private int preferedsize;

    public IncompleteException(int arg2)
    {
      int i;
      this.preferedsize = i;
    }

    public int getPreferedSize()
    {
      return this.preferedsize;
    }
  }
}