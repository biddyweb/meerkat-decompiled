.class public Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
.super Ljava/lang/Object;
.source "EventNamespace.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder;
    }
.end annotation


# instance fields
.field public final action:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "action"
    .end annotation
.end field

.field public final client:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "client"
    .end annotation
.end field

.field public final component:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "component"
    .end annotation
.end field

.field public final element:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "element"
    .end annotation
.end field

.field public final page:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "page"
    .end annotation
.end field

.field public final section:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "section"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "client"    # Ljava/lang/String;
    .param p2, "page"    # Ljava/lang/String;
    .param p3, "section"    # Ljava/lang/String;
    .param p4, "component"    # Ljava/lang/String;
    .param p5, "element"    # Ljava/lang/String;
    .param p6, "action"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    .line 29
    iput-object p3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    .line 30
    iput-object p4, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    .line 31
    iput-object p5, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    .line 32
    iput-object p6, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 49
    if-ne p0, p1, :cond_1

    .line 67
    :cond_0
    :goto_0
    return v1

    .line 50
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 52
    check-cast v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;

    .line 54
    .local v0, "that":Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 55
    :cond_6
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    :cond_7
    move v1, v2

    goto :goto_0

    :cond_8
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    if-nez v3, :cond_7

    .line 56
    :cond_9
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    :cond_a
    move v1, v2

    .line 57
    goto :goto_0

    .line 56
    :cond_b
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    if-nez v3, :cond_a

    .line 59
    :cond_c
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_f

    :cond_d
    move v1, v2

    .line 60
    goto :goto_0

    .line 59
    :cond_e
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    if-nez v3, :cond_d

    .line 62
    :cond_f
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_12

    :cond_10
    move v1, v2

    goto :goto_0

    :cond_11
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    if-nez v3, :cond_10

    .line 63
    :cond_12
    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    if-eqz v3, :cond_13

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    iget-object v4, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 64
    goto/16 :goto_0

    .line 63
    :cond_13
    iget-object v3, v0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 72
    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 73
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 74
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int v0, v3, v2

    .line 75
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int v0, v3, v2

    .line 76
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_4
    add-int v0, v3, v2

    .line 77
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 78
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 72
    goto :goto_0

    .restart local v0    # "result":I
    :cond_2
    move v2, v1

    .line 73
    goto :goto_1

    :cond_3
    move v2, v1

    .line 74
    goto :goto_2

    :cond_4
    move v2, v1

    .line 75
    goto :goto_3

    :cond_5
    move v2, v1

    .line 76
    goto :goto_4
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "client="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->client:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", page="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->page:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", section="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->section:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", component="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->component:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", element="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->element:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", action="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/twitter/sdk/android/core/internal/scribe/EventNamespace;->action:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
