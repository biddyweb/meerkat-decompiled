.class final Lcom/instabug/library/internal/storage/j;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/interactor/a$a;


# instance fields
.field private synthetic a:Lcom/instabug/library/interactor/a$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/interactor/a$a;)V
    .locals 0

    .prologue
    .line 84
    iput-object p2, p0, Lcom/instabug/library/internal/storage/j;->a:Lcom/instabug/library/interactor/a$a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/instabug/library/internal/storage/j;->a:Lcom/instabug/library/interactor/a$a;

    invoke-interface {v0}, Lcom/instabug/library/interactor/a$a;->a()V

    .line 88
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/instabug/library/internal/storage/j;->a:Lcom/instabug/library/interactor/a$a;

    invoke-interface {v0, p1}, Lcom/instabug/library/interactor/a$a;->a(Ljava/lang/String;)V

    .line 93
    return-void
.end method
