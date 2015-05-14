.class public final Lcom/instabug/library/internal/storage/g;
.super Ljava/lang/Object;
.source "IssueCloudDataStore.java"

# interfaces
.implements Lcom/instabug/library/internal/storage/p;


# instance fields
.field private a:Lcom/instabug/library/internal/storage/a;

.field private b:Lcom/instabug/library/internal/storage/e;

.field private c:Lcom/instabug/library/network/restapi/a;


# direct methods
.method public constructor <init>(Lcom/instabug/library/internal/storage/e;Lcom/instabug/library/network/restapi/a;Lcom/instabug/library/internal/storage/a;)V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/instabug/library/internal/storage/g;->b:Lcom/instabug/library/internal/storage/e;

    .line 19
    iput-object p2, p0, Lcom/instabug/library/internal/storage/g;->c:Lcom/instabug/library/network/restapi/a;

    .line 20
    iput-object p3, p0, Lcom/instabug/library/internal/storage/g;->a:Lcom/instabug/library/internal/storage/a;

    .line 21
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/internal/storage/g;)Lcom/instabug/library/internal/storage/e;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->b:Lcom/instabug/library/internal/storage/e;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->e(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    return-void
.end method

.method private a(Lcom/instabug/library/model/a;Ljava/io/File;ILcom/instabug/library/interactor/a$a;)V
    .locals 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->c:Lcom/instabug/library/network/restapi/a;

    new-instance v1, Lcom/instabug/library/internal/storage/j;

    invoke-direct {v1, p0, p4}, Lcom/instabug/library/internal/storage/j;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/interactor/a$a;)V

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/instabug/library/network/restapi/a;->a(Lcom/instabug/library/model/a;Ljava/io/File;ILcom/instabug/library/interactor/a$a;)V

    .line 95
    return-void
.end method

.method static synthetic b(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->c(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    return-void
.end method

.method static synthetic c(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->d(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    return-void
.end method

.method private c(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->b:Lcom/instabug/library/internal/storage/e;

    new-instance v1, Lcom/instabug/library/internal/storage/l;

    invoke-direct {v1, p0, p2}, Lcom/instabug/library/internal/storage/l;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/e;->b(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 145
    return-void
.end method

.method private d(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->c:Lcom/instabug/library/network/restapi/a;

    new-instance v1, Lcom/instabug/library/internal/storage/m;

    invoke-direct {v1, p0, p1, p2}, Lcom/instabug/library/internal/storage/m;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/network/restapi/a;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/network/restapi/a$a;)V

    .line 163
    return-void
.end method

.method private declared-synchronized e(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 2

    .prologue
    .line 166
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->b:Lcom/instabug/library/internal/storage/e;

    new-instance v1, Lcom/instabug/library/internal/storage/n;

    invoke-direct {v1, p0, p2}, Lcom/instabug/library/internal/storage/n;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-virtual {v0, p1, v1}, Lcom/instabug/library/internal/storage/e;->d(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    monitor-exit p0

    return-void

    .line 166
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public final a()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/instabug/library/internal/storage/g;->b:Lcom/instabug/library/internal/storage/e;

    invoke-virtual {v0}, Lcom/instabug/library/internal/storage/e;->a()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method final a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 3

    .prologue
    .line 24
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->k()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->j()I

    move-result v0

    if-nez v0, :cond_0

    .line 25
    const-string v0, "Issue has a photo that wasn\'t uploaded. Saving artifact now."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 26
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->k()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x2

    new-instance v2, Lcom/instabug/library/internal/storage/h;

    invoke-direct {v2, p0, p1, p2}, Lcom/instabug/library/internal/storage/h;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/model/a;Ljava/io/File;ILcom/instabug/library/interactor/a$a;)V

    .line 44
    :cond_0
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->l()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->i()I

    move-result v0

    if-nez v0, :cond_1

    .line 45
    const-string v0, "Issue has an attachment that wasn\'t uploaded. Saving artifact now."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 46
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->l()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    new-instance v2, Lcom/instabug/library/internal/storage/i;

    invoke-direct {v2, p0, p1, p2}, Lcom/instabug/library/internal/storage/i;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/model/a;Ljava/io/File;ILcom/instabug/library/interactor/a$a;)V

    .line 62
    :cond_1
    return-void
.end method

.method public final b(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    .line 66
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->e()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->h()I

    move-result v0

    if-nez v0, :cond_0

    .line 67
    const-string v0, "Issue is cached but hasn\'t been sent before. Sending Directly."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 68
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->d(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    .line 80
    :goto_0
    return-void

    .line 69
    :cond_0
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->e()J

    move-result-wide v0

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    invoke-virtual {p1}, Lcom/instabug/library/model/a;->h()I

    move-result v0

    if-eqz v0, :cond_1

    .line 70
    const-string v0, "Issue is cached and was already uploaded. Checking for artifacts.."

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 71
    invoke-virtual {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->a(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    goto :goto_0

    .line 73
    :cond_1
    invoke-virtual {p1}, Lcom/instabug/library/model/a;->b()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 74
    if-eqz v0, :cond_2

    .line 75
    iget-object v1, p0, Lcom/instabug/library/internal/storage/g;->a:Lcom/instabug/library/internal/storage/a;

    new-instance v2, Lcom/instabug/library/internal/storage/k;

    invoke-direct {v2, p0, p1, p2}, Lcom/instabug/library/internal/storage/k;-><init>(Lcom/instabug/library/internal/storage/g;Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    invoke-virtual {v1, v0, v2}, Lcom/instabug/library/internal/storage/a;->a(Landroid/graphics/Bitmap;Lcom/instabug/library/internal/storage/a$b;)V

    goto :goto_0

    .line 77
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/instabug/library/internal/storage/g;->c(Lcom/instabug/library/model/a;Lcom/instabug/library/internal/storage/e$a;)V

    goto :goto_0
.end method
