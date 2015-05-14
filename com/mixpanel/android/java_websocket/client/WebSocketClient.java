package com.mixpanel.android.java_websocket.client;

import com.mixpanel.android.java_websocket.WebSocket;
import com.mixpanel.android.java_websocket.WebSocket.READYSTATE;
import com.mixpanel.android.java_websocket.WebSocketAdapter;
import com.mixpanel.android.java_websocket.WebSocketImpl;
import com.mixpanel.android.java_websocket.drafts.Draft;
import com.mixpanel.android.java_websocket.drafts.Draft_17;
import com.mixpanel.android.java_websocket.exceptions.InvalidHandshakeException;
import com.mixpanel.android.java_websocket.framing.Framedata;
import com.mixpanel.android.java_websocket.framing.Framedata.Opcode;
import com.mixpanel.android.java_websocket.handshake.HandshakeImpl1Client;
import com.mixpanel.android.java_websocket.handshake.Handshakedata;
import com.mixpanel.android.java_websocket.handshake.ServerHandshake;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.Socket;
import java.net.URI;
import java.nio.ByteBuffer;
import java.nio.channels.NotYetConnectedException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.CountDownLatch;

public abstract class WebSocketClient extends WebSocketAdapter
  implements Runnable, WebSocket
{
  private CountDownLatch closeLatch = new CountDownLatch(1);
  private CountDownLatch connectLatch = new CountDownLatch(1);
  private int connectTimeout = 0;
  private Draft draft;
  private WebSocketImpl engine = null;
  private Map<String, String> headers;
  private InputStream istream;
  private OutputStream ostream;
  private Proxy proxy = Proxy.NO_PROXY;
  private Socket socket = null;
  protected URI uri = null;
  private Thread writeThread;

  static
  {
    if (!WebSocketClient.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public WebSocketClient(URI paramURI)
  {
    this(paramURI, new Draft_17());
  }

  public WebSocketClient(URI paramURI, Draft paramDraft)
  {
    this(paramURI, paramDraft, null, 0);
  }

  public WebSocketClient(URI paramURI, Draft paramDraft, Map<String, String> paramMap, int paramInt)
  {
    if (paramURI == null)
      throw new IllegalArgumentException();
    if (paramDraft == null)
      throw new IllegalArgumentException("null as draft is permitted for `WebSocketServer` only!");
    this.uri = paramURI;
    this.draft = paramDraft;
    this.headers = paramMap;
    this.connectTimeout = paramInt;
    this.engine = new WebSocketImpl(this, paramDraft);
  }

  private int getPort()
  {
    int i = this.uri.getPort();
    String str;
    if (i == -1)
    {
      str = this.uri.getScheme();
      if (str.equals("wss"))
        i = 443;
    }
    else
    {
      return i;
    }
    if (str.equals("ws"))
      return 80;
    throw new RuntimeException("unkonow scheme" + str);
  }

  private void sendHandshake()
    throws InvalidHandshakeException
  {
    String str1 = this.uri.getPath();
    String str2 = this.uri.getQuery();
    String str3;
    int i;
    StringBuilder localStringBuilder;
    if ((str1 == null) || (str1.length() == 0))
    {
      str3 = "/";
      if (str2 != null)
        str3 = str3 + "?" + str2;
      i = getPort();
      localStringBuilder = new StringBuilder().append(this.uri.getHost());
      if (i == 80)
        break label226;
    }
    HandshakeImpl1Client localHandshakeImpl1Client;
    label226: for (String str4 = ":" + i; ; str4 = "")
    {
      String str5 = str4;
      localHandshakeImpl1Client = new HandshakeImpl1Client();
      localHandshakeImpl1Client.setResourceDescriptor(str3);
      localHandshakeImpl1Client.put("Host", str5);
      if (this.headers == null)
        break label233;
      Iterator localIterator = this.headers.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localHandshakeImpl1Client.put((String)localEntry.getKey(), (String)localEntry.getValue());
      }
      str3 = str1;
      break;
    }
    label233: this.engine.startHandshake(localHandshakeImpl1Client);
  }

  public void close()
  {
    if (this.writeThread != null)
      this.engine.close(1000);
  }

  public void close(int paramInt)
  {
    this.engine.close();
  }

  public void close(int paramInt, String paramString)
  {
    this.engine.close(paramInt, paramString);
  }

  public void closeBlocking()
    throws InterruptedException
  {
    close();
    this.closeLatch.await();
  }

  public void closeConnection(int paramInt, String paramString)
  {
    this.engine.closeConnection(paramInt, paramString);
  }

  public void connect()
  {
    if (this.writeThread != null)
      throw new IllegalStateException("WebSocketClient objects are not reuseable");
    this.writeThread = new Thread(this);
    this.writeThread.start();
  }

  public boolean connectBlocking()
    throws InterruptedException
  {
    connect();
    this.connectLatch.await();
    return this.engine.isOpen();
  }

  public WebSocket getConnection()
  {
    return this.engine;
  }

  public Draft getDraft()
  {
    return this.draft;
  }

  public InetSocketAddress getLocalSocketAddress()
  {
    return this.engine.getLocalSocketAddress();
  }

  public InetSocketAddress getLocalSocketAddress(WebSocket paramWebSocket)
  {
    if (this.socket != null)
      return (InetSocketAddress)this.socket.getLocalSocketAddress();
    return null;
  }

  public WebSocket.READYSTATE getReadyState()
  {
    return this.engine.getReadyState();
  }

  public InetSocketAddress getRemoteSocketAddress()
  {
    return this.engine.getRemoteSocketAddress();
  }

  public InetSocketAddress getRemoteSocketAddress(WebSocket paramWebSocket)
  {
    if (this.socket != null)
      return (InetSocketAddress)this.socket.getRemoteSocketAddress();
    return null;
  }

  public String getResourceDescriptor()
  {
    return this.uri.getPath();
  }

  public URI getURI()
  {
    return this.uri;
  }

  public boolean hasBufferedData()
  {
    return this.engine.hasBufferedData();
  }

  public boolean isClosed()
  {
    return this.engine.isClosed();
  }

  public boolean isClosing()
  {
    return this.engine.isClosing();
  }

  public boolean isConnecting()
  {
    return this.engine.isConnecting();
  }

  public boolean isFlushAndClose()
  {
    return this.engine.isFlushAndClose();
  }

  public boolean isOpen()
  {
    return this.engine.isOpen();
  }

  public abstract void onClose(int paramInt, String paramString, boolean paramBoolean);

  public void onCloseInitiated(int paramInt, String paramString)
  {
  }

  public void onClosing(int paramInt, String paramString, boolean paramBoolean)
  {
  }

  public abstract void onError(Exception paramException);

  public void onFragment(Framedata paramFramedata)
  {
  }

  public abstract void onMessage(String paramString);

  public void onMessage(ByteBuffer paramByteBuffer)
  {
  }

  public abstract void onOpen(ServerHandshake paramServerHandshake);

  public final void onWebsocketClose(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean)
  {
    this.connectLatch.countDown();
    this.closeLatch.countDown();
    if (this.writeThread != null)
      this.writeThread.interrupt();
    try
    {
      if (this.socket != null)
        this.socket.close();
      onClose(paramInt, paramString, paramBoolean);
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
        onWebsocketError(this, localIOException);
    }
  }

  public void onWebsocketCloseInitiated(WebSocket paramWebSocket, int paramInt, String paramString)
  {
    onCloseInitiated(paramInt, paramString);
  }

  public void onWebsocketClosing(WebSocket paramWebSocket, int paramInt, String paramString, boolean paramBoolean)
  {
    onClosing(paramInt, paramString, paramBoolean);
  }

  public final void onWebsocketError(WebSocket paramWebSocket, Exception paramException)
  {
    onError(paramException);
  }

  public final void onWebsocketMessage(WebSocket paramWebSocket, String paramString)
  {
    onMessage(paramString);
  }

  public final void onWebsocketMessage(WebSocket paramWebSocket, ByteBuffer paramByteBuffer)
  {
    onMessage(paramByteBuffer);
  }

  public void onWebsocketMessageFragment(WebSocket paramWebSocket, Framedata paramFramedata)
  {
    onFragment(paramFramedata);
  }

  public final void onWebsocketOpen(WebSocket paramWebSocket, Handshakedata paramHandshakedata)
  {
    this.connectLatch.countDown();
    onOpen((ServerHandshake)paramHandshakedata);
  }

  public final void onWriteDemand(WebSocket paramWebSocket)
  {
  }

  // ERROR //
  public void run()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   4: ifnonnull +189 -> 193
    //   7: aload_0
    //   8: new 262\011java/net/Socket
    //   11: dup
    //   12: aload_0
    //   13: getfield 70\011com/mixpanel/android/java_websocket/client/WebSocketClient:proxy\011Ljava/net/Proxy;
    //   16: invokespecial 357\011java/net/Socket:<init>\011(Ljava/net/Proxy;)V
    //   19: putfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   22: aload_0
    //   23: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   26: invokevirtual 360\011java/net/Socket:isBound\011()Z
    //   29: ifne +32 -> 61
    //   32: aload_0
    //   33: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   36: new 267\011java/net/InetSocketAddress
    //   39: dup
    //   40: aload_0
    //   41: getfield 59\011com/mixpanel/android/java_websocket/client/WebSocketClient:uri\011Ljava/net/URI;
    //   44: invokevirtual 159\011java/net/URI:getHost\011()Ljava/lang/String;
    //   47: aload_0
    //   48: invokespecial 156\011com/mixpanel/android/java_websocket/client/WebSocketClient:getPort\011()I
    //   51: invokespecial 363\011java/net/InetSocketAddress:<init>\011(Ljava/lang/String;I)V
    //   54: aload_0
    //   55: getfield 81\011com/mixpanel/android/java_websocket/client/WebSocketClient:connectTimeout\011I
    //   58: invokevirtual 366\011java/net/Socket:connect\011(Ljava/net/SocketAddress;I)V
    //   61: aload_0
    //   62: aload_0
    //   63: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   66: invokevirtual 370\011java/net/Socket:getInputStream\011()Ljava/io/InputStream;
    //   69: putfield 372\011com/mixpanel/android/java_websocket/client/WebSocketClient:istream\011Ljava/io/InputStream;
    //   72: aload_0
    //   73: aload_0
    //   74: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   77: invokevirtual 376\011java/net/Socket:getOutputStream\011()Ljava/io/OutputStream;
    //   80: putfield 104\011com/mixpanel/android/java_websocket/client/WebSocketClient:ostream\011Ljava/io/OutputStream;
    //   83: aload_0
    //   84: invokespecial 378\011com/mixpanel/android/java_websocket/client/WebSocketClient:sendHandshake\011()V
    //   87: aload_0
    //   88: new 239\011java/lang/Thread
    //   91: dup
    //   92: new 380\011com/mixpanel/android/java_websocket/client/WebSocketClient$WebsocketWriteThread
    //   95: dup
    //   96: aload_0
    //   97: aconst_null
    //   98: invokespecial 383\011com/mixpanel/android/java_websocket/client/WebSocketClient$WebsocketWriteThread:<init>\011(Lcom/mixpanel/android/java_websocket/client/WebSocketClient;Lcom/mixpanel/android/java_websocket/client/WebSocketClient$1;)V
    //   101: invokespecial 242\011java/lang/Thread:<init>\011(Ljava/lang/Runnable;)V
    //   104: putfield 214\011com/mixpanel/android/java_websocket/client/WebSocketClient:writeThread\011Ljava/lang/Thread;
    //   107: aload_0
    //   108: getfield 214\011com/mixpanel/android/java_websocket/client/WebSocketClient:writeThread\011Ljava/lang/Thread;
    //   111: invokevirtual 245\011java/lang/Thread:start\011()V
    //   114: getstatic 386\011com/mixpanel/android/java_websocket/WebSocketImpl:RCVBUF\011I
    //   117: newarray byte
    //   119: astore_2
    //   120: aload_0
    //   121: invokevirtual 387\011com/mixpanel/android/java_websocket/client/WebSocketClient:isClosed\011()Z
    //   124: ifne +110 -> 234
    //   127: aload_0
    //   128: getfield 372\011com/mixpanel/android/java_websocket/client/WebSocketClient:istream\011Ljava/io/InputStream;
    //   131: aload_2
    //   132: invokevirtual 393\011java/io/InputStream:read\011([B)I
    //   135: istore 5
    //   137: iload 5
    //   139: iconst_m1
    //   140: if_icmpeq +94 -> 234
    //   143: aload_0
    //   144: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   147: aload_2
    //   148: iconst_0
    //   149: iload 5
    //   151: invokestatic 399\011java/nio/ByteBuffer:wrap\011([BII)Ljava/nio/ByteBuffer;
    //   154: invokevirtual 402\011com/mixpanel/android/java_websocket/WebSocketImpl:decode\011(Ljava/nio/ByteBuffer;)V
    //   157: goto -37 -> 120
    //   160: astore 4
    //   162: aload_0
    //   163: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   166: invokevirtual 405\011com/mixpanel/android/java_websocket/WebSocketImpl:eot\011()V
    //   169: getstatic 44\011com/mixpanel/android/java_websocket/client/WebSocketClient:$assertionsDisabled\011Z
    //   172: ifne +61 -> 233
    //   175: aload_0
    //   176: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   179: invokevirtual 406\011java/net/Socket:isClosed\011()Z
    //   182: ifne +51 -> 233
    //   185: new 408\011java/lang/AssertionError
    //   188: dup
    //   189: invokespecial 409\011java/lang/AssertionError:<init>\011()V
    //   192: athrow
    //   193: aload_0
    //   194: getfield 63\011com/mixpanel/android/java_websocket/client/WebSocketClient:socket\011Ljava/net/Socket;
    //   197: invokevirtual 406\011java/net/Socket:isClosed\011()Z
    //   200: ifeq -178 -> 22
    //   203: new 310\011java/io/IOException
    //   206: dup
    //   207: invokespecial 410\011java/io/IOException:<init>\011()V
    //   210: athrow
    //   211: astore_1
    //   212: aload_0
    //   213: aload_0
    //   214: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   217: aload_1
    //   218: invokevirtual 323\011com/mixpanel/android/java_websocket/client/WebSocketClient:onWebsocketError\011(Lcom/mixpanel/android/java_websocket/WebSocket;Ljava/lang/Exception;)V
    //   221: aload_0
    //   222: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   225: iconst_m1
    //   226: aload_1
    //   227: invokevirtual 413\011java/lang/Exception:getMessage\011()Ljava/lang/String;
    //   230: invokevirtual 231\011com/mixpanel/android/java_websocket/WebSocketImpl:closeConnection\011(ILjava/lang/String;)V
    //   233: return
    //   234: aload_0
    //   235: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   238: invokevirtual 405\011com/mixpanel/android/java_websocket/WebSocketImpl:eot\011()V
    //   241: goto -72 -> 169
    //   244: astore_3
    //   245: aload_0
    //   246: aload_3
    //   247: invokevirtual 332\011com/mixpanel/android/java_websocket/client/WebSocketClient:onError\011(Ljava/lang/Exception;)V
    //   250: aload_0
    //   251: getfield 61\011com/mixpanel/android/java_websocket/client/WebSocketClient:engine\011Lcom/mixpanel/android/java_websocket/WebSocketImpl;
    //   254: sipush 1006
    //   257: aload_3
    //   258: invokevirtual 414\011java/lang/RuntimeException:getMessage\011()Ljava/lang/String;
    //   261: invokevirtual 231\011com/mixpanel/android/java_websocket/WebSocketImpl:closeConnection\011(ILjava/lang/String;)V
    //   264: goto -95 -> 169
    //
    // Exception table:
    //   from\011to\011target\011type
    //   120\011137\011160\011java/io/IOException
    //   143\011157\011160\011java/io/IOException
    //   234\011241\011160\011java/io/IOException
    //   0\01122\011211\011java/lang/Exception
    //   22\01161\011211\011java/lang/Exception
    //   61\01187\011211\011java/lang/Exception
    //   193\011211\011211\011java/lang/Exception
    //   120\011137\011244\011java/lang/RuntimeException
    //   143\011157\011244\011java/lang/RuntimeException
    //   234\011241\011244\011java/lang/RuntimeException
  }

  public void send(String paramString)
    throws NotYetConnectedException
  {
    this.engine.send(paramString);
  }

  public void send(ByteBuffer paramByteBuffer)
    throws IllegalArgumentException, NotYetConnectedException
  {
    this.engine.send(paramByteBuffer);
  }

  public void send(byte[] paramArrayOfByte)
    throws NotYetConnectedException
  {
    this.engine.send(paramArrayOfByte);
  }

  public void sendFragmentedFrame(Framedata.Opcode paramOpcode, ByteBuffer paramByteBuffer, boolean paramBoolean)
  {
    this.engine.sendFragmentedFrame(paramOpcode, paramByteBuffer, paramBoolean);
  }

  public void sendFrame(Framedata paramFramedata)
  {
    this.engine.sendFrame(paramFramedata);
  }

  public void setProxy(Proxy paramProxy)
  {
    if (paramProxy == null)
      throw new IllegalArgumentException();
    this.proxy = paramProxy;
  }

  public void setSocket(Socket paramSocket)
  {
    if (this.socket != null)
      throw new IllegalStateException("socket has already been set");
    this.socket = paramSocket;
  }

  private class WebsocketWriteThread
    implements Runnable
  {
    private WebsocketWriteThread()
    {
    }

    public void run()
    {
      Thread.currentThread().setName("WebsocketWriteThread");
      try
      {
        while (!Thread.interrupted())
        {
          ByteBuffer localByteBuffer = (ByteBuffer)WebSocketClient.this.engine.outQueue.take();
          WebSocketClient.this.ostream.write(localByteBuffer.array(), 0, localByteBuffer.limit());
          WebSocketClient.this.ostream.flush();
        }
      }
      catch (IOException localIOException)
      {
        WebSocketClient.this.engine.eot();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
    }
  }
}