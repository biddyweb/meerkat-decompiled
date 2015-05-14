.class Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lvijay/expirabledisklrucache/cache/utils/ByteArrayDataOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lvijay/expirabledisklrucache/cache/utils/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayDataOutputStream"
.end annotation


# instance fields
.field final byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

.field final output:Ljava/io/DataOutput;


# direct methods
.method constructor <init>(Ljava/io/ByteArrayOutputStream;)V
    .locals 1
    .param p1, "byteArrayOutputSteam"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 419
    iput-object p1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    .line 420
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    .line 421
    return-void
.end method


# virtual methods
.method public toByteArray()[B
    .locals 1

    .prologue
    .line 536
    iget-object v0, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .locals 2
    .param p1, "b"    # I

    .prologue
    .line 425
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 429
    return-void

    .line 426
    :catch_0
    move-exception v0

    .line 427
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([B)V
    .locals 2
    .param p1, "b"    # [B

    .prologue
    .line 433
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 437
    return-void

    .line 434
    :catch_0
    move-exception v0

    .line 435
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([BII)V
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 441
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2, p3}, Ljava/io/DataOutput;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    return-void

    .line 442
    :catch_0
    move-exception v0

    .line 443
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBoolean(Z)V
    .locals 2
    .param p1, "v"    # Z

    .prologue
    .line 449
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBoolean(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 453
    return-void

    .line 450
    :catch_0
    move-exception v0

    .line 451
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeByte(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 457
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeByte(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 461
    return-void

    .line 458
    :catch_0
    move-exception v0

    .line 459
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBytes(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 465
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBytes(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 469
    return-void

    .line 466
    :catch_0
    move-exception v0

    .line 467
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChar(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 473
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChar(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 477
    return-void

    .line 474
    :catch_0
    move-exception v0

    .line 475
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChars(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 481
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChars(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 485
    return-void

    .line 482
    :catch_0
    move-exception v0

    .line 483
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeDouble(D)V
    .locals 3
    .param p1, "v"    # D

    .prologue
    .line 489
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeDouble(D)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 493
    return-void

    .line 490
    :catch_0
    move-exception v0

    .line 491
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeFloat(F)V
    .locals 2
    .param p1, "v"    # F

    .prologue
    .line 497
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeFloat(F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    return-void

    .line 498
    :catch_0
    move-exception v0

    .line 499
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeInt(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 505
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeInt(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 509
    return-void

    .line 506
    :catch_0
    move-exception v0

    .line 507
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeLong(J)V
    .locals 3
    .param p1, "v"    # J

    .prologue
    .line 513
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeLong(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 517
    return-void

    .line 514
    :catch_0
    move-exception v0

    .line 515
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeShort(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 521
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeShort(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 525
    return-void

    .line 522
    :catch_0
    move-exception v0

    .line 523
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeUTF(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 529
    :try_start_0
    iget-object v1, p0, Lvijay/expirabledisklrucache/cache/utils/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 533
    return-void

    .line 530
    :catch_0
    move-exception v0

    .line 531
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
