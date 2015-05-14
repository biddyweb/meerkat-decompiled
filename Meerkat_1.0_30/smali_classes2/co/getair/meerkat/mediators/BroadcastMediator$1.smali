.class Lco/getair/meerkat/mediators/BroadcastMediator$1;
.super Ljava/lang/Object;
.source "BroadcastMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/BroadcastMediator;-><init>(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/BroadcastMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/BroadcastMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/BroadcastMediator;

    .prologue
    .line 203
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$1;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 206
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$1;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    # invokes: Lco/getair/meerkat/mediators/BroadcastMediator;->stopBroadcast()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->access$000(Lco/getair/meerkat/mediators/BroadcastMediator;)V

    .line 207
    return-void
.end method
