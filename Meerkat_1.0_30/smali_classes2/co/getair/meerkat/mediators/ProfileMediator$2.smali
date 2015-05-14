.class Lco/getair/meerkat/mediators/ProfileMediator$2;
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
    .line 93
    iput-object p1, p0, Lco/getair/meerkat/mediators/ProfileMediator$2;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 97
    iget-object v2, p0, Lco/getair/meerkat/mediators/ProfileMediator$2;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    # invokes: Lco/getair/meerkat/mediators/ProfileMediator;->getOwnerActivity()Landroid/app/Activity;
    invoke-static {v2}, Lco/getair/meerkat/mediators/ProfileMediator;->access$000(Lco/getair/meerkat/mediators/ProfileMediator;)Landroid/app/Activity;

    move-result-object v0

    .line 98
    .local v0, "ownerActivity":Landroid/app/Activity;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/UserListActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 99
    .local v1, "userListActivity":Landroid/content/Intent;
    const-string v2, "listSourceBundleKey"

    const-string v3, "followers"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 100
    const-string v2, "listTitleBundleKey"

    const-string v3, "Followers"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    invoke-virtual {v0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 104
    return-void
.end method
