package com.mixpanel.android.java_websocket;

import com.mixpanel.android.java_websocket.drafts.Draft;
import com.mixpanel.android.java_websocket.drafts.Draft.CloseHandshakeType;
import com.mixpanel.android.java_websocket.drafts.Draft.HandshakeState;
import com.mixpanel.android.java_websocket.drafts.Draft_10;
import com.mixpanel.android.java_websocket.drafts.Draft_17;
import com.mixpanel.android.java_websocket.drafts.Draft_75;
import com.mixpanel.android.java_websocket.drafts.Draft_76;
import com.mixpanel.android.java_websocket.exceptions.IncompleteHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.exceptions.WebsocketNotConnectedException;
import com.mixpanel.android.java_websocket.framing.CloseFrame;
import com.mixpanel.android.java_websocket.framing.CloseFrameBuilder;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.ClientHandshakeBuilder;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.server.WebSocketServer.WebSocketWorker;
import com.mixpanel.android.java_websocket.util.Charsetfunctions;
import java.io.PrintStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.channels.SelectionKey;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

public class WebSocketImpl
  implements WebSocket
{
  public static boolean DEBUG;
  public static int RCVBUF;
  public static final List<Draft> defaultdraftlist;
  public ByteChannel channel;
  private Integer closecode = null;
  private Boolean closedremotely = null;
  private String closemessage = null;
  private Framedata.Opcode current_continuous_frame_opcode = null;
  private Draft draft = null;
  private volatile boolean flushandclosestate = false;
  private ClientHandshake handshakerequest = null;
  public final BlockingQueue<ByteBuffer> inQueue;
  public SelectionKey key;
  private List<Draft> knownDrafts;
  public final BlockingQueue<ByteBuffer> outQueue;
  private WebSocket.READYSTATE readystate = WebSocket.READYSTATE.NOT_YET_CONNECTED;
  private String resourceDescriptor = null;
  private WebSocket.Role role;
  private ByteBuffer tmpHandshakeBytes = ByteBuffer.allocate(0);
  public volatile WebSocketServer.WebSocketWorker workerThread;
  private final WebSocketListener wsl;

  static
  {
    if (!WebSocketImpl.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      RCVBUF = 16384;
      DEBUG = false;
      defaultdraftlist = new ArrayList(4);
      defaultdraftlist.add(new Draft_17());
      defaultdraftlist.add(new Draft_10());
      defaultdraftlist.add(new Draft_76());
      defaultdraftlist.add(new Draft_75());
      return;
    }
  }

  public WebSocketImpl(WebSocketListener paramWebSocketListener, Draft paramDraft)
  {
    if ((paramWebSocketListener == null) || ((paramDraft == null) && (this.role == WebSocket.Role.SERVER)))
      throw new IllegalArgumentException("parameters must not be null");
    this.outQueue = new LinkedBlockingQueue();
    this.inQueue = new LinkedBlockingQueue();
    this.wsl = paramWebSocketListener;
    this.role = WebSocket.Role.CLIENT;
    if (paramDraft != null)
      this.draft = paramDraft.copyInstance();
  }

  @Deprecated
  public WebSocketImpl(WebSocketListener paramWebSocketListener, Draft paramDraft, Socket paramSocket)
  {
    this(paramWebSocketListener, paramDraft);
  }

  public WebSocketImpl(WebSocketListener paramWebSocketListener, List<Draft> paramList)
  {
    this(paramWebSocketListener, (Draft)null);
    this.role = WebSocket.Role.SERVER;
    if ((paramList == null) || (paramList.isEmpty()))
    {
      this.knownDrafts = defaultdraftlist;
      return;
    }
    this.knownDrafts = paramList;
  }

  @Deprecated
  public WebSocketImpl(WebSocketListener paramWebSocketListener, List<Draft> paramList, Socket paramSocket)
  {
    this(paramWebSocketListener, paramList);
  }

  private void close(int paramInt, String paramString, boolean paramBoolean)
  {
    if ((this.readystate != WebSocket.READYSTATE.CLOSING) && (this.readystate != WebSocket.READYSTATE.CLOSED))
    {
      if (this.readystate != WebSocket.READYSTATE.OPEN)
        break label190;
      if (paramInt == 1006)
      {
        assert (!paramBoolean);
        this.readystate = WebSocket.READYSTATE.CLOSING;
        flushAndClose(paramInt, paramString, false);
      }
    }
    else
    {
      return;
    }
    if ((this.draft.getCloseHandshakeType() == Draft.CloseHandshakeType.NONE) || (!paramBoolean));
    while (true)
    {
      try
      {
        this.wsl.onWebsocketCloseInitiated(this, paramInt, paramString);
        sendFrame(new CloseFrameBuilder(paramInt, paramString));
        flushAndClose(paramInt, paramString, paramBoolean);
        if (paramInt == 1002)
          flushAndClose(paramInt, paramString, paramBoolean);
        this.readystate = WebSocket.READYSTATE.CLOSING;
        this.tmpHandshakeBytes = null;
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        this.wsl.onWebsocketError(this, localRuntimeException);
        continue;
      }
      catch (InvalidDataException localInvalidDataException)
      {
        this.wsl.onWebsocketError(this, localInvalidDataException);
        flushAndClose(1006, "generated frame is invalid", false);
        continue;
      }
      label190: if (paramInt == -3)
      {
        assert (paramBoolean);
        flushAndClose(-3, paramString, true);
      }
      else
      {
        flushAndClose(-1, paramString, false);
      }
    }
  }

  private void decodeFrames(ByteBuffer paramByteBuffer)
  {
    while (true)
    {
      Framedata localFramedata;
      Framedata.Opcode localOpcode1;
      boolean bool;
      int i;
      String str;
      try
      {
        Iterator localIterator = this.draft.translateFrame(paramByteBuffer).iterator();
        if (localIterator.hasNext())
        {
          localFramedata = (Framedata)localIterator.next();
          if (DEBUG)
            System.out.println("matched frame: " + localFramedata);
          localOpcode1 = localFramedata.getOpcode();
          bool = localFramedata.isFin();
          if (localOpcode1 != Framedata.Opcode.CLOSING)
            break label212;
          i = 1005;
          str = "";
          if ((localFramedata instanceof CloseFrame))
          {
            CloseFrame localCloseFrame = (CloseFrame)localFramedata;
            i = localCloseFrame.getCloseCode();
            str = localCloseFrame.getMessage();
          }
          if (this.readystate != WebSocket.READYSTATE.CLOSING)
            break label175;
          closeConnection(i, str, true);
          continue;
        }
      }
      catch (InvalidDataException localInvalidDataException)
      {
        this.wsl.onWebsocketError(this, localInvalidDataException);
        close(localInvalidDataException);
      }
      return;
      label175: if (this.draft.getCloseHandshakeType() == Draft.CloseHandshakeType.TWOWAY)
      {
        close(i, str, true);
      }
      else
      {
        flushAndClose(i, str, false);
        continue;
        label212: if (localOpcode1 == Framedata.Opcode.PING)
        {
          this.wsl.onWebsocketPing(this, localFramedata);
        }
        else if (localOpcode1 == Framedata.Opcode.PONG)
        {
          this.wsl.onWebsocketPong(this, localFramedata);
        }
        else
        {
          if ((!bool) || (localOpcode1 == Framedata.Opcode.CONTINUOUS))
          {
            if (localOpcode1 != Framedata.Opcode.CONTINUOUS)
            {
              if (this.current_continuous_frame_opcode != null)
                throw new InvalidDataException(1002, "Previous continuous frame sequence not completed.");
              this.current_continuous_frame_opcode = localOpcode1;
            }
            label372: 
            do
              while (true)
              {
                try
                {
                  this.wsl.onWebsocketMessageFragment(this, localFramedata);
                }
                catch (RuntimeException localRuntimeException1)
                {
                  this.wsl.onWebsocketError(this, localRuntimeException1);
                }
                break;
                if (!bool)
                  break label372;
                if (this.current_continuous_frame_opcode == null)
                  throw new InvalidDataException(1002, "Continuous frame sequence was not started.");
                this.current_continuous_frame_opcode = null;
              }
            while (this.current_continuous_frame_opcode != null);
            throw new InvalidDataException(1002, "Continuous frame sequence was not started.");
          }
          if (this.current_continuous_frame_opcode != null)
            throw new InvalidDataException(1002, "Continuous frame sequence not completed.");
          Framedata.Opcode localOpcode2 = Framedata.Opcode.TEXT;
          if (localOpcode1 == localOpcode2)
          {
            try
            {
              this.wsl.onWebsocketMessage(this, Charsetfunctions.stringUtf8(localFramedata.getPayloadData()));
            }
            catch (RuntimeException localRuntimeException3)
            {
              this.wsl.onWebsocketError(this, localRuntimeException3);
            }
          }
          else
          {
            Framedata.Opcode localOpcode3 = Framedata.Opcode.BINARY;
            if (localOpcode1 != localOpcode3)
              break;
            try
            {
              this.wsl.onWebsocketMessage(this, localFramedata.getPayloadData());
            }
            catch (RuntimeException localRuntimeException2)
            {
              this.wsl.onWebsocketError(this, localRuntimeException2);
            }
          }
        }
      }
    }
    throw new InvalidDataException(1002, "non control or continious frame expected");
  }

  // ERROR //
  private boolean decodeHandshake(ByteBuffer paramByteBuffer)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   4: invokevirtual 359\011java/nio/ByteBuffer:capacity\011()I
    //   7: ifne +70 -> 77
    //   10: aload_1
    //   11: astore 4
    //   13: aload 4
    //   15: invokevirtual 363\011java/nio/ByteBuffer:mark\011()Ljava/nio/Buffer;
    //   18: pop
    //   19: aload_0
    //   20: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   23: ifnonnull +211 -> 234
    //   26: aload_0
    //   27: aload 4
    //   29: invokespecial 367\011com/mixpanel/android/java_websocket/WebSocketImpl:isFlashEdgeCase\011(Ljava/nio/ByteBuffer;)Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   32: astore 30
    //   34: getstatic 373\011com/mixpanel/android/java_websocket/drafts/Draft$HandshakeState:MATCHED\011Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   37: astore 31
    //   39: aload 30
    //   41: aload 31
    //   43: if_acmpne +191 -> 234
    //   46: aload_0
    //   47: aload_0
    //   48: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   51: aload_0
    //   52: invokeinterface 377 2 0
    //   57: invokestatic 381\011com/mixpanel/android/java_websocket/util/Charsetfunctions:utf8Bytes\011(Ljava/lang/String;)[B
    //   60: invokestatic 385\011java/nio/ByteBuffer:wrap\011([B)Ljava/nio/ByteBuffer;
    //   63: invokespecial 388\011com/mixpanel/android/java_websocket/WebSocketImpl:write\011(Ljava/nio/ByteBuffer;)V
    //   66: aload_0
    //   67: bipush 253
    //   69: ldc_w 279
    //   72: invokevirtual 390\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(ILjava/lang/String;)V
    //   75: iconst_0
    //   76: ireturn
    //   77: aload_0
    //   78: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   81: invokevirtual 393\011java/nio/ByteBuffer:remaining\011()I
    //   84: aload_1
    //   85: invokevirtual 393\011java/nio/ByteBuffer:remaining\011()I
    //   88: if_icmpge +44 -> 132
    //   91: aload_0
    //   92: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   95: invokevirtual 359\011java/nio/ByteBuffer:capacity\011()I
    //   98: aload_1
    //   99: invokevirtual 393\011java/nio/ByteBuffer:remaining\011()I
    //   102: iadd
    //   103: invokestatic 109\011java/nio/ByteBuffer:allocate\011(I)Ljava/nio/ByteBuffer;
    //   106: astore 33
    //   108: aload_0
    //   109: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   112: invokevirtual 396\011java/nio/ByteBuffer:flip\011()Ljava/nio/Buffer;
    //   115: pop
    //   116: aload 33
    //   118: aload_0
    //   119: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   122: invokevirtual 400\011java/nio/ByteBuffer:put\011(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    //   125: pop
    //   126: aload_0
    //   127: aload 33
    //   129: putfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   132: aload_0
    //   133: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   136: aload_1
    //   137: invokevirtual 400\011java/nio/ByteBuffer:put\011(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    //   140: pop
    //   141: aload_0
    //   142: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   145: invokevirtual 396\011java/nio/ByteBuffer:flip\011()Ljava/nio/Buffer;
    //   148: pop
    //   149: aload_0
    //   150: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   153: astore 4
    //   155: goto -142 -> 13
    //   158: astore 32
    //   160: aload_0
    //   161: sipush 1006
    //   164: ldc_w 402
    //   167: iconst_1
    //   168: invokespecial 299\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(ILjava/lang/String;Z)V
    //   171: goto -96 -> 75
    //   174: astore 6
    //   176: aload_0
    //   177: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   180: invokevirtual 359\011java/nio/ByteBuffer:capacity\011()I
    //   183: ifne +606 -> 789
    //   186: aload 4
    //   188: invokevirtual 405\011java/nio/ByteBuffer:reset\011()Ljava/nio/Buffer;
    //   191: pop
    //   192: aload 6
    //   194: invokevirtual 408\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException:getPreferedSize\011()I
    //   197: istore 10
    //   199: iload 10
    //   201: ifne +561 -> 762
    //   204: bipush 16
    //   206: aload 4
    //   208: invokevirtual 359\011java/nio/ByteBuffer:capacity\011()I
    //   211: iadd
    //   212: istore 10
    //   214: aload_0
    //   215: iload 10
    //   217: invokestatic 109\011java/nio/ByteBuffer:allocate\011(I)Ljava/nio/ByteBuffer;
    //   220: putfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   223: aload_0
    //   224: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   227: aload_1
    //   228: invokevirtual 400\011java/nio/ByteBuffer:put\011(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    //   231: pop
    //   232: iconst_0
    //   233: ireturn
    //   234: aload_0
    //   235: getfield 123\011com/mixpanel/android/java_websocket/WebSocketImpl:role\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   238: getstatic 128\011com/mixpanel/android/java_websocket/WebSocket$Role:SERVER\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   241: if_acmpne +314 -> 555
    //   244: aload_0
    //   245: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   248: ifnonnull +233 -> 481
    //   251: aload_0
    //   252: getfield 163\011com/mixpanel/android/java_websocket/WebSocketImpl:knownDrafts\011Ljava/util/List;
    //   255: invokeinterface 228 1 0
    //   260: astore 21
    //   262: aload 21
    //   264: invokeinterface 233 1 0
    //   269: ifeq +192 -> 461
    //   272: aload 21
    //   274: invokeinterface 237 1 0
    //   279: checkcast 149\011com/mixpanel/android/java_websocket/drafts/Draft
    //   282: invokevirtual 153\011com/mixpanel/android/java_websocket/drafts/Draft:copyInstance\011()Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   285: astore 22
    //   287: aload 22
    //   289: aload_0
    //   290: getfield 123\011com/mixpanel/android/java_websocket/WebSocketImpl:role\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   293: invokevirtual 412\011com/mixpanel/android/java_websocket/drafts/Draft:setParseMode\011(Lcom/mixpanel/android/java_websocket/WebSocket$Role;)V
    //   296: aload 4
    //   298: invokevirtual 405\011java/nio/ByteBuffer:reset\011()Ljava/nio/Buffer;
    //   301: pop
    //   302: aload 22
    //   304: aload 4
    //   306: invokevirtual 416\011com/mixpanel/android/java_websocket/drafts/Draft:translateHandshake\011(Ljava/nio/ByteBuffer;)Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;
    //   309: astore 25
    //   311: aload 25
    //   313: instanceof 418
    //   316: ifne +16 -> 332
    //   319: aload_0
    //   320: sipush 1002
    //   323: ldc_w 420
    //   326: iconst_0
    //   327: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   330: iconst_0
    //   331: ireturn
    //   332: aload 25
    //   334: checkcast 418\011com/mixpanel/android/java_websocket/handshake/ClientHandshake
    //   337: astore 26
    //   339: aload 22
    //   341: aload 26
    //   343: invokevirtual 424\011com/mixpanel/android/java_websocket/drafts/Draft:acceptHandshakeAsServer\011(Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;)Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   346: getstatic 373\011com/mixpanel/android/java_websocket/drafts/Draft$HandshakeState:MATCHED\011Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   349: if_acmpne -87 -> 262
    //   352: aload_0
    //   353: aload 26
    //   355: invokeinterface 427 1 0
    //   360: putfield 121\011com/mixpanel/android/java_websocket/WebSocketImpl:resourceDescriptor\011Ljava/lang/String;
    //   363: aload_0
    //   364: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   367: aload_0
    //   368: aload 22
    //   370: aload 26
    //   372: invokeinterface 431 4 0
    //   377: astore 29
    //   379: aload_0
    //   380: aload 22
    //   382: aload 22
    //   384: aload 26
    //   386: aload 29
    //   388: invokevirtual 435\011com/mixpanel/android/java_websocket/drafts/Draft:postProcessHandshakeResponseAsServer\011(Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;Lcom/mixpanel/android/java_websocket/handshake/ServerHandshakeBuilder;)Lcom/mixpanel/android/java_websocket/handshake/HandshakeBuilder;
    //   391: aload_0
    //   392: getfield 123\011com/mixpanel/android/java_websocket/WebSocketImpl:role\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   395: invokevirtual 439\011com/mixpanel/android/java_websocket/drafts/Draft:createHandshake\011(Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;Lcom/mixpanel/android/java_websocket/WebSocket$Role;)Ljava/util/List;
    //   398: invokespecial 442\011com/mixpanel/android/java_websocket/WebSocketImpl:write\011(Ljava/util/List;)V
    //   401: aload_0
    //   402: aload 22
    //   404: putfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   407: aload_0
    //   408: aload 26
    //   410: invokespecial 446\011com/mixpanel/android/java_websocket/WebSocketImpl:open\011(Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;)V
    //   413: iconst_1
    //   414: ireturn
    //   415: astore 28
    //   417: aload_0
    //   418: aload 28
    //   420: invokevirtual 447\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException:getCloseCode\011()I
    //   423: aload 28
    //   425: invokevirtual 448\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException:getMessage\011()Ljava/lang/String;
    //   428: iconst_0
    //   429: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   432: iconst_0
    //   433: ireturn
    //   434: astore 27
    //   436: aload_0
    //   437: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   440: aload_0
    //   441: aload 27
    //   443: invokeinterface 216 3 0
    //   448: aload_0
    //   449: iconst_m1
    //   450: aload 27
    //   452: invokevirtual 449\011java/lang/RuntimeException:getMessage\011()Ljava/lang/String;
    //   455: iconst_0
    //   456: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   459: iconst_0
    //   460: ireturn
    //   461: aload_0
    //   462: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   465: ifnonnull +362 -> 827
    //   468: aload_0
    //   469: sipush 1002
    //   472: ldc_w 451
    //   475: invokevirtual 390\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(ILjava/lang/String;)V
    //   478: goto +349 -> 827
    //   481: aload_0
    //   482: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   485: aload 4
    //   487: invokevirtual 416\011com/mixpanel/android/java_websocket/drafts/Draft:translateHandshake\011(Ljava/nio/ByteBuffer;)Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;
    //   490: astore 19
    //   492: aload 19
    //   494: instanceof 418
    //   497: ifne +16 -> 513
    //   500: aload_0
    //   501: sipush 1002
    //   504: ldc_w 420
    //   507: iconst_0
    //   508: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   511: iconst_0
    //   512: ireturn
    //   513: aload 19
    //   515: checkcast 418\011com/mixpanel/android/java_websocket/handshake/ClientHandshake
    //   518: astore 20
    //   520: aload_0
    //   521: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   524: aload 20
    //   526: invokevirtual 424\011com/mixpanel/android/java_websocket/drafts/Draft:acceptHandshakeAsServer\011(Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;)Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   529: getstatic 373\011com/mixpanel/android/java_websocket/drafts/Draft$HandshakeState:MATCHED\011Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   532: if_acmpne +11 -> 543
    //   535: aload_0
    //   536: aload 20
    //   538: invokespecial 446\011com/mixpanel/android/java_websocket/WebSocketImpl:open\011(Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;)V
    //   541: iconst_1
    //   542: ireturn
    //   543: aload_0
    //   544: sipush 1002
    //   547: ldc_w 453
    //   550: invokevirtual 390\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(ILjava/lang/String;)V
    //   553: iconst_0
    //   554: ireturn
    //   555: aload_0
    //   556: getfield 123\011com/mixpanel/android/java_websocket/WebSocketImpl:role\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   559: getstatic 147\011com/mixpanel/android/java_websocket/WebSocket$Role:CLIENT\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   562: if_acmpne -330 -> 232
    //   565: aload_0
    //   566: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   569: aload_0
    //   570: getfield 123\011com/mixpanel/android/java_websocket/WebSocketImpl:role\011Lcom/mixpanel/android/java_websocket/WebSocket$Role;
    //   573: invokevirtual 412\011com/mixpanel/android/java_websocket/drafts/Draft:setParseMode\011(Lcom/mixpanel/android/java_websocket/WebSocket$Role;)V
    //   576: aload_0
    //   577: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   580: aload 4
    //   582: invokevirtual 416\011com/mixpanel/android/java_websocket/drafts/Draft:translateHandshake\011(Ljava/nio/ByteBuffer;)Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;
    //   585: astore 13
    //   587: aload 13
    //   589: instanceof 455
    //   592: ifne +16 -> 608
    //   595: aload_0
    //   596: sipush 1002
    //   599: ldc_w 420
    //   602: iconst_0
    //   603: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   606: iconst_0
    //   607: ireturn
    //   608: aload 13
    //   610: checkcast 455\011com/mixpanel/android/java_websocket/handshake/ServerHandshake
    //   613: astore 14
    //   615: aload_0
    //   616: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   619: aload_0
    //   620: getfield 113\011com/mixpanel/android/java_websocket/WebSocketImpl:handshakerequest\011Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;
    //   623: aload 14
    //   625: invokevirtual 459\011com/mixpanel/android/java_websocket/drafts/Draft:acceptHandshakeAsClient\011(Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;Lcom/mixpanel/android/java_websocket/handshake/ServerHandshake;)Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   628: astore 15
    //   630: getstatic 373\011com/mixpanel/android/java_websocket/drafts/Draft$HandshakeState:MATCHED\011Lcom/mixpanel/android/java_websocket/drafts/Draft$HandshakeState;
    //   633: astore 16
    //   635: aload 15
    //   637: aload 16
    //   639: if_acmpne +73 -> 712
    //   642: aload_0
    //   643: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   646: aload_0
    //   647: aload_0
    //   648: getfield 113\011com/mixpanel/android/java_websocket/WebSocketImpl:handshakerequest\011Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;
    //   651: aload 14
    //   653: invokeinterface 463 4 0
    //   658: aload_0
    //   659: aload 14
    //   661: invokespecial 446\011com/mixpanel/android/java_websocket/WebSocketImpl:open\011(Lcom/mixpanel/android/java_websocket/handshake/Handshakedata;)V
    //   664: iconst_1
    //   665: ireturn
    //   666: astore 18
    //   668: aload_0
    //   669: aload 18
    //   671: invokevirtual 447\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException:getCloseCode\011()I
    //   674: aload 18
    //   676: invokevirtual 448\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException:getMessage\011()Ljava/lang/String;
    //   679: iconst_0
    //   680: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   683: iconst_0
    //   684: ireturn
    //   685: astore 17
    //   687: aload_0
    //   688: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   691: aload_0
    //   692: aload 17
    //   694: invokeinterface 216 3 0
    //   699: aload_0
    //   700: iconst_m1
    //   701: aload 17
    //   703: invokevirtual 449\011java/lang/RuntimeException:getMessage\011()Ljava/lang/String;
    //   706: iconst_0
    //   707: invokevirtual 187\011com/mixpanel/android/java_websocket/WebSocketImpl:flushAndClose\011(ILjava/lang/String;Z)V
    //   710: iconst_0
    //   711: ireturn
    //   712: aload_0
    //   713: sipush 1002
    //   716: new 247\011java/lang/StringBuilder
    //   719: dup
    //   720: invokespecial 248\011java/lang/StringBuilder:<init>\011()V
    //   723: ldc_w 465
    //   726: invokevirtual 254\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   729: aload_0
    //   730: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   733: invokevirtual 257\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   736: ldc_w 467
    //   739: invokevirtual 254\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   742: invokevirtual 261\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   745: invokevirtual 390\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(ILjava/lang/String;)V
    //   748: goto -516 -> 232
    //   751: astore 12
    //   753: aload_0
    //   754: aload 12
    //   756: invokevirtual 294\011com/mixpanel/android/java_websocket/WebSocketImpl:close\011(Lcom/mixpanel/android/java_websocket/exceptions/InvalidDataException;)V
    //   759: goto -527 -> 232
    //   762: getstatic 57\011com/mixpanel/android/java_websocket/WebSocketImpl:$assertionsDisabled\011Z
    //   765: ifne -551 -> 214
    //   768: aload 6
    //   770: invokevirtual 408\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException:getPreferedSize\011()I
    //   773: aload 4
    //   775: invokevirtual 393\011java/nio/ByteBuffer:remaining\011()I
    //   778: if_icmpge -564 -> 214
    //   781: new 183\011java/lang/AssertionError
    //   784: dup
    //   785: invokespecial 184\011java/lang/AssertionError:<init>\011()V
    //   788: athrow
    //   789: aload_0
    //   790: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   793: aload_0
    //   794: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   797: invokevirtual 470\011java/nio/ByteBuffer:limit\011()I
    //   800: invokevirtual 474\011java/nio/ByteBuffer:position\011(I)Ljava/nio/Buffer;
    //   803: pop
    //   804: aload_0
    //   805: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   808: aload_0
    //   809: getfield 111\011com/mixpanel/android/java_websocket/WebSocketImpl:tmpHandshakeBytes\011Ljava/nio/ByteBuffer;
    //   812: invokevirtual 359\011java/nio/ByteBuffer:capacity\011()I
    //   815: invokevirtual 476\011java/nio/ByteBuffer:limit\011(I)Ljava/nio/Buffer;
    //   818: pop
    //   819: goto -587 -> 232
    //   822: astore 23
    //   824: goto -562 -> 262
    //   827: iconst_0
    //   828: ireturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   46\01175\011158\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException
    //   19\01139\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   46\01175\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   160\011171\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   234\011262\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   262\011287\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   287\011330\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   332\011363\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   363\011379\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   379\011413\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   417\011432\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   436\011459\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   461\011478\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   481\011511\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   513\011541\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   543\011553\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   555\011606\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   608\011635\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   642\011658\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   658\011664\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   668\011683\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   687\011710\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   712\011748\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   753\011759\011174\011com/mixpanel/android/java_websocket/exceptions/IncompleteHandshakeException
    //   363\011379\011415\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException
    //   363\011379\011434\011java/lang/RuntimeException
    //   642\011658\011666\011com/mixpanel/android/java_websocket/exceptions/InvalidDataException
    //   642\011658\011685\011java/lang/RuntimeException
    //   234\011262\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   262\011287\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   461\011478\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   481\011511\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   513\011541\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   543\011553\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   555\011606\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   608\011635\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   642\011658\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   658\011664\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   668\011683\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   687\011710\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   712\011748\011751\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   287\011330\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   332\011363\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   363\011379\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   379\011413\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   417\011432\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
    //   436\011459\011822\011com/mixpanel/android/java_websocket/exceptions/InvalidHandshakeException
  }

  private Draft.HandshakeState isFlashEdgeCase(ByteBuffer paramByteBuffer)
    throws IncompleteHandshakeException
  {
    paramByteBuffer.mark();
    if (paramByteBuffer.limit() > Draft.FLASH_POLICY_REQUEST.length)
      return Draft.HandshakeState.NOT_MATCHED;
    if (paramByteBuffer.limit() < Draft.FLASH_POLICY_REQUEST.length)
      throw new IncompleteHandshakeException(Draft.FLASH_POLICY_REQUEST.length);
    for (int i = 0; paramByteBuffer.hasRemaining(); i++)
      if (Draft.FLASH_POLICY_REQUEST[i] != paramByteBuffer.get())
      {
        paramByteBuffer.reset();
        return Draft.HandshakeState.NOT_MATCHED;
      }
    return Draft.HandshakeState.MATCHED;
  }

  private void open(Handshakedata paramHandshakedata)
  {
    if (DEBUG)
      System.out.println("open using draft: " + this.draft.getClass().getSimpleName());
    this.readystate = WebSocket.READYSTATE.OPEN;
    try
    {
      this.wsl.onWebsocketOpen(this, paramHandshakedata);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      this.wsl.onWebsocketError(this, localRuntimeException);
    }
  }

  private void send(Collection<Framedata> paramCollection)
  {
    if (!isOpen())
      throw new WebsocketNotConnectedException();
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext())
      sendFrame((Framedata)localIterator.next());
  }

  private void write(ByteBuffer paramByteBuffer)
  {
    PrintStream localPrintStream;
    StringBuilder localStringBuilder;
    if (DEBUG)
    {
      localPrintStream = System.out;
      localStringBuilder = new StringBuilder().append("write(").append(paramByteBuffer.remaining()).append("): {");
      if (paramByteBuffer.remaining() <= 1000)
        break label95;
    }
    label95: for (String str = "too big to display"; ; str = new String(paramByteBuffer.array()))
    {
      localPrintStream.println(str + "}");
      this.outQueue.add(paramByteBuffer);
      this.wsl.onWriteDemand(this);
      return;
    }
  }

  private void write(List<ByteBuffer> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      write((ByteBuffer)localIterator.next());
  }

  public void close()
  {
    close(1000);
  }

  public void close(int paramInt)
  {
    close(paramInt, "", false);
  }

  public void close(int paramInt, String paramString)
  {
    close(paramInt, paramString, false);
  }

  public void close(InvalidDataException paramInvalidDataException)
  {
    close(paramInvalidDataException.getCloseCode(), paramInvalidDataException.getMessage(), false);
  }

  public void closeConnection()
  {
    if (this.closedremotely == null)
      throw new IllegalStateException("this method must be used in conjuction with flushAndClose");
    closeConnection(this.closecode.intValue(), this.closemessage, this.closedremotely.booleanValue());
  }

  public void closeConnection(int paramInt, String paramString)
  {
    closeConnection(paramInt, paramString, false);
  }

  // ERROR //
  protected void closeConnection(int paramInt, String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 99\011com/mixpanel/android/java_websocket/WebSocketImpl:readystate\011Lcom/mixpanel/android/java_websocket/WebSocket$READYSTATE;
    //   6: astore 5
    //   8: getstatic 178\011com/mixpanel/android/java_websocket/WebSocket$READYSTATE:CLOSED\011Lcom/mixpanel/android/java_websocket/WebSocket$READYSTATE;
    //   11: astore 6
    //   13: aload 5
    //   15: aload 6
    //   17: if_acmpne +6 -> 23
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: aload_0
    //   24: getfield 563\011com/mixpanel/android/java_websocket/WebSocketImpl:key\011Ljava/nio/channels/SelectionKey;
    //   27: ifnull +10 -> 37
    //   30: aload_0
    //   31: getfield 563\011com/mixpanel/android/java_websocket/WebSocketImpl:key\011Ljava/nio/channels/SelectionKey;
    //   34: invokevirtual 568\011java/nio/channels/SelectionKey:cancel\011()V
    //   37: aload_0
    //   38: getfield 570\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   41: astore 7
    //   43: aload 7
    //   45: ifnull +12 -> 57
    //   48: aload_0
    //   49: getfield 570\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   52: invokeinterface 574 1 0
    //   57: aload_0
    //   58: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   61: aload_0
    //   62: iload_1
    //   63: aload_2
    //   64: iload_3
    //   65: invokeinterface 578 5 0
    //   70: aload_0
    //   71: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   74: ifnull +10 -> 84
    //   77: aload_0
    //   78: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   81: invokevirtual 580\011com/mixpanel/android/java_websocket/drafts/Draft:reset\011()V
    //   84: aload_0
    //   85: aconst_null
    //   86: putfield 113\011com/mixpanel/android/java_websocket/WebSocketImpl:handshakerequest\011Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;
    //   89: aload_0
    //   90: getstatic 178\011com/mixpanel/android/java_websocket/WebSocket$READYSTATE:CLOSED\011Lcom/mixpanel/android/java_websocket/WebSocket$READYSTATE;
    //   93: putfield 99\011com/mixpanel/android/java_websocket/WebSocketImpl:readystate\011Lcom/mixpanel/android/java_websocket/WebSocket$READYSTATE;
    //   96: aload_0
    //   97: getfield 140\011com/mixpanel/android/java_websocket/WebSocketImpl:outQueue\011Ljava/util/concurrent/BlockingQueue;
    //   100: invokeinterface 583 1 0
    //   105: goto -85 -> 20
    //   108: astore 4
    //   110: aload_0
    //   111: monitorexit
    //   112: aload 4
    //   114: athrow
    //   115: astore 9
    //   117: aload_0
    //   118: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   121: aload_0
    //   122: aload 9
    //   124: invokeinterface 216 3 0
    //   129: goto -72 -> 57
    //   132: astore 8
    //   134: aload_0
    //   135: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   138: aload_0
    //   139: aload 8
    //   141: invokeinterface 216 3 0
    //   146: goto -76 -> 70
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01113\011108\011finally
    //   23\01137\011108\011finally
    //   37\01143\011108\011finally
    //   48\01157\011108\011finally
    //   57\01170\011108\011finally
    //   70\01184\011108\011finally
    //   84\011105\011108\011finally
    //   117\011129\011108\011finally
    //   134\011146\011108\011finally
    //   48\01157\011115\011java/io/IOException
    //   57\01170\011132\011java/lang/RuntimeException
  }

  protected void closeConnection(int paramInt, boolean paramBoolean)
  {
    closeConnection(paramInt, "", paramBoolean);
  }

  public void decode(ByteBuffer paramByteBuffer)
  {
    assert (paramByteBuffer.hasRemaining());
    String str;
    if (DEBUG)
    {
      PrintStream localPrintStream = System.out;
      StringBuilder localStringBuilder = new StringBuilder().append("process(").append(paramByteBuffer.remaining()).append("): {");
      if (paramByteBuffer.remaining() > 1000)
      {
        str = "too big to display";
        localPrintStream.println(str + "}");
      }
    }
    else
    {
      if (this.readystate == WebSocket.READYSTATE.NOT_YET_CONNECTED)
        break label166;
      decodeFrames(paramByteBuffer);
    }
    while (true)
    {
      if (($assertionsDisabled) || (isClosing()) || (isFlushAndClose()) || (!paramByteBuffer.hasRemaining()))
        return;
      throw new AssertionError();
      str = new String(paramByteBuffer.array(), paramByteBuffer.position(), paramByteBuffer.remaining());
      break;
      label166: if (decodeHandshake(paramByteBuffer))
      {
        assert ((this.tmpHandshakeBytes.hasRemaining() != paramByteBuffer.hasRemaining()) || (!paramByteBuffer.hasRemaining()));
        if (paramByteBuffer.hasRemaining())
          decodeFrames(paramByteBuffer);
        else if (this.tmpHandshakeBytes.hasRemaining())
          decodeFrames(this.tmpHandshakeBytes);
      }
    }
  }

  public void eot()
  {
    if (getReadyState() == WebSocket.READYSTATE.NOT_YET_CONNECTED)
    {
      closeConnection(-1, true);
      return;
    }
    if (this.flushandclosestate)
    {
      closeConnection(this.closecode.intValue(), this.closemessage, this.closedremotely.booleanValue());
      return;
    }
    if (this.draft.getCloseHandshakeType() == Draft.CloseHandshakeType.NONE)
    {
      closeConnection(1000, true);
      return;
    }
    if (this.draft.getCloseHandshakeType() == Draft.CloseHandshakeType.ONEWAY)
    {
      if (this.role == WebSocket.Role.SERVER)
      {
        closeConnection(1006, true);
        return;
      }
      closeConnection(1000, true);
      return;
    }
    closeConnection(1006, true);
  }

  // ERROR //
  protected void flushAndClose(int paramInt, String paramString, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 92\011com/mixpanel/android/java_websocket/WebSocketImpl:flushandclosestate\011Z
    //   6: istore 5
    //   8: iload 5
    //   10: ifeq +6 -> 16
    //   13: aload_0
    //   14: monitorexit
    //   15: return
    //   16: aload_0
    //   17: iload_1
    //   18: invokestatic 616\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   21: putfield 117\011com/mixpanel/android/java_websocket/WebSocketImpl:closecode\011Ljava/lang/Integer;
    //   24: aload_0
    //   25: aload_2
    //   26: putfield 115\011com/mixpanel/android/java_websocket/WebSocketImpl:closemessage\011Ljava/lang/String;
    //   29: aload_0
    //   30: iload_3
    //   31: invokestatic 619\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
    //   34: putfield 119\011com/mixpanel/android/java_websocket/WebSocketImpl:closedremotely\011Ljava/lang/Boolean;
    //   37: aload_0
    //   38: iconst_1
    //   39: putfield 92\011com/mixpanel/android/java_websocket/WebSocketImpl:flushandclosestate\011Z
    //   42: aload_0
    //   43: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   46: aload_0
    //   47: invokeinterface 533 2 0
    //   52: aload_0
    //   53: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   56: aload_0
    //   57: iload_1
    //   58: aload_2
    //   59: iload_3
    //   60: invokeinterface 622 5 0
    //   65: aload_0
    //   66: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   69: ifnull +10 -> 79
    //   72: aload_0
    //   73: getfield 101\011com/mixpanel/android/java_websocket/WebSocketImpl:draft\011Lcom/mixpanel/android/java_websocket/drafts/Draft;
    //   76: invokevirtual 580\011com/mixpanel/android/java_websocket/drafts/Draft:reset\011()V
    //   79: aload_0
    //   80: aconst_null
    //   81: putfield 113\011com/mixpanel/android/java_websocket/WebSocketImpl:handshakerequest\011Lcom/mixpanel/android/java_websocket/handshake/ClientHandshake;
    //   84: goto -71 -> 13
    //   87: astore 4
    //   89: aload_0
    //   90: monitorexit
    //   91: aload 4
    //   93: athrow
    //   94: astore 6
    //   96: aload_0
    //   97: getfield 144\011com/mixpanel/android/java_websocket/WebSocketImpl:wsl\011Lcom/mixpanel/android/java_websocket/WebSocketListener;
    //   100: aload_0
    //   101: aload 6
    //   103: invokeinterface 216 3 0
    //   108: goto -43 -> 65
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\0118\01187\011finally
    //   16\01152\01187\011finally
    //   52\01165\01187\011finally
    //   65\01179\01187\011finally
    //   79\01184\01187\011finally
    //   96\011108\01187\011finally
    //   52\01165\01194\011java/lang/RuntimeException
  }

  public Draft getDraft()
  {
    return this.draft;
  }

  public InetSocketAddress getLocalSocketAddress()
  {
    return this.wsl.getLocalSocketAddress(this);
  }

  public WebSocket.READYSTATE getReadyState()
  {
    return this.readystate;
  }

  public InetSocketAddress getRemoteSocketAddress()
  {
    return this.wsl.getRemoteSocketAddress(this);
  }

  public String getResourceDescriptor()
  {
    return this.resourceDescriptor;
  }

  public boolean hasBufferedData()
  {
    return !this.outQueue.isEmpty();
  }

  public int hashCode()
  {
    return super.hashCode();
  }

  public boolean isClosed()
  {
    return this.readystate == WebSocket.READYSTATE.CLOSED;
  }

  public boolean isClosing()
  {
    return this.readystate == WebSocket.READYSTATE.CLOSING;
  }

  public boolean isConnecting()
  {
    if (($assertionsDisabled) || (!this.flushandclosestate) || (this.readystate == WebSocket.READYSTATE.CONNECTING))
    {
      if (this.readystate == WebSocket.READYSTATE.CONNECTING)
        return true;
    }
    else
      throw new AssertionError();
    return false;
  }

  public boolean isFlushAndClose()
  {
    return this.flushandclosestate;
  }

  public boolean isOpen()
  {
    if (($assertionsDisabled) || (this.readystate != WebSocket.READYSTATE.OPEN) || (!this.flushandclosestate))
    {
      if (this.readystate == WebSocket.READYSTATE.OPEN)
        return true;
    }
    else
      throw new AssertionError();
    return false;
  }

  public void send(String paramString)
    throws WebsocketNotConnectedException
  {
    if (paramString == null)
      throw new IllegalArgumentException("Cannot send 'null' data to a WebSocketImpl.");
    Draft localDraft = this.draft;
    if (this.role == WebSocket.Role.CLIENT);
    for (boolean bool = true; ; bool = false)
    {
      send(localDraft.createFrames(paramString, bool));
      return;
    }
  }

  public void send(ByteBuffer paramByteBuffer)
    throws IllegalArgumentException, WebsocketNotConnectedException
  {
    if (paramByteBuffer == null)
      throw new IllegalArgumentException("Cannot send 'null' data to a WebSocketImpl.");
    Draft localDraft = this.draft;
    if (this.role == WebSocket.Role.CLIENT);
    for (boolean bool = true; ; bool = false)
    {
      send(localDraft.createFrames(paramByteBuffer, bool));
      return;
    }
  }

  public void send(byte[] paramArrayOfByte)
    throws IllegalArgumentException, WebsocketNotConnectedException
  {
    send(ByteBuffer.wrap(paramArrayOfByte));
  }

  public void sendFragmentedFrame(Framedata.Opcode paramOpcode, ByteBuffer paramByteBuffer, boolean paramBoolean)
  {
    send(this.draft.continuousFrame(paramOpcode, paramByteBuffer, paramBoolean));
  }

  public void sendFrame(Framedata paramFramedata)
  {
    if (DEBUG)
      System.out.println("send frame: " + paramFramedata);
    write(this.draft.createBinaryFrame(paramFramedata));
  }

  public void startHandshake(ClientHandshakeBuilder paramClientHandshakeBuilder)
    throws InvalidHandshakeException
  {
    assert (this.readystate != WebSocket.READYSTATE.CONNECTING) : "shall only be called once";
    this.handshakerequest = this.draft.postProcessHandshakeRequestAsClient(paramClientHandshakeBuilder);
    this.resourceDescriptor = paramClientHandshakeBuilder.getResourceDescriptor();
    assert (this.resourceDescriptor != null);
    try
    {
      this.wsl.onWebsocketHandshakeSentAsClient(this, this.handshakerequest);
      write(this.draft.createHandshake(this.handshakerequest, this.role));
      return;
    }
    catch (InvalidDataException localInvalidDataException)
    {
      throw new InvalidHandshakeException("Handshake data rejected by client.");
    }
    catch (RuntimeException localRuntimeException)
    {
      this.wsl.onWebsocketError(this, localRuntimeException);
      throw new InvalidHandshakeException("rejected because of" + localRuntimeException);
    }
  }

  public String toString()
  {
    return super.toString();
  }
}