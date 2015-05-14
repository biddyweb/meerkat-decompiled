.class Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;
.super Ljava/lang/Object;
.source "StreamFeedItemProxy.java"

# interfaces
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;->unsubscribeToSchduledStream(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    .prologue
    .line 140
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;"
    iput-object p1, p0, Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;->this$0:Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 1
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 144
    .local p0, "this":Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;, "Lco/getair/meerkat/dtos/feed/StreamFeedItemProxy$4;"
    const-string v0, "FAILED unsubscribing"

    invoke-static {v0}, Lco/getair/meerkat/utilities/MLog;->e(Ljava/lang/String;)V

    .line 145
    return-void
.end method
