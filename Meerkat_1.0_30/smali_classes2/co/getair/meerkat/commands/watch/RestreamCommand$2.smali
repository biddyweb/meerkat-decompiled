.class Lco/getair/meerkat/commands/watch/RestreamCommand$2;
.super Ljava/lang/Object;
.source "RestreamCommand.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/commands/watch/RestreamCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/commands/watch/RestreamCommand;


# direct methods
.method constructor <init>(Lco/getair/meerkat/commands/watch/RestreamCommand;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/commands/watch/RestreamCommand;

    .prologue
    .line 41
    iput-object p1, p0, Lco/getair/meerkat/commands/watch/RestreamCommand$2;->this$0:Lco/getair/meerkat/commands/watch/RestreamCommand;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "whichButton"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lco/getair/meerkat/commands/watch/RestreamCommand$2;->this$0:Lco/getair/meerkat/commands/watch/RestreamCommand;

    # invokes: Lco/getair/meerkat/commands/watch/RestreamCommand;->restream()V
    invoke-static {v0}, Lco/getair/meerkat/commands/watch/RestreamCommand;->access$000(Lco/getair/meerkat/commands/watch/RestreamCommand;)V

    .line 44
    return-void
.end method
