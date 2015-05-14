package retrofit;

import retrofit.client.Response;

final class ResponseWrapper
{
  final Response response;
  final Object responseBody;

  ResponseWrapper(Response paramResponse, Object paramObject)
  {
    this.response = paramResponse;
    this.responseBody = paramObject;
  }
}