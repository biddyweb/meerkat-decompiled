.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;
.source "AbstractDescriptorBox.java"


# static fields
.field private static log:Ljava/util/logging/Logger;


# instance fields
.field protected data:Ljava/nio/ByteBuffer;

.field protected descriptor:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->log:Ljava/util/logging/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractFullBox;-><init>(Ljava/lang/String;)V

    .line 40
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 76
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->parseVersionAndFlags(Ljava/nio/ByteBuffer;)J

    .line 77
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    .line 78
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    :try_start_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 81
    const/4 v1, -0x1

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-static {v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ObjectDescriptorFactory;->createFrom(ILjava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->descriptor:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1

    .line 90
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->log:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "Error parsing ObjectDescriptor"

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 85
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 86
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    sget-object v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->log:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "Error parsing ObjectDescriptor"

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->writeVersionAndFlags(Ljava/nio/ByteBuffer;)V

    .line 49
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 50
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 51
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    add-int/lit8 v0, v0, 0x4

    int-to-long v0, v0

    return-wide v0
.end method

.method public getData()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public getDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->descriptor:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    return-object v0
.end method

.method public getDescriptorAsString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->descriptor:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    invoke-virtual {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setData(Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 71
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->data:Ljava/nio/ByteBuffer;

    .line 72
    return-void
.end method

.method public setDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)V
    .locals 0
    .param p1, "descriptor"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    .prologue
    .line 67
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->descriptor:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    .line 68
    return-void
.end method
