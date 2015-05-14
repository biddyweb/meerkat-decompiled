.class Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;
.super Ljava/io/OutputStream;
.source "EditorConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/EditorConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WebSocketOutputStream"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;Lcom/mixpanel/android/viewcrawler/EditorConnection$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mixpanel/android/viewcrawler/EditorConnection;
    .param p2, "x1"    # Lcom/mixpanel/android/viewcrawler/EditorConnection$1;

    .prologue
    .line 121
    invoke-direct {p0, p1}, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;-><init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
        }
    .end annotation

    .prologue
    .line 154
    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    # getter for: Lcom/mixpanel/android/viewcrawler/EditorConnection;->mClient:Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;
    invoke-static {v1}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->access$300(Lcom/mixpanel/android/viewcrawler/EditorConnection;)Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;

    move-result-object v1

    sget-object v2, Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;->TEXT:Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;

    # getter for: Lcom/mixpanel/android/viewcrawler/EditorConnection;->EMPTY_BYTE_BUFFER:Ljava/nio/ByteBuffer;
    invoke-static {}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->access$400()Ljava/nio/ByteBuffer;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;->sendFragmentedFrame(Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;Ljava/nio/ByteBuffer;Z)V
    :try_end_0
    .catch Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/mixpanel/android/java_websocket/exceptions/NotSendableException; {:try_start_0 .. :try_end_0} :catch_1

    .line 160
    return-void

    .line 155
    :catch_0
    move-exception v0

    .line 156
    .local v0, "e":Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException;
    new-instance v1, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;

    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-direct {v1, v2, v0}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;-><init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;Ljava/lang/Throwable;)V

    throw v1

    .line 157
    .end local v0    # "e":Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException;
    :catch_1
    move-exception v0

    .line 158
    .local v0, "e":Lcom/mixpanel/android/java_websocket/exceptions/NotSendableException;
    new-instance v1, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;

    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-direct {v1, v2, v0}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;-><init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public write(I)V
    .locals 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 126
    new-array v0, v3, [B

    .line 127
    .local v0, "oneByte":[B
    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 128
    invoke-virtual {p0, v0, v2, v3}, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->write([BII)V

    .line 129
    return-void
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
        }
    .end annotation

    .prologue
    .line 134
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->write([BII)V

    .line 135
    return-void
.end method

.method public write([BII)V
    .locals 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 142
    .local v1, "message":Ljava/nio/ByteBuffer;
    :try_start_0
    iget-object v2, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    # getter for: Lcom/mixpanel/android/viewcrawler/EditorConnection;->mClient:Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;
    invoke-static {v2}, Lcom/mixpanel/android/viewcrawler/EditorConnection;->access$300(Lcom/mixpanel/android/viewcrawler/EditorConnection;)Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;

    move-result-object v2

    sget-object v3, Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;->TEXT:Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v1, v4}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorClient;->sendFragmentedFrame(Lcom/mixpanel/android/java_websocket/framing/Framedata$Opcode;Ljava/nio/ByteBuffer;Z)V
    :try_end_0
    .catch Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/mixpanel/android/java_websocket/exceptions/NotSendableException; {:try_start_0 .. :try_end_0} :catch_1

    .line 148
    return-void

    .line 143
    :catch_0
    move-exception v0

    .line 144
    .local v0, "e":Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException;
    new-instance v2, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-direct {v2, v3, v0}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;-><init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;Ljava/lang/Throwable;)V

    throw v2

    .line 145
    .end local v0    # "e":Lcom/mixpanel/android/java_websocket/exceptions/WebsocketNotConnectedException;
    :catch_1
    move-exception v0

    .line 146
    .local v0, "e":Lcom/mixpanel/android/java_websocket/exceptions/NotSendableException;
    new-instance v2, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;

    iget-object v3, p0, Lcom/mixpanel/android/viewcrawler/EditorConnection$WebSocketOutputStream;->this$0:Lcom/mixpanel/android/viewcrawler/EditorConnection;

    invoke-direct {v2, v3, v0}, Lcom/mixpanel/android/viewcrawler/EditorConnection$EditorConnectionException;-><init>(Lcom/mixpanel/android/viewcrawler/EditorConnection;Ljava/lang/Throwable;)V

    throw v2
.end method
