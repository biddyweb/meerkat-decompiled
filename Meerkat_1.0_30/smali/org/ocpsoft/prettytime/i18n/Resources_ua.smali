.class public Lorg/ocpsoft/prettytime/i18n/Resources_ua;
.super Ljava/util/ListResourceBundle;
.source "Resources_ua.java"

# interfaces
.implements Lorg/ocpsoft/prettytime/impl/TimeFormatProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;
    }
.end annotation


# static fields
.field private static final OBJECTS:[[Ljava/lang/Object;

.field private static final slavicPluralForms:I = 0x3

.field private static final tolerance:I = 0x32


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 40
    filled-new-array {v0, v0}, [I

    move-result-object v0

    const-class v1, Ljava/lang/Object;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Ljava/lang/Object;

    sput-object v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua;->OBJECTS:[[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/util/ListResourceBundle;-><init>()V

    .line 47
    return-void
.end method


# virtual methods
.method public getContents()[[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 123
    sget-object v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua;->OBJECTS:[[Ljava/lang/Object;

    return-object v0
.end method

.method public getFormatFor(Lorg/ocpsoft/prettytime/TimeUnit;)Lorg/ocpsoft/prettytime/TimeFormat;
    .locals 6
    .param p1, "t"    # Lorg/ocpsoft/prettytime/TimeUnit;

    .prologue
    const/4 v1, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 128
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/JustNow;

    if-eqz v0, :cond_0

    .line 129
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;

    invoke-direct {v0, p0}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$1;-><init>(Lorg/ocpsoft/prettytime/i18n/Resources_ua;)V

    .line 183
    :goto_0
    return-object v0

    .line 160
    :cond_0
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Century;

    if-eqz v0, :cond_1

    .line 161
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0441\u0442\u043e\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v3

    const-string v2, "\u0441\u0442\u043e\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v4

    const-string v2, "\u0441\u0442\u043e\u043b\u0456\u0442\u0442\u044c"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto :goto_0

    .line 162
    :cond_1
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Day;

    if-eqz v0, :cond_2

    .line 163
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0434\u0435\u043d\u044c"

    aput-object v2, v1, v3

    const-string v2, "\u0434\u043d\u0456"

    aput-object v2, v1, v4

    const-string v2, "\u0434\u043d\u0456\u0432"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto :goto_0

    .line 164
    :cond_2
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Decade;

    if-eqz v0, :cond_3

    .line 165
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0434\u0435\u0441\u044f\u0442\u0438\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v3

    const-string v2, "\u0434\u0435\u0441\u044f\u0442\u0438\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v4

    const-string v2, "\u0434\u0435\u0441\u044f\u0442\u0438\u043b\u0456\u0442\u044c"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto :goto_0

    .line 166
    :cond_3
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Hour;

    if-eqz v0, :cond_4

    .line 167
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0433\u043e\u0434\u0438\u043d\u0443"

    aput-object v2, v1, v3

    const-string v2, "\u0433\u043e\u0434\u0438\u043d\u0438"

    aput-object v2, v1, v4

    const-string v2, "\u0433\u043e\u0434\u0438\u043d"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto :goto_0

    .line 168
    :cond_4
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Millennium;

    if-eqz v0, :cond_5

    .line 169
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0442\u0438\u0441\u044f\u0447\u043e\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v3

    const-string v2, "\u0442\u0438\u0441\u044f\u0447\u043e\u043b\u0456\u0442\u0442\u044f"

    aput-object v2, v1, v4

    const-string v2, "\u0442\u0438\u0441\u044f\u0447\u043e\u043b\u0456\u0442\u044c"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto :goto_0

    .line 170
    :cond_5
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Millisecond;

    if-eqz v0, :cond_6

    .line 171
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u043c\u0456\u043b\u0456\u0441\u0435\u043a\u0443\u043d\u0434\u0443"

    aput-object v2, v1, v3

    const-string v2, "\u043c\u0456\u043b\u0456\u0441\u0435\u043a\u0443\u043d\u0434\u0438"

    aput-object v2, v1, v4

    const-string v2, "\u043c\u0456\u043b\u0456\u0441\u0435\u043a\u0443\u043d\u0434"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 172
    :cond_6
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Minute;

    if-eqz v0, :cond_7

    .line 173
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0445\u0432\u0438\u043b\u0438\u043d\u0443"

    aput-object v2, v1, v3

    const-string v2, "\u0445\u0432\u0438\u043b\u0438\u043d\u0438"

    aput-object v2, v1, v4

    const-string v2, "\u0445\u0432\u0438\u043b\u0438\u043d"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 174
    :cond_7
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Month;

    if-eqz v0, :cond_8

    .line 175
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u043c\u0456\u0441\u044f\u0446\u044c"

    aput-object v2, v1, v3

    const-string v2, "\u043c\u0456\u0441\u044f\u0446\u0456"

    aput-object v2, v1, v4

    const-string v2, "\u043c\u0456\u0441\u044f\u0446\u0456\u0432"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 176
    :cond_8
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Second;

    if-eqz v0, :cond_9

    .line 177
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0441\u0435\u043a\u0443\u043d\u0434\u0443"

    aput-object v2, v1, v3

    const-string v2, "\u0441\u0435\u043a\u0443\u043d\u0434\u0438"

    aput-object v2, v1, v4

    const-string v2, "\u0441\u0435\u043a\u0443\u043d\u0434"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 178
    :cond_9
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Week;

    if-eqz v0, :cond_a

    .line 179
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0442\u0438\u0436\u0434\u0435\u043d\u044c"

    aput-object v2, v1, v3

    const-string v2, "\u0442\u0438\u0436\u043d\u0456"

    aput-object v2, v1, v4

    const-string v2, "\u0442\u0438\u0436\u043d\u0456\u0432"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 180
    :cond_a
    instance-of v0, p1, Lorg/ocpsoft/prettytime/units/Year;

    if-eqz v0, :cond_b

    .line 181
    new-instance v0, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "\u0440\u0456\u043a"

    aput-object v2, v1, v3

    const-string v2, "\u0440\u043e\u043a\u0438"

    aput-object v2, v1, v4

    const-string v2, "\u0440\u043e\u043a\u0456\u0432"

    aput-object v2, v1, v5

    invoke-direct {v0, v1}, Lorg/ocpsoft/prettytime/i18n/Resources_ua$TimeFormatAided;-><init>([Ljava/lang/String;)V

    goto/16 :goto_0

    .line 183
    :cond_b
    const/4 v0, 0x0

    goto/16 :goto_0
.end method
