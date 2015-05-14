.class Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2$1;
.super Ljava/lang/Object;
.source "PhoneActivationCodeMediator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;)V
    .locals 0
    .param p1, "this$1"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;

    .prologue
    .line 96
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2$1;->this$1:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2$1;->this$1:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;

    iget-object v0, v0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->submitActivationCode()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$600(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    .line 100
    return-void
.end method
