import UIKit

/// IOS YASAM DONGULERINI ARASTIRIP BIRER ORNEK YAZINIZ

/*
init(coder:) veya init(nibName:bundle:):

Görünüm kontrolörü oluşturulduğunda çağrılır.
Görünüm kontrolörünün başlatılması için kullanılır.
Örneğin, görünüm kontrolörü bir storyboard'dan yükleniyorsa init(coder:) kullanılır.
 
 
loadView():

Görünüm kontrolörünün görünümü yüklenmeden hemen önce çağrılır.
Görünümü programatik olarak oluşturmak için kullanılır.
Genellikle bu metodu doğrudan çağırmazsınız; eğer görünümü kendiniz oluşturmak istiyorsanız, bu metodu override edebilirsiniz.
 
 
viewDidLoad():

Görünüm yüklendikten sonra çağrılır.
İlk kurulum ve yapılandırmalar için kullanılır.
Örneğin, API'dan veri çekme, görünüm özelliklerini ayarlama.
 
 
viewWillAppear(_:):

Görünüm kullanıcıya gösterilmeden hemen önce çağrılır.
Görünümün her gösterilmesinden önce yapılması gereken güncellemeler için kullanılır.
Örneğin, navigasyon çubuğu öğelerini güncelleme, ekran yönü değişikliklerini takip etme.
 
 
viewDidAppear(_:):

Görünüm kullanıcıya gösterildikten sonra çağrılır.
Animasyon başlatma veya kullanıcı etkileşimini izleme gibi işlemler için kullanılır.
 
 
viewWillDisappear(_:):

Görünüm kullanıcıdan kaybolmadan hemen önce çağrılır.
Kaynakları serbest bırakma veya kullanıcı izleme durdurma gibi işlemler için kullanılır.
 
 
viewDidDisappear(_:):

Görünüm kullanıcıdan kaybolduktan sonra çağrılır.
Görünümün kaybolduğunda yapılması gereken temizlik işlemleri için kullanılır.
 
 
deinit:

Görünüm kontrolörü hafızadan kaldırılmadan hemen önce çağrılır.
Kaynakları temizleme ve dairesel referansları kırma işlemleri için kullanılır.

*/


/// DID SET VE WILL SET

//didSet ve willSet Swift'te özellik gözlemcileridir ve bir sınıf, yapı ya da numaralandırma içindeki özelliklerin değeri değiştiğinde çağrılırlar. willSet özelliğin yeni değeri atanmadan hemen önce çağrılırken, didSet yeni değer atandıktan hemen sonra çağrılır. Bu yöntemler, özelliğin değeri değiştiğinde ek işlemler yapmak için kullanılır.
//

//Kullanımı:
//
//Bir özelliği tanımlarken willSet ve/veya didSet blokları eklenir.
//willSet içinde yeni değere newValue adıyla erişilebilir.
//didSet içinde eski değere oldValue adıyla erişilebilir.

// NOT : Init anında didSet ve willSet metodları çağrılmaz !
