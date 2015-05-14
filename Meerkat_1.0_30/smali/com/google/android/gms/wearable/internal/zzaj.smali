.class abstract Lcom/google/android/gms/wearable/internal/zzaj;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/wearable/internal/zzaj$zzf;,
        Lcom/google/android/gms/wearable/internal/zzaj$zza;,
        Lcom/google/android/gms/wearable/internal/zzaj$zzd;,
        Lcom/google/android/gms/wearable/internal/zzaj$zze;,
        Lcom/google/android/gms/wearable/internal/zzaj$zzc;,
        Lcom/google/android/gms/wearable/internal/zzaj$zzb;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final zzaGo:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<TT;",
            "Lcom/google/android/gms/wearable/internal/zzbe;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;[Landroid/content/IntentFilter;)Lcom/google/android/gms/wearable/internal/zzbe;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[",
            "Landroid/content/IntentFilter;",
            ")",
            "Lcom/google/android/gms/wearable/internal/zzbe;"
        }
    .end annotation
.end method

.method public zza(Lcom/google/android/gms/wearable/internal/zzbd;Lcom/google/android/gms/common/api/zza$zzb;Ljava/lang/Object;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/wearable/internal/zzbd;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v2, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/wearable/internal/zzbe;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xfa2

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-interface {p2, v0}, Lcom/google/android/gms/common/api/zza$zzb;->zzd(Ljava/lang/Object;)V

    monitor-exit v2

    :goto_0
    return-void

    :cond_0
    invoke-virtual {v0}, Lcom/google/android/gms/wearable/internal/zzbe;->clear()V

    invoke-virtual {p1}, Lcom/google/android/gms/wearable/internal/zzbd;->zzjb()Landroid/os/IInterface;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/wearable/internal/zzai;

    new-instance v3, Lcom/google/android/gms/wearable/internal/zzaj$zzf;

    iget-object v4, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-direct {v3, v4, p3, p2}, Lcom/google/android/gms/wearable/internal/zzaj$zzf;-><init>(Ljava/util/Map;Ljava/lang/Object;Lcom/google/android/gms/common/api/zza$zzb;)V

    new-instance v4, Lcom/google/android/gms/wearable/internal/zzau;

    invoke-direct {v4, v0}, Lcom/google/android/gms/wearable/internal/zzau;-><init>(Lcom/google/android/gms/wearable/internal/zzah;)V

    invoke-interface {v1, v3, v4}, Lcom/google/android/gms/wearable/internal/zzai;->zza(Lcom/google/android/gms/wearable/internal/zzag;Lcom/google/android/gms/wearable/internal/zzau;)V

    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public zza(Lcom/google/android/gms/wearable/internal/zzbd;Lcom/google/android/gms/common/api/zza$zzb;Ljava/lang/Object;[Landroid/content/IntentFilter;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/wearable/internal/zzbd;",
            "Lcom/google/android/gms/common/api/zza$zzb",
            "<",
            "Lcom/google/android/gms/common/api/Status;",
            ">;TT;[",
            "Landroid/content/IntentFilter;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-virtual {p0, p3, p4}, Lcom/google/android/gms/wearable/internal/zzaj;->zza(Ljava/lang/Object;[Landroid/content/IntentFilter;)Lcom/google/android/gms/wearable/internal/zzbe;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    const/16 v1, 0xfa1

    invoke-direct {v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(I)V

    invoke-interface {p2, v0}, Lcom/google/android/gms/common/api/zza$zzb;->zzd(Ljava/lang/Object;)V

    monitor-exit v2

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p1}, Lcom/google/android/gms/wearable/internal/zzbd;->zzjb()Landroid/os/IInterface;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/wearable/internal/zzai;

    new-instance v3, Lcom/google/android/gms/wearable/internal/zzaj$zza;

    iget-object v4, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-direct {v3, v4, p3, p2}, Lcom/google/android/gms/wearable/internal/zzaj$zza;-><init>(Ljava/util/Map;Ljava/lang/Object;Lcom/google/android/gms/common/api/zza$zzb;)V

    new-instance v4, Lcom/google/android/gms/wearable/internal/zzb;

    invoke-direct {v4, v1}, Lcom/google/android/gms/wearable/internal/zzb;-><init>(Lcom/google/android/gms/wearable/internal/zzbe;)V

    invoke-interface {v0, v3, v4}, Lcom/google/android/gms/wearable/internal/zzai;->zza(Lcom/google/android/gms/wearable/internal/zzag;Lcom/google/android/gms/wearable/internal/zzb;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catch_0
    move-exception v0

    :try_start_3
    iget-object v1, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v1, p3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public zzb(Lcom/google/android/gms/wearable/internal/zzbd;)V
    .locals 8

    iget-object v3, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    monitor-enter v3

    :try_start_0
    new-instance v4, Lcom/google/android/gms/wearable/internal/zzbc$zzh;

    invoke-direct {v4}, Lcom/google/android/gms/wearable/internal/zzbc$zzh;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/wearable/internal/zzbe;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/google/android/gms/wearable/internal/zzbe;->clear()V

    invoke-virtual {p1}, Lcom/google/android/gms/wearable/internal/zzbd;->isConnected()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-eqz v2, :cond_0

    :try_start_1
    invoke-virtual {p1}, Lcom/google/android/gms/wearable/internal/zzbd;->zzjb()Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/wearable/internal/zzai;

    new-instance v6, Lcom/google/android/gms/wearable/internal/zzau;

    invoke-direct {v6, v1}, Lcom/google/android/gms/wearable/internal/zzau;-><init>(Lcom/google/android/gms/wearable/internal/zzah;)V

    invoke-interface {v2, v4, v6}, Lcom/google/android/gms/wearable/internal/zzai;->zza(Lcom/google/android/gms/wearable/internal/zzag;Lcom/google/android/gms/wearable/internal/zzau;)V

    const-string v2, "WearableClient"

    const/4 v6, 0x2

    invoke-static {v2, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "WearableClient"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "disconnect: removed: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    :try_start_2
    const-string v2, "WearableClient"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "disconnect: Didn\'t remove: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, "/"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_1
    :try_start_3
    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void
.end method

.method public zzcS(Landroid/os/IBinder;)V
    .locals 9

    iget-object v2, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    monitor-enter v2

    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/wearable/internal/zzai$zza;->zzcR(Landroid/os/IBinder;)Lcom/google/android/gms/wearable/internal/zzai;

    move-result-object v3

    new-instance v4, Lcom/google/android/gms/wearable/internal/zzbc$zzh;

    invoke-direct {v4}, Lcom/google/android/gms/wearable/internal/zzbc$zzh;-><init>()V

    iget-object v0, p0, Lcom/google/android/gms/wearable/internal/zzaj;->zzaGo:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/wearable/internal/zzbe;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v6, Lcom/google/android/gms/wearable/internal/zzb;

    invoke-direct {v6, v1}, Lcom/google/android/gms/wearable/internal/zzb;-><init>(Lcom/google/android/gms/wearable/internal/zzbe;)V

    invoke-interface {v3, v4, v6}, Lcom/google/android/gms/wearable/internal/zzai;->zza(Lcom/google/android/gms/wearable/internal/zzag;Lcom/google/android/gms/wearable/internal/zzb;)V

    const-string v6, "WearableClient"

    const/4 v7, 0x2

    invoke-static {v6, v7}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "WearableClient"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onPostInitHandler: added: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v6

    :try_start_2
    const-string v6, "WearableClient"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onPostInitHandler: Didn\'t add: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v7, "/"

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_1
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-void
.end method
