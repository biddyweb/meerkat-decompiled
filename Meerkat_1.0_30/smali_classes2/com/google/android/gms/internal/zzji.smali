.class public Lcom/google/android/gms/internal/zzji;
.super Ljava/lang/Object;


# direct methods
.method private static zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzop$zzc;)Lcom/google/android/gms/internal/zzir;
    .locals 3

    new-instance v0, Lcom/google/android/gms/internal/zziz$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zziz$zza;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zziz$zza;->zzI(Z)Lcom/google/android/gms/internal/zziz$zza;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/internal/zziz$zza;->zzaA(Ljava/lang/String;)Lcom/google/android/gms/internal/zziz$zza;

    move-result-object v0

    const-string v1, "blob"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zziz$zza;->zzaz(Ljava/lang/String;)Lcom/google/android/gms/internal/zziz$zza;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zziz$zza;->zzgX()Lcom/google/android/gms/internal/zziz;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/internal/zzir;

    invoke-static {p1}, Lcom/google/android/gms/internal/zzwy;->zzf(Lcom/google/android/gms/internal/zzwy;)[B

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/internal/zzir;-><init>([BLcom/google/android/gms/internal/zziz;)V

    return-object v1
.end method

.method public static zza(Lcom/google/android/gms/appindexing/Action;JLjava/lang/String;I)Lcom/google/android/gms/internal/zzjb;
    .locals 9

    const/4 v7, 0x0

    const/4 v5, 0x0

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    const-string v0, "object"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    const-string v0, "id"

    invoke-virtual {v2, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "id"

    invoke-virtual {v2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :goto_0
    const-string v3, "name"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "type"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "url"

    invoke-virtual {v2, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzjj;->zza(Ljava/lang/String;Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v2

    invoke-static {v2, v3, v0, v4, v5}, Lcom/google/android/gms/internal/zzjb;->zza(Landroid/content/Intent;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Ljava/util/List;)Lcom/google/android/gms/internal/zzin$zza;

    move-result-object v3

    const-string v0, ".private:ssbContext"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".private:ssbContext"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/internal/zzir;->zzd([B)Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzin$zza;->zza(Lcom/google/android/gms/internal/zzir;)Lcom/google/android/gms/internal/zzin$zza;

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v0

    const-string v4, ".private:ssbContext"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_0
    const-string v0, ".private:accountName"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ".private:accountName"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Landroid/accounts/Account;

    const-string v6, "com.google"

    invoke-direct {v4, v0, v6}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/zzin$zza;->zza(Landroid/accounts/Account;)Lcom/google/android/gms/internal/zzin$zza;

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v0

    const-string v4, ".private:accountName"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_1
    const-string v0, ".private:isContextOnly"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, ".private:isContextOnly"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p4, 0x4

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v0

    const-string v4, ".private:isContextOnly"

    invoke-virtual {v0, v4}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_2
    move v4, p4

    const-string v0, ".private:isDeviceOnly"

    invoke-virtual {v1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, ".private:isDeviceOnly"

    invoke-virtual {v1, v0, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, ".private:isDeviceOnly"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    :cond_3
    const-string v0, ".private:action"

    invoke-virtual {p0}, Lcom/google/android/gms/appindexing/Action;->zzgZ()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Lcom/google/android/gms/internal/zzji;->zzh(Landroid/os/Bundle;)Lcom/google/android/gms/internal/zzop$zzc;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/internal/zzji;->zza(Ljava/lang/String;Lcom/google/android/gms/internal/zzop$zzc;)Lcom/google/android/gms/internal/zzir;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/google/android/gms/internal/zzin$zza;->zza(Lcom/google/android/gms/internal/zzir;)Lcom/google/android/gms/internal/zzin$zza;

    invoke-static {p3, v2}, Lcom/google/android/gms/internal/zzjb;->zza(Ljava/lang/String;Landroid/content/Intent;)Lcom/google/android/gms/internal/zzip;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzjb;

    invoke-virtual {v3}, Lcom/google/android/gms/internal/zzin$zza;->zzgU()Lcom/google/android/gms/internal/zzin;

    move-result-object v6

    const/4 v8, -0x1

    move-wide v2, p1

    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/zzjb;-><init>(Lcom/google/android/gms/internal/zzip;JILjava/lang/String;Lcom/google/android/gms/internal/zzin;ZI)V

    return-object v0

    :cond_4
    move-object v0, v5

    goto/16 :goto_0
.end method

.method static zzh(Landroid/os/Bundle;)Lcom/google/android/gms/internal/zzop$zzc;
    .locals 8

    new-instance v2, Lcom/google/android/gms/internal/zzop$zzc;

    invoke-direct {v2}, Lcom/google/android/gms/internal/zzop$zzc;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    new-instance v5, Lcom/google/android/gms/internal/zzop$zzb;

    invoke-direct {v5}, Lcom/google/android/gms/internal/zzop$zzb;-><init>()V

    iput-object v0, v5, Lcom/google/android/gms/internal/zzop$zzb;->name:Ljava/lang/String;

    new-instance v0, Lcom/google/android/gms/internal/zzop$zzd;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzop$zzd;-><init>()V

    iput-object v0, v5, Lcom/google/android/gms/internal/zzop$zzb;->zzalj:Lcom/google/android/gms/internal/zzop$zzd;

    instance-of v0, v1, Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v6, v5, Lcom/google/android/gms/internal/zzop$zzb;->zzalj:Lcom/google/android/gms/internal/zzop$zzd;

    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    iput-object v0, v6, Lcom/google/android/gms/internal/zzop$zzd;->zzQN:Ljava/lang/String;

    :goto_1
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    instance-of v0, v1, Landroid/os/Bundle;

    if-eqz v0, :cond_1

    iget-object v0, v5, Lcom/google/android/gms/internal/zzop$zzb;->zzalj:Lcom/google/android/gms/internal/zzop$zzd;

    check-cast v1, Landroid/os/Bundle;

    invoke-static {v1}, Lcom/google/android/gms/internal/zzji;->zzh(Landroid/os/Bundle;)Lcom/google/android/gms/internal/zzop$zzc;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/internal/zzop$zzd;->zzalo:Lcom/google/android/gms/internal/zzop$zzc;

    goto :goto_1

    :cond_1
    const-string v0, "AppDataSearchClient"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unsupported value: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    const-string v0, "type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v2, Lcom/google/android/gms/internal/zzop$zzc;->type:Ljava/lang/String;

    :cond_3
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzop$zzb;

    invoke-interface {v3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzop$zzb;

    iput-object v0, v2, Lcom/google/android/gms/internal/zzop$zzc;->zzalk:[Lcom/google/android/gms/internal/zzop$zzb;

    return-object v2
.end method
