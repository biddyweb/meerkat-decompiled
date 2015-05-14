.class public final Lcom/instabug/library/b;
.super Ljava/lang/Object;
.source "InstabugAnnotationScreen.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/instabug/library/view/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/instabug/library/b$a;
    }
.end annotation


# instance fields
.field private A:Ljava/lang/String;

.field private B:Ljava/lang/String;

.field private C:Landroid/widget/TextView;

.field private D:Landroid/widget/ImageView;

.field private final a:Lcom/instabug/library/InstabugFeedbackActivity;

.field private b:Lcom/instabug/library/presenter/a;

.field private c:Lcom/instabug/library/view/AnnotationView;

.field private d:Landroid/widget/LinearLayout;

.field private e:Landroid/widget/FrameLayout;

.field private f:Landroid/widget/FrameLayout;

.field private g:Landroid/widget/FrameLayout;

.field private h:Landroid/widget/FrameLayout;

.field private i:Landroid/widget/FrameLayout;

.field private j:Landroid/widget/FrameLayout;

.field private k:Landroid/widget/FrameLayout;

.field private l:Landroid/widget/FrameLayout;

.field private m:Landroid/widget/FrameLayout;

.field private n:Landroid/widget/ImageButton;

.field private o:Landroid/widget/ImageButton;

.field private p:Landroid/widget/ImageView;

.field private q:Landroid/view/View;

.field private r:Landroid/view/View;

.field private s:Landroid/widget/ProgressBar;

.field private t:Landroid/widget/EditText;

.field private u:Landroid/widget/EditText;

.field private v:I

.field private w:Landroid/app/ProgressDialog;

.field private x:Landroid/graphics/drawable/Drawable;

.field private y:Lcom/instabug/library/util/f;

.field private z:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Lcom/instabug/library/InstabugFeedbackActivity;)V
    .locals 1

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    const-string v0, "iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAABGdBTUEAALGPC/xhBQAACjppQ0NQUGhvdG9zaG9wIElDQyBwcm9maWxlAABIiZ2Wd1RU1xaHz713eqHNMBQpQ++9DSC9N6nSRGGYGWAoAw4zNLEhogIRRUQEFUGCIgaMhiKxIoqFgGDBHpAgoMRgFFFReTOyVnTl5b2Xl98fZ31rn733PWfvfda6AJC8/bm8dFgKgDSegB/i5UqPjIqmY/sBDPAAA8wAYLIyMwJCPcOASD4ebvRMkRP4IgiAN3fEKwA3jbyD6HTw/0malcEXiNIEidiCzclkibhQxKnZggyxfUbE1PgUMcMoMfNFBxSxvJgTF9nws88iO4uZncZji1h85gx2GlvMPSLemiXkiBjxF3FRFpeTLeJbItZMFaZxRfxWHJvGYWYCgCKJ7QIOK0nEpiIm8cNC3ES8FAAcKfErjv+KBZwcgfhSbukZuXxuYpKArsvSo5vZ2jLo3pzsVI5AYBTEZKUw+Wy6W3paBpOXC8DinT9LRlxbuqjI1ma21tZG5sZmXxXqv27+TYl7u0ivgj/3DKL1fbH9lV96PQCMWVFtdnyxxe8FoGMzAPL3v9g0DwIgKepb+8BX96GJ5yVJIMiwMzHJzs425nJYxuKC/qH/6fA39NX3jMXp/igP3Z2TwBSmCujiurHSU9OFfHpmBpPFoRv9eYj/ceBfn8MwhJPA4XN4oohw0ZRxeYmidvPYXAE3nUfn8v5TE/9h2J+0ONciURo+AWqsMZAaoALk1z6AohABEnNAtAP90Td/fDgQv7wI1YnFuf8s6N+zwmXiJZOb+DnOLSSMzhLysxb3xM8SoAEBSAIqUAAqQAPoAiNgDmyAPXAGHsAXBIIwEAVWARZIAmmAD7JBPtgIikAJ2AF2g2pQCxpAE2gBJ0AHOA0ugMvgOrgBboMHYASMg+dgBrwB8xAEYSEyRIEUIFVICzKAzCEG5Ah5QP5QCBQFxUGJEA8SQvnQJqgEKoeqoTqoCfoeOgVdgK5Cg9A9aBSagn6H3sMITIKpsDKsDZvADNgF9oPD4JVwIrwazoML4e1wFVwPH4Pb4Qvwdfg2PAI/h2cRgBARGqKGGCEMxA0JRKKRBISPrEOKkUqkHmlBupBe5CYygkwj71AYFAVFRxmh7FHeqOUoFmo1ah2qFFWNOoJqR/WgbqJGUTOoT2gyWgltgLZD+6Aj0YnobHQRuhLdiG5DX0LfRo+j32AwGBpGB2OD8cZEYZIxazClmP2YVsx5zCBmDDOLxWIVsAZYB2wglokVYIuwe7HHsOewQ9hx7FscEaeKM8d54qJxPFwBrhJ3FHcWN4SbwM3jpfBaeDt8IJ6Nz8WX4RvwXfgB/Dh+niBN0CE4EMIIyYSNhCpCC+ES4SHhFZFIVCfaEoOJXOIGYhXxOPEKcZT4jiRD0ie5kWJIQtJ20mHSedI90isymaxNdiZHkwXk7eQm8kXyY/JbCYqEsYSPBFtivUSNRLvEkMQLSbyklqSL5CrJPMlKyZOSA5LTUngpbSk3KabUOqkaqVNSw1Kz0hRpM+lA6TTpUumj0lelJ2WwMtoyHjJsmUKZQzIXZcYoCEWD4kZhUTZRGiiXKONUDFWH6kNNppZQv6P2U2dkZWQtZcNlc2RrZM/IjtAQmjbNh5ZKK6OdoN2hvZdTlnOR48htk2uRG5Kbk18i7yzPkS+Wb5W/Lf9ega7goZCisFOhQ+GRIkpRXzFYMVvxgOIlxekl1CX2S1hLipecWHJfCVbSVwpRWqN0SKlPaVZZRdlLOUN5r/JF5WkVmoqzSrJKhcpZlSlViqqjKle1QvWc6jO6LN2FnkqvovfQZ9SU1LzVhGp1av1q8+o66svVC9Rb1R9pEDQYGgkaFRrdGjOaqpoBmvmazZr3tfBaDK0krT1avVpz2jraEdpbtDu0J3XkdXx08nSadR7qknWddFfr1uve0sPoMfRS9Pbr3dCH9a30k/Rr9AcMYANrA67BfoNBQ7ShrSHPsN5w2Ihk5GKUZdRsNGpMM/Y3LjDuMH5homkSbbLTpNfkk6mVaappg+kDMxkzX7MCsy6z3831zVnmNea3LMgWnhbrLTotXloaWHIsD1jetaJYBVhtseq2+mhtY823brGestG0ibPZZzPMoDKCGKWMK7ZoW1fb9banbd/ZWdsJ7E7Y/WZvZJ9if9R+cqnOUs7ShqVjDuoOTIc6hxFHumOc40HHESc1J6ZTvdMTZw1ntnOj84SLnkuyyzGXF66mrnzXNtc5Nzu3tW7n3RF3L/di934PGY/lHtUejz3VPRM9mz1nvKy81nid90Z7+3nv9B72UfZh+TT5zPja+K717fEj+YX6Vfs98df35/t3BcABvgG7Ah4u01rGW9YRCAJ9AncFPgrSCVod9GMwJjgouCb4aYhZSH5IbyglNDb0aOibMNewsrAHy3WXC5d3h0uGx4Q3hc9FuEeUR4xEmkSujbwepRjFjeqMxkaHRzdGz67wWLF7xXiMVUxRzJ2VOitzVl5dpbgqddWZWMlYZuzJOHRcRNzRuA/MQGY9czbeJ35f/AzLjbWH9ZztzK5gT3EcOOWciQSHhPKEyUSHxF2JU0lOSZVJ01w3bjX3ZbJ3cm3yXEpgyuGUhdSI1NY0XFpc2imeDC+F15Oukp6TPphhkFGUMbLabvXu1TN8P35jJpS5MrNTQBX9TPUJdYWbhaNZjlk1WW+zw7NP5kjn8HL6cvVzt+VO5HnmfbsGtYa1pjtfLX9j/uhal7V166B18eu612usL1w/vsFrw5GNhI0pG38qMC0oL3i9KWJTV6Fy4YbCsc1em5uLJIr4RcNb7LfUbkVt5W7t32axbe+2T8Xs4mslpiWVJR9KWaXXvjH7puqbhe0J2/vLrMsO7MDs4O24s9Np55Fy6fK88rFdAbvaK+gVxRWvd8fuvlppWVm7h7BHuGekyr+qc6/m3h17P1QnVd+uca1p3ae0b9u+uf3s/UMHnA+01CrXltS+P8g9eLfOq669Xru+8hDmUNahpw3hDb3fMr5talRsLGn8eJh3eORIyJGeJpumpqNKR8ua4WZh89SxmGM3vnP/rrPFqKWuldZachwcFx5/9n3c93dO+J3oPsk42fKD1g/72ihtxe1Qe277TEdSx0hnVOfgKd9T3V32XW0/Gv94+LTa6ZozsmfKzhLOFp5dOJd3bvZ8xvnpC4kXxrpjux9cjLx4qye4p/+S36Urlz0vX+x16T13xeHK6at2V09dY1zruG59vb3Pqq/tJ6uf2vqt+9sHbAY6b9je6BpcOnh2yGnowk33m5dv+dy6fnvZ7cE7y+/cHY4ZHrnLvjt5L/Xey/tZ9+cfbHiIflj8SOpR5WOlx/U/6/3cOmI9cmbUfbTvSeiTB2Ossee/ZP7yYbzwKflp5YTqRNOk+eTpKc+pG89WPBt/nvF8frroV+lf973QffHDb86/9c1Ezoy/5L9c+L30lcKrw68tX3fPBs0+fpP2Zn6u+K3C2yPvGO9630e8n5jP/oD9UPVR72PXJ79PDxfSFhb+BQOY8/wldxZ1AAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAAGYktHRAD/AP8A/6C9p5MAAAAJcEhZcwAAPYQAAD2EAdWsr3QAAAAHdElNRQffAhAMEx/gmLWmAAAMbElEQVRoQ8WaeXxU5bnHf+97zpmZbBBCEgJGoSwXNwqBgwu4gNwoB0QoXMsSOCxhEeQWxBt7S9QiVq+C4lJRwYIytqbSglLUwYIRK2Up0wKi5aoBWWSHJCRk5syZc96nfwxpZ59s93O/f83M83vOe37nfd/zbsPQClRNzwHwBoB6AI96Pe7vU6REoGr6GABlAN71etwvp9Ing6cSpGApgLEApgKYkUIbgarphQjlDwLwkqrp16VISUqzjaiazsK+/m/Y58Gqpl8drU/CEAD5Vz4fB1DXGIgqo0k0OyEcVdOdAMYByALwHwDaA5jj9bj3pcj7bwCzAKwHcBTAQa/HvTNZTipaZSScK/3lFYSayi1ej/tMAt1PAJQDWABgvdfjFvF0zaXNjDSiavonADp4Pe7+cWJFAHYBmOH1uN+JSW4Fze4jTeBeAN1VTZ8HhNp7WJtfh9Abqk1NAP8HNQIAqqYvATAZQAmAPgDOXwm9DyDf63E3fm8z2tyIqumDADwCYHSc8GUAEwFUej1uX5x4i5FSCZqDqulzAKwBUJRA4gAwCUBGl159956qOuBPoGs2ra4RVdMLAMxGaFy41RbCRYLAOANnHIwBti0AEAQRGGOQOQcY2w9gJ4Bfez3uXUmKaBItNqJqejsAzwMYR0TZQggmy3KVIsubszIzvE6n8t2Zcxc7A/SiLMmLc7KzDjHOC2svXe5nmubdZtAaxABwidcB2A/gEa/HvSdpoUlokRFV06cCWAkgI2hZpsvpfD8nO+uZj95+aT9jjBp1A4brqizx9RJnM3dufrMy/BoTHyzvcuLkmTkNvsACxll7zpgFYDWAspb0n2YZUTU9D8AyANMs226QJXnbNV06Ldq4ZtmRePoBw6eosiytlyQ+c+emtRFGGiEiPnjMzCcaGvzzFUXOBrAPQGmq2UE0TR5HVE2/FkAFEU2zbPFV+6zMiV7PujGJTDQVxpjYuWnNYz17Xl1kC/GhEFQEkEfVdC1VbjhNMqJqem8AvxFCDBOC3ruqIG/EZxtWbU6V1xw2vP7s0aGDisbKirTUtkQegPWqpt8PNG0SmdKIqumZACqEEP2FoHfyOnYo/dD9wvFUeS1hxc8fNieNHb60XVbGIjMYzASwWtX0u70e9z/7XSJSGgHwOyIqMoPWp9PHjyr9Y8Uva1IltIaFMybYn21c/VK7rIyfmUErmwG/UjW9a6q8pEZUTS9jjA0LBMzjy5csGLVg5gQjmb4t2fHer55RZGmdJcTVAF5LpZcTBVRN78kYm9fg8yt9r/+38dodtzZEa8qfeZX9ac++mwOmOZ9z/ufO+R3d7615LkYXzfCSn+TX1l2eS0IUZmVmPLPt3ZWH4+m8HveMfsUlxZIk3alq+nSvx/1mPB2QvEbmWpbdrX27zNUVr/5idzxB1bHvC+rqG3ZZlijx+YxXz1+snfibTVuS1vLEeeXOS3X1ZQ0+/xIzGJxZfanu47GzHnHG0zLGROFVBdMDATOdMTZN1fR8JCBuoaqm3wBgJJEwenfv+kQ8DQD4jcA1QgjIcugyjLEe23f8VUmkB4Bj3592Wrb9Q0WWIMsySIgemelpCXOOnzhZmZmR5rEs6w7GcFciXVwjjLHbLcvu3S4r85cnz547F08DALk57b9yKMrHti0gy/IZzvlHbywvDyTSA8CNvbs3KLL8lhBkCSGgyPLLh749mnAkP1j5riVL0otgDCBoV6ZGMcQYUTW9AxENkyQOy7Y3bK1YacVLBIC1zz9+OTMzfTLnfGB6mut2m0TKyd/q5Y/aXJY3OJ1KkcSlAS6Xq3zvR+uSLnclLv1dkWWvLcRIxlhePE1MZ2dAR1uIIbIs7XAoyol4SeF8tmHVBQAXUunC2bFxtQngy1S6Rl55uuzMrLKntwaD1s9AdK2q6Ueix5bYpsXQiQi5kiTvmjnpvpgb/NGMMj590dKUI21LmLd4GZ9V9lTMPd3Yu4dl2/Z+WZZAoc2NmHVURJKq6ZwIfSSJQdj2d5PHjjDD47f9aFansxeqp35ddXTCiCkLs9GGDBk3p/Drw0dnfnPk2I//ffy89tFxhyKdYaGaL0IqIwg1tUGMcdC/1tkAgOIJD2YFAuazPr+xtsHnf6emtu5xtBEBy+b1Pv87F6prV9Vcqq9o8BkL5z+63BGuURSlWpC4QETdEaclRf/AAfRggE+WpIhlaHVtXQ4RDVMUGU6nEwHTLEEbsabifVcwGLzdqSgkSxKClnXr/i+/zgrX5GS3rydi9QR0QJzlR7QRBiBHEAWClhXRrAo7dzrPGDb7DQM+vx8ul3MV2oh5U8b50tNcHp8RYFboVV459Db1UrjmYu0lizEEOWMRNdVIvClKA+dMUWQpoh1uevM5310/nvvT/Nycj82g5QOwI05ui8nKzJiY3T6rWAiqczmdnz35Xw9EvPav6VLAv/rmsESCbInHvqOijQgAx4nQ37JFerS4cv1r9QA2Rf/eFmyteOUSgN8nin9/+mw6AzLAWC0BMdP6aGs2gP1ExIgo7gj6/4Vl2TmM8RwAp9FEI3tsISBJUjciauV4wUJFplwWpSZgBvMBdGaMHUDoPiOIMOL1uIkxdhyARUR9x5SW5UQnNAdZ4jJjTCHReiucs162bTOENsGTGwEAIqqWOP/ctsTdZ85eTDhtBoBFS1b0OFj1nQsAhox7IKb2GEM727YLBWL7W//hUxgAPPXS2twlL6y+CgDUEVPjtoB7Jv1nrhBiCAAw4It4RxHxZr/nGGN/DASD6RkZaUMXLX0x7rZqv+KS32/9fO/ukjmLvVrJglu3b3g94qkTEXM4nV0DZhDpLtfVPsOMKOtvW96mAZo+5d3N2/Zu/ODTfQNHTnva+9G6uDVnGGZXyxIjOecfExD33CXGiNfjJiLa5VDkC/WXGxZ+vntfWrRm2PgHRwgS9zgdSq6iyDecOnt+YbRm2qInnUTU2xYCgqjXgseWRbz/n3r5rRzbsmfLstTN4VDyDMN4YPZPn445urtv2sMOQaLEsiwwxv6QaCc/0WpuD2Nsq98I9MrrmH1/dJAEBRiYIAo9QMZZzFr+yNETaUEz+EOHosAwzOsPfXvMFR43A6YAEAARiAggmJkZGTFtn0CFlxv8Dzkc8kEi2h4dbySuEa/HbRCRO83lrDl5+tyLEx4sj+grlb979RMCvSkIX9iCtuTmZK+IvoZpBl1CiH6SxEGgPoZpRixnnyibXStJ/GUi+rMQYn9ammvZiscXnIq+zrkLNStCD4xt9Hrcf4+ON5Jwfe31uLcQ0QbOebtvqo7HTEe+2FaxsM+13UdNurd43LbfrjwQHS/I71hgWlYeAFiWdVV+x+yO4fEbh45nf93y9h+GDh44uqjPtSP+8uFbK6678/6Izn7LqOlz/YYx2uGQ9wlBryMJSceJAcOndOCc7wladi/btv/n4CcVi5PpwymeOH/eufPVKx0OBUYggK6FnfUP1r3wdqq8m0dOY3s+fIsGalNHBYLBXzsdcjoRhns97k+S5SU96Dld9YXRpWffSs7ZLMbYzQXdb7TPHDmYco7Va9BYJsvSowTqDQCMMViWXdftBnXT8UN/S5p78tv9GHxf6V3+QGCVIkudAPaQ1+P+bdIkNGGn0etxfwVgiMS5i3H+5E33TnuYiJLmjR5xJw9aVjFjoQqXOIdt20MPfPlNsjQAwKDRpcMaDGOdLEtdGWPLm/rXjpRGAODKYf49EudB0ww+d8u905+9bXRpRJsPp7qmfrDfCKQ1GgEAwzCvKS0Zk3Drc6S+MP2OcbMn+/zGBxLnhYyx570e9yOJ9NE0+QzxVNWBw1169d0jSdJAM2iNFkTFP7hBPdq7/6CaI1/ujViEpeX9oBygAeFGbNuG3wgcO3zwLxGbffMXL0uz0guuD5jmUz6/8YQsST7G2GNej3sJmkGTjQDAqaoDR7r07FspSVI6EWmmZU22glavLj37KX1uutN3+OCeGgDI7Xr9WkmSIqYlkiTBbwRyT1UdeAMApi5c0tGZ03XoqbMX5hLhNdu2B8iytB3AQ16Pe11s6clp0exW1XQXgBEAZhKRduUy+xhod2ZGenVN3eVyRY59RkIIOyMtbXrANPvYQtzEGLtFCOHknB8C8DqADV6P+2RMYhNokZFGrhzFXQeglIgmMsaSbpdeIQDASaET3j8hdBa5G8CJppyDJKJVRhpRNV0BkAZgIIC7AagAuiG0UaAgtPKsB3AKoRPcTwFsB3ARQLA1Bhr5BxQIHx0qIRkGAAAAAElFTkSuQmCC"

    iput-object v0, p0, Lcom/instabug/library/b;->A:Ljava/lang/String;

    .line 113
    const-string v0, "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"

    iput-object v0, p0, Lcom/instabug/library/b;->B:Ljava/lang/String;

    .line 118
    iput-object p1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    .line 119
    return-void
.end method

.method static synthetic a(Lcom/instabug/library/b;)Lcom/instabug/library/presenter/a;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    return-object v0
.end method

.method static synthetic a(Lcom/instabug/library/b;Lorg/json/JSONObject;)V
    .locals 3

    .prologue
    const/4 v2, 0x4

    .line 57
    if-eqz p1, :cond_0

    const-string v0, "white_label"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->C:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private b(I)Landroid/view/View;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0, p1}, Lcom/instabug/library/InstabugFeedbackActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic b(Lcom/instabug/library/b;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/instabug/library/b;->k()V

    return-void
.end method

.method static synthetic c(Lcom/instabug/library/b;)V
    .locals 9

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 57
    iget-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-ne v0, v3, :cond_1

    iget-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-ne v0, v3, :cond_0

    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v1

    move v4, v2

    move v5, v1

    move v7, v1

    move v8, v2

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    iget-object v1, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    iget-object v1, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/instabug/library/b;->m()V

    goto :goto_0
.end method

.method static synthetic d(Lcom/instabug/library/b;)V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/instabug/library/b;->l()V

    return-void
.end method

.method static synthetic e(Lcom/instabug/library/b;)Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/instabug/library/b;->m:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic f(Lcom/instabug/library/b;)Lcom/instabug/library/view/AnnotationView;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    return-object v0
.end method

.method private i(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 502
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0, p1}, Lcom/instabug/library/InstabugFeedbackActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private k()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 449
    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    .line 450
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/high16 v8, 0x3f800000    # 1.0f

    move v3, v1

    move v4, v2

    move v5, v1

    move v6, v2

    move v7, v1

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 453
    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 454
    iget-object v1, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 455
    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 456
    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->clearFocus()V

    .line 457
    const-string v0, "input_method"

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->i(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 458
    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v1}, Lcom/instabug/library/InstabugFeedbackActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 459
    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v1}, Lcom/instabug/library/InstabugFeedbackActivity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 461
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->requestFocus()Z

    .line 463
    :cond_1
    return-void
.end method

.method private l()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 466
    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    const/16 v3, 0x8

    if-ne v0, v3, :cond_0

    .line 467
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/high16 v6, 0x3f800000    # 1.0f

    move v3, v1

    move v4, v2

    move v5, v1

    move v7, v1

    move v8, v2

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 470
    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 471
    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 472
    iget-object v2, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 473
    iget-object v2, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 475
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->isEmailEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 476
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getDefaultEmail()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 477
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 478
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->performClick()Z

    .line 479
    const-string v0, "input_method"

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->i(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 480
    iget-object v2, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 499
    :cond_0
    :goto_0
    return-void

    .line 481
    :cond_1
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getDefaultEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 482
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 483
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->performClick()Z

    .line 484
    const-string v0, "input_method"

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->i(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 485
    iget-object v2, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 487
    :cond_2
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 488
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->performClick()Z

    .line 489
    const-string v0, "input_method"

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->i(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 490
    iget-object v2, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 493
    :cond_3
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 494
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->performClick()Z

    .line 495
    const-string v0, "input_method"

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->i(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 496
    iget-object v2, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0, v2, v1}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0
.end method

.method private m()V
    .locals 9

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 506
    iget-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 507
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/high16 v8, 0x3f800000    # 1.0f

    move v3, v1

    move v4, v2

    move v5, v1

    move v6, v2

    move v7, v1

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 510
    const-wide/16 v2, 0x15e

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 511
    iget-object v1, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 512
    iget-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 514
    :cond_0
    return-void
.end method

.method private n()Lcom/instabug/library/internal/theming/a;
    .locals 2

    .prologue
    .line 733
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->iG()Lcom/instabug/library/Instabug$a;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/Instabug$a;->a:Lcom/instabug/library/Instabug;

    # getter for: Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;
    invoke-static {v0}, Lcom/instabug/library/Instabug;->access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;

    invoke-static {}, Lcom/instabug/library/h;->c()Lcom/instabug/library/Instabug$SdkThemingMode;

    move-result-object v0

    .line 734
    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->MIN_SDK_14:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_0

    .line 735
    const-string v0, "Explicitly loading Native Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 736
    new-instance v0, Lcom/instabug/library/internal/theming/d;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/d;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/d;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    .line 774
    :goto_0
    return-object v0

    .line 737
    :cond_0
    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->APPCOMPAT_V7:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_1

    .line 738
    const-string v0, "Explicitly loading AppCompat Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 739
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 740
    :cond_1
    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->SHERLOCK:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_2

    .line 741
    const-string v0, "Explicitly loading ActionBarSherlock Material Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 742
    new-instance v0, Lcom/instabug/library/internal/theming/e;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/e;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/e;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 743
    :cond_2
    sget-object v1, Lcom/instabug/library/Instabug$SdkThemingMode;->APP_COMPAT_MATERIAL:Lcom/instabug/library/Instabug$SdkThemingMode;

    if-ne v0, v1, :cond_3

    .line 744
    const-string v0, "Explicitly loading AppCompat Material Theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 745
    new-instance v0, Lcom/instabug/library/internal/theming/c;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/c;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/c;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto :goto_0

    .line 749
    :cond_3
    :try_start_0
    const-string v0, "android.support.v7.widget.Toolbar"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 750
    const-string v0, "AppCompat Material found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 751
    new-instance v0, Lcom/instabug/library/internal/theming/c;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/c;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/c;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 756
    :try_start_1
    const-string v0, "android.support.v7.app.ActionBarActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 757
    const-string v0, "AppCompat found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 758
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 763
    :try_start_2
    const-string v0, "com.actionbarsherlock.app.SherlockActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 764
    const-string v0, "ActionBarSherlock found, loading theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 765
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v0

    goto/16 :goto_0

    .line 769
    :catch_2
    move-exception v0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_4

    .line 770
    const-string v0, "No ActionBar libraries found, loading native theme"

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->a(Ljava/lang/String;)V

    .line 771
    new-instance v0, Lcom/instabug/library/internal/theming/b;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/b;-><init>()V

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/internal/theming/b;->a(Landroid/app/Activity;)Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    goto/16 :goto_0

    .line 774
    :cond_4
    const/4 v0, 0x0

    goto/16 :goto_0
.end method


# virtual methods
.method public final a()V
    .locals 12

    .prologue
    const v8, -0xff5551

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 127
    new-instance v0, Lcom/instabug/library/util/f;

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-direct {v0, v1}, Lcom/instabug/library/util/f;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    .line 129
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-static {v0}, Lcom/instabug/library/Instabug$a;->b(Landroid/app/Activity;)V

    .line 130
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    iget-object v1, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_activity_annotation"

    const-string v3, "layout"

    invoke-virtual {v1, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/instabug/library/InstabugFeedbackActivity;->setContentView(I)V

    .line 131
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "annotation_view"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/instabug/library/view/AnnotationView;

    iput-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_lyt_color_picker"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_composer_layout"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_blue_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_red_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_green_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_yellow_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_orange_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "color_gray_button"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "button_pick_color"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->l:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "button_add_message"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "button_clear_all"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "progress_spinner"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "user_email"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "email_separator"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "text_composer"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getCommentHint()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "brush_stroke"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/b;->q:Landroid/view/View;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "brush_icon"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "annotation_view_holder"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/instabug/library/b;->m:Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;

    new-instance v1, Lcom/instabug/library/c;

    invoke-direct {v1, p0}, Lcom/instabug/library/c;-><init>(Lcom/instabug/library/b;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/instabug/library/d;

    invoke-direct {v1, p0}, Lcom/instabug/library/d;-><init>(Lcom/instabug/library/b;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->l:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/instabug/library/e;

    invoke-direct {v1, p0}, Lcom/instabug/library/e;-><init>(Lcom/instabug/library/b;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->q:Landroid/view/View;

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v1}, Lcom/instabug/library/InstabugFeedbackActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v3, "instabug_annotation_color_blue"

    const-string v4, "color"

    invoke-virtual {v2, v3, v4}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;

    new-instance v1, Lcom/instabug/library/f;

    invoke-direct {v1, p0}, Lcom/instabug/library/f;-><init>(Lcom/instabug/library/b;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    new-instance v2, Lcom/instabug/library/interactor/c;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->iG()Lcom/instabug/library/Instabug$a;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/Instabug$a;->a:Lcom/instabug/library/Instabug;

    # getter for: Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;
    invoke-static {v0}, Lcom/instabug/library/Instabug;->access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/h;->d()Lcom/instabug/library/internal/storage/s;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/instabug/library/interactor/c;-><init>(Lcom/instabug/library/internal/storage/s;)V

    .line 133
    new-instance v0, Lcom/instabug/library/internal/device/a;

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v1}, Lcom/instabug/library/InstabugFeedbackActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/instabug/library/internal/device/a;-><init>(Landroid/content/Context;)V

    .line 135
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v1

    .line 136
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v3

    invoke-virtual {v3}, Lcom/instabug/library/Instabug;->iG()Lcom/instabug/library/Instabug$a;

    move-result-object v3

    iget-object v3, v3, Lcom/instabug/library/Instabug$a;->a:Lcom/instabug/library/Instabug;

    # getter for: Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;
    invoke-static {v3}, Lcom/instabug/library/Instabug;->access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;

    move-result-object v3

    invoke-virtual {v3}, Lcom/instabug/library/h;->u()Lcom/instabug/library/a;

    move-result-object v3

    .line 134
    invoke-static {v1, v3, v0}, Lcom/instabug/library/model/b;->a(Lcom/instabug/library/x;Lcom/instabug/library/a;Lcom/instabug/library/internal/device/a;)Lcom/instabug/library/model/b;

    move-result-object v4

    .line 137
    new-instance v5, Lcom/instabug/library/internal/storage/a;

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/instabug/library/internal/storage/a;-><init>(Landroid/content/Context;)V

    .line 138
    new-instance v0, Lcom/instabug/library/presenter/a;

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v1

    invoke-virtual {v1}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v3

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/instabug/library/presenter/a;-><init>(Lcom/instabug/library/view/a;Lcom/instabug/library/interactor/c;Lcom/instabug/library/x;Lcom/instabug/library/model/b;Lcom/instabug/library/internal/storage/a;)V

    iput-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    .line 139
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_btn_send"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_btn_back"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 143
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "com.instabug.load_own_theme"

    invoke-virtual {v0, v1, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 144
    invoke-direct {p0}, Lcom/instabug/library/b;->n()Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    move-object v1, v0

    .line 159
    :goto_0
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_titlebar"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    iget-object v2, v1, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_toolbar"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    iget-object v2, v1, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    iget-object v2, v1, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_txt_title"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget v2, v1, Lcom/instabug/library/internal/theming/a;->d:I

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    iget v3, v1, Lcom/instabug/library/internal/theming/a;->d:I

    invoke-virtual {v0, v2, v3}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    invoke-virtual {v0}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, v1, Lcom/instabug/library/internal/theming/a;->c:I

    :goto_1
    iget v0, v1, Lcom/instabug/library/internal/theming/a;->c:I

    iput v0, p0, Lcom/instabug/library/b;->v:I

    iget-object v0, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;

    iget v2, p0, Lcom/instabug/library/b;->v:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v0, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;

    iget v2, p0, Lcom/instabug/library/b;->v:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/widget/ImageButton;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v0, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;

    iget v2, p0, Lcom/instabug/library/b;->v:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/widget/ImageButton;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_btn_back"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget v2, v1, Lcom/instabug/library/internal/theming/a;->c:I

    sget-object v3, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v2, v3}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_btn_send"

    const-string v3, "id"

    invoke-virtual {v0, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget v1, v1, Lcom/instabug/library/internal/theming/a;->c:I

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getFeedbackPopupColors()Lcom/instabug/library/dialog/d$a;

    move-result-object v2

    iget-object v1, p0, Lcom/instabug/library/b;->A:Ljava/lang/String;

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v3, "instabug_logo"

    const-string v4, "id"

    invoke-virtual {v0, v3, v4}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/instabug/library/b;->D:Landroid/widget/ImageView;

    if-eqz v2, :cond_8

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v3, "instabug_composer_internal_layout"

    const-string v4, "id"

    invoke-virtual {v0, v3, v4}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->a:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->b:I

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->c:I

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setHintTextColor(I)V

    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    iget v3, v2, Lcom/instabug/library/dialog/d$a;->b:I

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setTextColor(I)V

    iget v0, v2, Lcom/instabug/library/dialog/d$a;->a:I

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    const-wide v4, 0x3fd322d0e5604189L    # 0.299

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v8

    int-to-double v8, v8

    mul-double/2addr v4, v8

    const-wide v8, 0x3fe2c8b439581062L    # 0.587

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v10

    int-to-double v10, v10

    mul-double/2addr v8, v10

    add-double/2addr v4, v8

    const-wide v8, 0x3fbd2f1a9fbe76c9L    # 0.114

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    int-to-double v10, v0

    mul-double/2addr v8, v10

    add-double/2addr v4, v8

    const-wide v8, 0x406fe00000000000L    # 255.0

    div-double/2addr v4, v8

    sub-double/2addr v2, v4

    const-wide/high16 v4, 0x3fe0000000000000L    # 0.5

    cmpg-double v0, v2, v4

    if-gez v0, :cond_5

    move v0, v6

    :goto_2
    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/instabug/library/b;->B:Ljava/lang/String;

    :goto_3
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0, v6}, Landroid/util/Base64;->decode([BI)[B

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v6, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/b;->D:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_pbi_text"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/instabug/library/b;->C:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/instabug/library/b;->C:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "&name&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "&name&"

    const-string v2, "Instabug"

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "  "

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const-string v0, "Feedback Powered by Instabug"

    :cond_1
    :goto_4
    iget-object v1, p0, Lcom/instabug/library/b;->C:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 161
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->o()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 162
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->getSettingsBundle()Lcom/instabug/library/x;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/x;->p()V

    .line 163
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0, v1}, Lcom/instabug/library/Instabug;->showAnimatedTutorial(Landroid/app/Activity;)V

    .line 166
    :cond_2
    new-instance v1, Ljava/io/File;

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    :goto_5
    const-string v2, "com.instabug.library.settings"

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 167
    new-instance v0, Lcom/instabug/library/b$a;

    invoke-direct {v0, v6}, Lcom/instabug/library/b$a;-><init>(B)V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v1, v2, v6

    aput-object p0, v2, v7

    invoke-virtual {v0, v2}, Lcom/instabug/library/b$a;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 168
    return-void

    .line 146
    :cond_3
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->iG()Lcom/instabug/library/Instabug$a;

    move-result-object v0

    iget-object v0, v0, Lcom/instabug/library/Instabug$a;->a:Lcom/instabug/library/Instabug;

    # getter for: Lcom/instabug/library/Instabug;->mDelegate:Lcom/instabug/library/h;
    invoke-static {v0}, Lcom/instabug/library/Instabug;->access$000(Lcom/instabug/library/Instabug;)Lcom/instabug/library/h;

    invoke-static {}, Lcom/instabug/library/h;->b()Lcom/instabug/library/internal/theming/a;

    move-result-object v0

    .line 148
    if-nez v0, :cond_9

    .line 150
    new-instance v0, Lcom/instabug/library/internal/theming/a;

    invoke-direct {v0}, Lcom/instabug/library/internal/theming/a;-><init>()V

    .line 151
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    const v2, -0x333334

    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 152
    const/4 v1, -0x1

    iput v1, v0, Lcom/instabug/library/internal/theming/a;->c:I

    .line 153
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, v0, Lcom/instabug/library/internal/theming/a;->a:Landroid/graphics/drawable/Drawable;

    .line 155
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v1, v8}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v1, v0, Lcom/instabug/library/internal/theming/a;->b:Landroid/graphics/drawable/Drawable;

    move-object v1, v0

    goto/16 :goto_0

    .line 159
    :cond_4
    iget v2, v1, Lcom/instabug/library/internal/theming/a;->c:I

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto/16 :goto_1

    :cond_5
    move v0, v7

    goto/16 :goto_2

    :cond_6
    const-string v0, "Feedback Powered by Instabug"

    goto/16 :goto_4

    .line 166
    :cond_7
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getCacheDir()Ljava/io/File;

    move-result-object v0

    goto :goto_5

    :cond_8
    move-object v0, v1

    goto/16 :goto_3

    :cond_9
    move-object v1, v0

    goto/16 :goto_0
.end method

.method public final a(I)V
    .locals 2

    .prologue
    .line 564
    iget-object v0, p0, Lcom/instabug/library/b;->q:Landroid/view/View;

    iget-object v1, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v1}, Lcom/instabug/library/InstabugFeedbackActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 565
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    invoke-virtual {v0, p1}, Lcom/instabug/library/view/AnnotationView;->a(I)V

    .line 566
    return-void
.end method

.method public final a(Landroid/graphics/Bitmap;)V
    .locals 2

    .prologue
    .line 584
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    invoke-virtual {v0, p1}, Lcom/instabug/library/view/AnnotationView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 585
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/instabug/library/view/AnnotationView;->setVisibility(I)V

    .line 586
    iget-object v0, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 588
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    new-instance v1, Lcom/instabug/library/g;

    invoke-direct {v1, p0}, Lcom/instabug/library/g;-><init>(Lcom/instabug/library/b;)V

    invoke-virtual {v0, v1}, Lcom/instabug/library/view/AnnotationView;->post(Ljava/lang/Runnable;)Z

    .line 596
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 3

    .prologue
    .line 123
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_txt_title"

    const-string v2, "id"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/instabug/library/b;->b(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    return-void
.end method

.method public final a(Z)V
    .locals 3

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 606
    if-eqz p1, :cond_0

    .line 607
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setVisibility(I)V

    .line 608
    iget-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 613
    :goto_0
    return-void

    .line 610
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 611
    iget-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method

.method public final b()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 233
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->b()V

    .line 235
    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 237
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    invoke-virtual {v0}, Lcom/instabug/library/view/AnnotationView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 238
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/instabug/library/view/AnnotationView;->setDrawingCacheEnabled(Z)V

    .line 239
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :goto_0
    iput-object v2, p0, Lcom/instabug/library/b;->d:Landroid/widget/LinearLayout;

    .line 245
    iput-object v2, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    .line 248
    :try_start_1
    iget-object v0, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 249
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    .line 251
    iget-object v0, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 252
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    .line 254
    iget-object v0, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 255
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    .line 257
    iget-object v0, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 258
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    .line 260
    iget-object v0, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 261
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    .line 263
    iget-object v0, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 264
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 274
    :goto_1
    iput-object v2, p0, Lcom/instabug/library/b;->l:Landroid/widget/FrameLayout;

    .line 276
    :try_start_2
    iget-object v0, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 277
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 283
    :goto_2
    :try_start_3
    iget-object v0, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 284
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 290
    :goto_3
    :try_start_4
    iget-object v0, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 291
    iget-object v0, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 292
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    .line 297
    :goto_4
    iput-object v2, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    .line 300
    :try_start_5
    iget-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->r:Landroid/view/View;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 306
    :goto_5
    iput-object v2, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    .line 309
    :try_start_6
    iget-object v0, p0, Lcom/instabug/library/b;->q:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 310
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->q:Landroid/view/View;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 316
    :goto_6
    :try_start_7
    iget-object v0, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 317
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    .line 323
    :goto_7
    :try_start_8
    iget-object v0, p0, Lcom/instabug/library/b;->m:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 324
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/instabug/library/b;->m:Landroid/widget/FrameLayout;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_8

    .line 330
    :goto_8
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_9
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 331
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_9

    .line 337
    :goto_9
    iput-object v2, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    .line 338
    return-void

    .line 241
    :catch_0
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    goto/16 :goto_0

    .line 266
    :catch_1
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    .line 267
    iput-object v2, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    .line 268
    iput-object v2, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;

    .line 269
    iput-object v2, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    .line 270
    iput-object v2, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    .line 271
    iput-object v2, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    goto/16 :goto_1

    .line 279
    :catch_2
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->n:Landroid/widget/ImageButton;

    goto :goto_2

    .line 286
    :catch_3
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->o:Landroid/widget/ImageButton;

    goto :goto_3

    .line 294
    :catch_4
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->s:Landroid/widget/ProgressBar;

    goto :goto_4

    .line 303
    :catch_5
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->r:Landroid/view/View;

    goto :goto_5

    .line 312
    :catch_6
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->q:Landroid/view/View;

    goto :goto_6

    .line 319
    :catch_7
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->p:Landroid/widget/ImageView;

    goto :goto_7

    .line 326
    :catch_8
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->m:Landroid/widget/FrameLayout;

    goto :goto_8

    .line 333
    :catch_9
    move-exception v0

    iput-object v2, p0, Lcom/instabug/library/b;->x:Landroid/graphics/drawable/Drawable;

    .line 334
    iput-object v2, p0, Lcom/instabug/library/b;->z:Landroid/graphics/drawable/Drawable;

    goto :goto_9
.end method

.method public final b(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 622
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 623
    return-void
.end method

.method public final c()Ljava/lang/String;
    .locals 2

    .prologue
    .line 575
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "com.instabug.snapshot_file_path"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final c(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 632
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 633
    return-void
.end method

.method public final d()Landroid/graphics/Bitmap;
    .locals 2

    .prologue
    .line 600
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/instabug/library/view/AnnotationView;->setDrawingCacheEnabled(Z)V

    .line 601
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    invoke-virtual {v0}, Lcom/instabug/library/view/AnnotationView;->getDrawingCache()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 642
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0, p1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 643
    return-void
.end method

.method public final e()Ljava/lang/String;
    .locals 1

    .prologue
    .line 627
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final e(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 662
    invoke-direct {p0}, Lcom/instabug/library/b;->l()V

    .line 663
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 664
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 665
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 666
    iget-object v0, p0, Lcom/instabug/library/b;->t:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 667
    return-void
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final f(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 671
    invoke-direct {p0}, Lcom/instabug/library/b;->l()V

    .line 672
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 673
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 674
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 675
    iget-object v0, p0, Lcom/instabug/library/b;->u:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 676
    return-void
.end method

.method public final g()V
    .locals 1

    .prologue
    .line 685
    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 686
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->finish()V

    .line 687
    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 680
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, v2, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    .line 681
    return-void
.end method

.method public final h()V
    .locals 1

    .prologue
    .line 700
    iget-object v0, p0, Lcom/instabug/library/b;->c:Lcom/instabug/library/view/AnnotationView;

    invoke-virtual {v0}, Lcom/instabug/library/view/AnnotationView;->a()V

    .line 701
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 691
    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/instabug/library/b;->w:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 692
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 693
    const/16 v1, 0x11

    invoke-virtual {v0, v1, v2, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 694
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 695
    iget-object v0, p0, Lcom/instabug/library/b;->a:Lcom/instabug/library/InstabugFeedbackActivity;

    invoke-virtual {v0}, Lcom/instabug/library/InstabugFeedbackActivity;->finish()V

    .line 696
    return-void
.end method

.method public final i()V
    .locals 1

    .prologue
    .line 720
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->a()V

    .line 721
    return-void
.end method

.method public final j()V
    .locals 1

    .prologue
    .line 724
    iget-object v0, p0, Lcom/instabug/library/b;->e:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 725
    invoke-direct {p0}, Lcom/instabug/library/b;->k()V

    .line 730
    :goto_0
    return-void

    .line 729
    :cond_0
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->d()V

    goto :goto_0
.end method

.method public final onClick(Landroid/view/View;)V
    .locals 4

    .prologue
    .line 421
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 422
    iget-object v1, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_btn_back"

    const-string v3, "id"

    invoke-virtual {v1, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 423
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->d()V

    .line 446
    :goto_0
    return-void

    .line 424
    :cond_0
    iget-object v1, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v2, "instabug_btn_send"

    const-string v3, "id"

    invoke-virtual {v1, v2, v3}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 425
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->c()V

    goto :goto_0

    .line 428
    :cond_1
    invoke-direct {p0}, Lcom/instabug/library/b;->m()V

    .line 429
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_blue"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 430
    iget-object v1, p0, Lcom/instabug/library/b;->f:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 431
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_blue"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 444
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v1, v0}, Lcom/instabug/library/presenter/a;->a(I)V

    goto :goto_0

    .line 432
    :cond_3
    iget-object v1, p0, Lcom/instabug/library/b;->g:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 433
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_red"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_1

    .line 434
    :cond_4
    iget-object v1, p0, Lcom/instabug/library/b;->h:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 435
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_green"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_1

    .line 436
    :cond_5
    iget-object v1, p0, Lcom/instabug/library/b;->k:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 437
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_gray"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_1

    .line 438
    :cond_6
    iget-object v1, p0, Lcom/instabug/library/b;->i:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 439
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_yellow"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_1

    .line 440
    :cond_7
    iget-object v1, p0, Lcom/instabug/library/b;->j:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 441
    iget-object v0, p0, Lcom/instabug/library/b;->y:Lcom/instabug/library/util/f;

    const-string v1, "instabug_annotation_color_orange"

    const-string v2, "color"

    invoke-virtual {v0, v1, v2}, Lcom/instabug/library/util/f;->a(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    goto :goto_1
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .prologue
    .line 706
    if-eqz p3, :cond_0

    :try_start_0
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 707
    :cond_0
    const/4 v0, 0x6

    if-ne p2, v0, :cond_1

    .line 711
    iget-object v0, p0, Lcom/instabug/library/b;->b:Lcom/instabug/library/presenter/a;

    invoke-virtual {v0}, Lcom/instabug/library/presenter/a;->c()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 716
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 713
    :catch_0
    move-exception v0

    .line 714
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
