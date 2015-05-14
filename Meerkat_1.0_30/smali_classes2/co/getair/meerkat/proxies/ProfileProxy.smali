.class public Lco/getair/meerkat/proxies/ProfileProxy;
.super Lorg/puremvc/java/multicore/patterns/proxy/Proxy;
.source "ProfileProxy.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .locals 0
    .param p1, "proxyName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Lorg/puremvc/java/multicore/patterns/proxy/Proxy;-><init>(Ljava/lang/String;)V

    .line 17
    iput-object p2, p0, Lco/getair/meerkat/proxies/ProfileProxy;->context:Landroid/content/Context;

    .line 18
    return-void
.end method
