.class final Lcom/squareup/mimecraft/Part$Builder$StreamPart;
.super Lcom/squareup/mimecraft/Part$Builder$PartImpl;
.source "Part.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/mimecraft/Part$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "StreamPart"
.end annotation


# instance fields
.field private final buffer:[B

.field private final in:Ljava/io/InputStream;


# direct methods
.method private constructor <init>(Ljava/util/Map;Ljava/io/InputStream;)V
    .locals 1
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/io/InputStream;",
            ")V"
        }
    .end annotation

    .prologue
    .line 226
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1}, Lcom/squareup/mimecraft/Part$Builder$PartImpl;-><init>(Ljava/util/Map;)V

    .line 223
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/squareup/mimecraft/Part$Builder$StreamPart;->buffer:[B

    .line 227
    iput-object p2, p0, Lcom/squareup/mimecraft/Part$Builder$StreamPart;->in:Ljava/io/InputStream;

    .line 228
    return-void
.end method

.method synthetic constructor <init>(Ljava/util/Map;Ljava/io/InputStream;Lcom/squareup/mimecraft/Part$1;)V
    .locals 0
    .param p1, "x0"    # Ljava/util/Map;
    .param p2, "x1"    # Ljava/io/InputStream;
    .param p3, "x2"    # Lcom/squareup/mimecraft/Part$1;

    .prologue
    .line 221
    invoke-direct {p0, p1, p2}, Lcom/squareup/mimecraft/Part$Builder$StreamPart;-><init>(Ljava/util/Map;Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public writeBodyTo(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder$StreamPart;->in:Ljava/io/InputStream;

    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder$StreamPart;->buffer:[B

    invoke-static {v0, p1, v1}, Lcom/squareup/mimecraft/Utils;->copyStream(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V

    .line 232
    return-void
.end method
