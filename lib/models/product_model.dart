class ProductModel{
  late int id, harga_sayur, stock;
  late String nama_sayur, deskripsi, gambar;

  ProductModel({
    required this.id,
    required this.nama_sayur,
    required this.harga_sayur,
    required this.stock,
    required this.deskripsi,
    required this.gambar
  });

  ProductModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nama_sayur = json['nama_sayur'];
    harga_sayur = json['harga_sayur'];
    stock = json['stock'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'nama_sayur' : nama_sayur,
      'harga_sayur' : harga_sayur,
      'stock' : stock,
      'deskripsi' : deskripsi,
      'gambar' : gambar
    };
  }
}