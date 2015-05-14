.class public final Lcom/instabug/library/network/toolbox/a;
.super Lcom/android/volley/Request;
.source "MultiPartRequest.java"


# instance fields
.field private final a:Lcom/android/volley/Response$Listener;

.field private b:Ljava/util/Map;

.field private c:Ljava/util/Map;

.field private d:Lcom/squareup/mimecraft/Multipart;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x1

    invoke-direct {p0, v0, p2, p4}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 29
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/network/toolbox/a;->b:Ljava/util/Map;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/network/toolbox/a;->c:Ljava/util/Map;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 48
    iput-object p3, p0, Lcom/instabug/library/network/toolbox/a;->a:Lcom/android/volley/Response$Listener;

    .line 49
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .prologue
    .line 98
    new-instance v0, Lcom/squareup/mimecraft/Multipart$Builder;

    invoke-direct {v0}, Lcom/squareup/mimecraft/Multipart$Builder;-><init>()V

    sget-object v1, Lcom/squareup/mimecraft/Multipart$Type;->FORM:Lcom/squareup/mimecraft/Multipart$Type;

    invoke-virtual {v0, v1}, Lcom/squareup/mimecraft/Multipart$Builder;->type(Lcom/squareup/mimecraft/Multipart$Type;)Lcom/squareup/mimecraft/Multipart$Builder;

    move-result-object v3

    .line 101
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->b:Ljava/util/Map;

    .line 102
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v1, "Key = "

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/String;)V

    .line 104
    const-string v2, "application/octet-stream"

    .line 105
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v5, ".png"

    invoke-virtual {v1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 106
    const-string v1, "image/png"

    move-object v2, v1

    .line 108
    :cond_0
    new-instance v5, Lcom/squareup/mimecraft/Part$Builder;

    invoke-direct {v5}, Lcom/squareup/mimecraft/Part$Builder;-><init>()V

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v1, "file; name=\"file\"; filename=\""

    invoke-direct {v6, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, "\""

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Lcom/squareup/mimecraft/Part$Builder;->contentDisposition(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v1

    .line 111
    invoke-virtual {v1, v2}, Lcom/squareup/mimecraft/Part$Builder;->contentType(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v1

    .line 112
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-virtual {v1, v0}, Lcom/squareup/mimecraft/Part$Builder;->body(Ljava/io/File;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/mimecraft/Part$Builder;->build()Lcom/squareup/mimecraft/Part;

    move-result-object v0

    .line 108
    invoke-virtual {v3, v0}, Lcom/squareup/mimecraft/Multipart$Builder;->addPart(Lcom/squareup/mimecraft/Part;)Lcom/squareup/mimecraft/Multipart$Builder;

    goto/16 :goto_0

    .line 117
    :cond_1
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->c:Ljava/util/Map;

    .line 118
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 119
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v1, "Key = "

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, ", Value = "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/instabug/library/Instabug$a;->b(Ljava/lang/String;)V

    .line 122
    :try_start_0
    new-instance v4, Lcom/squareup/mimecraft/Part$Builder;

    invoke-direct {v4}, Lcom/squareup/mimecraft/Part$Builder;-><init>()V

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v1, "form-data; name=\""

    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v5, "\";"

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/squareup/mimecraft/Part$Builder;->contentDisposition(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v1

    const-string v4, "text/plain"

    .line 125
    invoke-virtual {v1, v4}, Lcom/squareup/mimecraft/Part$Builder;->contentType(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v1

    .line 126
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/squareup/mimecraft/Part$Builder;->body(Ljava/lang/String;)Lcom/squareup/mimecraft/Part$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/squareup/mimecraft/Part$Builder;->build()Lcom/squareup/mimecraft/Part;

    move-result-object v0

    .line 122
    invoke-virtual {v3, v0}, Lcom/squareup/mimecraft/Multipart$Builder;->addPart(Lcom/squareup/mimecraft/Part;)Lcom/squareup/mimecraft/Multipart$Builder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 127
    :catch_0
    move-exception v0

    .line 128
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 132
    :cond_2
    invoke-virtual {v3}, Lcom/squareup/mimecraft/Multipart$Builder;->build()Lcom/squareup/mimecraft/Multipart;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/network/toolbox/a;->d:Lcom/squareup/mimecraft/Multipart;

    .line 133
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/io/File;)V
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->b:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->c:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    return-void
.end method

.method protected final synthetic deliverResponse(Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 25
    check-cast p1, Lorg/json/JSONObject;

    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->a:Lcom/android/volley/Response$Listener;

    invoke-interface {v0, p1}, Lcom/android/volley/Response$Listener;->onResponse(Ljava/lang/Object;)V

    return-void
.end method

.method public final getBody()[B
    .locals 2

    .prologue
    .line 140
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 143
    :try_start_0
    iget-object v1, p0, Lcom/instabug/library/network/toolbox/a;->d:Lcom/squareup/mimecraft/Multipart;

    invoke-virtual {v1, v0}, Lcom/squareup/mimecraft/Multipart;->writeBodyTo(Ljava/io/OutputStream;)V

    .line 144
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 149
    :goto_0
    return-object v0

    .line 145
    :catch_0
    move-exception v0

    .line 146
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 149
    invoke-super {p0}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v0

    goto :goto_0
.end method

.method public final getBodyContentType()Ljava/lang/String;
    .locals 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->d:Lcom/squareup/mimecraft/Multipart;

    invoke-virtual {v0}, Lcom/squareup/mimecraft/Multipart;->getHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public final getHeaders()Ljava/util/Map;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/instabug/library/network/toolbox/a;->d:Lcom/squareup/mimecraft/Multipart;

    invoke-virtual {v0}, Lcom/squareup/mimecraft/Multipart;->getHeaders()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method protected final getParamsEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    const-string v0, "utf-8"

    return-object v0
.end method

.method protected final parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 3

    .prologue
    .line 85
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/android/volley/NetworkResponse;->data:[B

    iget-object v2, p1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    .line 86
    invoke-static {v2}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCharset(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 87
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v0

    .line 87
    invoke-static {v1, v0}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 92
    :goto_0
    return-object v0

    .line 89
    :catch_0
    move-exception v0

    .line 90
    new-instance v1, Lcom/android/volley/ParseError;

    invoke-direct {v1, v0}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v1}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v0

    goto :goto_0

    .line 91
    :catch_1
    move-exception v0

    .line 92
    new-instance v1, Lcom/android/volley/ParseError;

    invoke-direct {v1, v0}, Lcom/android/volley/ParseError;-><init>(Ljava/lang/Throwable;)V

    invoke-static {v1}, Lcom/android/volley/Response;->error(Lcom/android/volley/VolleyError;)Lcom/android/volley/Response;

    move-result-object v0

    goto :goto_0
.end method
