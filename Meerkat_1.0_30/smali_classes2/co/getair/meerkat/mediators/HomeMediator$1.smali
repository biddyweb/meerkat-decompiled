.class Lco/getair/meerkat/mediators/HomeMediator$1;
.super Ljava/lang/Object;
.source "HomeMediator.java"

# interfaces
.implements Landroid/text/util/Linkify$TransformFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/HomeMediator;->linkifyTermsOfUse()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/HomeMediator;

.field final synthetic val$linkableTexts:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/HomeMediator;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/HomeMediator;

    .prologue
    .line 119
    iput-object p1, p0, Lco/getair/meerkat/mediators/HomeMediator$1;->this$0:Lco/getair/meerkat/mediators/HomeMediator;

    iput-object p2, p0, Lco/getair/meerkat/mediators/HomeMediator$1;->val$linkableTexts:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public transformUrl(Ljava/util/regex/Matcher;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "match"    # Ljava/util/regex/Matcher;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 123
    iget-object v1, p0, Lco/getair/meerkat/mediators/HomeMediator$1;->val$linkableTexts:Ljava/util/HashMap;

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 124
    .local v0, "link":Ljava/lang/String;
    return-object v0
.end method
