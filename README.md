//dart dilinde bütün satırlar noktalı virgül ile biter
/*Temel anlamda dört değişken tip vardır.
 * String ,int ,double ,bool */
//int ve float değerler için Ekrana yazdırırken to.string() kullanmalıyız.
void main() {
  String name = "Hilal Öztemel";
  int age=20;
  double ratio=20.1;
  bool login= false;
  
  print(" NAME : "+name);
  print("  AGE : "+age.toString());
  print("Ratio : "+ratio.toString());
  print("Login : "+login.toString());
}
