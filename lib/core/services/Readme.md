# API Request Services

- API'ye istek atarken kullanılan servisler burada yer almaktadır. Şuan için GET ve POST metotlarını desteklemektedir.

- Şuan kullanılabilir 2 adet servis bulunmaktadır. Bu servisler RemoteDataService'ten kalıtım almaktadır. GetData, GetDataByApiResponse ile PostData, PostDataByApiResponse metotlarını barındırırlar. Servisler:
    - HttpRemoteDataManager
    - VexanaRemoteDataManager


## Örnek Kullanım

```dart
 Future<void> testRestApi() async {
    RemoteDataService remoteDataService = HttpRemoteDataManager.getInstance();
    final resultHttp = await remoteDataService.getData<EmptyModel, EmptyModel>(
      endpoint: 'endpoint',
      parseModel: EmptyModel(),
      query: 'query',
      headers: {'key': 'value'},
      timeoutDuration: DurationTypes.sixteenSeconds,
    );

    print('Success: ${resultHttp.success} Message: ${resultHttp.message} Data: ${resultHttp.data?.toJson()}');

    remoteDataService = VexanaRemoteDataManager.getInstance();

    final resultVexana = await remoteDataService.getData<EmptyModel, EmptyModel>(
      endpoint: 'endpoint',
      parseModel: EmptyModel(),
      query: 'query',
      headers: {'key': 'value'},
      timeoutDuration: DurationTypes.sixteenSeconds,
    );

    print('Success: ${resultVexana.success} Message: ${resultVexana.message} Data: ${resultVexana.data?.toJson()}');
  }
```