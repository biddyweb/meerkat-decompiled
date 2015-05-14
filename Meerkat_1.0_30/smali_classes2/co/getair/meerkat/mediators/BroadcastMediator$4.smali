.class Lco/getair/meerkat/mediators/BroadcastMediator$4;
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
    .line 224
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$4;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 227
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$4;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/mediators/BroadcastMediator;->setCommentsVisibility(Z)V

    .line 228
    return-void
.end method
