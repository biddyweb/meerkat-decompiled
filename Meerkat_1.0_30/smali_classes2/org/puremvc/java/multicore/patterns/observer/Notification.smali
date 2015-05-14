.class public Lorg/puremvc/java/multicore/patterns/observer/Notification;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Lorg/puremvc/java/multicore/interfaces/INotification;


# instance fields
.field private body:Ljava/lang/Object;

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 82
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 83
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 84
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 96
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 98
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/Object;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 54
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 57
    iput-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 70
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    .line 71
    iput-object p2, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 72
    iput-object p3, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 73
    return-void
.end method


# virtual methods
.method public getBody()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    return-object v0
.end method

.method public setBody(Ljava/lang/Object;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/Object;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    .line 134
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    .line 142
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 152
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Notification Name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/puremvc/java/multicore/patterns/observer/Notification;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Body:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 153
    .local v0, "result":Ljava/lang/String;
    iget-object v1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    if-eqz v1, :cond_0

    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->body:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 158
    :goto_0
    iget-object v1, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/puremvc/java/multicore/patterns/observer/Notification;->type:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 163
    :goto_1
    return-object v0

    .line 156
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "null Type:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 161
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "null "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method
