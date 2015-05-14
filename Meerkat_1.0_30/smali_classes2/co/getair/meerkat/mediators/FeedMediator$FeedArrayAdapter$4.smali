.class Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;
.super Ljava/lang/Object;
.source "FeedMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->getCreateBroadcastView(Landroid/view/ViewGroup;Landroid/view/View;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

.field final synthetic val$edittext:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    .prologue
    .line 832
    iput-object p1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iput-object p2, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;->val$edittext:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 835
    iget-object v0, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;->this$1:Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;

    iget-object v0, v0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter;->this$0:Lco/getair/meerkat/mediators/FeedMediator;

    iget-object v1, p0, Lco/getair/meerkat/mediators/FeedMediator$FeedArrayAdapter$4;->val$edittext:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    # invokes: Lco/getair/meerkat/mediators/FeedMediator;->scheduleBroadcast(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lco/getair/meerkat/mediators/FeedMediator;->access$1400(Lco/getair/meerkat/mediators/FeedMediator;Ljava/lang/String;)V

    .line 837
    return-void
.end method
