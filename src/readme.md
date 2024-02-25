# Api Test Base Otomasyon Projesi

Bu proje api otomasyon base projedir. Yeni bir otomasyon projesine başlarken bu projenin yapısı kullanılacaktır.

# Tool stack
* Karate Framework
* Maven
* Java/Javascript
* Cucumber reporing
* Jenkins pipeline
* IntelliJ IDEA Community Edition or Ultimate

# Links

* <a href="">Project Git Repository</a>
* <a href="">Project Git Repository</a>
* <a href="">Project Git Repository</a>
* <a href="">Api Dökümantasyonu</a>
* <a href="">Swagger Link</a>

# Projenin localde kurulması

* Command line ya da IDE terminalinden proje git url'i ile proje locale alınır.


## Testlerin Çalıştırılması

1. IDE üzerinden yeşin RUN butonuna basılarak senaryo ya da feature bazlı çalıştırılır.
2. Junit runner üzerinden belirlenen senaryolar yine yeşil run butonuna basılarak çalıştırılır.
3. Command line üzerinden 
   'mvn clean test -Dtest=RunnerName '-Dkarate.options=--tags @tagName'
    komutuyla istenilen runner class ve tagname yazılarak çalıştırılır.
4. API testini performans testi olarak çalıştırmak istersek
   ''mvn clean test-compile gatling:test -Dgatling.simulationClass=className''
 komutu çalıştırılmalıdır. Class name yerine hangi class koşacak ise o class name yazılmalıdır.

# Project tree
daha sonra eklenecek

## karate-config.js
* Proje genelini ilgilendiren tanımlar bu dosya içerisinde konumlandırılmalıdır. (URL, env vg)
* Proje için gerekli data file data folderı içinde tutulmaktadır.

## Resources
* Gatling ile ilgili resource file'lar bbu package altında konumlandırılacaktır.

## Feature yazımı
* features folderında ilgili servise ait package oluşturularak geliştirmeler yapılacaktır.
* Her bir mikroservis için ayrı bir feature file oluşturulacak. Bir mikroserisin birden fazla feature'ı varsa
o featurelar içinde ayrı birer feature file oluşturulacak.
* Data file'lar data klasörü altında tutulacaktır.
* Load test 'runner'ları performance runner'ının altınta yer almalıdır.

## Naming Convention

* Projede isimlendirmelerde 'camelCase' uygulanmıştır. Yeni geliştirme yapılırken bu kural takip edilmelidir.
Sadece java ve Scala classlar'ı 'UpperCamelCase' olarak kullanılmalıdır.

Örnek : 'myVar', 'dataPackage', 'contentCategory', 'Utils.java', 'features.MyRunner.scala' vb.

## Taglame
* Senaryolar taglenirken yine 'camelCase' yapısı takio edilecektir.
* Regresyon suitine dahil olacak senaryolara '@regression' tag'i eklenmelidir.
* Smoke testler '@smoke' tag'i ile taglanmelidir.
* Sadece load test olan amaçlı yazılmış olan senaryolar '@name=load' tag'i eklenmelidir.
* Bug'ı açılmış olan senaryolar için '@bug' '@bugId=US-1245' taglamesi yapılacaktır. Ayrıca bu buglar düzeltilemeline kadar ilgili senaryo koşmayacak ya da fail almadan koşması sağlanacak
* Bug fix yapıldıktan sonra '@bugId=US-1245' tag'i çağrılarak ilgili senaryonun pass olup olmadığı kontrol edilebilir.
* Eğer senaryo ile ilgili geliştrime devam ediyorsa '@wip' (work in progress) tag'i kullanılmalıdır.

## Custom Method Geliştirme

* Karate framework ile geliştirilmeyen custom ihtiyaçlar olduğunda, Jaba ve/veya JS ile custom metotlar geliştirilebilir.
* Custom metotlar 'helpers' package'nın altında konumlandırılmalıdır.