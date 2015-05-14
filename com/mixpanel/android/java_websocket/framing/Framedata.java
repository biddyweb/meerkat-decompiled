package com.mixpanel.android.java_websocket.framing;

import com.mixpanel.android.java_websocket.exceptions.InvalidFrameException;
import java.nio.ByteBuffer;

public abstract interface Framedata
{
  public abstract void append(Framedata paramFramedata)
    throws InvalidFrameException;

  public abstract Opcode getOpcode();

  public abstract ByteBuffer getPayloadData();

  public abstract boolean getTransfereMasked();

  public abstract boolean isFin();

  public static enum Opcode
  {
    static
    {
      BINARY = new Opcode("BINARY", 2);
      PING = new Opcode("PING", 3);
      PONG = new Opcode("PONG", 4);
      CLOSING = new Opcode("CLOSING", 5);
      Opcode[] arrayOfOpcode = new Opcode[6];
      arrayOfOpcode[0] = CONTINUOUS;
      arrayOfOpcode[1] = TEXT;
      arrayOfOpcode[2] = BINARY;
      arrayOfOpcode[3] = PING;
      arrayOfOpcode[4] = PONG;
      arrayOfOpcode[5] = CLOSING;
    }
  }
}