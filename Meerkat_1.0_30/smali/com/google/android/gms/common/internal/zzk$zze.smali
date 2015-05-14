.class public final Lcom/google/android/gms/common/internal/zzk$zze;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/internal/zzk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "zze"
.end annotation


# instance fields
.field final synthetic zzPT:Lcom/google/android/gms/common/internal/zzk;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/common/internal/zzk;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 5
    .param p1, "component"    # Landroid/content/ComponentName;
    .param p2, "binder"    # Landroid/os/IBinder;

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/internal/zzk$zze;, "Lcom/google/android/gms/common/internal/zzk<TT;>.zze;"
    const-string v0, "Expecting a valid IBinder"

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/zzs$zza;->zzU(Landroid/os/IBinder;)Lcom/google/android/gms/common/internal/zzs;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzk;->zza(Lcom/google/android/gms/common/internal/zzk;Lcom/google/android/gms/common/internal/zzs;)Lcom/google/android/gms/common/internal/zzs;

    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzk;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    iget-object v1, v1, Lcom/google/android/gms/common/internal/zzk;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x6

    new-instance v3, Lcom/google/android/gms/common/internal/zzk$zzg;

    iget-object v4, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    invoke-direct {v3, v4}, Lcom/google/android/gms/common/internal/zzk$zzg;-><init>(Lcom/google/android/gms/common/internal/zzk;)V

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 4
    .param p1, "component"    # Landroid/content/ComponentName;

    .prologue
    .local p0, "this":Lcom/google/android/gms/common/internal/zzk$zze;, "Lcom/google/android/gms/common/internal/zzk<TT;>.zze;"
    iget-object v0, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    iget-object v0, v0, Lcom/google/android/gms/common/internal/zzk;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/google/android/gms/common/internal/zzk$zze;->zzPT:Lcom/google/android/gms/common/internal/zzk;

    iget-object v1, v1, Lcom/google/android/gms/common/internal/zzk;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x4

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method
