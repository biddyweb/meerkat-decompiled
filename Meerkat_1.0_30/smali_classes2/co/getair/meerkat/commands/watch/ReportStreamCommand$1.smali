.class Lco/getair/meerkat/commands/watch/ReportStreamCommand$1;
.super Ljava/lang/Object;
.source "ReportStreamCommand.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/watch/ReportStreamCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/watch/ReportStreamCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    .prologue
    .line 37
    iput-object p1, p0, Lco/getair/meerkat/commands/watch/ReportStreamCommand$1;->this$0:Lco/getair/meerkat/commands/watch/ReportStreamCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 41
    return-void
.end method
