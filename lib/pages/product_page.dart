import 'package:agri/data/fruites_data.dart';
import 'package:agri/data/rice_data.dart';
import 'package:agri/data/vegi_data.dart';
import 'package:agri/widget/footer_section.dart';
import 'package:agri/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String _selectedValue = 'Vegitables';
  final vegitables = vegiData;
  final fruites = fruitsData;
  final rice = riceData;

  List<dynamic> getSelectedData() {
    switch (_selectedValue) {
      case 'Fruites':
        return fruites;
      case 'Rice':
        return rice;
      case 'Vegitables':
      default:
        return vegitables;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 120),
        child: Column(
          children: [
            // Top row with Dropdown, Search, Icons
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dropdown
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.13,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          style: TextStyle(fontSize: 14),
                          value: _selectedValue,
                          isExpanded: true,
                          items: [
                            'Vegitables',
                            'Fruites',
                            'Rice',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),

                    // Search field
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.4,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),

                    // Icon buttons
                    Row(
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.green),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.green),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30),

            // Grid content with footer
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = getSelectedData()[index];
                        return ProductCard(
                          image: product.image,
                          name: product.name,
                          price: product.pricePerKg,
                          description: product.description,
                          location: product.location,
                        );
                      },
                      childCount: getSelectedData().length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                  ),

                  // Footer
                  SliverToBoxAdapter(
                    child: FooterSection(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
