.class Lco/getair/meerkat/utilities/GPSHandlerProxy$1;
.super Ljava/lang/Object;
.source "GPSHandlerProxy.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/utilities/GPSHandlerProxy;->checkGpsEnabled(Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/utilities/GPSHandlerProxy;


# direct methods
.method constructor <init>(Lco/getair/meerkat/utilities/GPSHandlerProxy;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .prologue
    .line 72
    iput-object p1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$1;->this$0:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$1;->this$0:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    # invokes: Lco/getair/meerkat/utilities/GPSHandlerProxy;->notifyGPSLocation()V
    invoke-static {v0}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->access$000(Lco/getair/meerkat/utilities/GPSHandlerProxy;)V

    .line 76
    return-void
.end method
