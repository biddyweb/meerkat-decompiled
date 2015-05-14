.class public final Lcom/instabug/library/a;
.super Ljava/lang/Object;
.source "EventsManager.java"


# instance fields
.field private a:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    .line 15
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 24
    new-instance v0, Lcom/instabug/library/model/c;

    invoke-direct {v0}, Lcom/instabug/library/model/c;-><init>()V

    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/model/c;->a(J)V

    .line 26
    invoke-virtual {v0, p2}, Lcom/instabug/library/model/c;->a(Ljava/lang/String;)V

    .line 27
    invoke-virtual {v0, p1}, Lcom/instabug/library/model/c;->d(Ljava/lang/String;)V

    .line 28
    iget-object v1, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    return-void
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4

    .prologue
    .line 40
    new-instance v0, Lcom/instabug/library/model/c;

    invoke-direct {v0}, Lcom/instabug/library/model/c;-><init>()V

    .line 41
    const-string v1, "click"

    invoke-virtual {v0, v1}, Lcom/instabug/library/model/c;->a(Ljava/lang/String;)V

    .line 42
    invoke-virtual {v0, p1}, Lcom/instabug/library/model/c;->d(Ljava/lang/String;)V

    .line 43
    invoke-virtual {v0, p3}, Lcom/instabug/library/model/c;->c(Ljava/lang/String;)V

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/model/c;->a(J)V

    .line 45
    invoke-static {p4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 46
    if-eqz p2, :cond_0

    invoke-virtual {v0, p2}, Lcom/instabug/library/model/c;->b(Ljava/lang/String;)V

    .line 47
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 51
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    const/4 v0, 0x0

    .line 53
    iget-object v1, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/16 v3, 0x64

    if-le v1, v3, :cond_0

    .line 54
    iget-object v0, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x64

    :cond_0
    move v1, v0

    .line 56
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 57
    iget-object v0, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/model/c;

    invoke-virtual {v0, v2}, Lcom/instabug/library/model/c;->a(Ljava/lang/StringBuilder;)V

    .line 59
    add-int/lit8 v0, v1, 0x1

    iget-object v3, p0, Lcom/instabug/library/a;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eq v0, v3, :cond_1

    .line 60
    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    :cond_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    .line 63
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
