.class public Lcom/digits/sdk/android/SmsBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SmsBroadcastReceiver.java"


# static fields
.field static final PDU_EXTRA:Ljava/lang/String; = "pdus"


# instance fields
.field final editTextWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/EditText;",
            ">;"
        }
    .end annotation
.end field

.field final patternConfirmationCode:Ljava/util/regex/Pattern;


# direct methods
.method constructor <init>(Landroid/widget/EditText;)V
    .locals 1
    .param p1, "editText"    # Landroid/widget/EditText;

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 15
    const-string v0, ":\\s(\\d{6}).*Digits by Twitter"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/digits/sdk/android/SmsBroadcastReceiver;->patternConfirmationCode:Ljava/util/regex/Pattern;

    .line 19
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/digits/sdk/android/SmsBroadcastReceiver;->editTextWeakReference:Ljava/lang/ref/WeakReference;

    .line 20
    return-void
.end method


# virtual methods
.method getConfirmationCode(Landroid/telephony/SmsMessage;)Ljava/lang/String;
    .locals 3
    .param p1, "message"    # Landroid/telephony/SmsMessage;

    .prologue
    .line 47
    invoke-virtual {p1}, Landroid/telephony/SmsMessage;->getDisplayMessageBody()Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "body":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 49
    iget-object v2, p0, Lcom/digits/sdk/android/SmsBroadcastReceiver;->patternConfirmationCode:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 50
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 51
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 55
    .end local v1    # "matcher":Ljava/util/regex/Matcher;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method getConfirmationCode([Landroid/telephony/SmsMessage;)Ljava/lang/String;
    .locals 5
    .param p1, "messages"    # [Landroid/telephony/SmsMessage;

    .prologue
    .line 36
    move-object v0, p1

    .local v0, "arr$":[Landroid/telephony/SmsMessage;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 37
    .local v3, "message":Landroid/telephony/SmsMessage;
    invoke-virtual {p0, v3}, Lcom/digits/sdk/android/SmsBroadcastReceiver;->getConfirmationCode(Landroid/telephony/SmsMessage;)Ljava/lang/String;

    move-result-object v4

    .line 38
    .local v4, "result":Ljava/lang/String;
    if-eqz v4, :cond_0

    .line 43
    .end local v3    # "message":Landroid/telephony/SmsMessage;
    .end local v4    # "result":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 36
    .restart local v3    # "message":Landroid/telephony/SmsMessage;
    .restart local v4    # "result":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    .end local v3    # "message":Landroid/telephony/SmsMessage;
    .end local v4    # "result":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method getMessagesFromIntent(Landroid/content/Intent;)[Landroid/telephony/SmsMessage;
    .locals 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 59
    const-string v4, "pdus"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v4

    check-cast v4, [Ljava/lang/Object;

    move-object v1, v4

    check-cast v1, [Ljava/lang/Object;

    .line 60
    .local v1, "messages":[Ljava/lang/Object;
    array-length v3, v1

    .line 61
    .local v3, "pduCount":I
    new-array v2, v3, [Landroid/telephony/SmsMessage;

    .line 62
    .local v2, "msgs":[Landroid/telephony/SmsMessage;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v3, :cond_0

    .line 63
    aget-object v4, v1, v0

    check-cast v4, [B

    check-cast v4, [B

    invoke-static {v4}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v4

    aput-object v4, v2, v0

    .line 62
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    :cond_0
    return-object v2
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 24
    invoke-virtual {p0, p2}, Lcom/digits/sdk/android/SmsBroadcastReceiver;->getMessagesFromIntent(Landroid/content/Intent;)[Landroid/telephony/SmsMessage;

    move-result-object v2

    .line 25
    .local v2, "messages":[Landroid/telephony/SmsMessage;
    invoke-virtual {p0, v2}, Lcom/digits/sdk/android/SmsBroadcastReceiver;->getConfirmationCode([Landroid/telephony/SmsMessage;)Ljava/lang/String;

    move-result-object v0

    .line 26
    .local v0, "confirmationCode":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 27
    iget-object v3, p0, Lcom/digits/sdk/android/SmsBroadcastReceiver;->editTextWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    .line 28
    .local v1, "editText":Landroid/widget/EditText;
    if-eqz v1, :cond_0

    .line 29
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 30
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 33
    .end local v1    # "editText":Landroid/widget/EditText;
    :cond_0
    return-void
.end method
