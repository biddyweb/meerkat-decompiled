.class Lco/getair/meerkat/mediators/BroadcastMediator$14;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Lcom/nanotasks/BackgroundWork;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;->startSubmission(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nanotasks/BackgroundWork",
        "<",
        "Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

.field final synthetic val$streamURL:Ljava/lang/String;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 734
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$14;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/BroadcastMediator$14;->val$streamURL:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doInBackground()Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 737
    const-string v6, "Starting submission"

    invoke-static {v6}, Lco/getair/meerkat/utilities/MLog;->i(Ljava/lang/String;)V

    .line 738
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 740
    .local v1, "httpclient":Lorg/apache/http/client/HttpClient;
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v0

    .line 741
    .local v0, "httpParameters":Lorg/apache/http/params/HttpParams;
    const/16 v6, 0x7530

    invoke-static {v0, v6}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 742
    invoke-static {v0, v7}, Lorg/apache/http/params/HttpConnectionParams;->setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V

    .line 744
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    iget-object v6, p0, Lco/getair/meerkat/mediators/BroadcastMediator$14;->val$streamURL:Ljava/lang/String;

    invoke-direct {v2, v6}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 745
    .local v2, "httppost":Lorg/apache/http/client/methods/HttpPost;
    new-instance v3, Lorg/apache/http/entity/InputStreamEntity;

    iget-object v6, p0, Lco/getair/meerkat/mediators/BroadcastMediator$14;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    iget-object v6, v6, Lco/getair/meerkat/mediators/BroadcastMediator;->inPipe:Ljava/io/PipedInputStream;

    const-wide/16 v8, -0x1

    invoke-direct {v3, v6, v8, v9}, Lorg/apache/http/entity/InputStreamEntity;-><init>(Ljava/io/InputStream;J)V

    .line 748
    .local v3, "reqEntity":Lorg/apache/http/entity/InputStreamEntity;
    const-string v6, "binary/octet-stream"

    invoke-virtual {v3, v6}, Lorg/apache/http/entity/InputStreamEntity;->setContentType(Ljava/lang/String;)V

    .line 749
    invoke-virtual {v3, v7}, Lorg/apache/http/entity/InputStreamEntity;->setChunked(Z)V

    .line 751
    invoke-virtual {v2, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 753
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 754
    .local v5, "response":Lorg/apache/http/HttpResponse;
    invoke-interface {v5}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v4

    .line 757
    .local v4, "resEntity":Lorg/apache/http/HttpEntity;
    sget-object v6, Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;->connectionIssues:Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    return-object v6
.end method

.method public bridge synthetic doInBackground()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 734
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/BroadcastMediator$14;->doInBackground()Lco/getair/meerkat/mediators/BroadcastMediator$StreamerResult;

    move-result-object v0

    return-object v0
.end method
