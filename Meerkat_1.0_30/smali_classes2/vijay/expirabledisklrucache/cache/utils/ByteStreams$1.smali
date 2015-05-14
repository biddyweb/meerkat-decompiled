.class final Lvijay/expirabledisklrucache/cache/utils/ByteStreams$1;
.super Ljava/io/OutputStream;
.source "ByteStreams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/utils/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 541
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 556
    const-string v0, "ByteStreams.nullOutputStream()"

    return-object v0
.end method

.method public write(I)V
    .locals 0
    .param p1, "b"    # I

    .prologue
    .line 544
    return-void
.end method

.method public write([B)V
    .locals 0
    .param p1, "b"    # [B

    .prologue
    .line 547
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    return-void
.end method

.method public write([BII)V
    .locals 0
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 551
    invoke-static {p1}, Lvijay/expirabledisklrucache/cache/utils/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 552
    return-void
.end method
