package com.squareup.picasso;

public abstract interface Picasso$RequestTransformer
{
  public static final RequestTransformer IDENTITY = new RequestTransformer()
  {
    public Request transformRequest(Request paramAnonymousRequest)
    {
      return paramAnonymousRequest;
    }
  };

  public abstract Request transformRequest(Request paramRequest);
}