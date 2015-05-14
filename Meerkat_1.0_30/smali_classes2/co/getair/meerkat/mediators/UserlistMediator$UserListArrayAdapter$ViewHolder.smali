.class Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "UserlistMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ViewHolder"
.end annotation


# instance fields
.field followButton:Landroid/widget/ToggleButton;

.field icon:Landroid/widget/ImageView;

.field name:Landroid/widget/TextView;

.field score:Landroid/widget/TextView;

.field scoreContainer:Landroid/view/View;

.field final synthetic this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

.field twitterHandle:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    .prologue
    .line 259
    iput-object p1, p0, Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter$ViewHolder;->this$1:Lco/getair/meerkat/mediators/UserlistMediator$UserListArrayAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
