.class Lco/getair/meerkat/proxies/FeedProxy$5$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "FeedProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/FeedProxy$5;->onResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken",
        "<",
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/proxies/FeedProxy$5;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/FeedProxy$5;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/FeedProxy$5;

    .prologue
    .line 176
    iput-object p1, p0, Lco/getair/meerkat/proxies/FeedProxy$5$1;->this$1:Lco/getair/meerkat/proxies/FeedProxy$5;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
