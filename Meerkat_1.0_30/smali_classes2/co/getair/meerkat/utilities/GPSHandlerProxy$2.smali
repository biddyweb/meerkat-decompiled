.class Lco/getair/meerkat/utilities/GPSHandlerProxy$2;
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

.field final synthetic val$displayContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lco/getair/meerkat/utilities/GPSHandlerProxy;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/utilities/GPSHandlerProxy;

    .prologue
    .line 66
    iput-object p1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;->this$0:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    iput-object p2, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;->val$displayContext:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 69
    iget-object v0, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;->this$0:Lco/getair/meerkat/utilities/GPSHandlerProxy;

    iget-object v1, p0, Lco/getair/meerkat/utilities/GPSHandlerProxy$2;->val$displayContext:Landroid/content/Context;

    # invokes: Lco/getair/meerkat/utilities/GPSHandlerProxy;->enableLocationSettings(Landroid/content/Context;)V
    invoke-static {v0, v1}, Lco/getair/meerkat/utilities/GPSHandlerProxy;->access$100(Lco/getair/meerkat/utilities/GPSHandlerProxy;Landroid/content/Context;)V

    .line 70
    return-void
.end method
