.class Lco/getair/meerkat/proxies/StreamActivitiesProxy$4;
.super Ljava/lang/Object;
.source "StreamActivitiesProxy.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/StreamActivitiesProxy;->reactivateGetActivities(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/StreamActivitiesProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    .prologue
    .line 148
    iput-object p1, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$4;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lco/getair/meerkat/proxies/StreamActivitiesProxy$4;->this$0:Lco/getair/meerkat/proxies/StreamActivitiesProxy;

    invoke-virtual {v0}, Lco/getair/meerkat/proxies/StreamActivitiesProxy;->getActivities()V

    .line 151
    return-void
.end method
