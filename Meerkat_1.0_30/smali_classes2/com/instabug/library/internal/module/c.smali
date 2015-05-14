.class public final Lcom/instabug/library/internal/module/c;
.super Ljava/lang/Object;
.source "NetworkModule.java"


# instance fields
.field private final a:Lcom/instabug/library/network/restapi/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Lcom/instabug/library/network/restapi/a;

    new-instance v1, Lcom/instabug/library/network/restapi/c;

    invoke-direct {v1}, Lcom/instabug/library/network/restapi/c;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/instabug/library/network/restapi/a;-><init>(Landroid/content/Context;Lcom/instabug/library/network/restapi/c;)V

    iput-object v0, p0, Lcom/instabug/library/internal/module/c;->a:Lcom/instabug/library/network/restapi/a;

    .line 19
    return-void
.end method


# virtual methods
.method public final a()Lcom/instabug/library/network/restapi/a;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/instabug/library/internal/module/c;->a:Lcom/instabug/library/network/restapi/a;

    return-object v0
.end method
