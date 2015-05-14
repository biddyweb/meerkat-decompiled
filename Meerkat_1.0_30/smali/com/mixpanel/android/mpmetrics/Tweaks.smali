.class public Lcom/mixpanel/android/mpmetrics/Tweaks;
.super Ljava/lang/Object;
.source "Tweaks.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;
    }
.end annotation


# instance fields
.field private final mBindings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mTweaks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mUiHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mTweaks:Ljava/util/Map;

    .line 39
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mUiHandler:Landroid/os/Handler;

    .line 41
    return-void
.end method

.method private runCallback(Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V
    .locals 2
    .param p1, "callback"    # Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 123
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mUiHandler:Landroid/os/Handler;

    new-instance v1, Lcom/mixpanel/android/mpmetrics/Tweaks$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks$1;-><init>(Lcom/mixpanel/android/mpmetrics/Tweaks;Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 129
    return-void
.end method

.method private declared-synchronized set(Ljava/lang/String;Ljava/lang/Object;Z)V
    .locals 3
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "isDefault"    # Z

    .prologue
    .line 113
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mTweaks:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    if-nez p3, :cond_0

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 116
    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;

    .line 117
    .local v0, "changeCallback":Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;
    invoke-direct {p0, v0, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->runCallback(Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 113
    .end local v0    # "changeCallback":Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 120
    :cond_0
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized bind(Ljava/lang/String;Ljava/lang/Object;Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;)V
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Object;
    .param p3, "callback"    # Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 96
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mBindings:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-direct {p0, p3, v0}, Lcom/mixpanel/android/mpmetrics/Tweaks;->runCallback(Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Object;

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mTweaks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 85
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/mixpanel/android/mpmetrics/Tweaks;->set(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mTweaks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    .line 84
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getAll()Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks;->mTweaks:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDouble(Ljava/lang/String;Ljava/lang/Double;)Ljava/lang/Double;
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Double;

    .prologue
    .line 77
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    :goto_0
    return-object v1

    .line 78
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ClassCastException;
    move-object v1, p2

    .line 79
    goto :goto_0
.end method

.method public getFloat(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Float;

    .prologue
    .line 69
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    :goto_0
    return-object v1

    .line 70
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ClassCastException;
    move-object v1, p2

    .line 71
    goto :goto_0
.end method

.method public getInteger(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Integer;

    .prologue
    .line 53
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    :goto_0
    return-object v1

    .line 54
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ClassCastException;
    move-object v1, p2

    .line 55
    goto :goto_0
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Long;

    .prologue
    .line 61
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    :goto_0
    return-object v1

    .line 62
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ClassCastException;
    move-object v1, p2

    .line 63
    goto :goto_0
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 45
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    :goto_0
    return-object v1

    .line 46
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/ClassCastException;
    move-object v1, p2

    .line 47
    goto :goto_0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "tweakName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mixpanel/android/mpmetrics/Tweaks;->set(Ljava/lang/String;Ljava/lang/Object;Z)V

    .line 104
    return-void
.end method

.method public set(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 107
    .local p1, "tweakUpdates":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 108
    .local v0, "tweakName":Ljava/lang/String;
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v0, v2}, Lcom/mixpanel/android/mpmetrics/Tweaks;->set(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 110
    .end local v0    # "tweakName":Ljava/lang/String;
    :cond_0
    return-void
.end method
