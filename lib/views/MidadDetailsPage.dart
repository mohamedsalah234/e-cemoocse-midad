import 'package:flutter/material.dart';
import '../models/midadd_model.dart';

class MidadDetailsPage extends StatefulWidget {
  final Product product;

  MidadDetailsPage({required this.product});

  @override
  _MidadDetailsPageState createState() => _MidadDetailsPageState();
}

class _MidadDetailsPageState extends State<MidadDetailsPage> {
  bool _isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'تفاصيل المنتج',
            style: TextStyle(
              fontFamily: 'Lalezar',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.end, // محاذاة جميع العناصر إلى اليمين
            children: [
              // الجزء العلوي: الصورة مع الظل
              Container(
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0, 6),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Image.network(
                    widget.product.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              // الجزء السفلي: تفاصيل المنتج داخل مستطيل
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, -2),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // محاذاة النصوص إلى اليمين
                  children: [
                    Text(
                      widget.product.name ?? 'اسم غير متوفر',
                      style: TextStyle(
                        fontFamily: 'Lalezar',
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    AnimatedCrossFade(
                      firstChild: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.end, // محاذاة النصوص إلى اليمين
                        children: [
                          Text(
                            widget.product.description ??
                                'لا توجد تفاصيل متاحة.',
                            style: TextStyle(
                              fontFamily: 'Lalezar',
                              fontSize: 18.0,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'إخفاء التفاصيل',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16.0,
                              color: Colors.teal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      secondChild: Text(
                        'عرض المزيد',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      crossFadeState: _isDescriptionExpanded
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 300),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '\$${widget.product.price?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        fontFamily: 'ReemKufi',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isDescriptionExpanded = !_isDescriptionExpanded;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      child: Text(
                        _isDescriptionExpanded
                            ? 'إخفاء التفاصيل'
                            : 'عرض المزيد',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
