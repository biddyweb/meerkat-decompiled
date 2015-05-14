.class public Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;
.super Ljava/lang/Object;
.source "StreamingDrmSessionManager.java"

# interfaces
.implements Lcom/google/android/exoplayer/drm/DrmSessionManager;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x12
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostRequestHandler;,
        Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;,
        Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmEventListener;,
        Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;,
        Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;
    }
.end annotation


# static fields
.field private static final MSG_KEYS:I = 0x1

.field private static final MSG_PROVISION:I


# instance fields
.field final callback:Lcom/google/android/exoplayer/drm/MediaDrmCallback;

.field private final eventHandler:Landroid/os/Handler;

.field private final eventListener:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;

.field private lastException:Ljava/lang/Exception;

.field private mediaCrypto:Landroid/media/MediaCrypto;

.field private final mediaDrm:Landroid/media/MediaDrm;

.field final mediaDrmHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;

.field private mimeType:Ljava/lang/String;

.field private openCount:I

.field private final optionalKeyRequestParameters:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private postRequestHandler:Landroid/os/Handler;

.field final postResponseHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;

.field private provisioningInProgress:Z

.field private requestHandlerThread:Landroid/os/HandlerThread;

.field private schemePsshData:[B

.field private sessionId:[B

.field private state:I

.field final uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Landroid/os/Looper;Lcom/google/android/exoplayer/drm/MediaDrmCallback;Landroid/os/Handler;Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;)V
    .locals 7
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "playbackLooper"    # Landroid/os/Looper;
    .param p3, "callback"    # Lcom/google/android/exoplayer/drm/MediaDrmCallback;
    .param p4, "eventHandler"    # Landroid/os/Handler;
    .param p5, "eventListener"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/UnsupportedSchemeException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 90
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;-><init>(Ljava/util/UUID;Landroid/os/Looper;Lcom/google/android/exoplayer/drm/MediaDrmCallback;Ljava/util/HashMap;Landroid/os/Handler;Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;Landroid/os/Looper;Lcom/google/android/exoplayer/drm/MediaDrmCallback;Ljava/util/HashMap;Landroid/os/Handler;Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;)V
    .locals 3
    .param p1, "uuid"    # Ljava/util/UUID;
    .param p2, "playbackLooper"    # Landroid/os/Looper;
    .param p3, "callback"    # Lcom/google/android/exoplayer/drm/MediaDrmCallback;
    .param p5, "eventHandler"    # Landroid/os/Handler;
    .param p6, "eventListener"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Landroid/os/Looper;",
            "Lcom/google/android/exoplayer/drm/MediaDrmCallback;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/media/UnsupportedSchemeException;
        }
    .end annotation

    .prologue
    .line 107
    .local p4, "optionalKeyRequestParameters":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->uuid:Ljava/util/UUID;

    .line 109
    iput-object p3, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->callback:Lcom/google/android/exoplayer/drm/MediaDrmCallback;

    .line 110
    iput-object p4, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->optionalKeyRequestParameters:Ljava/util/HashMap;

    .line 111
    iput-object p5, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventHandler:Landroid/os/Handler;

    .line 112
    iput-object p6, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventListener:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;

    .line 113
    new-instance v0, Landroid/media/MediaDrm;

    invoke-direct {v0, p1}, Landroid/media/MediaDrm;-><init>(Ljava/util/UUID;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    .line 114
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    new-instance v1, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmEventListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmEventListener;-><init>(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$1;)V

    invoke-virtual {v0, v1}, Landroid/media/MediaDrm;->setOnEventListener(Landroid/media/MediaDrm$OnEventListener;)V

    .line 115
    new-instance v0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;

    invoke-direct {v0, p0, p2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;-><init>(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrmHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;

    .line 116
    new-instance v0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;

    invoke-direct {v0, p0, p2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;-><init>(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postResponseHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;

    .line 117
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    .line 118
    return-void
.end method

.method static synthetic access$100(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;)Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventListener:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;

    return-object v0
.end method

.method static synthetic access$200(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;

    .prologue
    .line 42
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openCount:I

    return v0
.end method

.method static synthetic access$300(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;)I
    .locals 1
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;

    .prologue
    .line 42
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    return v0
.end method

.method static synthetic access$302(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;I)I
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;
    .param p1, "x1"    # I

    .prologue
    .line 42
    iput p1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    return p1
.end method

.method static synthetic access$400(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postKeyRequest()V

    return-void
.end method

.method static synthetic access$500(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;

    .prologue
    .line 42
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postProvisionRequest()V

    return-void
.end method

.method static synthetic access$600(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onProvisionResponse(Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$700(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Ljava/lang/Object;)V
    .locals 0
    .param p0, "x0"    # Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onKeyResponse(Ljava/lang/Object;)V

    return-void
.end method

.method private onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 303
    iput-object p1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->lastException:Ljava/lang/Exception;

    .line 304
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventListener:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$EventListener;

    if-eqz v0, :cond_0

    .line 305
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->eventHandler:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$1;

    invoke-direct {v1, p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$1;-><init>(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Ljava/lang/Exception;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 312
    :cond_0
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    .line 313
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    .line 315
    :cond_1
    return-void
.end method

.method private onKeyResponse(Ljava/lang/Object;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x4

    .line 276
    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    if-eq v1, v3, :cond_0

    .line 292
    .end local p1    # "response":Ljava/lang/Object;
    :goto_0
    return-void

    .line 281
    .restart local p1    # "response":Ljava/lang/Object;
    :cond_0
    instance-of v1, p1, Ljava/lang/Exception;

    if-eqz v1, :cond_1

    .line 282
    check-cast p1, Ljava/lang/Exception;

    .end local p1    # "response":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onKeysError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 287
    .restart local p1    # "response":Ljava/lang/Object;
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    iget-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    check-cast p1, [B

    .end local p1    # "response":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {v1, v2, p1}, Landroid/media/MediaDrm;->provideKeyResponse([B[B)[B

    .line 288
    const/4 v1, 0x4

    iput v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 289
    :catch_0
    move-exception v0

    .line 290
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onKeysError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private onKeysError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 295
    instance-of v0, p1, Landroid/media/NotProvisionedException;

    if-eqz v0, :cond_0

    .line 296
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postProvisionRequest()V

    .line 300
    :goto_0
    return-void

    .line 298
    :cond_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private onProvisionResponse(Ljava/lang/Object;)V
    .locals 4
    .param p1, "response"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x0

    .line 241
    iput-boolean v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->provisioningInProgress:Z

    .line 242
    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    if-eq v1, v3, :cond_0

    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v2, 0x4

    if-eq v1, v2, :cond_0

    .line 262
    .end local p1    # "response":Ljava/lang/Object;
    :goto_0
    return-void

    .line 247
    .restart local p1    # "response":Ljava/lang/Object;
    :cond_0
    instance-of v1, p1, Ljava/lang/Exception;

    if-eqz v1, :cond_1

    .line 248
    check-cast p1, Ljava/lang/Exception;

    .end local p1    # "response":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 253
    .restart local p1    # "response":Ljava/lang/Object;
    :cond_1
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    check-cast p1, [B

    .end local p1    # "response":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {v1, p1}, Landroid/media/MediaDrm;->provideProvisionResponse([B)V

    .line 254
    iget v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    if-ne v1, v3, :cond_2

    .line 255
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openInternal(Z)V
    :try_end_0
    .catch Landroid/media/DeniedByServerException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 259
    :catch_0
    move-exception v0

    .line 260
    .local v0, "e":Landroid/media/DeniedByServerException;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 257
    .end local v0    # "e":Landroid/media/DeniedByServerException;
    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postKeyRequest()V
    :try_end_1
    .catch Landroid/media/DeniedByServerException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private openInternal(Z)V
    .locals 4
    .param p1, "allowProvisioning"    # Z

    .prologue
    .line 216
    :try_start_0
    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v1}, Landroid/media/MediaDrm;->openSession()[B

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    .line 217
    new-instance v1, Landroid/media/MediaCrypto;

    iget-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->uuid:Ljava/util/UUID;

    iget-object v3, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    invoke-direct {v1, v2, v3}, Landroid/media/MediaCrypto;-><init>(Ljava/util/UUID;[B)V

    iput-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaCrypto:Landroid/media/MediaCrypto;

    .line 218
    const/4 v1, 0x3

    iput v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    .line 219
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postKeyRequest()V
    :try_end_0
    .catch Landroid/media/NotProvisionedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 229
    :goto_0
    return-void

    .line 220
    :catch_0
    move-exception v0

    .line 221
    .local v0, "e":Landroid/media/NotProvisionedException;
    if-eqz p1, :cond_0

    .line 222
    invoke-direct {p0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postProvisionRequest()V

    goto :goto_0

    .line 224
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 226
    .end local v0    # "e":Landroid/media/NotProvisionedException;
    :catch_1
    move-exception v0

    .line 227
    .local v0, "e":Ljava/lang/Exception;
    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private postKeyRequest()V
    .locals 8

    .prologue
    .line 267
    :try_start_0
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    iget-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->schemePsshData:[B

    iget-object v3, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mimeType:Ljava/lang/String;

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->optionalKeyRequestParameters:Ljava/util/HashMap;

    invoke-virtual/range {v0 .. v5}, Landroid/media/MediaDrm;->getKeyRequest([B[BLjava/lang/String;ILjava/util/HashMap;)Landroid/media/MediaDrm$KeyRequest;

    move-result-object v7

    .line 269
    .local v7, "keyRequest":Landroid/media/MediaDrm$KeyRequest;
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v7}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Landroid/media/NotProvisionedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    .end local v7    # "keyRequest":Landroid/media/MediaDrm$KeyRequest;
    :goto_0
    return-void

    .line 270
    :catch_0
    move-exception v6

    .line 271
    .local v6, "e":Landroid/media/NotProvisionedException;
    invoke-direct {p0, v6}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onKeysError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private postProvisionRequest()V
    .locals 3

    .prologue
    .line 232
    iget-boolean v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->provisioningInProgress:Z

    if-eqz v1, :cond_0

    .line 238
    :goto_0
    return-void

    .line 235
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->provisioningInProgress:Z

    .line 236
    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v1}, Landroid/media/MediaDrm;->getProvisionRequest()Landroid/media/MediaDrm$ProvisionRequest;

    move-result-object v0

    .line 237
    .local v0, "request":Landroid/media/MediaDrm$ProvisionRequest;
    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 194
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openCount:I

    if-eqz v0, :cond_1

    .line 212
    :cond_0
    :goto_0
    return-void

    .line 197
    :cond_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    .line 198
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->provisioningInProgress:Z

    .line 199
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrmHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$MediaDrmHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 200
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postResponseHandler:Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostResponseHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 201
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 202
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    .line 203
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->requestHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 204
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->requestHandlerThread:Landroid/os/HandlerThread;

    .line 205
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->schemePsshData:[B

    .line 206
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaCrypto:Landroid/media/MediaCrypto;

    .line 207
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->lastException:Ljava/lang/Exception;

    .line 208
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    if-eqz v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    invoke-virtual {v0, v1}, Landroid/media/MediaDrm;->closeSession([B)V

    .line 210
    iput-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->sessionId:[B

    goto :goto_0
.end method

.method public getError()Ljava/lang/Exception;
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->lastException:Ljava/lang/Exception;

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getMediaCrypto()Landroid/media/MediaCrypto;
    .locals 2

    .prologue
    .line 127
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 128
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaCrypto:Landroid/media/MediaCrypto;

    return-object v0
.end method

.method public final getPropertyByteArray(Ljava/lang/String;)[B
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->getPropertyByteArray(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public final getPropertyString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaDrm:Landroid/media/MediaDrm;

    invoke-virtual {v0, p1}, Landroid/media/MediaDrm;->getPropertyString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    return v0
.end method

.method public open(Ljava/util/Map;Ljava/lang/String;)V
    .locals 3
    .param p2, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "psshData":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;[B>;"
    const/4 v2, 0x1

    .line 172
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openCount:I

    if-eq v0, v2, :cond_0

    .line 190
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    if-nez v0, :cond_1

    .line 176
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "DrmRequestHandler"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->requestHandlerThread:Landroid/os/HandlerThread;

    .line 177
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->requestHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 178
    new-instance v0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostRequestHandler;

    iget-object v1, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->requestHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager$PostRequestHandler;-><init>(Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->postRequestHandler:Landroid/os/Handler;

    .line 180
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->schemePsshData:[B

    if-nez v0, :cond_2

    .line 181
    iput-object p2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mimeType:Ljava/lang/String;

    .line 182
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->uuid:Ljava/util/UUID;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->schemePsshData:[B

    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->schemePsshData:[B

    if-nez v0, :cond_2

    .line 184
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Media does not support uuid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->uuid:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->onError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 188
    :cond_2
    const/4 v0, 0x2

    iput v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    .line 189
    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->openInternal(Z)V

    goto :goto_0
.end method

.method public requiresSecureDecoderComponent(Ljava/lang/String;)Z
    .locals 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 135
    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 136
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 138
    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/drm/StreamingDrmSessionManager;->mediaCrypto:Landroid/media/MediaCrypto;

    invoke-virtual {v0, p1}, Landroid/media/MediaCrypto;->requiresSecureDecoderComponent(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
