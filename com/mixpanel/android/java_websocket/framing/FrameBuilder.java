package com.mixpanel.android.java_websocket.framing;

import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import java.nio.ByteBuffer;

public abstract interface FrameBuilder extends Framedata
{
  public abstract void setFin(boolean paramBoolean);

  public abstract void setOptcode(Framedata.Opcode paramOpcode);

  public abstract void setPayload(ByteBuffer paramByteBuffer)
    throws InvalidDataException;

  public abstract void setTransferemasked(boolean paramBoolean);
}