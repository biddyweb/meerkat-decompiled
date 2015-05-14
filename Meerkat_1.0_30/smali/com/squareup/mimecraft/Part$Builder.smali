.class public Lcom/squareup/mimecraft/Part$Builder;
.super Ljava/lang/Object;
.source "Part.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/mimecraft/Part;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/mimecraft/Part$Builder$FilePart;,
        Lcom/squareup/mimecraft/Part$Builder$StreamPart;,
        Lcom/squareup/mimecraft/Part$Builder$BytesPart;,
        Lcom/squareup/mimecraft/Part$Builder$PartPart;,
        Lcom/squareup/mimecraft/Part$Builder$PartImpl;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x1000


# instance fields
.field private bodyBytes:[B

.field private bodyFile:Ljava/io/File;

.field private bodyMultipart:Lcom/squareup/mimecraft/Multipart;

.field private bodyStream:Ljava/io/InputStream;

.field private hasBody:Z

.field private headerDisposition:Ljava/lang/String;

.field private headerEncoding:Ljava/lang/String;

.field private headerLanguage:Ljava/lang/String;

.field headerLength:I

.field private headerType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/squareup/mimecraft/Part$Builder;->hasBody:Z

    .line 235
    return-void
.end method

.method private checkSetBody()V
    .locals 2

    .prologue
    .line 46
    iget-boolean v0, p0, Lcom/squareup/mimecraft/Part$Builder;->hasBody:Z

    if-eqz v0, :cond_0

    .line 47
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Only one body per part."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/squareup/mimecraft/Part$Builder;->hasBody:Z

    .line 50
    return-void
.end method


# virtual methods
.method public body(Lcom/squareup/mimecraft/Multipart;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "body"    # Lcom/squareup/mimecraft/Multipart;

    .prologue
    .line 137
    const-string v0, "Multipart body must not be null."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 139
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Content type must not be explicitly set for multipart body."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_0
    invoke-direct {p0}, Lcom/squareup/mimecraft/Part$Builder;->checkSetBody()V

    .line 143
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    .line 144
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyMultipart:Lcom/squareup/mimecraft/Multipart;

    .line 145
    return-object p0
.end method

.method public body(Ljava/io/File;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 1
    .param p1, "body"    # Ljava/io/File;

    .prologue
    .line 97
    const-string v0, "File body must not be null."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 98
    invoke-direct {p0}, Lcom/squareup/mimecraft/Part$Builder;->checkSetBody()V

    .line 99
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyFile:Ljava/io/File;

    .line 100
    return-object p0
.end method

.method public body(Ljava/io/InputStream;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 1
    .param p1, "body"    # Ljava/io/InputStream;

    .prologue
    .line 105
    const-string v0, "Stream body must not be null."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 106
    invoke-direct {p0}, Lcom/squareup/mimecraft/Part$Builder;->checkSetBody()V

    .line 107
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyStream:Ljava/io/InputStream;

    .line 108
    return-object p0
.end method

.method public body(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 5
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 113
    const-string v2, "String body must not be null."

    invoke-static {p1, v2}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 114
    invoke-direct {p0}, Lcom/squareup/mimecraft/Part$Builder;->checkSetBody()V

    .line 117
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 121
    .local v0, "bytes":[B
    iput-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyBytes:[B

    .line 122
    array-length v2, v0

    iput v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    .line 123
    return-object p0

    .line 118
    .end local v0    # "bytes":[B
    :catch_0
    move-exception v1

    .line 119
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to convert input to UTF-8: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public body([B)Lcom/squareup/mimecraft/Part$Builder;
    .locals 1
    .param p1, "body"    # [B

    .prologue
    .line 128
    const-string v0, "Byte array body must not be null."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 129
    invoke-direct {p0}, Lcom/squareup/mimecraft/Part$Builder;->checkSetBody()V

    .line 130
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyBytes:[B

    .line 131
    array-length v0, p1

    iput v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    .line 132
    return-object p0
.end method

.method public build()Lcom/squareup/mimecraft/Part;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 150
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 151
    .local v0, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerDisposition:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 152
    const-string v1, "Content-Disposition"

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerDisposition:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    :cond_0
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 155
    const-string v1, "Content-Type"

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_1
    iget v1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    if-eqz v1, :cond_2

    .line 158
    const-string v1, "Content-Length"

    iget v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    :cond_2
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLanguage:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 161
    const-string v1, "Content-Language"

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLanguage:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    :cond_3
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerEncoding:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 164
    const-string v1, "Content-Transfer-Encoding"

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->headerEncoding:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_4
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyBytes:[B

    if-eqz v1, :cond_5

    .line 168
    new-instance v1, Lcom/squareup/mimecraft/Part$Builder$BytesPart;

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyBytes:[B

    invoke-direct {v1, v0, v2}, Lcom/squareup/mimecraft/Part$Builder$BytesPart;-><init>(Ljava/util/Map;[B)V

    .line 178
    :goto_0
    return-object v1

    .line 170
    :cond_5
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyStream:Ljava/io/InputStream;

    if-eqz v1, :cond_6

    .line 171
    new-instance v1, Lcom/squareup/mimecraft/Part$Builder$StreamPart;

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyStream:Ljava/io/InputStream;

    invoke-direct {v1, v0, v2, v3}, Lcom/squareup/mimecraft/Part$Builder$StreamPart;-><init>(Ljava/util/Map;Ljava/io/InputStream;Lcom/squareup/mimecraft/Part$1;)V

    goto :goto_0

    .line 173
    :cond_6
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyFile:Ljava/io/File;

    if-eqz v1, :cond_7

    .line 174
    new-instance v1, Lcom/squareup/mimecraft/Part$Builder$FilePart;

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyFile:Ljava/io/File;

    invoke-direct {v1, v0, v2, v3}, Lcom/squareup/mimecraft/Part$Builder$FilePart;-><init>(Ljava/util/Map;Ljava/io/File;Lcom/squareup/mimecraft/Part$1;)V

    goto :goto_0

    .line 176
    :cond_7
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyMultipart:Lcom/squareup/mimecraft/Multipart;

    if-eqz v1, :cond_8

    .line 177
    iget-object v1, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyMultipart:Lcom/squareup/mimecraft/Multipart;

    invoke-virtual {v1}, Lcom/squareup/mimecraft/Multipart;->getHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 178
    new-instance v1, Lcom/squareup/mimecraft/Part$Builder$PartPart;

    iget-object v2, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyMultipart:Lcom/squareup/mimecraft/Multipart;

    invoke-direct {v1, v0, v2}, Lcom/squareup/mimecraft/Part$Builder$PartPart;-><init>(Ljava/util/Map;Lcom/squareup/mimecraft/Part;)V

    goto :goto_0

    .line 180
    :cond_8
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Part required body to be set."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public contentDisposition(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "disposition"    # Ljava/lang/String;

    .prologue
    .line 89
    const-string v0, "Disposition must not be empty."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerDisposition:Ljava/lang/String;

    const-string v1, "Disposition header already set."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerDisposition:Ljava/lang/String;

    .line 92
    return-object p0
.end method

.method public contentEncoding(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 81
    const-string v0, "Encoding must not be empty."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerEncoding:Ljava/lang/String;

    const-string v1, "Encoding header already set."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerEncoding:Ljava/lang/String;

    .line 84
    return-object p0
.end method

.method public contentLanguage(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 73
    const-string v0, "Language must not be empty."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLanguage:Ljava/lang/String;

    const-string v1, "Language header already set."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLanguage:Ljava/lang/String;

    .line 76
    return-object p0
.end method

.method public contentLength(I)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "length"    # I

    .prologue
    .line 63
    if-gtz p1, :cond_0

    .line 64
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Length must be greater than zero."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_0
    iget v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    const-string v1, "Length header already set."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNotZero(ILjava/lang/String;)V

    .line 67
    iput p1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerLength:I

    .line 68
    return-object p0
.end method

.method public contentType(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 54
    const-string v0, "Type must not be empty."

    invoke-static {p1, v0}, Lcom/squareup/mimecraft/Utils;->isNotEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    const-string v1, "Type header already set."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lcom/squareup/mimecraft/Part$Builder;->bodyMultipart:Lcom/squareup/mimecraft/Multipart;

    const-string v1, "Type cannot be set with multipart body."

    invoke-static {v0, v1}, Lcom/squareup/mimecraft/Utils;->isNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    iput-object p1, p0, Lcom/squareup/mimecraft/Part$Builder;->headerType:Ljava/lang/String;

    .line 58
    return-object p0
.end method
