package com.mixpanel.android.java_websocket.server;

import com.mixpanel.android.java_websocket.WebSocket;
import com.mixpanel.android.java_websocket.WebSocketAdapter;
import com.mixpanel.android.java_websocket.WebSocketFactory;
import com.mixpanel.android.java_websocket.WebSocketImpl;
import com.mixpanel.android.java_websocket.drafts.Draft;
import com.mixpanel.android.java_websocket.exceptions.InvalidDataException;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.handshake.ClientHandshake;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.handshake.ServerHandshakeBuilder;
import java.io.IOException;
import java.io.PrintStream;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.SelectableChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class WebSocketServer extends WebSocketAdapter
  implements Runnable
{
  public static int DECODERS;
  private final InetSocketAddress address;
  private BlockingQueue<ByteBuffer> buffers;
  private final Collection<WebSocket> connections;
  private List<WebSocketWorker> decoders;
  private List<Draft> drafts;
  private List<WebSocketImpl> iqueue;
  private volatile AtomicBoolean isclosed = new AtomicBoolean(false);
  private int queueinvokes = 0;
  private AtomicInteger queuesize = new AtomicInteger(0);
  private Selector selector;
  private Thread selectorthread;
  private ServerSocketChannel server;
  private WebSocketServerFactory wsf = new DefaultWebSocketServerFactory();

  static
  {
    if (!WebSocketServer.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      DECODERS = Runtime.getRuntime().availableProcessors();
      return;
    }
  }

  public WebSocketServer()
    throws UnknownHostException
  {
    this(new InetSocketAddress(80), DECODERS, null);
  }

  public WebSocketServer(InetSocketAddress paramInetSocketAddress)
  {
    this(paramInetSocketAddress, DECODERS, null);
  }

  public WebSocketServer(InetSocketAddress paramInetSocketAddress, int paramInt)
  {
    this(paramInetSocketAddress, paramInt, null);
  }

  public WebSocketServer(InetSocketAddress paramInetSocketAddress, int paramInt, List<Draft> paramList)
  {
    this(paramInetSocketAddress, paramInt, paramList, new HashSet());
  }

  public WebSocketServer(InetSocketAddress paramInetSocketAddress, int paramInt, List<Draft> paramList, Collection<WebSocket> paramCollection)
  {
    if ((paramInetSocketAddress == null) || (paramInt < 1) || (paramCollection == null))
      throw new IllegalArgumentException("address and connectionscontainer must not be null and you need at least 1 decoder");
    if (paramList == null);
    for (this.drafts = Collections.emptyList(); ; this.drafts = paramList)
    {
      this.address = paramInetSocketAddress;
      this.connections = paramCollection;
      this.iqueue = new LinkedList();
      this.decoders = new ArrayList(paramInt);
      this.buffers = new LinkedBlockingQueue();
      for (int i = 0; i < paramInt; i++)
      {
        WebSocketWorker localWebSocketWorker = new WebSocketWorker();
        this.decoders.add(localWebSocketWorker);
        localWebSocketWorker.start();
      }
    }
  }

  public WebSocketServer(InetSocketAddress paramInetSocketAddress, List<Draft> paramList)
  {
    this(paramInetSocketAddress, DECODERS, paramList);
  }

  private Socket getSocket(WebSocket paramWebSocket)
  {
    return ((SocketChannel)((WebSocketImpl)paramWebSocket).key.channel()).socket();
  }

  private void handleFatal(WebSocket paramWebSocket, Exception paramException)
  {
    onError(paramWebSocket, paramException);
    try
    {
      stop();
      return;
    }
    catch (IOException localIOException)
    {
      onError(null, localIOException);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Thread.currentThread().interrupt();
      onError(null, localInterruptedException);
    }
  }

  private void handleIOException(SelectionKey paramSelectionKey, WebSocket paramWebSocket, IOException paramIOException)
  {
    if (paramWebSocket != null)
      paramWebSocket.closeConnection(1006, paramIOException.getMessage());
    while (true)
    {
      return;
      if (paramSelectionKey == null)
        continue;
      SelectableChannel localSelectableChannel = paramSelectionKey.channel();
      if ((localSelectableChannel == null) || (!localSelectableChannel.isOpen()))
        break;
      try
      {
        localSelectableChannel.close();
        label46: if (!WebSocketImpl.DEBUG)
          continue;
        System.out.println("Connection closed because of" + paramIOException);
        return;
      }
      catch (IOException localIOException)
      {
        break label46;
      }
    }
  }

  private void pushBuffer(ByteBuffer paramByteBuffer)
    throws InterruptedException
  {
    if (this.buffers.size() > this.queuesize.intValue())
      return;
    this.buffers.put(paramByteBuffer);
  }

  private void queue(WebSocketImpl paramWebSocketImpl)
    throws InterruptedException
  {
    if (paramWebSocketImpl.workerThread == null)
    {
      paramWebSocketImpl.workerThread = ((WebSocketWorker)this.decoders.get(this.queueinvokes % this.decoders.size()));
      this.queueinvokes = (1 + this.queueinvokes);
    }
    paramWebSocketImpl.workerThread.put(paramWebSocketImpl);
  }

  private ByteBuffer takeBuffer()
    throws InterruptedException
  {
    return (ByteBuffer)this.buffers.take();
  }

  protected boolean addConnection(WebSocket paramWebSocket)
  {
    if (!this.isclosed.get())
    {
      boolean bool;
      synchronized (this.connections)
      {
        bool = this.connections.add(paramWebSocket);
        if ((!$assertionsDisabled) && (!bool))
          throw new AssertionError();
      }
      return bool;
    }
    paramWebSocket.close(1001);
    return true;
  }

  protected void allocateBuffers(WebSocket paramWebSocket)
    throws InterruptedException
  {
    if (this.queuesize.get() >= 1 + 2 * this.decoders.size())
      return;
    this.queuesize.incrementAndGet();
    this.buffers.put(createBuffer());
  }

  public Collection<WebSocket> connections()
  {
    return this.connections;
  }

  public ByteBuffer createBuffer()
  {
    return ByteBuffer.allocate(WebSocketImpl.RCVBUF);
  }

  public InetSocketAddress getAddress()
  {
    return this.address;
  }

  public List<Draft> getDraft()
  {
    return Collections.unmodifiableList(this.drafts);
  }

  protected String getFlashSecurityPolicy()
  {
    return "<cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"" + getPort() + "\" /></cross-domain-policy>";
  }

  public InetSocketAddress getLocalSocketAddress(WebSocket paramWebSocket)
  {
    return (InetSocketAddress)getSocket(paramWebSocket).getLocalSocketAddress();
  }

  public int getPort()
  {
    int i = getAddress().getPort();
    if ((i == 0) && (this.server != null))
      i = this.server.socket().getLocalPort();
    return i;
  }

  public InetSocketAddress getRemoteSocketAddress(WebSocket paramWebSocket)
  {
    return (InetSocketAddress)getSocket(paramWebSocket).getRemoteSocketAddress();
  }

  public final WebSocketFactory getWebSocketFactory()
  {
    return this.wsf;
  }

  public abstract void onClose(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean);

  public void onCloseInitiated(WebSocket paramWebSocket, int paramInt, String paramString)
  {
  }

  public void onClosing(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean)
  {
  }

  protected boolean onConnect(SelectionKey paramSelectionKey)
  {
    return true;
  }

  public abstract void onError(WebSocket paramWebSocket, Exception paramException);

  public void onFragment(WebSocket paramWebSocket, Framedata paramFramedata)
  {
  }

  public abstract void onMessage(WebSocket paramWebSocket, String paramString);

  public void onMessage(WebSocket paramWebSocket, ByteBuffer paramByteBuffer)
  {
  }

  public abstract void onOpen(WebSocket paramWebSocket, ClientHandshake paramClientHandshake);

  public final void onWebsocketClose(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean)
  {
    this.selector.wakeup();
    try
    {
      if (removeConnection(paramWebSocket))
        onClose(paramWebSocket, paramInt, paramString, paramBoolean);
      try
      {
        releaseBuffers(paramWebSocket);
        return;
      }
      catch (InterruptedException localInterruptedException2)
      {
        Thread.currentThread().interrupt();
        return;
      }
    }
    finally
    {
    }
    try
    {
      releaseBuffers(paramWebSocket);
      throw localObject;
    }
    catch (InterruptedException localInterruptedException1)
    {
      while (true)
        Thread.currentThread().interrupt();
    }
  }

  public void onWebsocketCloseInitiated(WebSocket paramWebSocket, int paramInt, String paramString)
  {
    onCloseInitiated(paramWebSocket, paramInt, paramString);
  }

  public void onWebsocketClosing(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean)
  {
    onClosing(paramWebSocket, paramInt, paramString, paramBoolean);
  }

  public final void onWebsocketError(WebSocket paramWebSocket, Exception paramException)
  {
    onError(paramWebSocket, paramException);
  }

  public ServerHandshakeBuilder onWebsocketHandshakeReceivedAsServer(WebSocket paramWebSocket, Draft paramDraft, ClientHandshake paramClientHandshake)
    throws InvalidDataException
  {
    return super.onWebsocketHandshakeReceivedAsServer(paramWebSocket, paramDraft, paramClientHandshake);
  }

  public final void onWebsocketMessage(WebSocket paramWebSocket, String paramString)
  {
    onMessage(paramWebSocket, paramString);
  }

  public final void onWebsocketMessage(WebSocket paramWebSocket, ByteBuffer paramByteBuffer)
  {
    onMessage(paramWebSocket, paramByteBuffer);
  }

  @Deprecated
  public void onWebsocketMessageFragment(WebSocket paramWebSocket, Framedata paramFramedata)
  {
    onFragment(paramWebSocket, paramFramedata);
  }

  public final void onWebsocketOpen(WebSocket paramWebSocket, Handshakedata paramHandshakedata)
  {
    if (addConnection(paramWebSocket))
      onOpen(paramWebSocket, (ClientHandshake)paramHandshakedata);
  }

  public final void onWriteDemand(WebSocket paramWebSocket)
  {
    WebSocketImpl localWebSocketImpl = (WebSocketImpl)paramWebSocket;
    try
    {
      localWebSocketImpl.key.interestOps(5);
      this.selector.wakeup();
      return;
    }
    catch (CancelledKeyException localCancelledKeyException)
    {
      while (true)
        localWebSocketImpl.outQueue.clear();
    }
  }

  protected void releaseBuffers(WebSocket paramWebSocket)
    throws InterruptedException
  {
  }

  protected boolean removeConnection(WebSocket paramWebSocket)
  {
    boolean bool;
    synchronized (this.connections)
    {
      bool = this.connections.remove(paramWebSocket);
      if ((!$assertionsDisabled) && (!bool))
        throw new AssertionError();
    }
    if ((this.isclosed.get()) && (this.connections.size() == 0))
      this.selectorthread.interrupt();
    return bool;
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   6: ifnull +42 -> 48
    //   9: new 446\011java/lang/IllegalStateException
    //   12: dup
    //   13: new 231\011java/lang/StringBuilder
    //   16: dup
    //   17: invokespecial 232\011java/lang/StringBuilder:<init>\011()V
    //   20: aload_0
    //   21: invokevirtual 452\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   24: invokevirtual 455\011java/lang/Class:getName\011()Ljava/lang/String;
    //   27: invokevirtual 238\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   30: ldc_w 457
    //   33: invokevirtual 238\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: invokevirtual 244\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   39: invokespecial 458\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   42: athrow
    //   43: astore_1
    //   44: aload_0
    //   45: monitorexit
    //   46: aload_1
    //   47: athrow
    //   48: aload_0
    //   49: invokestatic 197\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   52: putfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   55: aload_0
    //   56: getfield 88\011com/mixpanel/android/java_websocket/server/WebSocketServer:isclosed\011Ljava/util/concurrent/atomic/AtomicBoolean;
    //   59: invokevirtual 286\011java/util/concurrent/atomic/AtomicBoolean:get\011()Z
    //   62: ifeq +6 -> 68
    //   65: aload_0
    //   66: monitorexit
    //   67: return
    //   68: aload_0
    //   69: monitorexit
    //   70: aload_0
    //   71: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   74: new 231\011java/lang/StringBuilder
    //   77: dup
    //   78: invokespecial 232\011java/lang/StringBuilder:<init>\011()V
    //   81: ldc_w 460
    //   84: invokevirtual 238\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   87: aload_0
    //   88: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   91: invokevirtual 464\011java/lang/Thread:getId\011()J
    //   94: invokevirtual 467\011java/lang/StringBuilder:append\011(J)Ljava/lang/StringBuilder;
    //   97: invokevirtual 244\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   100: invokevirtual 470\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   103: aload_0
    //   104: invokestatic 474\011java/nio/channels/ServerSocketChannel:open\011()Ljava/nio/channels/ServerSocketChannel;
    //   107: putfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   110: aload_0
    //   111: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   114: iconst_0
    //   115: invokevirtual 478\011java/nio/channels/ServerSocketChannel:configureBlocking\011(Z)Ljava/nio/channels/SelectableChannel;
    //   118: pop
    //   119: aload_0
    //   120: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   123: invokevirtual 349\011java/nio/channels/ServerSocketChannel:socket\011()Ljava/net/ServerSocket;
    //   126: astore 4
    //   128: aload 4
    //   130: getstatic 308\011com/mixpanel/android/java_websocket/WebSocketImpl:RCVBUF\011I
    //   133: invokevirtual 481\011java/net/ServerSocket:setReceiveBufferSize\011(I)V
    //   136: aload 4
    //   138: aload_0
    //   139: getfield 117\011com/mixpanel/android/java_websocket/server/WebSocketServer:address\011Ljava/net/InetSocketAddress;
    //   142: invokevirtual 485\011java/net/ServerSocket:bind\011(Ljava/net/SocketAddress;)V
    //   145: aload_0
    //   146: invokestatic 487\011java/nio/channels/Selector:open\011()Ljava/nio/channels/Selector;
    //   149: putfield 376\011com/mixpanel/android/java_websocket/server/WebSocketServer:selector\011Ljava/nio/channels/Selector;
    //   152: aload_0
    //   153: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   156: aload_0
    //   157: getfield 376\011com/mixpanel/android/java_websocket/server/WebSocketServer:selector\011Ljava/nio/channels/Selector;
    //   160: aload_0
    //   161: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   164: invokevirtual 490\011java/nio/channels/ServerSocketChannel:validOps\011()I
    //   167: invokevirtual 494\011java/nio/channels/ServerSocketChannel:register\011(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;
    //   170: pop
    //   171: aload_0
    //   172: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   175: invokevirtual 497\011java/lang/Thread:isInterrupted\011()Z
    //   178: istore 12
    //   180: iload 12
    //   182: ifne +761 -> 943
    //   185: aconst_null
    //   186: astore 15
    //   188: aconst_null
    //   189: astore 16
    //   191: aload_0
    //   192: getfield 376\011com/mixpanel/android/java_websocket/server/WebSocketServer:selector\011Ljava/nio/channels/Selector;
    //   195: invokevirtual 500\011java/nio/channels/Selector:select\011()I
    //   198: pop
    //   199: aload_0
    //   200: getfield 376\011com/mixpanel/android/java_websocket/server/WebSocketServer:selector\011Ljava/nio/channels/Selector;
    //   203: invokevirtual 504\011java/nio/channels/Selector:selectedKeys\011()Ljava/util/Set;
    //   206: invokeinterface 510 1 0
    //   211: astore 26
    //   213: aload 26
    //   215: invokeinterface 515 1 0
    //   220: ifeq +557 -> 777
    //   223: aload 26
    //   225: invokeinterface 518 1 0
    //   230: checkcast 173\011java/nio/channels/SelectionKey
    //   233: astore 15
    //   235: aload 15
    //   237: invokevirtual 521\011java/nio/channels/SelectionKey:isValid\011()Z
    //   240: ifeq -27 -> 213
    //   243: aload 15
    //   245: invokevirtual 524\011java/nio/channels/SelectionKey:isAcceptable\011()Z
    //   248: ifeq +170 -> 418
    //   251: aload_0
    //   252: aload 15
    //   254: invokevirtual 526\011com/mixpanel/android/java_websocket/server/WebSocketServer:onConnect\011(Ljava/nio/channels/SelectionKey;)Z
    //   257: ifne +24 -> 281
    //   260: aload 15
    //   262: invokevirtual 529\011java/nio/channels/SelectionKey:cancel\011()V
    //   265: goto -52 -> 213
    //   268: astore 24
    //   270: goto -99 -> 171
    //   273: astore_2
    //   274: aload_0
    //   275: aconst_null
    //   276: aload_2
    //   277: invokespecial 163\011com/mixpanel/android/java_websocket/server/WebSocketServer:handleFatal\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   280: return
    //   281: aload_0
    //   282: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   285: invokevirtual 533\011java/nio/channels/ServerSocketChannel:accept\011()Ljava/nio/channels/SocketChannel;
    //   288: astore 35
    //   290: aload 35
    //   292: iconst_0
    //   293: invokevirtual 534\011java/nio/channels/SocketChannel:configureBlocking\011(Z)Ljava/nio/channels/SelectableChannel;
    //   296: pop
    //   297: aload_0
    //   298: getfield 100\011com/mixpanel/android/java_websocket/server/WebSocketServer:wsf\011Lcom/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketServerFactory;
    //   301: aload_0
    //   302: aload_0
    //   303: getfield 115\011com/mixpanel/android/java_websocket/server/WebSocketServer:drafts\011Ljava/util/List;
    //   306: aload 35
    //   308: invokevirtual 183\011java/nio/channels/SocketChannel:socket\011()Ljava/net/Socket;
    //   311: invokeinterface 540 4 0
    //   316: astore 37
    //   318: aload 37
    //   320: aload 35
    //   322: aload_0
    //   323: getfield 376\011com/mixpanel/android/java_websocket/server/WebSocketServer:selector\011Ljava/nio/channels/Selector;
    //   326: iconst_1
    //   327: aload 37
    //   329: invokevirtual 543\011java/nio/channels/SocketChannel:register\011(Ljava/nio/channels/Selector;ILjava/lang/Object;)Ljava/nio/channels/SelectionKey;
    //   332: putfield 171\011com/mixpanel/android/java_websocket/WebSocketImpl:key\011Ljava/nio/channels/SelectionKey;
    //   335: aload 37
    //   337: aload_0
    //   338: getfield 100\011com/mixpanel/android/java_websocket/server/WebSocketServer:wsf\011Lcom/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketServerFactory;
    //   341: aload 35
    //   343: aload 37
    //   345: getfield 171\011com/mixpanel/android/java_websocket/WebSocketImpl:key\011Ljava/nio/channels/SelectionKey;
    //   348: invokeinterface 547 3 0
    //   353: putfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   356: aload 26
    //   358: invokeinterface 552 1 0
    //   363: aload_0
    //   364: aload 37
    //   366: invokevirtual 554\011com/mixpanel/android/java_websocket/server/WebSocketServer:allocateBuffers\011(Lcom/mixpanel/android/java_websocket/WebSocket;)V
    //   369: goto -156 -> 213
    //   372: astore 21
    //   374: aload_0
    //   375: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   378: ifnull +515 -> 893
    //   381: aload_0
    //   382: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   385: invokeinterface 555 1 0
    //   390: astore 23
    //   392: aload 23
    //   394: invokeinterface 515 1 0
    //   399: ifeq +494 -> 893
    //   402: aload 23
    //   404: invokeinterface 518 1 0
    //   409: checkcast 136\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker
    //   412: invokevirtual 556\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:interrupt\011()V
    //   415: goto -23 -> 392
    //   418: aload 15
    //   420: invokevirtual 559\011java/nio/channels/SelectionKey:isReadable\011()Z
    //   423: ifeq +106 -> 529
    //   426: aload 15
    //   428: invokevirtual 562\011java/nio/channels/SelectionKey:attachment\011()Ljava/lang/Object;
    //   431: checkcast 167\011com/mixpanel/android/java_websocket/WebSocketImpl
    //   434: astore 16
    //   436: aload_0
    //   437: invokespecial 564\011com/mixpanel/android/java_websocket/server/WebSocketServer:takeBuffer\011()Ljava/nio/ByteBuffer;
    //   440: astore 32
    //   442: aload 32
    //   444: aload 16
    //   446: aload 16
    //   448: getfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   451: invokestatic 570\011com/mixpanel/android/java_websocket/SocketChannelIOHelper:read\011(Ljava/nio/ByteBuffer;Lcom/mixpanel/android/java_websocket/WebSocketImpl;Ljava/nio/channels/ByteChannel;)Z
    //   454: ifeq +268 -> 722
    //   457: aload 32
    //   459: invokevirtual 573\011java/nio/ByteBuffer:hasRemaining\011()Z
    //   462: ifeq +194 -> 656
    //   465: aload 16
    //   467: getfield 576\011com/mixpanel/android/java_websocket/WebSocketImpl:inQueue\011Ljava/util/concurrent/BlockingQueue;
    //   470: aload 32
    //   472: invokeinterface 261 2 0
    //   477: aload_0
    //   478: aload 16
    //   480: invokespecial 578\011com/mixpanel/android/java_websocket/server/WebSocketServer:queue\011(Lcom/mixpanel/android/java_websocket/WebSocketImpl;)V
    //   483: aload 26
    //   485: invokeinterface 552 1 0
    //   490: aload 16
    //   492: getfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   495: instanceof 580
    //   498: ifeq +31 -> 529
    //   501: aload 16
    //   503: getfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   506: checkcast 580\011com/mixpanel/android/java_websocket/WrappedByteChannel
    //   509: invokeinterface 583 1 0
    //   514: ifeq +15 -> 529
    //   517: aload_0
    //   518: getfield 124\011com/mixpanel/android/java_websocket/server/WebSocketServer:iqueue\011Ljava/util/List;
    //   521: aload 16
    //   523: invokeinterface 145 2 0
    //   528: pop
    //   529: aload 15
    //   531: invokevirtual 586\011java/nio/channels/SelectionKey:isWritable\011()Z
    //   534: ifeq -321 -> 213
    //   537: aload 15
    //   539: invokevirtual 562\011java/nio/channels/SelectionKey:attachment\011()Ljava/lang/Object;
    //   542: checkcast 167\011com/mixpanel/android/java_websocket/WebSocketImpl
    //   545: astore 16
    //   547: aload 16
    //   549: aload 16
    //   551: getfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   554: invokestatic 590\011com/mixpanel/android/java_websocket/SocketChannelIOHelper:batch\011(Lcom/mixpanel/android/java_websocket/WebSocketImpl;Ljava/nio/channels/ByteChannel;)Z
    //   557: ifeq -344 -> 213
    //   560: aload 15
    //   562: invokevirtual 521\011java/nio/channels/SelectionKey:isValid\011()Z
    //   565: ifeq -352 -> 213
    //   568: aload 15
    //   570: iconst_1
    //   571: invokevirtual 427\011java/nio/channels/SelectionKey:interestOps\011(I)Ljava/nio/channels/SelectionKey;
    //   574: pop
    //   575: goto -362 -> 213
    //   578: astore 20
    //   580: aload 15
    //   582: ifnull +8 -> 590
    //   585: aload 15
    //   587: invokevirtual 529\011java/nio/channels/SelectionKey:cancel\011()V
    //   590: aload_0
    //   591: aload 15
    //   593: aload 16
    //   595: aload 20
    //   597: invokespecial 592\011com/mixpanel/android/java_websocket/server/WebSocketServer:handleIOException\011(Ljava/nio/channels/SelectionKey;Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/io/IOException;)V
    //   600: goto -429 -> 171
    //   603: astore 9
    //   605: aload_0
    //   606: aconst_null
    //   607: aload 9
    //   609: invokespecial 163\011com/mixpanel/android/java_websocket/server/WebSocketServer:handleFatal\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   612: aload_0
    //   613: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   616: ifnull +396 -> 1012
    //   619: aload_0
    //   620: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   623: invokeinterface 555 1 0
    //   628: astore 11
    //   630: aload 11
    //   632: invokeinterface 515 1 0
    //   637: ifeq +375 -> 1012
    //   640: aload 11
    //   642: invokeinterface 518 1 0
    //   647: checkcast 136\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker
    //   650: invokevirtual 556\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:interrupt\011()V
    //   653: goto -23 -> 630
    //   656: aload_0
    //   657: aload 32
    //   659: invokespecial 157\011com/mixpanel/android/java_websocket/server/WebSocketServer:pushBuffer\011(Ljava/nio/ByteBuffer;)V
    //   662: goto -133 -> 529
    //   665: astore 33
    //   667: aload_0
    //   668: aload 32
    //   670: invokespecial 157\011com/mixpanel/android/java_websocket/server/WebSocketServer:pushBuffer\011(Ljava/nio/ByteBuffer;)V
    //   673: aload 33
    //   675: athrow
    //   676: astore 17
    //   678: aload_0
    //   679: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   682: ifnull +236 -> 918
    //   685: aload_0
    //   686: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   689: invokeinterface 555 1 0
    //   694: astore 19
    //   696: aload 19
    //   698: invokeinterface 515 1 0
    //   703: ifeq +215 -> 918
    //   706: aload 19
    //   708: invokeinterface 518 1 0
    //   713: checkcast 136\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker
    //   716: invokevirtual 556\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:interrupt\011()V
    //   719: goto -23 -> 696
    //   722: aload_0
    //   723: aload 32
    //   725: invokespecial 157\011com/mixpanel/android/java_websocket/server/WebSocketServer:pushBuffer\011(Ljava/nio/ByteBuffer;)V
    //   728: goto -199 -> 529
    //   731: astore 6
    //   733: aload_0
    //   734: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   737: ifnull +300 -> 1037
    //   740: aload_0
    //   741: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   744: invokeinterface 555 1 0
    //   749: astore 8
    //   751: aload 8
    //   753: invokeinterface 515 1 0
    //   758: ifeq +279 -> 1037
    //   761: aload 8
    //   763: invokeinterface 518 1 0
    //   768: checkcast 136\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker
    //   771: invokevirtual 556\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:interrupt\011()V
    //   774: goto -23 -> 751
    //   777: aload_0
    //   778: getfield 124\011com/mixpanel/android/java_websocket/server/WebSocketServer:iqueue\011Ljava/util/List;
    //   781: invokeinterface 595 1 0
    //   786: ifne -615 -> 171
    //   789: aload_0
    //   790: getfield 124\011com/mixpanel/android/java_websocket/server/WebSocketServer:iqueue\011Ljava/util/List;
    //   793: iconst_0
    //   794: invokeinterface 597 2 0
    //   799: checkcast 167\011com/mixpanel/android/java_websocket/WebSocketImpl
    //   802: astore 16
    //   804: aload 16
    //   806: getfield 550\011com/mixpanel/android/java_websocket/WebSocketImpl:channel\011Ljava/nio/channels/ByteChannel;
    //   809: checkcast 580\011com/mixpanel/android/java_websocket/WrappedByteChannel
    //   812: astore 27
    //   814: aload_0
    //   815: invokespecial 564\011com/mixpanel/android/java_websocket/server/WebSocketServer:takeBuffer\011()Ljava/nio/ByteBuffer;
    //   818: astore 28
    //   820: aload 28
    //   822: aload 16
    //   824: aload 27
    //   826: invokestatic 601\011com/mixpanel/android/java_websocket/SocketChannelIOHelper:readMore\011(Ljava/nio/ByteBuffer;Lcom/mixpanel/android/java_websocket/WebSocketImpl;Lcom/mixpanel/android/java_websocket/WrappedByteChannel;)Z
    //   829: ifeq +15 -> 844
    //   832: aload_0
    //   833: getfield 124\011com/mixpanel/android/java_websocket/server/WebSocketServer:iqueue\011Ljava/util/List;
    //   836: aload 16
    //   838: invokeinterface 145 2 0
    //   843: pop
    //   844: aload 28
    //   846: invokevirtual 573\011java/nio/ByteBuffer:hasRemaining\011()Z
    //   849: ifeq +35 -> 884
    //   852: aload 16
    //   854: getfield 576\011com/mixpanel/android/java_websocket/WebSocketImpl:inQueue\011Ljava/util/concurrent/BlockingQueue;
    //   857: aload 28
    //   859: invokeinterface 261 2 0
    //   864: aload_0
    //   865: aload 16
    //   867: invokespecial 578\011com/mixpanel/android/java_websocket/server/WebSocketServer:queue\011(Lcom/mixpanel/android/java_websocket/WebSocketImpl;)V
    //   870: goto -93 -> 777
    //   873: astore 29
    //   875: aload_0
    //   876: aload 28
    //   878: invokespecial 157\011com/mixpanel/android/java_websocket/server/WebSocketServer:pushBuffer\011(Ljava/nio/ByteBuffer;)V
    //   881: aload 29
    //   883: athrow
    //   884: aload_0
    //   885: aload 28
    //   887: invokespecial 157\011com/mixpanel/android/java_websocket/server/WebSocketServer:pushBuffer\011(Ljava/nio/ByteBuffer;)V
    //   890: goto -113 -> 777
    //   893: aload_0
    //   894: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   897: ifnull +169 -> 1066
    //   900: aload_0
    //   901: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   904: invokevirtual 602\011java/nio/channels/ServerSocketChannel:close\011()V
    //   907: return
    //   908: astore 22
    //   910: aload_0
    //   911: aconst_null
    //   912: aload 22
    //   914: invokevirtual 188\011com/mixpanel/android/java_websocket/server/WebSocketServer:onError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   917: return
    //   918: aload_0
    //   919: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   922: ifnull +144 -> 1066
    //   925: aload_0
    //   926: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   929: invokevirtual 602\011java/nio/channels/ServerSocketChannel:close\011()V
    //   932: return
    //   933: astore 18
    //   935: aload_0
    //   936: aconst_null
    //   937: aload 18
    //   939: invokevirtual 188\011com/mixpanel/android/java_websocket/server/WebSocketServer:onError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   942: return
    //   943: aload_0
    //   944: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   947: ifnull +40 -> 987
    //   950: aload_0
    //   951: getfield 129\011com/mixpanel/android/java_websocket/server/WebSocketServer:decoders\011Ljava/util/List;
    //   954: invokeinterface 555 1 0
    //   959: astore 14
    //   961: aload 14
    //   963: invokeinterface 515 1 0
    //   968: ifeq +19 -> 987
    //   971: aload 14
    //   973: invokeinterface 518 1 0
    //   978: checkcast 136\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker
    //   981: invokevirtual 556\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:interrupt\011()V
    //   984: goto -23 -> 961
    //   987: aload_0
    //   988: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   991: ifnull +75 -> 1066
    //   994: aload_0
    //   995: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   998: invokevirtual 602\011java/nio/channels/ServerSocketChannel:close\011()V
    //   1001: return
    //   1002: astore 13
    //   1004: aload_0
    //   1005: aconst_null
    //   1006: aload 13
    //   1008: invokevirtual 188\011com/mixpanel/android/java_websocket/server/WebSocketServer:onError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   1011: return
    //   1012: aload_0
    //   1013: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   1016: ifnull +50 -> 1066
    //   1019: aload_0
    //   1020: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   1023: invokevirtual 602\011java/nio/channels/ServerSocketChannel:close\011()V
    //   1026: return
    //   1027: astore 10
    //   1029: aload_0
    //   1030: aconst_null
    //   1031: aload 10
    //   1033: invokevirtual 188\011com/mixpanel/android/java_websocket/server/WebSocketServer:onError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   1036: return
    //   1037: aload_0
    //   1038: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   1041: ifnull +10 -> 1051
    //   1044: aload_0
    //   1045: getfield 344\011com/mixpanel/android/java_websocket/server/WebSocketServer:server\011Ljava/nio/channels/ServerSocketChannel;
    //   1048: invokevirtual 602\011java/nio/channels/ServerSocketChannel:close\011()V
    //   1051: aload 6
    //   1053: athrow
    //   1054: astore 7
    //   1056: aload_0
    //   1057: aconst_null
    //   1058: aload 7
    //   1060: invokevirtual 188\011com/mixpanel/android/java_websocket/server/WebSocketServer:onError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   1063: goto -12 -> 1051
    //   1066: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01143\01143\011finally
    //   44\01146\01143\011finally
    //   48\01167\01143\011finally
    //   68\01170\01143\011finally
    //   191\011213\011268\011java/nio/channels/CancelledKeyException
    //   213\011265\011268\011java/nio/channels/CancelledKeyException
    //   281\011369\011268\011java/nio/channels/CancelledKeyException
    //   418\011442\011268\011java/nio/channels/CancelledKeyException
    //   442\011529\011268\011java/nio/channels/CancelledKeyException
    //   529\011575\011268\011java/nio/channels/CancelledKeyException
    //   656\011662\011268\011java/nio/channels/CancelledKeyException
    //   667\011676\011268\011java/nio/channels/CancelledKeyException
    //   722\011728\011268\011java/nio/channels/CancelledKeyException
    //   777\011820\011268\011java/nio/channels/CancelledKeyException
    //   820\011844\011268\011java/nio/channels/CancelledKeyException
    //   844\011870\011268\011java/nio/channels/CancelledKeyException
    //   875\011884\011268\011java/nio/channels/CancelledKeyException
    //   884\011890\011268\011java/nio/channels/CancelledKeyException
    //   103\011171\011273\011java/io/IOException
    //   191\011213\011372\011java/nio/channels/ClosedByInterruptException
    //   213\011265\011372\011java/nio/channels/ClosedByInterruptException
    //   281\011369\011372\011java/nio/channels/ClosedByInterruptException
    //   418\011442\011372\011java/nio/channels/ClosedByInterruptException
    //   442\011529\011372\011java/nio/channels/ClosedByInterruptException
    //   529\011575\011372\011java/nio/channels/ClosedByInterruptException
    //   656\011662\011372\011java/nio/channels/ClosedByInterruptException
    //   667\011676\011372\011java/nio/channels/ClosedByInterruptException
    //   722\011728\011372\011java/nio/channels/ClosedByInterruptException
    //   777\011820\011372\011java/nio/channels/ClosedByInterruptException
    //   820\011844\011372\011java/nio/channels/ClosedByInterruptException
    //   844\011870\011372\011java/nio/channels/ClosedByInterruptException
    //   875\011884\011372\011java/nio/channels/ClosedByInterruptException
    //   884\011890\011372\011java/nio/channels/ClosedByInterruptException
    //   191\011213\011578\011java/io/IOException
    //   213\011265\011578\011java/io/IOException
    //   281\011369\011578\011java/io/IOException
    //   418\011442\011578\011java/io/IOException
    //   529\011575\011578\011java/io/IOException
    //   667\011676\011578\011java/io/IOException
    //   777\011820\011578\011java/io/IOException
    //   875\011884\011578\011java/io/IOException
    //   171\011180\011603\011java/lang/RuntimeException
    //   191\011213\011603\011java/lang/RuntimeException
    //   213\011265\011603\011java/lang/RuntimeException
    //   281\011369\011603\011java/lang/RuntimeException
    //   418\011442\011603\011java/lang/RuntimeException
    //   442\011529\011603\011java/lang/RuntimeException
    //   529\011575\011603\011java/lang/RuntimeException
    //   585\011590\011603\011java/lang/RuntimeException
    //   590\011600\011603\011java/lang/RuntimeException
    //   656\011662\011603\011java/lang/RuntimeException
    //   667\011676\011603\011java/lang/RuntimeException
    //   722\011728\011603\011java/lang/RuntimeException
    //   777\011820\011603\011java/lang/RuntimeException
    //   820\011844\011603\011java/lang/RuntimeException
    //   844\011870\011603\011java/lang/RuntimeException
    //   875\011884\011603\011java/lang/RuntimeException
    //   884\011890\011603\011java/lang/RuntimeException
    //   442\011529\011665\011java/io/IOException
    //   656\011662\011665\011java/io/IOException
    //   722\011728\011665\011java/io/IOException
    //   191\011213\011676\011java/lang/InterruptedException
    //   213\011265\011676\011java/lang/InterruptedException
    //   281\011369\011676\011java/lang/InterruptedException
    //   418\011442\011676\011java/lang/InterruptedException
    //   442\011529\011676\011java/lang/InterruptedException
    //   529\011575\011676\011java/lang/InterruptedException
    //   656\011662\011676\011java/lang/InterruptedException
    //   667\011676\011676\011java/lang/InterruptedException
    //   722\011728\011676\011java/lang/InterruptedException
    //   777\011820\011676\011java/lang/InterruptedException
    //   820\011844\011676\011java/lang/InterruptedException
    //   844\011870\011676\011java/lang/InterruptedException
    //   875\011884\011676\011java/lang/InterruptedException
    //   884\011890\011676\011java/lang/InterruptedException
    //   171\011180\011731\011finally
    //   191\011213\011731\011finally
    //   213\011265\011731\011finally
    //   281\011369\011731\011finally
    //   418\011442\011731\011finally
    //   442\011529\011731\011finally
    //   529\011575\011731\011finally
    //   585\011590\011731\011finally
    //   590\011600\011731\011finally
    //   605\011612\011731\011finally
    //   656\011662\011731\011finally
    //   667\011676\011731\011finally
    //   722\011728\011731\011finally
    //   777\011820\011731\011finally
    //   820\011844\011731\011finally
    //   844\011870\011731\011finally
    //   875\011884\011731\011finally
    //   884\011890\011731\011finally
    //   820\011844\011873\011java/io/IOException
    //   844\011870\011873\011java/io/IOException
    //   884\011890\011873\011java/io/IOException
    //   900\011907\011908\011java/io/IOException
    //   925\011932\011933\011java/io/IOException
    //   994\0111001\0111002\011java/io/IOException
    //   1019\0111026\0111027\011java/io/IOException
    //   1044\0111051\0111054\011java/io/IOException
  }

  public final void setWebSocketFactory(WebSocketServerFactory paramWebSocketServerFactory)
  {
    this.wsf = paramWebSocketServerFactory;
  }

  public void start()
  {
    if (this.selectorthread != null)
      throw new IllegalStateException(getClass().getName() + " can only be started once.");
    new Thread(this).start();
  }

  public void stop()
    throws IOException, InterruptedException
  {
    stop(0);
  }

  // ERROR //
  public void stop(int paramInt)
    throws InterruptedException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 88\011com/mixpanel/android/java_websocket/server/WebSocketServer:isclosed\011Ljava/util/concurrent/atomic/AtomicBoolean;
    //   4: iconst_0
    //   5: iconst_1
    //   6: invokevirtual 614\011java/util/concurrent/atomic/AtomicBoolean:compareAndSet\011(ZZ)Z
    //   9: ifne +4 -> 13
    //   12: return
    //   13: aload_0
    //   14: getfield 119\011com/mixpanel/android/java_websocket/server/WebSocketServer:connections\011Ljava/util/Collection;
    //   17: astore_2
    //   18: aload_2
    //   19: monitorenter
    //   20: new 126\011java/util/ArrayList
    //   23: dup
    //   24: aload_0
    //   25: getfield 119\011com/mixpanel/android/java_websocket/server/WebSocketServer:connections\011Ljava/util/Collection;
    //   28: invokespecial 617\011java/util/ArrayList:<init>\011(Ljava/util/Collection;)V
    //   31: astore_3
    //   32: aload_2
    //   33: monitorexit
    //   34: aload_3
    //   35: invokeinterface 555 1 0
    //   40: astore 5
    //   42: aload 5
    //   44: invokeinterface 515 1 0
    //   49: ifeq +31 -> 80
    //   52: aload 5
    //   54: invokeinterface 518 1 0
    //   59: checkcast 208\011com/mixpanel/android/java_websocket/WebSocket
    //   62: sipush 1001
    //   65: invokeinterface 294 2 0
    //   70: goto -28 -> 42
    //   73: astore 4
    //   75: aload_2
    //   76: monitorexit
    //   77: aload 4
    //   79: athrow
    //   80: aload_0
    //   81: monitorenter
    //   82: aload_0
    //   83: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   86: ifnull +55 -> 141
    //   89: invokestatic 197\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   92: aload_0
    //   93: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   96: if_acmpeq +3 -> 99
    //   99: aload_0
    //   100: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   103: invokestatic 197\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   106: if_acmpeq +35 -> 141
    //   109: aload_3
    //   110: invokeinterface 268 1 0
    //   115: ifle +12 -> 127
    //   118: aload_0
    //   119: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   122: iload_1
    //   123: i2l
    //   124: invokevirtual 621\011java/lang/Thread:join\011(J)V
    //   127: aload_0
    //   128: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   131: invokevirtual 200\011java/lang/Thread:interrupt\011()V
    //   134: aload_0
    //   135: getfield 439\011com/mixpanel/android/java_websocket/server/WebSocketServer:selectorthread\011Ljava/lang/Thread;
    //   138: invokevirtual 623\011java/lang/Thread:join\011()V
    //   141: aload_0
    //   142: monitorexit
    //   143: return
    //   144: astore 6
    //   146: aload_0
    //   147: monitorexit
    //   148: aload 6
    //   150: athrow
    //   151: astore 4
    //   153: goto -78 -> 75
    //
    // Exception table:
    //   from\011to\011target\011type
    //   20\01132\01173\011finally
    //   75\01177\01173\011finally
    //   82\01199\011144\011finally
    //   99\011127\011144\011finally
    //   127\011141\011144\011finally
    //   141\011143\011144\011finally
    //   146\011148\011144\011finally
    //   32\01134\011151\011finally
  }

  public static abstract interface WebSocketServerFactory extends WebSocketFactory
  {
    public abstract WebSocketImpl createWebSocket(WebSocketAdapter paramWebSocketAdapter, Draft paramDraft, Socket paramSocket);

    public abstract WebSocketImpl createWebSocket(WebSocketAdapter paramWebSocketAdapter, List<Draft> paramList, Socket paramSocket);

    public abstract ByteChannel wrapChannel(SocketChannel paramSocketChannel, SelectionKey paramSelectionKey)
      throws IOException;
  }

  public class WebSocketWorker extends Thread
  {
    private BlockingQueue<WebSocketImpl> iqueue = new LinkedBlockingQueue();

    static
    {
      if (!WebSocketServer.class.desiredAssertionStatus());
      for (boolean bool = true; ; bool = false)
      {
        $assertionsDisabled = bool;
        return;
      }
    }

    public WebSocketWorker()
    {
      setName("WebSocketWorker-" + getId());
      setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler()
      {
        public void uncaughtException(Thread paramAnonymousThread, Throwable paramAnonymousThrowable)
        {
          Thread.getDefaultUncaughtExceptionHandler().uncaughtException(paramAnonymousThread, paramAnonymousThrowable);
        }
      });
    }

    public void put(WebSocketImpl paramWebSocketImpl)
      throws InterruptedException
    {
      this.iqueue.put(paramWebSocketImpl);
    }

    // ERROR //
    public void run()
    {
      // Byte code:
      //   0: aconst_null
      //   1: astore_1
      //   2: aload_0
      //   3: getfield 34\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:iqueue\011Ljava/util/concurrent/BlockingQueue;
      //   6: invokeinterface 83 1 0
      //   11: checkcast 85\011com/mixpanel/android/java_websocket/WebSocketImpl
      //   14: astore_1
      //   15: aload_1
      //   16: getfield 88\011com/mixpanel/android/java_websocket/WebSocketImpl:inQueue\011Ljava/util/concurrent/BlockingQueue;
      //   19: invokeinterface 91 1 0
      //   24: checkcast 93\011java/nio/ByteBuffer
      //   27: astore 4
      //   29: getstatic 23\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:$assertionsDisabled\011Z
      //   32: ifne +18 -> 50
      //   35: aload 4
      //   37: ifnonnull +13 -> 50
      //   40: new 95\011java/lang/AssertionError
      //   43: dup
      //   44: invokespecial 96\011java/lang/AssertionError:<init>\011()V
      //   47: athrow
      //   48: astore_3
      //   49: return
      //   50: aload_1
      //   51: aload 4
      //   53: invokevirtual 100\011com/mixpanel/android/java_websocket/WebSocketImpl:decode\011(Ljava/nio/ByteBuffer;)V
      //   56: aload_0
      //   57: getfield 27\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:this$0\011Lcom/mixpanel/android/java_websocket/server/WebSocketServer;
      //   60: aload 4
      //   62: invokestatic 104\011com/mixpanel/android/java_websocket/server/WebSocketServer:access$000\011(Lcom/mixpanel/android/java_websocket/server/WebSocketServer;Ljava/nio/ByteBuffer;)V
      //   65: goto -63 -> 2
      //   68: astore_2
      //   69: aload_0
      //   70: getfield 27\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:this$0\011Lcom/mixpanel/android/java_websocket/server/WebSocketServer;
      //   73: aload_1
      //   74: aload_2
      //   75: invokestatic 108\011com/mixpanel/android/java_websocket/server/WebSocketServer:access$100\011(Lcom/mixpanel/android/java_websocket/server/WebSocketServer;Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
      //   78: return
      //   79: astore 5
      //   81: aload_0
      //   82: getfield 27\011com/mixpanel/android/java_websocket/server/WebSocketServer$WebSocketWorker:this$0\011Lcom/mixpanel/android/java_websocket/server/WebSocketServer;
      //   85: aload 4
      //   87: invokestatic 104\011com/mixpanel/android/java_websocket/server/WebSocketServer:access$000\011(Lcom/mixpanel/android/java_websocket/server/WebSocketServer;Ljava/nio/ByteBuffer;)V
      //   90: aload 5
      //   92: athrow
      //
      // Exception table:
      //   from\011to\011target\011type
      //   2\01135\01148\011java/lang/InterruptedException
      //   40\01148\01148\011java/lang/InterruptedException
      //   56\01165\01148\011java/lang/InterruptedException
      //   81\01193\01148\011java/lang/InterruptedException
      //   2\01135\01168\011java/lang/RuntimeException
      //   40\01148\01168\011java/lang/RuntimeException
      //   56\01165\01168\011java/lang/RuntimeException
      //   81\01193\01168\011java/lang/RuntimeException
      //   50\01156\01179\011finally
    }
  }
}