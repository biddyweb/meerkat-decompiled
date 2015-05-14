package com.google.android.gms.games.internal.player;

import android.text.TextUtils;

public final class PlayerColumnNames
{
  public final String zzaiA;
  public final String zzaiB;
  public final String zzaiC;
  public final String zzaiD;
  public final String zzaiE;
  public final String zzaiF;
  public final String zzaiG;
  public final String zzaiH;
  public final String zzaiI;
  public final String zzaiJ;
  public final String zzaiK;
  public final String zzaiL;
  public final String zzaiM;
  public final String zzaiN;
  public final String zzaio;
  public final String zzaip;
  public final String zzaiq;
  public final String zzair;
  public final String zzais;
  public final String zzait;
  public final String zzaiu;
  public final String zzaiv;
  public final String zzaiw;
  public final String zzaix;
  public final String zzaiy;
  public final String zzaiz;

  public PlayerColumnNames(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      this.zzaio = "external_player_id";
      this.zzaip = "profile_name";
      this.zzaiq = "profile_icon_image_uri";
      this.zzair = "profile_icon_image_url";
      this.zzais = "profile_hi_res_image_uri";
      this.zzait = "profile_hi_res_image_url";
      this.zzaiu = "last_updated";
      this.zzaiv = "is_in_circles";
      this.zzaiw = "played_with_timestamp";
      this.zzaix = "current_xp_total";
      this.zzaiy = "current_level";
      this.zzaiz = "current_level_min_xp";
      this.zzaiA = "current_level_max_xp";
      this.zzaiB = "next_level";
      this.zzaiC = "next_level_max_xp";
      this.zzaiD = "last_level_up_timestamp";
      this.zzaiE = "player_title";
      this.zzaiF = "has_all_public_acls";
      this.zzaiG = "is_profile_visible";
      this.zzaiH = "most_recent_external_game_id";
      this.zzaiI = "most_recent_game_name";
      this.zzaiJ = "most_recent_activity_timestamp";
      this.zzaiK = "most_recent_game_icon_uri";
      this.zzaiL = "most_recent_game_hi_res_uri";
      this.zzaiM = "most_recent_game_featured_uri";
      this.zzaiN = "has_debug_access";
      return;
    }
    this.zzaio = (paramString + "external_player_id");
    this.zzaip = (paramString + "profile_name");
    this.zzaiq = (paramString + "profile_icon_image_uri");
    this.zzair = (paramString + "profile_icon_image_url");
    this.zzais = (paramString + "profile_hi_res_image_uri");
    this.zzait = (paramString + "profile_hi_res_image_url");
    this.zzaiu = (paramString + "last_updated");
    this.zzaiv = (paramString + "is_in_circles");
    this.zzaiw = (paramString + "played_with_timestamp");
    this.zzaix = (paramString + "current_xp_total");
    this.zzaiy = (paramString + "current_level");
    this.zzaiz = (paramString + "current_level_min_xp");
    this.zzaiA = (paramString + "current_level_max_xp");
    this.zzaiB = (paramString + "next_level");
    this.zzaiC = (paramString + "next_level_max_xp");
    this.zzaiD = (paramString + "last_level_up_timestamp");
    this.zzaiE = (paramString + "player_title");
    this.zzaiF = (paramString + "has_all_public_acls");
    this.zzaiG = (paramString + "is_profile_visible");
    this.zzaiH = (paramString + "most_recent_external_game_id");
    this.zzaiI = (paramString + "most_recent_game_name");
    this.zzaiJ = (paramString + "most_recent_activity_timestamp");
    this.zzaiK = (paramString + "most_recent_game_icon_uri");
    this.zzaiL = (paramString + "most_recent_game_hi_res_uri");
    this.zzaiM = (paramString + "most_recent_game_featured_uri");
    this.zzaiN = (paramString + "has_debug_access");
  }
}