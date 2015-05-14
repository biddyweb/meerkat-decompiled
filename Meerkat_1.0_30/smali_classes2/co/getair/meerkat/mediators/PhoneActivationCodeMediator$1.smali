.class Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;
.super Ljava/lang/Object;
.source "PhoneActivationCodeMediator.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 57
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z

    .prologue
    .line 61
    if-eqz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Landroid/widget/EditText;

    if-ne v0, v1, :cond_0

    .line 63
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    check-cast p1, Landroid/widget/EditText;

    .end local p1    # "v":Landroid/view/View;
    # setter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0, p1}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$002(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;Landroid/widget/EditText;)Landroid/widget/EditText;

    .line 64
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # invokes: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->markCurrentEditText()V
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$100(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    .line 66
    :cond_0
    return-void
.end method
