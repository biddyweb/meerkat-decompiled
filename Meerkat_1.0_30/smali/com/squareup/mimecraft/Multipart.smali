.class public final Lcom/squareup/mimecraft/Multipart;
.super Ljava/lang/Object;
.source "Multipart.java"

# interfaces
.implements Lcom/squareup/mimecraft/Part;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/mimecraft/Multipart$1;,
        Lcom/squareup/mimecraft/Multipart$Builder;,
        Lcom/squareup/mimecraft/Multipart$Type;
    }
.end annotation


# instance fields
.field private final boundary:Ljava/lang/String;

.field private final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/squareup/mimecraft/Part;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/squareup/mimecraft/Multipart$Type;Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .param p1, "type"    # Lcom/squareup/mimecraft/Multipart$Type;
    .param p3, "boundary"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/squareup/mimecraft/Multipart$Type;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/mimecraft/Part;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 97
    .local p2, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/mimecraft/Part;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    const-string v0, "Multipart type must not be null."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    iput-object p2, p0, Lcom/squareup/mimecraft/Multipart;->parts:Ljava/util/List;

    .line 101
    const-string v0, "Content-Type"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "multipart/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p1, Lcom/squareup/mimecraft/Multipart$Type;->contentType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; boundary="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/squareup/mimecraft/Multipart;->headers:Ljava/util/Map;

    .line 103
    iput-object p3, p0, Lcom/squareup/mimecraft/Multipart;->boundary:Ljava/lang/String;

    .line 104
    return-void
.end method

.method synthetic constructor <init>(Lcom/squareup/mimecraft/Multipart$Type;Ljava/util/List;Ljava/lang/String;Lcom/squareup/mimecraft/Multipart$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/squareup/mimecraft/Multipart$Type;
    .param p2, "x1"    # Ljava/util/List;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Lcom/squareup/mimecraft/Multipart$1;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2, p3}, Lcom/squareup/mimecraft/Multipart;-><init>(Lcom/squareup/mimecraft/Multipart$Type;Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method private static writeBoundary(Ljava/io/OutputStream;[BZZ)V
    .locals 3
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "boundary"    # [B
    .param p2, "first"    # Z
    .param p3, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0xd

    const/16 v1, 0xa

    const/16 v0, 0x2d

    .line 123
    if-nez p2, :cond_0

    .line 124
    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 125
    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 127
    :cond_0
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 128
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 129
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    .line 130
    if-eqz p3, :cond_1

    .line 131
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 132
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write(I)V

    .line 137
    :goto_0
    return-void

    .line 134
    :cond_1
    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 135
    invoke-virtual {p0, v1}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0
.end method

.method private static writePart(Ljava/io/OutputStream;Lcom/squareup/mimecraft/Part;)V
    .locals 7
    .param p0, "out"    # Ljava/io/OutputStream;
    .param p1, "part"    # Lcom/squareup/mimecraft/Part;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0xd

    const/16 v5, 0xa

    .line 140
    invoke-interface {p1}, Lcom/squareup/mimecraft/Part;->getHeaders()Ljava/util/Map;

    move-result-object v1

    .line 141
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_0

    .line 142
    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 143
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 144
    const/16 v2, 0x3a

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 145
    const/16 v2, 0x20

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    .line 146
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 147
    invoke-virtual {p0, v6}, Ljava/io/OutputStream;->write(I)V

    .line 148
    invoke-virtual {p0, v5}, Ljava/io/OutputStream;->write(I)V

    goto :goto_0

    .line 151
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {p0, v6}, Ljava/io/OutputStream;->write(I)V

    .line 152
    invoke-virtual {p0, v5}, Ljava/io/OutputStream;->write(I)V

    .line 153
    invoke-interface {p1, p0}, Lcom/squareup/mimecraft/Part;->writeBodyTo(Ljava/io/OutputStream;)V

    .line 154
    return-void
.end method


# virtual methods
.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/squareup/mimecraft/Multipart;->headers:Ljava/util/Map;

    return-object v0
.end method

.method public writeBodyTo(Ljava/io/OutputStream;)V
    .locals 6
    .param p1, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 111
    iget-object v3, p0, Lcom/squareup/mimecraft/Multipart;->boundary:Ljava/lang/String;

    const-string v4, "UTF-8"

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 112
    .local v0, "boundary":[B
    const/4 v1, 0x1

    .line 113
    .local v1, "first":Z
    iget-object v3, p0, Lcom/squareup/mimecraft/Multipart;->parts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/squareup/mimecraft/Part;

    .line 114
    .local v2, "part":Lcom/squareup/mimecraft/Part;
    invoke-static {p1, v0, v1, v5}, Lcom/squareup/mimecraft/Multipart;->writeBoundary(Ljava/io/OutputStream;[BZZ)V

    .line 115
    invoke-static {p1, v2}, Lcom/squareup/mimecraft/Multipart;->writePart(Ljava/io/OutputStream;Lcom/squareup/mimecraft/Part;)V

    .line 116
    const/4 v1, 0x0

    .line 117
    goto :goto_0

    .line 118
    .end local v2    # "part":Lcom/squareup/mimecraft/Part;
    :cond_0
    const/4 v3, 0x1

    invoke-static {p1, v0, v5, v3}, Lcom/squareup/mimecraft/Multipart;->writeBoundary(Ljava/io/OutputStream;[BZZ)V

    .line 119
    return-void
.end method
