import 'package:firestore_products_manager/models/product.dart';
import 'package:firestore_products_manager/services/firestore_db_service.dart';
import 'package:flutter/material.dart';

class ProductDialog extends StatelessWidget {
  final Product? product;
  const ProductDialog({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool isNew = product == null ? true : false;
    final nameController = TextEditingController(
      text: product == null ? '' : product!.name,
    );
    final priceController = TextEditingController(
      text: product == null ? '' : product!.price.toString(),
    );

    return AlertDialog(
      title: Text(isNew ? 'Ajouter un produit' : 'modifier produit'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Nom prod",
              ),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "prix",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                switch (isNew) {
                  case true: // --ajout produit 
                    if (nameController.text.isEmpty ||
                        priceController.text.isEmpty) {
                      return Navigator.pop(context);
                    }
                    FireStoreDbService.createProduct(
                      nameController.text,
                      int.parse(priceController.text),
                    );
                    break;
                  case false: // -- Update produit existant
                    FireStoreDbService.updateProduct(
                      product!.id,
                      nameController.text,
                      int.parse(priceController.text),
                    );
                    break;
                }
              
                Navigator.pop(context);
              },
              child: Text(isNew ? 'Ajouter' : 'Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}
