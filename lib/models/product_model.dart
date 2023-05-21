class ProductModel{
  final int id, harga_sayur, stock;
  final String nama_sayur, deskripsi, gambar;

  const ProductModel({
    required this.id,
    required this.nama_sayur,
    required this.harga_sayur,
    required this.stock,
    required this.deskripsi,
    required this.gambar
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
        id: json['id'],
        nama_sayur: json['nama_sayur'],
        harga_sayur: json['harga_sayur'],
        stock: json['stock'],
        deskripsi: json['deskripsi'],
        gambar: json['gambar'],
    );
  }
}