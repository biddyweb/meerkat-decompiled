.class Lcom/twitter/sdk/android/core/DefaultClient$1;
.super Lretrofit/client/OkClient;
.source "DefaultClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/twitter/sdk/android/core/DefaultClient;-><init>(Ljavax/net/ssl/SSLSocketFactory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/twitter/sdk/android/core/DefaultClient;


# direct methods
.method constructor <init>(Lcom/twitter/sdk/android/core/DefaultClient;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/twitter/sdk/android/core/DefaultClient$1;->this$0:Lcom/twitter/sdk/android/core/DefaultClient;

    invoke-direct {p0}, Lretrofit/client/OkClient;-><init>()V

    return-void
.end method


# virtual methods
.method protected openConnection(Lretrofit/client/Request;)Ljava/net/HttpURLConnection;
    .locals 2
    .param p1, "request"    # Lretrofit/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    iget-object v0, p0, Lcom/twitter/sdk/android/core/DefaultClient$1;->this$0:Lcom/twitter/sdk/android/core/DefaultClient;

    invoke-super {p0, p1}, Lretrofit/client/OkClient;->openConnection(Lretrofit/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/twitter/sdk/android/core/DefaultClient;->openSslConnection(Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method
