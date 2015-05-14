.class Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;
.super Lio/fabric/sdk/android/services/common/AbstractSpiCall;
.source "DefaultSessionAnalyticsFilesSender.java"

# interfaces
.implements Lio/fabric/sdk/android/services/events/FilesSender;


# static fields
.field static final FILE_CONTENT_TYPE:Ljava/lang/String; = "application/vnd.crashlytics.android.events"

.field static final FILE_PARAM_NAME:Ljava/lang/String; = "session_analytics_file_"


# instance fields
.field private final apiKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;Ljava/lang/String;)V
    .locals 7
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;
    .param p2, "protocolAndHostOverride"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "requestFactory"    # Lio/fabric/sdk/android/services/network/HttpRequestFactory;
    .param p5, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 27
    sget-object v6, Lio/fabric/sdk/android/services/network/HttpMethod;->POST:Lio/fabric/sdk/android/services/network/HttpMethod;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpMethod;)V

    .line 28
    return-void
.end method

.method constructor <init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpMethod;)V
    .locals 6
    .param p1, "kit"    # Lio/fabric/sdk/android/Kit;
    .param p2, "protocolAndHostOverride"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "requestFactory"    # Lio/fabric/sdk/android/services/network/HttpRequestFactory;
    .param p5, "apiKey"    # Ljava/lang/String;
    .param p6, "method"    # Lio/fabric/sdk/android/services/network/HttpMethod;

    .prologue
    .line 41
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p6

    invoke-direct/range {v0 .. v5}, Lio/fabric/sdk/android/services/common/AbstractSpiCall;-><init>(Lio/fabric/sdk/android/Kit;Ljava/lang/String;Ljava/lang/String;Lio/fabric/sdk/android/services/network/HttpRequestFactory;Lio/fabric/sdk/android/services/network/HttpMethod;)V

    .line 42
    iput-object p5, p0, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->apiKey:Ljava/lang/String;

    .line 43
    return-void
.end method

.method private applyHeadersTo(Lio/fabric/sdk/android/services/network/HttpRequest;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;
    .locals 3
    .param p1, "request"    # Lio/fabric/sdk/android/services/network/HttpRequest;
    .param p2, "apiKey"    # Ljava/lang/String;

    .prologue
    .line 61
    const-string v0, "X-CRASHLYTICS-API-CLIENT-TYPE"

    const-string v1, "android"

    invoke-virtual {p1, v0, v1}, Lio/fabric/sdk/android/services/network/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    const-string v1, "X-CRASHLYTICS-API-CLIENT-VERSION"

    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v2

    invoke-virtual {v2}, Lcom/crashlytics/android/answers/Answers;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lio/fabric/sdk/android/services/network/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    const-string v1, "X-CRASHLYTICS-API-KEY"

    invoke-virtual {v0, v1, p2}, Lio/fabric/sdk/android/services/network/HttpRequest;->header(Ljava/lang/String;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method private applyMultipartDataTo(Lio/fabric/sdk/android/services/network/HttpRequest;Ljava/util/List;)Lio/fabric/sdk/android/services/network/HttpRequest;
    .locals 6
    .param p1, "request"    # Lio/fabric/sdk/android/services/network/HttpRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/fabric/sdk/android/services/network/HttpRequest;",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)",
            "Lio/fabric/sdk/android/services/network/HttpRequest;"
        }
    .end annotation

    .prologue
    .line 68
    .local p2, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    const/4 v1, 0x0

    .line 69
    .local v1, "i":I
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 70
    .local v0, "file":Ljava/io/File;
    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v3

    invoke-virtual {v3}, Lcom/crashlytics/android/answers/Answers;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Adding analytics session file "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " to multipart POST"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 72
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "session_analytics_file_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "application/vnd.crashlytics.android.events"

    invoke-virtual {p1, v3, v4, v5, v0}, Lio/fabric/sdk/android/services/network/HttpRequest;->part(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lio/fabric/sdk/android/services/network/HttpRequest;

    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    goto :goto_0

    .line 76
    .end local v0    # "file":Ljava/io/File;
    :cond_0
    return-object p1
.end method


# virtual methods
.method public send(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "files":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {p0}, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->getHttpRequest()Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    .line 48
    .local v0, "httpRequest":Lio/fabric/sdk/android/services/network/HttpRequest;
    iget-object v2, p0, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->apiKey:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->applyHeadersTo(Lio/fabric/sdk/android/services/network/HttpRequest;Ljava/lang/String;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    .line 49
    invoke-direct {p0, v0, p1}, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->applyMultipartDataTo(Lio/fabric/sdk/android/services/network/HttpRequest;Ljava/util/List;)Lio/fabric/sdk/android/services/network/HttpRequest;

    move-result-object v0

    .line 51
    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v2

    invoke-virtual {v2}, Lcom/crashlytics/android/answers/Answers;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Sending "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " analytics files to "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/crashlytics/android/answers/DefaultSessionAnalyticsFilesSender;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0}, Lio/fabric/sdk/android/services/network/HttpRequest;->code()I

    move-result v1

    .line 54
    .local v1, "statusCode":I
    invoke-static {}, Lcom/crashlytics/android/answers/Answers;->getInstance()Lcom/crashlytics/android/answers/Answers;

    move-result-object v2

    invoke-virtual {v2}, Lcom/crashlytics/android/answers/Answers;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Response code for analytics file send is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lio/fabric/sdk/android/services/common/CommonUtils;->logControlled(Landroid/content/Context;Ljava/lang/String;)V

    .line 57
    invoke-static {v1}, Lio/fabric/sdk/android/services/common/ResponseParser;->parse(I)I

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
