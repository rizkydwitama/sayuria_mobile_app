import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 15),
      children: [
        for(int i =0; i<8; i++)
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, '/product-detail');
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xffeef1f4),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                          'assets/images/kembang_kol.png',
                      ),
                    )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Rp x.xxx',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama Produk',
                    style: TextStyle(
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Stock: x',
                    style: TextStyle(
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
