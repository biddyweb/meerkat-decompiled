.class Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;
.super Landroid/widget/ArrayAdapter;
.source "CommentsOnVideoMediator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/CommentsOnVideoMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CommentsListAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field final synthetic this$0:Lco/getair/meerkat/mediators/CommentsOnVideoMediator;


# direct methods
.method public constructor <init>(Lco/getair/meerkat/mediators/CommentsOnVideoMediator;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 95
    iput-object p1, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->this$0:Lco/getair/meerkat/mediators/CommentsOnVideoMediator;

    .line 96
    const v0, 0x7f04003b

    invoke-direct {p0, p2, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 98
    iput-object p2, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->context:Landroid/content/Context;

    .line 99
    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 105
    move-object v3, p2

    .line 106
    .local v3, "rowView":Landroid/view/View;
    invoke-virtual {p0, p1}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;

    .line 110
    .local v0, "broadcastActivity":Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getTitle()Ljava/lang/String;

    move-result-object v5

    const-string v6, "liked"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 111
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<font color=#ffe200>@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getUsername()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font> <font color=#1dd4ff>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 118
    .local v4, "text":Ljava/lang/String;
    :goto_0
    if-nez v3, :cond_2

    .line 120
    iget-object v5, p0, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;->context:Landroid/content/Context;

    const-string v6, "layout_inflater"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 121
    .local v2, "inflater":Landroid/view/LayoutInflater;
    const v5, 0x7f04003b

    const/4 v6, 0x0

    invoke-virtual {v2, v5, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 123
    new-instance v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;-><init>(Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter;)V

    .line 125
    .local v1, "holder":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;
    const v5, 0x7f0e012b

    invoke-virtual {v3, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    iput-object v5, v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;->comment:Landroid/widget/TextView;

    .line 127
    invoke-virtual {v3, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 132
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :goto_1
    iget-object v5, v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;->comment:Landroid/widget/TextView;

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    return-object v3

    .line 112
    .end local v1    # "holder":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;
    .end local v4    # "text":Ljava/lang/String;
    :cond_0
    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getTitle()Ljava/lang/String;

    move-result-object v5

    const-string v6, "restreamed & retweeted"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 113
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<font color=#ffe200>@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getUsername()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font> <font color=#aca5ff>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "text":Ljava/lang/String;
    goto :goto_0

    .line 115
    .end local v4    # "text":Ljava/lang/String;
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<font color=#ffe200>@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getUsername()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font> <font color=#ffffff>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lco/getair/meerkat/dtos/watch_broadcast/BroadcastActivity;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "</font>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .restart local v4    # "text":Ljava/lang/String;
    goto/16 :goto_0

    .line 129
    :cond_2
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;

    .restart local v1    # "holder":Lco/getair/meerkat/mediators/CommentsOnVideoMediator$CommentsListAdapter$ViewHolder;
    goto/16 :goto_1
.end method
