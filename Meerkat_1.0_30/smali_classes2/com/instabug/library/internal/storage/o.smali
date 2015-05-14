.class final Lcom/instabug/library/internal/storage/o;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/e$a;


# direct methods
.method constructor <init>(Lcom/instabug/library/internal/storage/n;)V
    .locals 0

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/instabug/library/model/a;)V
    .locals 1

    .prologue
    .line 174
    const-string v0, "Issue removed from cache successfully"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 179
    invoke-static {p1}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 180
    return-void
.end method
