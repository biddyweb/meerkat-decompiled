.class Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;
.super Ljava/lang/Object;
.source "AudioSampleEntry.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

.field final synthetic val$owmaSpecifics:Ljava/nio/ByteBuffer;

.field final synthetic val$remaining:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 246
    const-class v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method constructor <init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;JLjava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    .prologue
    .line 246
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    iput-wide p2, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->val$remaining:J

    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->val$owmaSpecifics:Ljava/nio/ByteBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBox(Ljava/nio/channels/WritableByteChannel;)V
    .locals 1
    .param p1, "writableByteChannel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 268
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->val$owmaSpecifics:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 269
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->val$owmaSpecifics:Ljava/nio/ByteBuffer;

    invoke-interface {p1, v0}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 270
    return-void
.end method

.method public getOffset()J
    .locals 2

    .prologue
    .line 260
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getParent()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 256
    iget-wide v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->val$remaining:J

    return-wide v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 264
    const-string v0, "----"

    return-object v0
.end method

.method public parse(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/nio/ByteBuffer;JLco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;)V
    .locals 2
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "header"    # Ljava/nio/ByteBuffer;
    .param p3, "contentSize"    # J
    .param p5, "boxParser"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/BoxParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "NotImplemented"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setParent(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 2
    .param p1, "parent"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 252
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry$1;->this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    if-eq p1, v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "you cannot diswown this special box"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 253
    :cond_0
    return-void
.end method
