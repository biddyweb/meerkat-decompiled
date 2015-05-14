package co.getair.meerkat.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class LoginSuccessfulView extends RelativeLayout
{
  private TextView linksWillOpenInAppText;
  private ImageView logInSuccessfulImage;
  private TextView yourLoggedInText;

  public LoginSuccessfulView(Context paramContext)
  {
    super(paramContext);
    init(paramContext, null, 0);
  }

  public LoginSuccessfulView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init(paramContext, paramAttributeSet, 0);
  }

  public LoginSuccessfulView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init(paramContext, paramAttributeSet, paramInt);
  }

  private void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    ((LayoutInflater)paramContext.getSystemService("layout_inflater")).inflate(2130968640, this);
    this.yourLoggedInText = ((TextView)findViewById(2131624262));
    this.linksWillOpenInAppText = ((TextView)findViewById(2131624264));
    this.logInSuccessfulImage = ((ImageView)findViewById(2131624263));
  }
}