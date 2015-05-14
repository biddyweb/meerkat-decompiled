.class Lco/getair/meerkat/mediators/ProfileMediator$4;
.super Ljava/lang/Object;
.source "ProfileMediator.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ProfileMediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/ProfileMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/ProfileMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 116
    iput-object p1, p0, Lco/getair/meerkat/mediators/ProfileMediator$4;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 119
    iget-object v0, p0, Lco/getair/meerkat/mediators/ProfileMediator$4;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    iget-object v1, p0, Lco/getair/meerkat/mediators/ProfileMediator$4;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    # invokes: Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;
    invoke-static {v1}, Lco/getair/meerkat/mediators/ProfileMediator;->access$000(Lco/getair/meerkat/mediators/ProfileMediator;)Landroid/app/Activity;

    move-result-object v1

    const-string v2, "appmeerkat"

    invoke-static {v2}, Lco/getair/meerkat/utilities/TwitterUrlBuilder;->forUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "@appmeerkat"

    # invokes: Lco/getair/meerkat/mediators/ProfileMediator;->openWebView(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v1, v2, v3}, Lco/getair/meerkat/mediators/ProfileMediator;->access$200(Lco/getair/meerkat/mediators/ProfileMediator;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return-void
.end method
