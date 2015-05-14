.class public Lco/getair/meerkat/utilities/TimePickerFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "TimePickerFragment.java"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# instance fields
.field dateSelectedRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance()Lco/getair/meerkat/utilities/TimePickerFragment;
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lco/getair/meerkat/utilities/TimePickerFragment;

    invoke-direct {v0}, Lco/getair/meerkat/utilities/TimePickerFragment;-><init>()V

    .line 23
    .local v0, "f":Lco/getair/meerkat/utilities/TimePickerFragment;
    return-object v0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 30
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v6

    .line 31
    .local v6, "c":Ljava/util/Calendar;
    const/16 v0, 0xb

    invoke-virtual {v6, v0}, Ljava/util/Calendar;->get(I)I

    move-result v3

    .line 32
    .local v3, "hour":I
    const/16 v0, 0xc

    invoke-virtual {v6, v0}, Ljava/util/Calendar;->get(I)I

    move-result v4

    .line 34
    .local v4, "minute":I
    new-instance v0, Landroid/app/TimePickerDialog;

    invoke-virtual {p0}, Lco/getair/meerkat/utilities/TimePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    .line 35
    invoke-virtual {p0}, Lco/getair/meerkat/utilities/TimePickerFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Landroid/text/format/DateFormat;->is24HourFormat(Landroid/content/Context;)Z

    move-result v5

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/TimePickerDialog;-><init>(Landroid/content/Context;Landroid/app/TimePickerDialog$OnTimeSetListener;IIZ)V

    return-object v0
.end method

.method public onTimeSet(Landroid/widget/TimePicker;II)V
    .locals 10
    .param p1, "view"    # Landroid/widget/TimePicker;
    .param p2, "hourOfDay"    # I
    .param p3, "minute"    # I

    .prologue
    const-wide/32 v8, 0x5265c00

    .line 42
    iget-object v6, p0, Lco/getair/meerkat/utilities/TimePickerFragment;->dateSelectedRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    if-nez v6, :cond_0

    .line 63
    :goto_0
    return-void

    .line 44
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 46
    .local v0, "c":Ljava/util/Calendar;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 47
    const/16 v6, 0xb

    invoke-virtual {v0, v6, p2}, Ljava/util/Calendar;->set(II)V

    .line 48
    const/16 v6, 0xc

    invoke-virtual {v0, v6, p3}, Ljava/util/Calendar;->set(II)V

    .line 50
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 51
    .local v2, "now":J
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    sub-long v4, v6, v2

    .line 52
    .local v4, "timeSinceNow":J
    const-wide/16 v6, 0x0

    cmp-long v6, v4, v6

    if-gtz v6, :cond_1

    .line 53
    add-long/2addr v4, v8

    .line 55
    :cond_1
    const-wide/32 v6, 0x5265fe8

    cmp-long v6, v4, v6

    if-lez v6, :cond_2

    .line 56
    sub-long/2addr v4, v8

    .line 59
    :cond_2
    new-instance v1, Ljava/util/Date;

    add-long v6, v2, v4

    invoke-direct {v1, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 61
    .local v1, "scheduledDate":Ljava/util/Date;
    iget-object v6, p0, Lco/getair/meerkat/utilities/TimePickerFragment;->dateSelectedRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    iput-object v1, v6, Lco/getair/meerkat/utilities/RunnableWithResultObject;->resultObject:Ljava/lang/Object;

    .line 62
    new-instance v6, Ljava/lang/Thread;

    iget-object v7, p0, Lco/getair/meerkat/utilities/TimePickerFragment;->dateSelectedRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    invoke-direct {v6, v7}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method public setDateSelectedRunnable(Lco/getair/meerkat/utilities/RunnableWithResultObject;)V
    .locals 0
    .param p1, "dateSelectedRunnable"    # Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .prologue
    .line 67
    iput-object p1, p0, Lco/getair/meerkat/utilities/TimePickerFragment;->dateSelectedRunnable:Lco/getair/meerkat/utilities/RunnableWithResultObject;

    .line 68
    return-void
.end method
