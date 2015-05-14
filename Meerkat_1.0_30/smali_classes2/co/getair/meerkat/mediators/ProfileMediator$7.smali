.class Lco/getair/meerkat/mediators/ProfileMediator$7;
.super Ljava/lang/Object;
.source "ProfileMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/ProfileMediator;->handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/ProfileMediator;

.field final synthetic val$followerList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/ProfileMediator;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/ProfileMediator;

    .prologue
    .line 155
    iput-object p1, p0, Lco/getair/meerkat/mediators/ProfileMediator$7;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/ProfileMediator$7;->val$followerList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 158
    iget-object v0, p0, Lco/getair/meerkat/mediators/ProfileMediator$7;->this$0:Lco/getair/meerkat/mediators/ProfileMediator;

    # getter for: Lco/getair/meerkat/mediators/ProfileMediator;->followersCountTextView:Landroid/widget/TextView;
    invoke-static {v0}, Lco/getair/meerkat/mediators/ProfileMediator;->access$300(Lco/getair/meerkat/mediators/ProfileMediator;)Landroid/widget/TextView;

    move-result-object v0

    const-string v1, "%d"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lco/getair/meerkat/mediators/ProfileMediator$7;->val$followerList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    return-void
.end method
