# Models Hakkında

- Nesnelerimizi sakladığımız katmandır. Burada entity, request, dto, intent tipinde nesneler oluşturabiliriz.
   - Entity : API ve benzeri yerlerden çektiğimiz veriler için burada sınıflar oluştururuz. 
   - Request: API ve benzeri operasyonlarda veri göndermek için burada sınıf oluşturup, bu sınıfları göndeririz.
   - DTO    : 2 veya daha fazla Entity'nin ortak değişkenlerini barındıran yeni tür sınıflarımızı burada oluştururuz.
   - Intent : Sayfalar arasında geçiş yaparken birden fazla değişken gönderirken tek çatıda toplamak için burada sınıf 
              oluştururuz. 



## Dikkat Edilmesi Gereken Hususlar

- Nesnemizi oluşturduktan sonra JsonSerialization kullanarak fromJson toJson metotları oluşturulmalıdır. Basit örneği lib/models/entity/example.dart içerisinde bulabilirsin.

- HttpManager kullanıyorsan Entity sınıfların EntityModel<T> ile extend edilmelidir. (T: sınıfın adı)


## Örnekler

```dart
@JsonSerializable()
class MyModel extends EntityModel<MyModel>{}
```