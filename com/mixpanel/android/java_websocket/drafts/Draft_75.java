package com.mixpanel.android.java_websocket.drafts;

import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidFrameException;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.LimitExedeedException;
import com.mixpanel.android.java_websocket.exceptions.NotSendableException;
import com.mixpanel.android.java_websocket.framing.FrameBuilder;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.framing.FramedataImpl1;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.HandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.ServerHandshake;
import com.mixpanel.android.java_websocket.handshake.ServerHandshakeBuilder;
import com.mixpanel.android.java_websocket.util.Charsetfunctions;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

public class Draft_75 extends Draft
{
  public static final byte CR = 13;
  public static final byte END_OF_FRAME = -1;
  public static final byte LF = 10;
  public static final byte START_OF_FRAME;
  protected ByteBuffer currentFrame;
  protected boolean readingState = false;
  protected List<Framedata> readyframes = new LinkedList();
  private final Random reuseableRandom = new Random();

  public Draft.HandshakeState acceptHandshakeAsClient(ClientHandshake paramClientHandshake, ServerHandshake paramServerHandshake)
  {
    if ((paramClientHandshake.getFieldValue("WebSocket-Origin").equals(paramServerHandshake.getFieldValue("Origin"))) && (basicAccept(paramServerHandshake)))
      return Draft.HandshakeState.MATCHED;
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft.HandshakeState acceptHandshakeAsServer(ClientHandshake paramClientHandshake)
  {
    if ((paramClientHandshake.hasFieldValue("Origin")) && (basicAccept(paramClientHandshake)))
      return Draft.HandshakeState.MATCHED;
    return Draft.HandshakeState.NOT_MATCHED;
  }

  public Draft copyInstance()
  {
    return new Draft_75();
  }

  public ByteBuffer createBinaryFrame(Framedata paramFramedata)
  {
    if (paramFramedata.getOpcode() != Framedata.Opcode.TEXT)
      throw new RuntimeException("only text frames supported");
    ByteBuffer localByteBuffer1 = paramFramedata.getPayloadData();
    ByteBuffer localByteBuffer2 = ByteBuffer.allocate(2 + localByteBuffer1.remaining());
    localByteBuffer2.put((byte)0);
    localByteBuffer1.mark();
    localByteBuffer2.put(localByteBuffer1);
    localByteBuffer1.reset();
    localByteBuffer2.put((byte)-1);
    localByteBuffer2.flip();
    return localByteBuffer2;
  }

  public ByteBuffer createBuffer()
  {
    return ByteBuffer.allocate(INITIAL_FAMESIZE);
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
    throw new RuntimeException("not yet implemented");
  }

  public Draft.CloseHandshakeType getCloseHandshakeType()
  {
    return Draft.CloseHandshakeType.NONE;
  }

  public ByteBuffer increaseBuffer(ByteBuffer paramByteBuffer)
    throws LimitExedeedException, InvalidDataException
  {
    paramByteBuffer.flip();
    ByteBuffer localByteBuffer = ByteBuffer.allocate(checkAlloc(2 * paramByteBuffer.capacity()));
    localByteBuffer.put(paramByteBuffer);
    return localByteBuffer;
  }

  public ClientHandshakeBuilder postProcessHandshakeRequestAsClient(ClientHandshakeBuilder paramClientHandshakeBuilder)
    throws InvalidHandshakeException
  {
    paramClientHandshakeBuilder.put("Upgrade", "WebSocket");
    paramClientHandshakeBuilder.put("Connection", "Upgrade");
    if (!paramClientHandshakeBuilder.hasFieldValue("Origin"))
      paramClientHandshakeBuilder.put("Origin", "random" + this.reuseableRandom.nextInt());
    return paramClientHandshakeBuilder;
  }

  public HandshakeBuilder postProcessHandshakeResponseAsServer(ClientHandshake paramClientHandshake, ServerHandshakeBuilder paramServerHandshakeBuilder)
    throws InvalidHandshakeException
  {
    paramServerHandshakeBuilder.setHttpStatusMessage("Web Socket Protocol Handshake");
    paramServerHandshakeBuilder.put("Upgrade", "WebSocket");
    paramServerHandshakeBuilder.put("Connection", paramClientHandshake.getFieldValue("Connection"));
    paramServerHandshakeBuilder.put("WebSocket-Origin", paramClientHandshake.getFieldValue("Origin"));
    paramServerHandshakeBuilder.put("WebSocket-Location", "ws://" + paramClientHandshake.getFieldValue("Host") + paramClientHandshake.getResourceDescriptor());
    return paramServerHandshakeBuilder;
  }

  public void reset()
  {
    this.readingState = false;
    this.currentFrame = null;
  }

  public List<Framedata> translateFrame(ByteBuffer paramByteBuffer)
    throws InvalidDataException
  {
    List localList = translateRegularFrame(paramByteBuffer);
    if (localList == null)
      throw new InvalidDataException(1002);
    return localList;
  }

  protected List<Framedata> translateRegularFrame(ByteBuffer paramByteBuffer)
    throws InvalidDataException
  {
    while (paramByteBuffer.hasRemaining())
    {
      byte b = paramByteBuffer.get();
      if (b == 0)
      {
        if (this.readingState)
          throw new InvalidFrameException("unexpected START_OF_FRAME");
        this.readingState = true;
      }
      else if (b == -1)
      {
        if (!this.readingState)
          throw new InvalidFrameException("unexpected END_OF_FRAME");
        if (this.currentFrame != null)
        {
          this.currentFrame.flip();
          FramedataImpl1 localFramedataImpl1 = new FramedataImpl1();
          localFramedataImpl1.setPayload(this.currentFrame);
          localFramedataImpl1.setFin(true);
          localFramedataImpl1.setOptcode(Framedata.Opcode.TEXT);
          this.readyframes.add(localFramedataImpl1);
          this.currentFrame = null;
          paramByteBuffer.mark();
        }
        this.readingState = false;
      }
      else
      {
        boolean bool = this.readingState;
        localList = null;
        if (!bool)
          break label223;
        if (this.currentFrame == null)
          this.currentFrame = createBuffer();
        while (true)
        {
          this.currentFrame.put(b);
          break;
          if (!this.currentFrame.hasRemaining())
            this.currentFrame = increaseBuffer(this.currentFrame);
        }
      }
    }
    List localList = this.readyframes;
    this.readyframes = new LinkedList();
    label223: return localList;
  }
}