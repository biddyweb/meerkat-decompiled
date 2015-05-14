.class Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;
.super Ljava/lang/Object;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->unrestreamScheduledStream()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 177
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;->this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 177
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;"
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;->onResponse(Lorg/json/JSONObject;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "response"    # Lorg/json/JSONObject;

    .prologue
    .line 180
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$7;"
    const-string v0, "unrestream successfully"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 181
    return-void
.end method
