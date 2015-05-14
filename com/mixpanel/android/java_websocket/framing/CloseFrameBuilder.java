package com.mixpanel.android.java_websocket.framing;

import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidFrameException;
import com.mixpanel.android.java_websocket.util.Charsetfunctions;
import java.nio.ByteBuffer;

public class CloseFrameBuilder extends FramedataImpl1
  implements CloseFrame
{
  static final ByteBuffer emptybytebuffer = ByteBuffer.allocate(0);
  private int code;
  private String reason;

  public CloseFrameBuilder()
  {
    super(Framedata.Opcode.CLOSING);
    setFin(true);
  }

  public CloseFrameBuilder(int paramInt)
    throws InvalidDataException
  {
    super(Framedata.Opcode.CLOSING);
    setFin(true);
    setCodeAndMessage(paramInt, "");
  }

  public CloseFrameBuilder(int paramInt, String paramString)
    throws InvalidDataException
  {
    super(Framedata.Opcode.CLOSING);
    setFin(true);
    setCodeAndMessage(paramInt, paramString);
  }

  private void initCloseCode()
    throws InvalidFrameException
  {
    this.code = 1005;
    ByteBuffer localByteBuffer1 = super.getPayloadData();
    localByteBuffer1.mark();
    if (localByteBuffer1.remaining() >= 2)
    {
      ByteBuffer localByteBuffer2 = ByteBuffer.allocate(4);
      localByteBuffer2.position(2);
      localByteBuffer2.putShort(localByteBuffer1.getShort());
      localByteBuffer2.position(0);
      this.code = localByteBuffer2.getInt();
      if ((this.code == 1006) || (this.code == 1015) || (this.code == 1005) || (this.code > 4999) || (this.code < 1000) || (this.code == 1004))
        throw new InvalidFrameException("closecode must not be sent over the wire: " + this.code);
    }
    localByteBuffer1.reset();
  }

  private void initMessage()
    throws InvalidDataException
  {
    if (this.code == 1005)
    {
      this.reason = Charsetfunctions.stringUtf8(super.getPayloadData());
      return;
    }
    ByteBuffer localByteBuffer = super.getPayloadData();
    int i = localByteBuffer.position();
    try
    {
      localByteBuffer.position(2 + localByteBuffer.position());
      this.reason = Charsetfunctions.stringUtf8(localByteBuffer);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new InvalidFrameException(localIllegalArgumentException);
    }
    finally
    {
      localByteBuffer.position(i);
    }
  }

  private void setCodeAndMessage(int paramInt, String paramString)
    throws InvalidDataException
  {
    if (paramString == null)
      paramString = "";
    if (paramInt == 1015)
    {
      paramInt = 1005;
      paramString = "";
    }
    if (paramInt == 1005)
    {
      if (paramString.length() > 0)
        throw new InvalidDataException(1002, "A close frame must have a closecode if it has a reason");
    }
    else
    {
      byte[] arrayOfByte = Charsetfunctions.utf8Bytes(paramString);
      ByteBuffer localByteBuffer1 = ByteBuffer.allocate(4);
      localByteBuffer1.putInt(paramInt);
      localByteBuffer1.position(2);
      ByteBuffer localByteBuffer2 = ByteBuffer.allocate(2 + arrayOfByte.length);
      localByteBuffer2.put(localByteBuffer1);
      localByteBuffer2.put(arrayOfByte);
      localByteBuffer2.rewind();
      setPayload(localByteBuffer2);
    }
  }

  public int getCloseCode()
  {
    return this.code;
  }

  public String getMessage()
  {
    return this.reason;
  }

  public ByteBuffer getPayloadData()
  {
    if (this.code == 1005)
      return emptybytebuffer;
    return super.getPayloadData();
  }

  public void setPayload(ByteBuffer paramByteBuffer)
    throws InvalidDataException
  {
    super.setPayload(paramByteBuffer);
    initCloseCode();
    initMessage();
  }

  public String toString()
  {
    return super.toString() + "code: " + this.code;
  }
}