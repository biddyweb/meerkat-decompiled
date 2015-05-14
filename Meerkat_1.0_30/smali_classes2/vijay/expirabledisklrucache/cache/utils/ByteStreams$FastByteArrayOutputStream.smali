.class final Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "ByteStreams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/utils/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FastByteArrayOutputStream"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 196
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;)V
    .locals 0
    .param p1, "x0"    # Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;

    .prologue
    .line 196
    invoke-direct {p0}, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method writeTo([BI)V
    .locals 3
    .param p1, "b"    # [B
    .param p2, "off"    # I

    .prologue
    .line 203
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;->buf:[B

    const/4 v1, 0x0

    iget v2, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$FastByteArrayOutputStream;->count:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 204
    return-void
.end method
