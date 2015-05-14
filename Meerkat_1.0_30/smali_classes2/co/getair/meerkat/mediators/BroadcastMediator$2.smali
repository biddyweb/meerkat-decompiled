.class Lco/getair/meerkat/mediators/BroadcastMediator$2;
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
    .line 210
    iput-object p1, p0, Lco/getair/meerkat/mediators/BroadcastMediator$2;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 213
    iget-object v0, p0, Lco/getair/meerkat/mediators/BroadcastMediator$2;->this$0:Lco/getair/meerkat/mediators/BroadcastMediator;

    invoke-virtual {v0}, Lco/getair/meerkat/mediators/BroadcastMediator;->toggleCameraClicked()V

    .line 214
    return-void
.end method
