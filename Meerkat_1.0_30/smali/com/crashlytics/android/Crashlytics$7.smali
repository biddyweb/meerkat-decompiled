.class Lcom/crashlytics/android/Crashlytics$7;
.super Ljava/lang/Object;
.source "Crashlytics.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/crashlytics/android/Crashlytics;->getSendDecisionFromUser(Landroid/app/Activity;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/crashlytics/android/Crashlytics;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$latch:Lcom/crashlytics/android/Crashlytics$OptInLatch;

.field final synthetic val$promptData:Lio/fabric/sdk/android/services/settings/PromptSettingsData;

.field final synthetic val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;


# direct methods
.method constructor <init>(Lcom/crashlytics/android/Crashlytics;Landroid/app/Activity;Lcom/crashlytics/android/Crashlytics$OptInLatch;Lcom/crashlytics/android/DialogStringResolver;Lio/fabric/sdk/android/services/settings/PromptSettingsData;)V
    .locals 0

    .prologue
    .line 994
    iput-object p1, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    iput-object p2, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/crashlytics/android/Crashlytics$7;->val$latch:Lcom/crashlytics/android/Crashlytics$OptInLatch;

    iput-object p4, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    iput-object p5, p0, Lcom/crashlytics/android/Crashlytics$7;->val$promptData:Lio/fabric/sdk/android/services/settings/PromptSettingsData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 997
    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    invoke-direct {v1, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 999
    .local v1, "builder":Landroid/app/AlertDialog$Builder;
    new-instance v5, Lcom/crashlytics/android/Crashlytics$7$1;

    invoke-direct {v5, p0}, Lcom/crashlytics/android/Crashlytics$7$1;-><init>(Lcom/crashlytics/android/Crashlytics$7;)V

    .line 1007
    .local v5, "sendClickListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    invoke-virtual {v8}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v3, v8, Landroid/util/DisplayMetrics;->density:F

    .line 1011
    .local v3, "density":F
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    const/4 v9, 0x5

    # invokes: Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I
    invoke-static {v8, v3, v9}, Lcom/crashlytics/android/Crashlytics;->access$300(Lcom/crashlytics/android/Crashlytics;FI)I

    move-result v7

    .line 1013
    .local v7, "textViewPadding":I
    new-instance v6, Landroid/widget/TextView;

    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    invoke-direct {v6, v8}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 1014
    .local v6, "textView":Landroid/widget/TextView;
    const/16 v8, 0xf

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setAutoLinkMask(I)V

    .line 1015
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    invoke-virtual {v8}, Lcom/crashlytics/android/DialogStringResolver;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1016
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    const v9, 0x1030044

    invoke-virtual {v6, v8, v9}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 1017
    invoke-virtual {v6, v7, v7, v7, v7}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1019
    invoke-virtual {v6, v13}, Landroid/widget/TextView;->setFocusable(Z)V

    .line 1021
    new-instance v4, Landroid/widget/ScrollView;

    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$activity:Landroid/app/Activity;

    invoke-direct {v4, v8}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 1022
    .local v4, "scrollView":Landroid/widget/ScrollView;
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    const/16 v9, 0xe

    # invokes: Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I
    invoke-static {v8, v3, v9}, Lcom/crashlytics/android/Crashlytics;->access$300(Lcom/crashlytics/android/Crashlytics;FI)I

    move-result v8

    iget-object v9, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    const/4 v10, 0x2

    # invokes: Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I
    invoke-static {v9, v3, v10}, Lcom/crashlytics/android/Crashlytics;->access$300(Lcom/crashlytics/android/Crashlytics;FI)I

    move-result v9

    iget-object v10, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    const/16 v11, 0xa

    # invokes: Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I
    invoke-static {v10, v3, v11}, Lcom/crashlytics/android/Crashlytics;->access$300(Lcom/crashlytics/android/Crashlytics;FI)I

    move-result v10

    iget-object v11, p0, Lcom/crashlytics/android/Crashlytics$7;->this$0:Lcom/crashlytics/android/Crashlytics;

    const/16 v12, 0xc

    # invokes: Lcom/crashlytics/android/Crashlytics;->dipsToPixels(FI)I
    invoke-static {v11, v3, v12}, Lcom/crashlytics/android/Crashlytics;->access$300(Lcom/crashlytics/android/Crashlytics;FI)I

    move-result v11

    invoke-virtual {v4, v8, v9, v10, v11}, Landroid/widget/ScrollView;->setPadding(IIII)V

    .line 1024
    invoke-virtual {v4, v6}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 1028
    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    iget-object v9, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    invoke-virtual {v9}, Lcom/crashlytics/android/DialogStringResolver;->getTitle()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    invoke-virtual {v8, v13}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    iget-object v9, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    invoke-virtual {v9}, Lcom/crashlytics/android/DialogStringResolver;->getSendButtonTitle()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v5}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1031
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$promptData:Lio/fabric/sdk/android/services/settings/PromptSettingsData;

    iget-boolean v8, v8, Lio/fabric/sdk/android/services/settings/PromptSettingsData;->showCancelButton:Z

    if-eqz v8, :cond_0

    .line 1032
    new-instance v2, Lcom/crashlytics/android/Crashlytics$7$2;

    invoke-direct {v2, p0}, Lcom/crashlytics/android/Crashlytics$7$2;-><init>(Lcom/crashlytics/android/Crashlytics$7;)V

    .line 1039
    .local v2, "cancelClickListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    invoke-virtual {v8}, Lcom/crashlytics/android/DialogStringResolver;->getCancelButtonTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1043
    .end local v2    # "cancelClickListener":Landroid/content/DialogInterface$OnClickListener;
    :cond_0
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$promptData:Lio/fabric/sdk/android/services/settings/PromptSettingsData;

    iget-boolean v8, v8, Lio/fabric/sdk/android/services/settings/PromptSettingsData;->showAlwaysSendButton:Z

    if-eqz v8, :cond_1

    .line 1044
    new-instance v0, Lcom/crashlytics/android/Crashlytics$7$3;

    invoke-direct {v0, p0}, Lcom/crashlytics/android/Crashlytics$7$3;-><init>(Lcom/crashlytics/android/Crashlytics$7;)V

    .line 1052
    .local v0, "alwaysSendClickListener":Landroid/content/DialogInterface$OnClickListener;
    iget-object v8, p0, Lcom/crashlytics/android/Crashlytics$7;->val$stringResolver:Lcom/crashlytics/android/DialogStringResolver;

    invoke-virtual {v8}, Lcom/crashlytics/android/DialogStringResolver;->getAlwaysSendButtonTitle()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1056
    .end local v0    # "alwaysSendClickListener":Landroid/content/DialogInterface$OnClickListener;
    :cond_1
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1057
    return-void
.end method
