.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
.super Ljava/lang/Object;
.source "XtraBox.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "XtraTag"
.end annotation


# instance fields
.field private inputSize:I

.field private tagName:Ljava/lang/String;

.field private values:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 311
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 312
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    .line 313
    return-void
.end method

.method synthetic constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V
    .locals 0
    .param p1, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;

    .prologue
    .line 305
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>()V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 316
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>()V

    .line 317
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    .line 318
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;

    .prologue
    .line 305
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)I
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .prologue
    .line 305
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContentSize()I

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/util/Vector;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .prologue
    .line 305
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    return-object v0
.end method

.method static synthetic access$200(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;

    .prologue
    .line 305
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    .param p1, "x1"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 305
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->parse(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method static synthetic access$500(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;Ljava/nio/ByteBuffer;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;
    .param p1, "x1"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 305
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContent(Ljava/nio/ByteBuffer;)V

    return-void
.end method

.method private getContent(Ljava/nio/ByteBuffer;)V
    .locals 2
    .param p1, "b"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 337
    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContentSize()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 338
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 339
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->writeAsciiString(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    invoke-static {p1, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->access$1400(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 340
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 341
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 342
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->getContent(Ljava/nio/ByteBuffer;)V
    invoke-static {v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->access$1500(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;Ljava/nio/ByteBuffer;)V

    .line 341
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 344
    :cond_0
    return-void
.end method

.method private getContentSize()I
    .locals 3

    .prologue
    .line 352
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, 0xc

    .line 353
    .local v1, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 354
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->getContentSize()I
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->access$1600(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;)I

    move-result v2

    add-int/2addr v1, v2

    .line 353
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 356
    :cond_0
    return v1
.end method

.method private parse(Ljava/nio/ByteBuffer;)V
    .locals 7
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 321
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    iput v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->inputSize:I

    .line 322
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 323
    .local v2, "tagLength":I
    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->readAsciiString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;
    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox;->access$1100(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    .line 324
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    .line 326
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 327
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$1;)V

    .line 328
    .local v3, "val":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;
    # invokes: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->parse(Ljava/nio/ByteBuffer;)V
    invoke-static {v3, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->access$1300(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;Ljava/nio/ByteBuffer;)V

    .line 329
    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v4, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 326
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 331
    .end local v3    # "val":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;
    :cond_0
    iget v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->inputSize:I

    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContentSize()I

    move-result v5

    if-eq v4, v5, :cond_1

    .line 332
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Improperly handled Xtra tag: Sizes don\'t match ( "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->inputSize:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-direct {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->getContentSize()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ") on "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 334
    :cond_1
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 360
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 361
    .local v0, "b":Ljava/lang/StringBuffer;
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->tagName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 362
    const-string v2, " ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 363
    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->inputSize:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 364
    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 365
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 366
    const-string v2, "]:\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 367
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 368
    const-string v2, "  "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 369
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraTag;->values:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/microsoft/XtraBox$XtraValue;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 370
    const-string v2, "\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 367
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 372
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
