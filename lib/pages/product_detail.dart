import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, dynamic> products;
  ProductDetail({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late final Map<String, dynamic> products;

  @override
  Widget build(BuildContext context) {
    Widget header(){
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left, size: 30,)
                ),
                const Text(
                  'Detail Produk',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.lightGreen,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Image.asset('assets/images/ic_cart.png', width: 20,)
              ],
            ),
          ),
        ]
      );
    }
    return Scaffold(

      body: ListView(
        children: [
          header(),
          Image.asset(
            'assets/images/products/${widget.products['gambar']}',
            width: MediaQuery.of(context).size.width,
            height: 315,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.products['namaSayur'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                      'Stock: ${widget.products['stock']}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(8 ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  )
                                ]
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                  )
                                ]
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      Text(
                          'Rp ${widget.products['harga']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          )
                      ),
                    ],
                  ),
                ),

                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.products['deskripsi'],
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                minimumSize: const Size.fromHeight(55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            child: const Text(
              'Tambah ke Keranjang',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            ),
          ),
        ),
      )
    );
  }
}
