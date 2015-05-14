.class Lcom/mixpanel/android/mpmetrics/Tweaks$1;
.super Ljava/lang/Object;
.source "Tweaks.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mixpanel/android/mpmetrics/Tweaks;->runCallback(Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/Tweaks;

.field final synthetic val$callback:Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;

.field final synthetic val$value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/mixpanel/android/mpmetrics/Tweaks;Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$0"    # Lcom/mixpanel/android/mpmetrics/Tweaks;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks$1;->this$0:Lcom/mixpanel/android/mpmetrics/Tweaks;

    iput-object p2, p0, Lcom/mixpanel/android/mpmetrics/Tweaks$1;->val$callback:Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;

    iput-object p3, p0, Lcom/mixpanel/android/mpmetrics/Tweaks$1;->val$value:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/Tweaks$1;->val$callback:Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;

    iget-object v1, p0, Lcom/mixpanel/android/mpmetrics/Tweaks$1;->val$value:Ljava/lang/Object;

    invoke-interface {v0, v1}, Lcom/mixpanel/android/mpmetrics/Tweaks$TweakChangeCallback;->onChange(Ljava/lang/Object;)V

    .line 127
    return-void
.end method
