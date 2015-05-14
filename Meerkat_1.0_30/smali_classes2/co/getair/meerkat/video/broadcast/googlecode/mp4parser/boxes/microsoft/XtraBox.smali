.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "XtraBox.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;,
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    }
.end annotation


# static fields
.field private static final FILETIME_EPOCH_DIFF:J = 0xa9730b66800L

.field private static final FILETIME_ONE_MILLISECOND:J = 0x2710L

.field public static final MP4_XTRA_BT_FILETIME:I = 0x15

.field public static final MP4_XTRA_BT_GUID:I = 0x48

.field public static final MP4_XTRA_BT_INT64:I = 0x13

.field public static final MP4_XTRA_BT_UNICODE:I = 0x8

.field public static final TYPE:Ljava/lang/String; = "Xtra"


# instance fields
.field data:Ljava/nio/ByteBuffer;

.field private successfulParse:Z

.field tags:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 62
    const-string v0, "Xtra"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    .line 68
    return-void
.end method

.method static synthetic access$1100(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # I

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->readAsciiString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1400(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->writeAsciiString(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1700(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # I

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->readUtf16String(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(J)J
    .locals 2
    .param p0, "x0"    # J

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->filetimeToMillis(J)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$1900(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/nio/ByteBuffer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->writeUtf16String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2000(J)J
    .locals 2
    .param p0, "x0"    # J

    .prologue
    .line 47
    invoke-static {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->millisToFiletime(J)J

    move-result-wide v0

    return-wide v0
.end method

.method private detailSize()I
    .locals 3

    .prologue
    .line 80
    const/4 v1, 0x0

    .line 81
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 82
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContentSize()I
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)I

    move-result v2

    add-int/2addr v1, v2

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    :cond_0
    return v1
.end method

.method private static filetimeToMillis(J)J
    .locals 4
    .param p0, "filetime"    # J

    .prologue
    .line 515
    const-wide/16 v0, 0x2710

    div-long v0, p0, v0

    const-wide v2, 0xa9730b66800L

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method private getTagByName(Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 297
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .line 298
    .local v0, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 302
    .end local v0    # "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static millisToFiletime(J)J
    .locals 4
    .param p0, "millis"    # J

    .prologue
    .line 519
    const-wide v0, 0xa9730b66800L

    add-long/2addr v0, p0

    const-wide/16 v2, 0x2710

    mul-long/2addr v0, v2

    return-wide v0
.end method

.method private static readAsciiString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    .locals 4
    .param p0, "content"    # Ljava/nio/ByteBuffer;
    .param p1, "length"    # I

    .prologue
    .line 531
    new-array v1, p1, [B

    .line 532
    .local v1, "s":[B
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 534
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "US-ASCII"

    invoke-direct {v2, v1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 535
    :catch_0
    move-exception v0

    .line 536
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Shouldn\'t happen"

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static readUtf16String(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    .locals 3
    .param p0, "content"    # Ljava/nio/ByteBuffer;
    .param p1, "length"    # I

    .prologue
    .line 542
    div-int/lit8 v2, p1, 0x2

    add-int/lit8 v2, v2, -0x1

    new-array v1, v2, [C

    .line 543
    .local v1, "s":[C
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    div-int/lit8 v2, p1, 0x2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_0

    .line 544
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getChar()C

    move-result v2

    aput-char v2, v1, v0

    .line 543
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 546
    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getChar()C

    .line 547
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v1}, Ljava/lang/String;-><init>([C)V

    return-object v2
.end method

.method private static writeAsciiString(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 3
    .param p0, "dest"    # Ljava/nio/ByteBuffer;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 524
    :try_start_0
    const-string v1, "US-ASCII"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 528
    return-void

    .line 525
    :catch_0
    move-exception v0

    .line 526
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Shouldn\'t happen"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static writeUtf16String(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 3
    .param p0, "dest"    # Ljava/nio/ByteBuffer;
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 551
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 552
    .local v0, "ar":[C
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 553
    aget-char v2, v0, v1

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 552
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 555
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->putChar(C)Ljava/nio/ByteBuffer;

    .line 556
    return-void
.end method


# virtual methods
.method public _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    const/4 v5, 0x0

    .line 109
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    .line 110
    .local v0, "boxSize":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->data:Ljava/nio/ByteBuffer;

    .line 111
    iput-boolean v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    .line 113
    :try_start_0
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->clear()V

    .line 114
    :goto_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    if-lez v4, :cond_0

    .line 115
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    .line 116
    .local v3, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->parse(Ljava/nio/ByteBuffer;)V
    invoke-static {v3, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$400(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;Ljava/nio/ByteBuffer;)V

    .line 117
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 124
    .end local v3    # "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    :catch_0
    move-exception v2

    .line 125
    .local v2, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    :try_start_1
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    .line 126
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Malformed Xtra Tag detected: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 128
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 132
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_1
    return-void

    .line 119
    :cond_0
    :try_start_2
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->detailSize()I

    move-result v1

    .line 120
    .local v1, "calcSize":I
    if-eq v0, v1, :cond_1

    .line 121
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Improperly handled Xtra tag: Calculated sizes don\'t match ( "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 130
    .end local v1    # "calcSize":I
    :catchall_0
    move-exception v4

    sget-object v5, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    throw v4

    .line 123
    .restart local v1    # "calcSize":I
    :cond_1
    const/4 v4, 0x1

    :try_start_3
    iput-boolean v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 130
    sget-object v4, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method

.method public getAllTagNames()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 152
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v1, v3, [Ljava/lang/String;

    .line 153
    .local v1, "names":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 154
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .line 155
    .local v2, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v0

    .line 153
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 157
    .end local v2    # "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    :cond_0
    return-object v1
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 136
    iget-boolean v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    if-eqz v1, :cond_0

    .line 137
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 138
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContent(Ljava/nio/ByteBuffer;)V
    invoke-static {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$500(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;Ljava/nio/ByteBuffer;)V

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    .end local v0    # "i":I
    :cond_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 142
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 144
    :cond_1
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 72
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->successfulParse:Z

    if-eqz v0, :cond_0

    .line 73
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->detailSize()I

    move-result v0

    int-to-long v0, v0

    .line 75
    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    int-to-long v0, v0

    goto :goto_0
.end method

.method public getFirstDateValue(Ljava/lang/String;)Ljava/util/Date;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 184
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->getValues(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v1

    .line 185
    .local v1, "objs":[Ljava/lang/Object;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 186
    .local v0, "obj":Ljava/lang/Object;
    instance-of v4, v0, Ljava/util/Date;

    if-eqz v4, :cond_0

    .line 187
    check-cast v0, Ljava/util/Date;

    .line 190
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_1
    return-object v0

    .line 185
    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 190
    .end local v0    # "obj":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getFirstLongValue(Ljava/lang/String;)Ljava/lang/Long;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 201
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->getValues(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v1

    .line 202
    .local v1, "objs":[Ljava/lang/Object;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 203
    .local v0, "obj":Ljava/lang/Object;
    instance-of v4, v0, Ljava/lang/Long;

    if-eqz v4, :cond_0

    .line 204
    check-cast v0, Ljava/lang/Long;

    .line 207
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_1
    return-object v0

    .line 202
    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 207
    .end local v0    # "obj":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getFirstStringValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 167
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->getValues(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v1

    .line 168
    .local v1, "objs":[Ljava/lang/Object;
    array-length v3, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 169
    .local v0, "obj":Ljava/lang/Object;
    instance-of v4, v0, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 170
    check-cast v0, Ljava/lang/String;

    .line 173
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_1
    return-object v0

    .line 168
    .restart local v0    # "obj":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 173
    .end local v0    # "obj":Ljava/lang/Object;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getValues(Ljava/lang/String;)[Ljava/lang/Object;
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 217
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->getTagByName(Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    move-result-object v1

    .line 219
    .local v1, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    if-eqz v1, :cond_0

    .line 220
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    new-array v2, v3, [Ljava/lang/Object;

    .line 221
    .local v2, "values":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v0, v3, :cond_1

    .line 222
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->getValueAsObject()Ljava/lang/Object;
    invoke-static {v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->access$600(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v0

    .line 221
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 225
    .end local v0    # "i":I
    .end local v2    # "values":[Ljava/lang/Object;
    :cond_0
    const/4 v3, 0x0

    new-array v2, v3, [Ljava/lang/Object;

    .line 227
    .restart local v2    # "values":[Ljava/lang/Object;
    :cond_1
    return-object v2
.end method

.method public removeTag(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 237
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->getTagByName(Ljava/lang/String;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    move-result-object v0

    .line 238
    .local v0, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    if-eqz v0, :cond_0

    .line 239
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 241
    :cond_0
    return-void
.end method

.method public setTagValue(Ljava/lang/String;J)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    const/4 v3, 0x0

    .line 290
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->removeTag(Ljava/lang/String;)V

    .line 291
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    invoke-direct {v0, p1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    .line 292
    .local v0, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    invoke-direct {v2, p2, p3, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;-><init>(JLco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 293
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 294
    return-void
.end method

.method public setTagValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 266
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-virtual {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->setTagValues(Ljava/lang/String;[Ljava/lang/String;)V

    .line 267
    return-void
.end method

.method public setTagValue(Ljava/lang/String;Ljava/util/Date;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    const/4 v3, 0x0

    .line 277
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->removeTag(Ljava/lang/String;)V

    .line 278
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    invoke-direct {v0, p1, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    .line 279
    .local v0, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v1

    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    invoke-direct {v2, p2, v3}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;-><init>(Ljava/util/Date;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    invoke-virtual {v1, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 280
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 281
    return-void
.end method

.method public setTagValues(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 250
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->removeTag(Ljava/lang/String;)V

    .line 251
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    invoke-direct {v1, p1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    .line 252
    .local v1, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p2

    if-ge v0, v2, :cond_0

    .line 253
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v2

    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    aget-object v4, p2, v0

    invoke-direct {v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;-><init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 255
    :cond_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 256
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 89
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->isParsed()Z

    move-result v3

    if-nez v3, :cond_0

    .line 90
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->parseDetails()V

    .line 92
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 93
    .local v0, "b":Ljava/lang/StringBuffer;
    const-string v3, "XtraBox["

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->tags:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .line 95
    .local v1, "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    .line 96
    .local v2, "value":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;
    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;
    invoke-static {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    const-string v5, "="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 99
    const-string v5, ";"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 102
    .end local v1    # "tag":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    .end local v2    # "value":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;
    :cond_2
    const-string v3, "]"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
