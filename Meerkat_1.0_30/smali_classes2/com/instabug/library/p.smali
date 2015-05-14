.class final Lcom/instabug/library/p;
.super Ljava/lang/Object;
.source "InstabugDelegate.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/e$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/Instabug$b;

.field private synthetic b:Lcom/instabug/library/h;


# direct methods
.method constructor <init>(Lcom/instabug/library/h;Lcom/instabug/library/Instabug$b;)V
    .locals 0

    .prologue
    .line 262
    iput-object p1, p0, Lcom/instabug/library/p;->b:Lcom/instabug/library/h;

    iput-object p2, p0, Lcom/instabug/library/p;->a:Lcom/instabug/library/Instabug$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/instabug/library/p;->b:Lcom/instabug/library/h;

    invoke-static {v0}, Lcom/instabug/library/h;->a(Lcom/instabug/library/h;)Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->r()Ljava/lang/String;

    .line 266
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 270
    return-void
.end method
