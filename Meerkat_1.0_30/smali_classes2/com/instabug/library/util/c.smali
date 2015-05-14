.class final Lcom/instabug/library/util/c;
.super Ljava/lang/Object;
.source "DeviceRegistrar.java"

# interfaces
.implements Lcom/instabug/library/interactor/a$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/util/b;


# direct methods
.method constructor <init>(Lcom/instabug/library/util/b;)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/instabug/library/util/c;->a:Lcom/instabug/library/util/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/instabug/library/util/c;->a:Lcom/instabug/library/util/b;

    invoke-static {v0}, Lcom/instabug/library/util/b;->a(Lcom/instabug/library/util/b;)Lcom/instabug/library/util/b$a;

    move-result-object v0

    invoke-interface {v0}, Lcom/instabug/library/util/b$a;->a()V

    .line 31
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 35
    return-void
.end method
