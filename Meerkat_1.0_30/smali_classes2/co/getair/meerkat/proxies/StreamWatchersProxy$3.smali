.class Lco/getair/meerkat/proxies/StreamWatchersProxy$3;
.super Ljava/lang/Object;
.source "StreamWatchersProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamWatchersProxy;->reactivateGetWatchers(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamWatchersProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamWatchersProxy;

    .prologue
    .line 97
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$3;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamWatchersProxy$3;->this$0:Lco/getair/meerkat/proxies/StreamWatchersProxy;

    invoke-virtual {v0}, Lco/getair/meerkat/proxies/StreamWatchersProxy;->getWatchers()V

    .line 100
    return-void
.end method
