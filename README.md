<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Flutter Template Project - MVVM Architecture</h3>

  <p align="center">
    <a href="https://flutter.dev/docs">Flutter 3.7.0</a> &#9679; <a href="https://flutter.dev/docs/null-safety">Null Safety</a> &#9679; <a href="#">MVVM</a>
  </p>
</p>

- Flutter Template Project. Yeni projelerimizi buradan referans alarak kullanabiliriz. Bir projenin ihtiyaç duyabileceği temel özellikleri barındıran projedir.

## Neler Bulunuyor?

- Easy Localization (Çoklu dil desteği)
- Http & Dio ile GET,POST işlemleri yapabilme
- Secure Storage & Hive ile lokal depolama
- Svg resimleri kullanabilme
- Input Formatter
- Bloc & Provider ile State yönetimi
- Json Annotation
- Basit dosya işlemleri
- Navigation (Auto Route & NavigationService)
- ThemeManager ile tema yönetimi
- Responsive tasarım desteği (Responsive Framework & Responsive Builder)
- Assets Generator (Resim, font ve diğer assetleri yönetmek)
- DotEnvironments (Projenin belirli sabitlerini yönetmek)
- Versiyon Kontrolü

Yukarıdaki maddelere ek olarak küçük çaplı pek çok özellikte mevcut.

## Kodlama Standartları

- Bir projeyi geliştirirken tüm ekibin ortak dili konuşması proje geçişleri için son derece önemlidir. Bu kapsamda projeleri geliştirirken aşağıdaki standartlara uygun geliştirmeyi ihmal etmeyin!

### Models Katmanı

- Models klasörü 3 alt katmanı barındırır. Entity, Intent ve Request. Eğer oluşturacağımız model API'ye istek atmak için oluşturulacaksa Request katmanında, sayfalar arası veri transferi için kullanılacaksa Intent katmanında ve bir response veya ham bir data ise Entity katmanında tanımlanmalıdır.

- Oluşturduğumuz model bir request veya response ise yani içerisinde toJson, fromJson metotları barındırıyorsa mutlaka json_serializable paketi kullanılmalıdır. 

- Entity modelleri zorunlu olarak EntityModel<T> sınıfından kalıtım almalıdır. Kullanıma göre Request modelleri de alabilir.

- Model parametreleri final ile tanımlı olup her biri nullable yapılmalıdır. (İstisnalar olabilir.)

- Modele bağımlı sorgular veya filtrelemeler varsa getter ile genişletilmelidir.

	ÖRNEK:

```dart
part 'example_entity_model.g.dart';

@JsonSerializable()
class ExampleEntityModel extends EntityModel<ExampleEntityModel> {
	final String? name;

	ExampleEntityModel({this.name});


	factory ExampleEntityModel.fromJson(Map<String,dynamic> json) => _$ExampleEntityModelFromJson(json);

	ExampleEntityModel fromJson(Map<String,dynamic> json) => _$ExampleEntityModelFromJson(json);

	Map<String, dynamic> toJson() => _$ExampleEntityModelToJson();
}
```


### Repository Katmanı

- Servis isteklerini yönetmek için kullanılan katmandır. Abstract ve concrete adında 2 bölümden oluşmaktadır. Abstract içerisine abstract class'ları tanımlıyoruz ve concrete içerisine de repositoryleri ekliyoruz. 

- Her bir repository muhakkak bir abstract repository'den kalıtım almalıdır.

- Repository içerisindeki metotlar dönüş tipi olarak aşağıdaki 3 tipten birisini döndürmelidir;

    * Result
	* DataResult<TData>
	* ApiResponse<TReturn, TData>

- Abstract repositoryler BaseRepository veya BaseVexanaRepository'den kalıtım almalıdır. Kalıtım alırken constructor'a super.remote() veya super() eklenmelidir.

- Request validasyonları bu katmanda yapılmalıdır.

	ÖRNEK:

```dart
abstract class ExampleRepository extends BaseVexanaRepository{
	Future<ApiResponse<List<ExampleEntityModel>, ExampleEntityModel>> getExamples(ExampleRequestModel request);
}

class RemoteExampleRepository extends BaseVexanaRepository{
	RemoteExampleRepository({
    super.header,
    super.baseUrl,
    super.timeout,
    super.dataService,
    super.baseOptions,
    super.tokenService,
    super.onRefreshToken,
  }) : super.remote();

  @override
  Future<ApiResponse<List<ExampleEntityModel>, ExampleEntityModel>> getExamples(ExampleRequestModel request) async {
	return await dataService.postByResponseData<List<ExampleEntityModel>, EmptyEntityModel>(
      parseModel: ExampleEntityModel(),
      endpoint: 'endpoint',
      body: data,
    ); 
  }
}
```

### State Managers (Cubit)

- Projede cubit kullanılmıyorsa bu açıklamayı atlayabilirsiniz.

- State'leri yönetmek adına cubit için oluşturulan BaseCubit ve BaseDataCubit adında iki adet manager bulunmaktadır. Bu managerlar içerisinde barındırdığı metotlar sayesinde API isteği atarken loading durumunu ayarlayıp gelen response'a göre success veya error durumlarını set etmektedir.

- Bir state manager oluşturmadan önce ilk olarak state sınıfı oluşturulmalıdır. State içerisinde tek bir data olacaksa BaseDataState<T> tercih edilmelidir. Fakat data yoksa veya birden fazla bulunuyorsa o zaman BaseState tercih edilebilir. Unutmayın state sınıfınızı BaseState veya BaseDataState ile kalıtımlamayı ihmal etmeyin.

- State sınıfı düzenlendikten sonra cubit oluşturulmalıdır. Bu cubit sınıfı da bizim state'e göre kalıtım alacaktır. Eğer state sınıfı BaseState'ten kalıtım aldıysa BaseCubit ile diğer durumda BaseDataCubit'ten kalıtım almalıdır.

- Cubit içerisinde atılacak her future istek kalıtımdaki sınıfların metotları ile yapılmalıdır.

	* sendRequestResult
	* sendRequestDataResult<TData>
	* sendRequestApiResponse<TReturn, TData>

	ÖRNEK:

```dart
class ExampleState extends BaseDataState<List<ExampleModel>> {
  ExampleState({
    required super.data,
    required super.errorMessage,
    required super.infoMessage,
    required super.status,
  }) : super();

  ExampleState.initial() : super.initial();

  @override
  ExampleState copyWith({
    List<ExampleModel>? data,
    bool isSetPreviousData = true,
    String? errorMessage,
    String? infoMessage,
    StateStatus? status,
  }) {
    return ExampleState(
      data: data ?? (isSetPreviousData ? this.data : null),
      errorMessage: errorMessage ?? this.errorMessage,
      infoMessage: infoMessage ?? this.infoMessage,
      status: status ?? this.status,
    );
  }
}

class ExampleCubit extends BaseDataCubit<ExampleState> {
  ExampleCubit({ExampleRepository? exampleRepository})
      : _exampleRepository = exampleRepository ?? MockExampleRepository(),
        super(ExampleState.initial());

  final ExampleRepository _exampleRepository;

  Future<void> getExamples() async {
    sendRequestDataResult(futureDataResult: _exampleRepository.getAll());
  }
}
```

### Presentation Katmanı

- Bu katmanda view ve view modelleri tutarız ayrıca widget'lar da burada yer almaktadır. Yukarıdaki repository ve cubit mantığına uygun widget'lar da bulunmaktadır. BaseBlocProviderView ve BaseBlocBuilderView.

Bu iki widget sayfa içerisinde yazılacak kodu azaltarak daha hızlı kodlamaya katkısı bulunmaktadır.

  ÖRNEK:

```dart
  @override
  Widget build(BuildContext context) {
    return BaseBlocProviderView<List<ExampleModel>>(
      create: (_) => ExampleCubit()..getExamples(),
      successChildBuilder: (context, state) {
        return ListView.builder(
          itemCount: state.data?.length ?? 0,
          itemBuilder: (context, index) => const Text('data'),
        );
      },
    );
  }

Widget _buildData() {
  return BaseBlocBuilderView<ExampleModel>(
    errorChildBuilder: (context, state) => Text('Error: ${state.errorMessage}'),
    successChildBuilder: (context, state) => MyCard(child: state.data),
    loadingChild: const CircularProgressIndicator(),
  );
}
```

## Katmanlar

- core
- models
- repositories
- presentation
- utils

Her katmanın kendine has görev ve sorumlulukları bulunmaktadır.

## Katman Görevleri
- ``core``: Tüm mobil projelerinde kullanılabilan, ortak ve dinamik kodları içeren yapıdır.
        Errors, Results, Utils gibi ortak kullanılabilir yapılar burada yer alır.
        
- ``models``: Verileri sakladığımız varlıklar burada tutulur. Modellerimiz json yardımı ile ayrıştırılmaktadır. 
          Bunun için JsonAnnotation kullanılmaktadır. Varsayılan olarak 3 alt başlık bulunmaktadır. <br/>
          [Entity] : Temel sınıflarımızı bu kısma ekliyoruz. ``` class User{} ``` <br/>
          [Request]: API'ye göndereceğimiz datayı içeren sınıflar buraya dahil edilir. ``` class LoginRequest{} ``` <br/>
          [DTO]    : Varlıkların birleşimi ile oluşan yeni model yapımız burada yer alır. Örneğin kategori ve ürün birleşiminden oluşan yeni bir sınıf. ``` class ProductCategoryDto {} ``` <br/>

		  Klasörleme Örneği:

		  models:
		  	|_ entity: User, Product ...
			|_ dto: ProductCategoryDto, EmployeeCompanyDto ...
			|_ request: LoginRequest, UserRequest ...
             
- ``repositories``: Verinin nereden alınacağına karar verdiğimiz katmandır. Genelde CRUD operasyonlarını içerir.
				İçerisinde de `abstract` ve `concrete` klasörleri olmalıdır. <br/>
				[Abstract]: Soyut sınıflarımız burada yer alır. <br/>
				[Concrete]: Soyut sınıflardan implement edilen somut sınıflarımız burada yer alır. <br/>
				
				Klasörleme Örneği:

				repositories:
					|_ abstract: LoginRepository
					|_ concrete: HttpLoginRepository, DioLoginRepository, LocaleLoginRepository ...
          
- ``presentation``: View ve ViewModel katmanlarını burada tutarız. İçerik şu şekildedir.
				[theme]: Temayı burada düzenleriz. Varsayılan ThemeManager kullanılır. <br/>
				[widgets]: Widget'lar burada yer alır. <br/>
			    [screens]: Sayfaları burada saklarız. View ve ViewModel yapısı burada yer alıyor. ViewModelimiz
				varsayılan olarak `cubit` ile oluşturulmaktadır. Yani Bloc yapısı kullanılmaktadır. <br/>

				Klasörleme Örneği:

				presentation
					|_ theme: ThemeManager ...
					|_ widgets: CustomButton, LoginForm ...
					|_ screens
						|_ login
							|_ view: login_screen.dart
							|_ view_model: login_view_model.dart

- ``utils``: Yardımcı araçlarımızı burada tutarız. Bunlar mixins, helpers, constants, enums olabilir.


## Ne, Nasıl Yapılır?

- [Sayfa Yönlendirmesi](https://github.com/E-MRE/base_flutter_project/tree/master/lib/utils/navigation)
- [Yerelleştirme](https://github.com/E-MRE/base_flutter_project/tree/master/lib/utils/constants/lang)
- [Model Oluşturma](https://github.com/E-MRE/base_flutter_project/tree/master/lib/models/)
- [Repository Oluşturma](https://github.com/E-MRE/base_flutter_project/tree/master/lib/repositories)


## Rehber

Bir nesnenin get/post işlemleri için hangi katmana hangi işlemler yapılması gerektiği aşağıda açıklanmaktadır. <br/>

1) endpoint_constants sınıfına kullanılacak endpoint eklenmelidir. <br/>

2) models - entity klasöründe nesne oluştur. <br/>
	1.1- Eğer veri göndermek gerekiyorsa request klasörüne de ilgili sınıfımızı oluşturuyoruz. <br/>

3) repository - buraya ilgili metotlarımızı oluşturup veriyi çekiyoruz. <br/>
	3.1- Abstract isimlendirme standardı -> 'operasyon_adi_repository.dart' şeklinde olmalıdır. <br/>
	3.2- abstract class içerisinde nesneye ait get, post, add, vs. metotları yazılmalıdır. <br/>
	3.3- (Eğer DataResult Result kullanıyorsan geçerli*) metotlar herhangi bir data dönüyorsa DataResult ile sarmallanmalı, eğer void tipindeyse o zaman Result yazılmalı. <br/>
	3.4- (Eğer DataResult Result kullanıyorsan geçerli*) Örn: Future<DataResult<List<String>>> getUsernames();  // metot async olduğu için Future, liste döneceği için DataResult ile sarmallandı. <br/>
	3.5- (Eğer DataResult Result kullanıyorsan geçerli*) Örn: Future<Result> addUsername(String name); //metot async olduğu için Future, geri dönüş değeri olmadığı için Result döndürdük. <br/>
	3.6- (Eğer DataResult Result kullanıyorsan geçerli*) Result: içerisinde işlem başarılı,başarısız bilgisi ve mesaj bilgisini tutar. <br/>
	3.7- (Eğer DataResult Result kullanıyorsan geçerli*) DataResult: Result'tan kalıtım alır. Ekstra olarak datayı da saklar. <br/>
	3.8- somut sınıfımız implement edilir. İsimlendirmesi veri_alma_yöntemi_operasyon_adi_repository.dart ÖRN: http_login_repository.dart <br/>
	3.9- Metotların içi doldurulur ve istek atılır. Gerekiyorsa validation yapılır ve işlem sonucu döndürülür. <br/>

4) view_model - Burada viewModel cubit'ten kalıtım alıcak şekilde oluşturulur. <br>
    4.1- Kullanacağımız repository'nin soyut sınıfı değişken olarak oluşturulur. <br/>
    4.2- constructor ile repository istenir. <br>
    4.3- İhtiyacımız olan metotlar burada oluşturulur. <br/>
    4.4- Repository'e erişim sağlanmadan önce varsa validation yapılır. <br/>
    4.5- Repository'e erişim sağlanır, gelen bilgi view'e aktarılır. <br/>

5) view - Burada viewModel'i oluştururuz ve gerekli bağımlılıkları ayarlarız. <br/>
	5.1- ViewModel üzerinden istek atılır. <br/>
	5.2- statelere göre sayfa içeriği ayarlanır.
