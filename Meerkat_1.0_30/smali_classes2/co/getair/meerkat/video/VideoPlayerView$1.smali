.class Lco/getair/meerkat/video/VideoPlayerView$1;
.super Ljava/lang/Object;
.source "VideoPlayerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/VideoPlayerView;->onPlayerStateChanged(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/VideoPlayerView;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/VideoPlayerView;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/VideoPlayerView;

    .prologue
    .line 187
    iput-object p1, p0, Lco/getair/meerkat/video/VideoPlayerView$1;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 190
    iget-object v0, p0, Lco/getair/meerkat/video/VideoPlayerView$1;->this$0:Lco/getair/meerkat/video/VideoPlayerView;

    # getter for: Lco/getair/meerkat/video/VideoPlayerView;->progressBar:Landroid/widget/ProgressBar;
    invoke-static {v0}, Lco/getair/meerkat/video/VideoPlayerView;->access$400(Lco/getair/meerkat/video/VideoPlayerView;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 191
    return-void
.end method
