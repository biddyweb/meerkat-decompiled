.class Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "CommentsMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field comment:Landroid/widget/TextView;

.field icon:Landroid/widget/ImageView;

.field final synthetic this$1:Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;

.field twitterHandle:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;

    .prologue
    .line 141
    iput-object p1, p0, Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter$ViewHolder;->this$1:Lco/getair/meerkat/mediators/CommentsMediator$CommentsArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
