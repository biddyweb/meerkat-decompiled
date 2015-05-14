.class Lco/getair/meerkat/mediators/WatchMediator$4;
.super Ljava/lang/Object;
.source "WatchMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/WatchMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/WatchMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/WatchMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/WatchMediator;

    .prologue
    .line 165
    iput-object p1, p0, Lco/getair/meerkat/mediators/WatchMediator$4;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 168
    iget-object v0, p0, Lco/getair/meerkat/mediators/WatchMediator$4;->this$0:Lco/getair/meerkat/mediators/WatchMediator;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/mediators/WatchMediator;->setCommentsVisibility(Z)V

    .line 169
    return-void
.end method
