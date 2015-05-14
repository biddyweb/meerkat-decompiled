.class Lco/getair/meerkat/proxies/SearchProxy$1$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "SearchProxy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/proxies/SearchProxy$1;->onResponse(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/proxies/SearchProxy$1;


# direct methods
.method constructor <init>(Lco/getair/meerkat/proxies/SearchProxy$1;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/proxies/SearchProxy$1;

    .prologue
    .line 58
    iput-object p1, p0, Lco/getair/meerkat/proxies/SearchProxy$1$1;->this$1:Lco/getair/meerkat/proxies/SearchProxy$1;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
